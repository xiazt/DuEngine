#include "stdafx.h"
#include "Texture.h"
#include "DuEngine.h"
#include "DuUtils.h"

GLuint Texture::GetTextureID() {
	if (type == TextureType::FrameBuffer) {
		return this->read_texture_id;
	}
	return this->id;
}

GLuint Texture::GetDirectID() {
	return read_texture_id;
}

void Texture::setFiltering() {
	//glGenSamplers(1, &sampler);
	m_wrapFilter = (m_warp == TextureWarp::REPEAT) ? GL_REPEAT : GL_CLAMP;
	switch (m_filter) {
	case TextureFilter::NEAREST:
		m_minFilter = GL_NEAREST;
		m_magFilter = GL_NEAREST;
		//setFiltering(TEXTURE_FILTER_MAG_NEAREST, TEXTURE_FILTER_MIN_NEAREST);
		break;
	case TextureFilter::LINEAR:
		m_minFilter = GL_LINEAR;
		m_magFilter = GL_LINEAR;
		//setFiltering(TEXTURE_FILTER_MAG_BILINEAR, TEXTURE_FILTER_MIN_NEAREST_MIPMAP);
		break;
	case TextureFilter::MIPMAP:
		m_minFilter = GL_LINEAR_MIPMAP_LINEAR;
		m_magFilter = GL_LINEAR;
		//setFiltering(TEXTURE_FILTER_MAG_BILINEAR, TEXTURE_FILTER_MIN_TRILINEAR);
		break;
	}

#if COMPILE_CHECK_GL_ERROR
	// Catch silly-mistake texture interpolation method for magnification
	if (m_magFilter == GL_LINEAR_MIPMAP_LINEAR ||
		m_magFilter == GL_LINEAR_MIPMAP_NEAREST ||
		m_magFilter == GL_NEAREST_MIPMAP_LINEAR ||
		m_magFilter == GL_NEAREST_MIPMAP_NEAREST) {
		warning("! You can't use MIPMAPs for magnification - setting filter to GL_LINEAR");
		m_magFilter = GL_LINEAR;
	}
#endif
	// Set texture interpolation methods for minification and magnification
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, m_minFilter);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, m_magFilter);

	// Set texture clamping methodw
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, m_wrapFilter);
	glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, m_wrapFilter);
}

void Texture::genTexture2D() {
	// Generate a number for our textureID's unique handle
	glGenTextures(1, &id);

	// Active the texture object
	glActiveTexture(GL_TEXTURE0 + id);

	// Bind to our texture handle
	glBindTexture(GL_TEXTURE_2D, id);

	this->setFiltering();
}

void Texture::generateMipmaps() {
	// If we're using mipmaps then generate them. Note: This requires OpenGL 3.0 or higher	   
	if (m_filter == TextureFilter::MIPMAP) {
		glGenerateMipmap(GL_TEXTURE_2D);
		info("Mipmap generated for texture" + id);
	}

#if COMPILE_CHECK_GL_ERROR
	// Check texturing errors.
	GLenum err = glGetError();
	if (err != GL_NO_ERROR)
		logerror("Texturing error: " + to_string(err));
#endif
}

#if DEBUG_TEXTURE_DEPRECATED_FILTERING
void Texture::setFiltering(int a_tfMagnification, int a_tfMinification) {
	// Set magnification filter
	if (a_tfMagnification == TEXTURE_FILTER_MAG_NEAREST)
		glSamplerParameteri(m_sampler, GL_TEXTURE_MAG_FILTER, GL_NEAREST);
	else if (a_tfMagnification == TEXTURE_FILTER_MAG_BILINEAR)
		glSamplerParameteri(m_sampler, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
	// Set minification filter
	if (a_tfMinification == TEXTURE_FILTER_MIN_NEAREST)
		glSamplerParameteri(m_sampler, GL_TEXTURE_MIN_FILTER, GL_NEAREST);
	else if (a_tfMinification == TEXTURE_FILTER_MIN_BILINEAR)
		glSamplerParameteri(m_sampler, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
	else if (a_tfMinification == TEXTURE_FILTER_MIN_NEAREST_MIPMAP)
		glSamplerParameteri(m_sampler, GL_TEXTURE_MIN_FILTER, GL_NEAREST_MIPMAP_NEAREST);
	else if (a_tfMinification == TEXTURE_FILTER_MIN_BILINEAR_MIPMAP)
		glSamplerParameteri(m_sampler, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_NEAREST);
	else if (a_tfMinification == TEXTURE_FILTER_MIN_TRILINEAR)
		glSamplerParameteri(m_sampler, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
}
#endif

TextureMat::TextureMat(string filename, bool vflip, TextureFilter filter, TextureWarp warp) {
	init(filename, vflip, filter, warp);
	m_mat = imread(filename);
	this->generateFromMat();
}

void TextureMat::init(string filename, bool vflip, TextureFilter filter, TextureWarp warp) {
	m_filename = filename; 
	m_vFlip = vflip;
	m_filter = filter;
	m_warp = warp; 
}

void TextureMat::generateFromMat() {
	return generateFromMat(m_mat); 
}

void TextureMat::updateFromMat() {
	glBindTexture(GL_TEXTURE_2D, id);
	glTexSubImage2D(
		GL_TEXTURE_2D,
		0,                       // GLint level,
		0, 0,                    // GLint xoffset, GLint yoffset,
		m_mat.cols, m_mat.rows,  // GLsizei width, GLsizei height,
		m_format,                // GLenum format,
		m_dataType,              // GLenum type,
		m_mat.ptr()              // const GLvoid * pixels
	);
	generateMipmaps();
}

// https://www.khronos.org/registry/OpenGL-Refpages/es2.0/xhtml/glTexParameter.xml
// minFilters: GL_NEAREST, GL_LINEAR, GL_NEAREST_MIPMAP_NEAREST, GL_LINEAR_MIPMAP_NEAREST, GL_NEAREST_MIPMAP_LINEAR, GL_LINEAR_MIPMAP_LINEAR
// magFilters: GL_NEAREST, GL_LINEAR
// GL_TEXTURE_WRAP_S: GL_CLAMP_TO_EDGE, GL_MIRRORED_REPEAT, GL_REPEAT
void TextureMat::generateFromMat(cv::Mat & mat) {
	this->genTexture2D();
	this->updateDataTypeFormat(); 

	// Create the texture
	glTexImage2D(GL_TEXTURE_2D,  // Type of texture
		0,					     // Pyramid level (for mip-mapping) - 0 is the top level
		GL_RGB,				     // Internal colour format to convert to
		mat.cols,			     // Image width  i.e. 640 for Kinect in standard mode
		mat.rows,			     // Image height i.e. 480 for Kinect in standard mode
		0,					     // Border width in pixels (can either be 1 or 0)
		m_format,	             // Input image format (i.e. GL_RGB, GL_RGBA, GL_BGR etc.)
		m_dataType,	             // Image data type
		mat.ptr());			     // The actual image data itself

	generateMipmaps(); 
}

void TextureMat::updateDataTypeFormat() {
	// OpenCV has reversed Y coordinates
	if (m_vFlip) flip(m_mat, m_mat, 0);
	datatypeFromMat(m_mat); 
	formatFromMat(m_mat);
}

void TextureMat::datatypeFromMat(cv::Mat & mat) {
	string r;
	auto type = mat.type();
	uchar depth = type & CV_MAT_DEPTH_MASK;
	uchar chans = 1 + (type >> CV_CN_SHIFT);
	switch (depth) {
		case CV_8U:  r = "8U"; m_dataType = GL_UNSIGNED_BYTE;  break;
		case CV_8S:  r = "8S"; m_dataType = GL_BYTE; break;
		case CV_16U: r = "16U"; m_dataType = GL_UNSIGNED_SHORT; break;
		case CV_16S: r = "16S"; m_dataType = GL_SHORT; break;
		case CV_32S: r = "32S"; m_dataType = GL_INT; break;
		case CV_32F: r = "32F"; m_dataType = GL_FLOAT; break;
		case CV_64F: r = "64F"; m_dataType = GL_DOUBLE; break;
		default:     r = "User"; break;
	}

	r += "C";
	r += (chans + '0');
}

// Set incoming texture format to:
// GL_BGR       for CV_CAP_OPENNI_BGR_IMAGE,
// GL_LUMINANCE for CV_CAP_OPENNI_DISPARITY_MAP,
void TextureMat::formatFromMat(cv::Mat & mat) {
	if (mat.channels() == 1) {
		m_format = GL_LUMINANCE;
	} else {
		m_format = GL_BGR;
	}
}

Texture2D::Texture2D(string filename, bool vflip, TextureFilter filter, TextureWarp warp) {
	init(filename, vflip, filter, warp);
	m_mat = imread(filename);
	this->generateFromMat();
}

VideoTexture::VideoTexture(string filename, bool vflip, TextureFilter filter, TextureWarp warp) {
	init(filename, vflip, filter, warp);

	m_video.open(filename);

	m_vFlip = vflip;
	m_filter = filter;
	if (!m_video.isOpened()) this->error();
	m_video >> m_mat;
	if (m_mat.empty()) this->error();
	this->generateFromMat();

	m_fps = m_video.get(CV_CAP_PROP_FPS); 
	m_prevTime = clock();

	// synchronization between videos and frame rate
	m_distribution = vector<bool>(DEFAULT_RENDER_FPS, false);
	double p = 0.0;
	int cnt = 0; 
	while (p < DEFAULT_RENDER_FPS) {
		m_distribution[(int)floor(p)] = true;
		p += (double)DEFAULT_RENDER_FPS / m_fps;
		++cnt; 
	}
	if (cnt != (int)round(m_fps)) {
		m_distribution[m_distribution.size() - 1] = true;
	}

	type = TextureType::Video; 
}

void VideoTexture::togglePaused() {
	m_paused = !m_paused;
}

void VideoTexture::update() {
	int iFrame = DuEngine::GetInstance()->getFrameNumber();
	if (!m_distribution[iFrame % m_distribution.size()]) return;

	m_prevTime = clock();
	m_video >> m_mat;
	m_numVideoFrames++;

	// loop the video
	if (m_mat.empty()) {
		resetTime(); 
		m_video >> m_mat;
	}
	if (m_vFlip) flip(m_mat, m_mat, 0);

	this->updateFromMat();

#if DEBUG_VIDEO
	info("video texture " + to_string(id) + " updated for the frame #" + to_string(frames));
#endif
}

void VideoTexture::resetTime() {
	m_video.set(CV_CAP_PROP_POS_FRAMES, 0);
}

void VideoTexture::error() {
	logerror("Cannot open the video texture." + m_filename);
	exit(EXIT_FAILURE); 
}

/**
* Keyboard Texture
*/
KeyboardTexture::KeyboardTexture() {
	m_mat = cv::Mat::zeros(3, 256, CV_8UC1);
	m_format = GL_LUMINANCE; 
	m_filter = TextureFilter::NEAREST;
	m_warp = TextureWarp::CLAMP;
	this->generateFromMat();
	memset(prevTimes, 0, 256); 
}

// 0 is current state (keydown event)
// 1 is keypress event
// 2 is toggle
void KeyboardTexture::onKeyDown(unsigned char key) {
	m_mat.at<uchar>(1, key) = 255;
	if (clock() - prevTimes[key] > RESPONSE_TIME) {
		m_mat.at<uchar>(0, key) = 255;
		prevTimes[key] = clock();
	} else {
		m_mat.at<uchar>(0, key) = 0;
	}
#if DEBUG_KEYBOARD
	info("Key down " + to_string(key));
#endif
}

void KeyboardTexture::onKeyUp(unsigned char key) {
	m_mat.at<uchar>(2, key) = 255 - m_mat.at<uchar>(2, key);
	m_mat.at<uchar>(1, key) = 0;
	m_mat.at<uchar>(0, key) = 0;
	prevTimes[key] = clock();
#if DEBUG_KEYBOARD
	info("Key up " + to_string(key));
#endif
}

void KeyboardTexture::onKeyPress(unsigned char key, bool up) {
	if (up) {
		onKeyUp(key);
	} else {
		onKeyDown(key);
	}
	this->updateFromMat(); 
}

#if COMPILE_WITH_SH
/**
* Spherical Harmonics Texture
*/
SHTexture::SHTexture(int numBands, int numCoefs) {
	m_numBands = numBands;
	m_mat = Mat::zeros(m_numBands, m_numBands, CV_32FC3);
	m_filter = TextureFilter::NEAREST; 
	m_warp = TextureWarp::CLAMP; 
	generateFromMat();
}

void SHTexture::update(float coef[NUM_COEF]) {
	for (int i = 0; i < m_mat.rows; ++i) {
		for (int j = 0; j < m_mat.cols; ++j) {
			m_mat.at<Vec3f>(m_mat.rows - 1 - i, j) =
				Vec3f(coef[(i * m_numBands + j) * 3 + 0],
					coef[(i * m_numBands + j) * 3 + 1],
					coef[(i * m_numBands + j) * 3 + 2]);
			//mat.at<Vec3f>(mat.rows - 1 - i, j) = Vec3f(1, 1, 1);
		}
	}
	this->updateFromMat();
}
#endif

FrameBufferTexture::FrameBufferTexture(GLuint FBO, int width, int height, TextureFilter filter, TextureWarp warp) {
	type = TextureType::FrameBuffer;
	m_filter = TextureFilter::MIPMAP;
	m_warp = TextureWarp::CLAMP;
	glGenTextures(1, &id);
	glActiveTexture(GL_TEXTURE0 + id);
	reshape(width, height);
	read_texture_id = id;

#if DEBUG_MULTIPASS
	info("Mipmap generated for framgebuffer " + to_string(FBO) + ", with texture ID " + to_string(id));
#endif
}

void FrameBufferTexture::setReadingTextureID(GLuint id) {
	read_texture_id = id;
}

void FrameBufferTexture::reshape(int _width, int _height) {
	glBindTexture(GL_TEXTURE_2D, id);
	glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA32F_ARB, _width, _height, 0, GL_RGBA, GL_FLOAT, NULL);

	this->setFiltering(); 

	glFramebufferTexture2D(
		GL_FRAMEBUFFER,
		GL_COLOR_ATTACHMENT0, // Specifies the attachment point to which an image from texture should be attached. Must be one of the following symbolic constants: GL_COLOR_ATTACHMENT0, GL_DEPTH_ATTACHMENT, or GL_STENCIL_ATTACHMENT.
		GL_TEXTURE_2D,
		id, // Specifies the texture object whose image is to be attached.
		0 // Specifies the mipmap level of the texture image to be attached, which must be 0.
	);
	this->generateMipmaps();
}