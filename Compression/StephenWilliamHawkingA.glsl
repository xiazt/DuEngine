// XsycRW
highp ivec2 SV_DispatchThreadID = ivec2(0,0);
highp int Double_pixelID = 0;
highp vec4 col = vec4(0.,0.,0.,0.);
int i = 0;

//pass !
void A(vec4 data){
    if(Double_pixelID == i++){
        col = data;
    }
}
void A(uvec4 data){
    if(Double_pixelID == i++){
        col = uintBitsToFloat(data);
    }
}

void mainImage( out vec4 C, in vec2 U)
{
    SV_DispatchThreadID = ivec2(floor(U-0.5));
    if(SV_DispatchThreadID.x >= 48 || SV_DispatchThreadID.y >= 77){
    	C = vec4(1./3.);
        return;
    }
    if(iFrame > 2){
    	C = texture(iChannel0,U/iResolution.xy);
        //discard;
    }
    //1个像素存一个数据块
    //16 x 32, 16为其中2个像素存2个块数据
    //像素ID编号
    Double_pixelID = (SV_DispatchThreadID.x>>1) + (SV_DispatchThreadID.y*24); 
    //-------------------------------------------------------------------------
	A(uvec4(0x1CE71616u,0x21286F1Au,0x1D07E4F4u,0x2549F9E4u));
	A(uvec4(0x294A6479u,0x2D6B0010u,0x14C51B1Bu,0x25491B1Bu));
	A(uvec4(0xC846B6Bu,0x14A51B5Bu,0x863BFFFu,0xC631F7Fu));
	A(uvec4(0x8630B0Bu,0x8630002u,0x4421F5Fu,0x8431707u));
	A(uvec4(0xFFFFu,0x442FFFFu,0x21ABAFu,0x42116AAu));
	A(uvec4(0x4219195u,0x421D490u,0x421D7D1u,0x421DFFFu));
	A(uvec4(0x4424000u,0x10A5F4D0u,0x863FEF8u,0x14C5FFFFu));
	A(uvec4(0x14A598E5u,0x18C75B5Au,0x14C59197u,0x18C741E4u));
	A(uvec4(0x18E690D0u,0x1CE7040Du,0x14C6A6BFu,0x1CE7E5D1u));
	A(uvec4(0x1CE7A9A8u,0x2108F9E9u,0x1D079090u,0x2529BEA5u));
	A(uvec4(0x2108BFAFu,0x2129553Fu,0x1D089556u,0x2549AAE4u));
	A(uvec4(0x2128AAB9u,0x2549554Bu,0x2108BFFFu,0x25491B7Fu));
	A(uvec4(0x21089046u,0x2529FEF4u,0x2128BFBEu,0x252982BFu));
	A(uvec4(0x21284145u,0x2529FF5Au,0x21286F7Fu,0x25294169u));
	A(uvec4(0x1D0851A6u,0x21285F56u,0x18E7561Bu,0x1D082F6Au));
	A(uvec4(0xC636F6Fu,0x18C71A5Bu,0xC639157u,0xC64FDA1u));
	A(uvec4(0xC645040u,0x1CE7D490u,0x18A6F8E4u,0x39AEFEF9u));
	A(uvec4(0x18C71F6Fu,0x318C1B1Bu,0x14A61F1Bu,0x25295F5Fu));
	A(uvec4(0x10845616u,0x14A66F5Bu,0xC437F2Fu,0x1084FFBFu));
	A(uvec4(0xC43F8F8u,0x1085F1F8u,0x10A5F9FDu,0x1CE7E4F8u));
	A(uvec4(0x1CE77964u,0x25296E7Eu,0xC631B1Bu,0x18E71B1Bu));
	A(uvec4(0x8634B47u,0xC63050Fu,0xFFFFu,0x843FFFFu));
	A(uvec4(0xFFFFu,0x843FFFFu,0xFFFFu,0x843FFFFu));
	A(uvec4(0x442CF0Fu,0x843FFC3u,0x421FF7Fu,0x8433F7Fu));
	A(uvec4(0x21281A05u,0x25495F5Bu,0x21289494u,0x254AF9E5u));
	A(uvec4(0x2529BFBEu,0x294A3F7Fu,0x14A51B1Bu,0x2529061Au));
	A(uvec4(0xC635B5Bu,0x14A51616u,0x8631A5Bu,0xC631516u));
	A(uvec4(0xFFFFu,0x843FFFFu,0x4426A6Bu,0x8431566u));
	A(uvec4(0x216FBFu,0x4221B5Fu,0x21155Bu,0x4215555u));
	A(uvec4(0x421D464u,0x4212594u,0x4219040u,0xC84F4E0u));
	A(uvec4(0x863A9A4u,0x18C6E9E9u,0x14C578A4u,0x18C79F5Fu));
	A(uvec4(0x14C69546u,0x18C64F59u,0x14C6FAD1u,0x18C659BEu));
	A(uvec4(0x18E65050u,0x1CE7E090u,0x18E7E994u,0x1D08FAFAu));
	A(uvec4(0x1D08D5D0u,0x2129FAE1u,0x1D086F7Fu,0x2529561Bu));
	A(uvec4(0x1D08F4E5u,0x2529BEF9u,0x21295F5Bu,0x2549A4E6u));
	A(uvec4(0x21297F69u,0x2549550Fu,0x2128F5D1u,0x2529FEF9u));
	A(uvec4(0x2529F73Fu,0x2549FFFFu,0x2108E641u,0x2549AFFFu));
	A(uvec4(0x21291F6Fu,0x2549BF5Bu,0x21281F5Au,0x2529FF6Fu));
	A(uvec4(0x2128BE1Au,0x25291F7Fu,0x14A56FBFu,0x1D081B1Bu));
	A(uvec4(0xC63171Bu,0x14A54546u,0xC63E0A0u,0x1065F5F4u));
	A(uvec4(0x14859040u,0x3DCEF4E4u,0x39AE2E24u,0x86102F2Fu));
	A(uvec4(0x14641B1Bu,0x2D6C171Bu,0x1CE70C09u,0x316C1C0Cu));
	A(uvec4(0x14A51605u,0x1CE8AB5Au,0x14850601u,0x14A60B06u));
	A(uvec4(0xC63D2E1u,0x14854682u,0x10A5D090u,0x1CE7C0D0u));
	A(uvec4(0x1CE73F7Eu,0x21296F3Fu,0x8631B1Fu,0x14C60B1Bu));
	A(uvec4(0x8631A1Du,0xC635A17u,0x8631515u,0x8435D1Du));
	A(uvec4(0xFFFFu,0x843FFFFu,0xFFFFu,0x843FFFFu));
	A(uvec4(0x442FFFFu,0x843FFCFu,0x4217F3Fu,0x843BFFFu));
	A(uvec4(0x21285B5Bu,0x294A0647u,0x2128F9F9u,0x296A94E9u));
	A(uvec4(0x1CE76F7Fu,0x294A1A6Fu,0x10841B1Bu,0x1CE7161Bu));
	A(uvec4(0x8636B6Bu,0xC84166Bu,0x8630303u,0x863003Fu));
	A(uvec4(0xFFFFu,0x843FFFFu,0x421FFFFu,0x4423FFFu));
	A(uvec4(0x215757u,0x4211557u,0x217D7Du,0x421157Fu));
	A(uvec4(0x218040u,0x843F4D0u,0x442F9F4u,0x1084F9F9u));
	A(uvec4(0x10A5B9F8u,0x18C655A9u,0x14C6F8FEu,0x18C755F9u));
	A(uvec4(0x14C6FEAFu,0x18C72AAFu,0x14C65615u,0x1CE7F9D5u));
	A(uvec4(0x18E79050u,0x1D08F9EAu,0x1D07E490u,0x2529BAFEu));
	A(uvec4(0x1D086FBFu,0x25299156u,0x2108F4F4u,0x252996A5u));
	A(uvec4(0x21289551u,0x254A65E9u,0x21296F7Eu,0x2549B90Bu));
	A(uvec4(0x21299490u,0x294AF5A5u,0x2529AA55u,0x294A971Bu));
	A(uvec4(0x25290500u,0x254A420Du,0x25296901u,0x296A5BA9u));
	A(uvec4(0x25494004u,0x254A41D0u,0x21296A6Au,0x294A165Bu));
	A(uvec4(0x18E7FFFFu,0x21083FBFu,0xC631B6Fu,0x1CE70607u));
	A(uvec4(0xC639095u,0x1085E594u,0x10854000u,0x2D6BD090u));
	A(uvec4(0x2108F8E4u,0x8A31FEFDu,0x2D6B2F6Fu,0x8A311F2Fu));
	A(uvec4(0x14641B1Bu,0x25095B1Bu,0x1CC71C1Cu,0x358D2C2Cu));
	A(uvec4(0x18C72A1Bu,0x1CE81A2Eu,0x10850707u,0x14A70707u));
	A(uvec4(0x8439B8Bu,0x10645646u,0xC63E5E5u,0x18C7E4E5u));
	A(uvec4(0x14C63FBFu,0x1D087F7Fu,0x863570Bu,0x10A5061Bu));
	A(uvec4(0x8631B5Bu,0xC63461Au,0x8630000u,0x8430F00u));
	A(uvec4(0x442FFFFu,0x843FFCFu,0xFFFFu,0x843FFFFu));
	A(uvec4(0xFFFFu,0x843FFFFu,0x4217F1Fu,0x8435BB7u));
	A(uvec4(0x1D076F6Fu,0x25491B1Bu,0x1D07E9FAu,0x2129E4E4u));
	A(uvec4(0x18E71B1Bu,0x25291B1Bu,0xC636F6Fu,0x14A51B6Fu));
	A(uvec4(0x8635B6Bu,0xC63521Bu,0x8637FFFu,0x843177Fu));
	A(uvec4(0x442171Fu,0x8431F17u,0x4212F6Fu,0x4420B1Bu));
	A(uvec4(0x215555u,0x4211535u,0x9556u,0x442F8E4u));
	A(uvec4(0x421E9E4u,0xC63EAEAu,0xC63E5E4u,0x10A5E9A5u));
	A(uvec4(0x10A5F4EDu,0x14C6FDE4u,0x14C6B954u,0x18E719A8u));
	A(uvec4(0x14C65616u,0x18E7E4D6u,0x18E6E4A0u,0x1D07E5A9u));
	A(uvec4(0x1D07F594u,0x2129AEF9u,0x1D08D3FFu,0x2108FFF7u));
	A(uvec4(0x2108B5A0u,0x2529496Eu,0x2128BEABu,0x252941A8u));
	A(uvec4(0x21288A5Eu,0x252990D1u,0x2129FFFCu,0x25497FFFu));
	A(uvec4(0x2128EFFFu,0x2549D9CFu,0x25497EBFu,0x294AD186u));
	A(uvec4(0x25291000u,0x294A0B1Au,0x2549685Du,0x254AC045u));
	A(uvec4(0x25491501u,0x296A1F2Eu,0x21294657u,0x25496F9Au));
	A(uvec4(0x10852F6Fu,0x21080B1Bu,0xC639647u,0x1085FAAAu));
	A(uvec4(0x10854000u,0x316CE490u,0x14A6F9E4u,0x8210FFFEu));
	A(uvec4(0x81EFFFFEu,0x8E52066Fu,0x2D4B1B2Fu,0x86101A1Au));
	A(uvec4(0x1CA52B1Bu,0x25093F2Bu,0x1CC71C2Cu,0x39AE1C1Cu));
	A(uvec4(0x10A66BABu,0x1CE81B6Bu,0xC645B6Bu,0x14A71657u));
	A(uvec4(0x842974Bu,0xC644B5Bu,0xC63E4E4u,0x18C7E4E4u));
	A(uvec4(0x10A52F6Fu,0x1D081F2Fu,0x8631B4Bu,0xC84161Bu));
	A(uvec4(0x8631506u,0xC632E29u,0xFFFFu,0x843FFFFu));
	A(uvec4(0xFFFFu,0x843FFFFu,0xFFFFu,0x843FFFFu));
	A(uvec4(0x442FFFFu,0x843FFCFu,0x4421B1Bu,0x8431B5Bu));
	A(uvec4(0x18E71B5Bu,0x2529070Bu,0x18E6E5F9u,0x2108A4E4u));
	A(uvec4(0x10A56F6Fu,0x21081A5Bu,0xC631B1Fu,0x10A5061Bu));
	A(uvec4(0x8635757u,0xC631547u,0xFFFFu,0x843FFFFu));
	A(uvec4(0x4225A5Fu,0x8431E16u,0x16BAFu,0x421175Bu));
	A(uvec4(0x8555u,0x442E595u,0x421FDF8u,0x842FAFEu));
	A(uvec4(0x863E490u,0xC64E9E4u,0xC84E4F8u,0x10A5F9F8u));
	A(uvec4(0x10A5F4FEu,0x14C6FDF9u,0x14C65415u,0x18E7F8B8u));
	A(uvec4(0x14C6F9F4u,0x18E7FEFFu,0x18E7FDF4u,0x1D08BEFFu));
	A(uvec4(0x1CE7AAAAu,0x2128D5C5u,0x1D08F5F4u,0x2529EF9Fu));
	A(uvec4(0x2108D281u,0x25297FFEu,0x21085B07u,0x2529FDEBu));
	A(uvec4(0x2129A654u,0x2529FFF7u,0x2128FFBEu,0x252987D7u));
	A(uvec4(0x2128AAA9u,0x294AE986u,0x25295090u,0x296AAB9Bu));
	A(uvec4(0x2549AA51u,0x296AFF5Fu,0x2549AFD5u,0x294A7F2Fu));
	A(uvec4(0x25499107u,0x294A2890u,0x14C66FBFu,0x25291B2Bu));
	A(uvec4(0xC854207u,0x18E74091u,0x1085EA90u,0x18C7A9FFu));
	A(uvec4(0x18C7E4E4u,0x35AD00A4u,0x18C7AAFFu,0x81F00055u));
	A(uvec4(0x18A7AAFFu,0x3DCE0055u,0x1CC7BFBFu,0x316CE0F8u));
	A(uvec4(0x1CC63A2Au,0x2D4BBF7Fu,0x18C71E1Du,0x39AD0B0Fu));
	A(uvec4(0xC851B6Fu,0x14C75A17u,0xC645515u,0x1085D659u));
	A(uvec4(0x8424757u,0x1085475Bu,0xC63E4E4u,0x18E7E4E4u));
	A(uvec4(0xC841F1Fu,0x1CE70B1Bu,0x8636F6Fu,0xC631B5Bu));
	A(uvec4(0x8636559u,0xC63B869u,0x8637D75u,0x863551Du));
	A(uvec4(0xFFFFu,0x843FFFFu,0xFFFFu,0x843FFFFu));
	A(uvec4(0x842FFFFu,0x843FFCFu,0x4216F6Fu,0x8431F6Fu));
	A(uvec4(0x14C61B5Bu,0x2128071Bu,0x14C6F8FDu,0x1CE779F9u));
	A(uvec4(0xC846F6Fu,0x18C61B5Bu,0x8631B1Bu,0xC84165Au));
	A(uvec4(0x8631D15u,0xC63157Fu,0xFFFFu,0x843FFFFu));
	A(uvec4(0x4211B2Fu,0x8430B1Bu,0x5A2Au,0x421E1D2u));
	A(uvec4(0x1FEF8u,0x442FFFFu,0xFFFFu,0x843FFFFu));
	A(uvec4(0x863F8E8u,0xC84F4F4u,0xC84FEF9u,0x10A5F4FDu));
	A(uvec4(0x10A5BDFCu,0x14C6FEFDu,0x14C684E8u,0x18E7F9E9u));
	A(uvec4(0x18E745D4u,0x1D074000u,0x18E79542u,0x2108E5A4u));
	A(uvec4(0x1D07F9D1u,0x2129FFBEu,0x2129D596u,0x2549F9E4u));
	A(uvec4(0x21290616u,0x294AFB56u,0x2129E0F8u,0x25495FD5u));
	A(uvec4(0x25298256u,0x254AAEDAu,0x25290B01u,0x294AD087u));
	A(uvec4(0x254979B0u,0x296B8146u,0x25298091u,0x296ADB86u));
	A(uvec4(0x2549F5F5u,0x2D6B0696u,0x25499753u,0x296A7DFFu));
	A(uvec4(0x18C6BFFFu,0x25291B6Fu,0x10A5071Bu,0x21080102u));
	A(uvec4(0x1085FC40u,0x14A6FEFEu,0x1085FE54u,0x18C7FFFFu));
	A(uvec4(0x14A54500u,0x1CC7FFBBu,0x14A69454u,0x1CC7FFEAu));
	A(uvec4(0x18A75550u,0x1CE8FEA9u,0x1CC7E0E0u,0x358DF9E4u));
	A(uvec4(0x314A9B16u,0x39ADDBDBu,0x14A60707u,0x3DCE0303u));
	A(uvec4(0xC855A5Fu,0x14A65652u,0xC85F8C0u,0x1085F8F8u));
	A(uvec4(0x8424747u,0x10850747u,0x863F8F8u,0x14C6FCFCu));
	A(uvec4(0xC631B5Fu,0x14C61B1Bu,0x8635F1Bu,0xC636E6Fu));
	A(uvec4(0x8636564u,0xC636363u,0xFFFFu,0x843FFFFu));
	A(uvec4(0x8634757u,0x8435545u,0x8630F00u,0x843F0FFu));
	A(uvec4(0xFFFFu,0x843FFFFu,0x4211B1Bu,0x8435B0Bu));
	A(uvec4(0x14C6565Bu,0x1D071606u,0x10A5BFFFu,0x14C6151Fu));
	A(uvec4(0xC636F6Fu,0x10A5165Bu,0x863562Bu,0xC630101u));
	A(uvec4(0x8635D55u,0xC631545u,0x4427FFFu,0x8433F3Fu));
	A(uvec4(0x1B6Fu,0x4218657u,0xFDF8u,0x422FFFEu));
	A(uvec4(0x422F4D4u,0x843FFF5u,0xFFFFu,0x843FFFFu));
	A(uvec4(0x863F9F8u,0xC64E9F9u,0xC84E9E5u,0x14A5F4E9u));
	A(uvec4(0x14C69090u,0x18E7D060u,0x14C669B5u,0x1CE7915Eu));
	A(uvec4(0x18E70040u,0x1D08E094u,0x1D08BCE4u,0x2129E0AAu));
	A(uvec4(0x2128A455u,0x254979E5u,0x252986D5u,0x254A7D8Bu));
	A(uvec4(0x25496E6Eu,0x296A081Au,0x21299506u,0x294AF995u));
	A(uvec4(0x2549CA69u,0x294AE5C3u,0x25491F55u,0x296AF447u));
	A(uvec4(0x25497D74u,0x296AF3EFu,0x252950EAu,0x294A4B03u));
	A(uvec4(0x25296002u,0x294A66D0u,0x1D086FBEu,0x294A1A5Fu));
	A(uvec4(0x10A51F6Fu,0x1D08061Bu,0xC8403C3u,0x1085FF03u));
	A(uvec4(0xC6494A5u,0x18A6FE55u,0x108555AAu,0x18A6FF00u));
	A(uvec4(0x1485E0FEu,0x18A6BF90u,0x18A6F9FFu,0x1CC7F9E4u));
	A(uvec4(0x1CE74040u,0x2509EA90u,0x292AE4F4u,0x358D90E4u));
	A(uvec4(0x314A8585u,0x8610C5C5u,0x10850303u,0x35AD0303u));
	A(uvec4(0xC64FBFFu,0x10854199u,0xC64EAFFu,0x1085D5D4u));
	A(uvec4(0x421175Bu,0xC85071Bu,0x863FDFCu,0x14A5BEFDu));
	A(uvec4(0xC631B2Bu,0x10855B1Bu,0x863281Du,0xC638179u));
	A(uvec4(0x8635461u,0xC63765Cu,0x8630303u,0x863F000u));
	A(uvec4(0x8637510u,0x863FFFFu,0x8635050u,0x863FF05u));
	A(uvec4(0x863E551u,0xC63B5E5u,0x4429F4Fu,0x843FFEFu));
	A(uvec4(0x14A56A6Bu,0x18C6155Au,0xC846FBFu,0x14A51B6Bu));
	A(uvec4(0xC635B6Bu,0xC84165Au,0x863D551u,0xC6350D5u));
	A(uvec4(0x8631F5Au,0xC63151Bu,0x212F6Fu,0x8430B1Fu));
	A(uvec4(0xE191u,0x442FDF8u,0x442AA94u,0x443FAAAu));
	A(uvec4(0xFFFFu,0x843FFFFu,0x863D450u,0x8434755u));
	A(uvec4(0x863F0E4u,0xC84F9F4u,0x10A55050u,0x18C7E490u));
	A(uvec4(0x14C55474u,0x18C7F1C1u,0x14C6A9B8u,0x18E7F9D2u));
	A(uvec4(0x18E7E8E4u,0x1D0895E5u,0x1D08E9A4u,0x2529FEFDu));
	A(uvec4(0x2529FD58u,0x254AEEFDu,0x2549FA2Eu,0x294A2FFAu));
	A(uvec4(0x25499548u,0x296ABC79u,0x25491F7Fu,0x294AAF1Fu));
	A(uvec4(0x2549F498u,0x296AFBF5u,0x296A2C74u,0x2D6BC0D0u));
	A(uvec4(0x25490566u,0x296BE647u,0x2549645Au,0x296A1B2Bu));
	A(uvec4(0x21286AABu,0x294A051Au,0x18E72F5Fu,0x21291A6Fu));
	A(uvec4(0x1085060Bu,0x18E74102u,0x14A60000u,0x35ADE440u));
	A(uvec4(0x1CE75000u,0x3DEFFFA9u,0x20E85500u,0x39ADAF6Au));
	A(uvec4(0x20E70500u,0x2D4AFF46u,0x1CC75040u,0x2D4AFFA9u));
	A(uvec4(0x25095000u,0x2D4BFEE4u,0x2D4A9450u,0x81EFF5E4u));
	A(uvec4(0xC22EAD5u,0x8E32E1E6u,0x10850303u,0x81EF0707u));
	A(uvec4(0xC635A9Bu,0xC651A5Bu,0xC63FEFEu,0x1085F8F9u));
	A(uvec4(0x4B4Bu,0xC648787u,0x10A4787Cu,0x14A51924u));
	A(uvec4(0x8631A1Bu,0x10855A1Au,0x86378A5u,0xC63E6B5u));
	A(uvec4(0x8632820u,0xC638B88u,0x8635550u,0xC636F5Au));
	A(uvec4(0x8630FFFu,0x8630F0Fu,0x8634155u,0x863FDD5u));
	A(uvec4(0x86354F0u,0xC631515u,0x4425B9Fu,0x843070Bu));
	A(uvec4(0xC84BFFFu,0x14A51A5Fu,0xC636B6Fu,0x10851A6Bu));
	A(uvec4(0x8635B6Fu,0xC63A916u,0x8637475u,0xC631FF4u));
	A(uvec4(0x442FFFFu,0x8433FFFu,0x21870Fu,0x422E1C3u));
	A(uvec4(0x421A854u,0x443FAF6u,0x4435454u,0x843555Du));
	A(uvec4(0xFFFFu,0x843FFFFu,0x843E595u,0xC63EAE4u));
	A(uvec4(0xC63E594u,0x10A5EAE5u,0x10A5E1F4u,0x14C6FEF9u));
	A(uvec4(0x14C6EEAAu,0x18E7FCF5u,0x18E74774u,0x1CE74103u));
	A(uvec4(0x18E7A494u,0x1D08FAF4u,0x2128E4E8u,0x254A94D0u));
	A(uvec4(0x25496F5Au,0x296B296Fu,0x2549BD2Eu,0x296A6EFEu));
	A(uvec4(0x2549A454u,0x2D8B69E5u,0x296A5605u,0x2D8BD555u));
	A(uvec4(0x296A1E29u,0x2D8B627Du,0x252996AFu,0x296AE6C2u));
	A(uvec4(0x2549A890u,0x2D6B96BDu,0x25295656u,0x296B070Bu));
	A(uvec4(0x1CE7AFABu,0x25291B6Fu,0x10A51B2Fu,0x1CE70606u));
	A(uvec4(0x14A54000u,0x81EFE080u,0x2529F890u,0x9694FFFEu));
	A(uvec4(0x8E52A900u,0xA6F7FFBEu,0x39AD1601u,0xA2D6FF6Fu));
	A(uvec4(0x358C5400u,0x96946F55u,0x316B5B05u,0x3DCEFFAFu));
	A(uvec4(0x1CE75555u,0x3DCE1F6Au,0x4217FFFu,0x316B010Bu));
	A(uvec4(0x421E0F0u,0x81EF90E0u,0xC640B07u,0x39CE2F1Fu));
	A(uvec4(0x8431A1Fu,0xC656A2Eu,0x843F9F9u,0xC85E4F8u));
	A(uvec4(0x8787u,0xC43C7C7u,0x10A55F1Fu,0x14A50955u));
	A(uvec4(0x8635B5Bu,0xC845317u,0x8635692u,0xC638729u));
	A(uvec4(0x8635A46u,0xC631BA9u,0x863171Fu,0xC630055u));
	A(uvec4(0x8630505u,0xC636E56u,0x863F0FCu,0x86303C3u));
	A(uvec4(0x8635555u,0xC63355Du,0x4420707u,0x8435707u));
	A(uvec4(0xC636FAFu,0x1084191Au,0xC631A2Bu,0xC645656u));
	A(uvec4(0xFFFFu,0xC63FFFFu,0x8635F1Bu,0xC636F6Fu));
	A(uvec4(0x217FBFu,0x8430F1Fu,0x21F4E0u,0x442EDF8u));
	A(uvec4(0xFFFFu,0x843FFFFu,0xFFFFu,0x843FFFFu));
	A(uvec4(0xFFFFu,0x843FFFFu,0x8639494u,0xC64E4A8u));
	A(uvec4(0xC84D454u,0x14C6F9E4u,0x14A5E4A4u,0x18E7EAE6u));
	A(uvec4(0x14C64FFDu,0x18E7DF47u,0x18E77C69u,0x1D08E4A8u));
	A(uvec4(0x18E7E4E5u,0x2129FAB5u,0x25295880u,0x296AE07Cu));
	A(uvec4(0x2529F092u,0x296ADBF8u,0x294A0000u,0x2D6B7D65u));
	A(uvec4(0x294A5E3Eu,0x2D6BFEFDu,0x296A1E54u,0x2D8BFAF5u));
	A(uvec4(0x296A0D65u,0x2D6BF601u,0x296AB840u,0x2D6BEAFDu));
	A(uvec4(0x254A6F5Fu,0x2D6B5F3Au,0x2128BFFFu,0x294A2F7Eu));
	A(uvec4(0x10A56B6Bu,0x25291A1Au,0x1085921Bu,0x14A6F9F5u));
	A(uvec4(0x18E7F4E0u,0x8E53F9F8u,0x9AB56964u,0xA7183E29u));
	A(uvec4(0x9673F9FEu,0xAB18E0F4u,0xA717AF01u,0xAF39B9BEu));
	A(uvec4(0x96946F16u,0xAB38FFBFu,0x85EF6B01u,0xA6F77FBFu));
	A(uvec4(0x401071Fu,0x398D0102u,0xA96Fu,0x40196C3u));
	A(uvec4(0x42180D0u,0x1CC74080u,0x14A6B53Eu,0x318D80D0u));
	A(uvec4(0xC630000u,0x294B0301u,0x422F9F9u,0xC64F5F8u));
	A(uvec4(0x20C7C7u,0xC63C7C7u,0x10A5A400u,0x14A624B8u));
	A(uvec4(0xC630B07u,0x10850606u,0x8635F57u,0xC631F5Fu));
	A(uvec4(0x8637B2Bu,0xC631D6Eu,0x8637454u,0xC631474u));
	A(uvec4(0x8630028u,0xC63AE08u,0x8634101u,0xC635755u));
	A(uvec4(0x8633F3Fu,0x8633F3Fu,0x4433F3Fu,0x8433F3Fu));
	A(uvec4(0xC635E6Fu,0xC841555u,0xC634B5Bu,0xC630507u));
	A(uvec4(0x863F6E6u,0xC6395F1u,0x8435B6Fu,0xC631B5Bu));
	A(uvec4(0x421964Bu,0x442A4E2u,0x442FACCu,0x843FEF0u));
	A(uvec4(0xFFFFu,0x843FFFFu,0xFFFFu,0x843FFFFu));
	A(uvec4(0x863A165u,0xC63D6C1u,0x863E594u,0xC84E9E9u));
	A(uvec4(0x10A5F4F4u,0x14A6E8D0u,0x14C6B8BDu,0x18E7E0D1u));
	A(uvec4(0x14C6D9ECu,0x18E7DFEFu,0x18E7D0D1u,0x1D0845E5u));
	A(uvec4(0x1D08FAFAu,0x2129D5C9u,0x2129F9E0u,0x296AF9FDu));
	A(uvec4(0x296A6400u,0x31AC65B8u,0x296AF4BDu,0x2D8BDBD2u));
	A(uvec4(0x296AA699u,0x2D8C2F4Bu,0x296AAF6Fu,0x2D8BD0D2u));
	A(uvec4(0x296ABCFDu,0x2D8BFFFFu,0x296A5A96u,0x2D8BBF1Au));
	A(uvec4(0x2549FFFFu,0x296B3F7Fu,0x1CE71B6Fu,0x296A161Au));
	A(uvec4(0x1085071Bu,0x18E70002u,0x14A64000u,0x8611D080u));
	A(uvec4(0x316CE9E4u,0x9ED6FEFAu,0xA2D67E3Eu,0xA7182579u));
	A(uvec4(0x8A10D6E5u,0xAB18E1D2u,0xAB18AA62u,0xAF5976ECu));
	A(uvec4(0xAB187B17u,0xAF39E2E6u,0x8A312F7Fu,0xAB180B1Fu));
	A(uvec4(0x1A67u,0x8015216u,0xCAAEu,0x1A99Eu));
	A(uvec4(0xC6E5u,0x8438586u,0x1085FCFCu,0x14A794F4u));
	A(uvec4(0x8431E0Fu,0x252A7A3Eu,0x1F5FAu,0xC63E4F5u));
	A(uvec4(0x421C3C3u,0xC438383u,0xC636E7Fu,0x10851854u));
	A(uvec4(0xC63060Fu,0xC63165Bu,0x863EF1Fu,0xC63FFFFu));
	A(uvec4(0x8631B1Eu,0xC634627u,0x8631414u,0xC635574u));
	A(uvec4(0x863545Du,0xC635050u,0x8633FFFu,0xC633F3Fu));
	A(uvec4(0x8631515u,0xC631575u,0x4433F3Fu,0x8433F3Fu));
	A(uvec4(0xC637FFFu,0xC631F3Fu,0x8635056u,0xC63E4A0u));
	A(uvec4(0xC63FDF4u,0xC63155Du,0x4213F7Fu,0x8439B6Fu));
	A(uvec4(0x421FDF4u,0x843FFFEu,0x863F5F4u,0x8437F55u));
	A(uvec4(0x8630002u,0x8633A30u,0x863F4D0u,0x843747Cu));
	A(uvec4(0x863E995u,0xC64F9F8u,0xC63D490u,0x10A5E5E5u));
	A(uvec4(0x10A5A554u,0x18E795D5u,0x14C6F4E9u,0x18E7FEF1u));
	A(uvec4(0x18E7B401u,0x1D089AFCu,0x18E7BA5Au,0x1D08E1E1u));
	A(uvec4(0x1D08F4E4u,0x2529FDE4u,0x2549F8F4u,0x2D6BA5B9u));
	A(uvec4(0x296AFDFFu,0x2D6BEDFCu,0x296BD685u,0x2D8CD1D2u));
	A(uvec4(0x296A421Bu,0x318C6652u,0x296A5544u,0x31ACE595u));
	A(uvec4(0x2D6B7CE2u,0x318CA77Eu,0x296A6E6Fu,0x318C166Au));
	A(uvec4(0x21296B6Fu,0x2D6B1A1Bu,0x10A51F6Fu,0x1D080B1Bu));
	A(uvec4(0x10854040u,0x20E9D040u,0x14C7F8E4u,0x8E52FEF9u));
	A(uvec4(0x9273E8F8u,0x9ED6F4F4u,0x9A94152Bu,0xA2F76E29u));
	A(uvec4(0x9253F9F0u,0xAB18FFFEu,0xAB186ABAu,0xAF390059u));
	A(uvec4(0x8610FEFEu,0xB35A3FBFu,0x8A100207u,0xA7180001u));
	A(uvec4(0xFFFBu,0x40152AFu,0xFFDFu,0x1DCFDu));
	A(uvec4(0x5FDFu,0x4212F5Fu,0x422FEFEu,0x1085FCFDu));
	A(uvec4(0x14A7C4D0u,0x21091040u,0x4224240u,0x252A4A43u));
	A(uvec4(0x421C3C3u,0x84382D2u,0x863BDBEu,0xC84A4B8u));
	A(uvec4(0x863A7ABu,0xC63ABA3u,0x8632FBEu,0xC63AA6Au));
	A(uvec4(0xC635400u,0xC635D5Cu,0xC633F0Cu,0xC63033Fu));
	A(uvec4(0x8630501u,0xC63D555u,0x8635454u,0xC637F7Du));
	A(uvec4(0x8635F6Au,0xC63165Au,0x4422B2Fu,0x8430223u));
	A(uvec4(0xC631B06u,0xC634B5Bu,0xC635474u,0xC634115u));
	A(uvec4(0x421FFFFu,0xC633FFFu,0x421E6D7u,0x843FCF8u));
	A(uvec4(0x8435555u,0xC63E968u,0x863A000u,0xC63AEA0u));
	A(uvec4(0x8634515u,0xC43F157u,0x8639555u,0xC63EA91u));
	A(uvec4(0xC63E5F5u,0xC64F1A5u,0xC84E4E4u,0x14A5F9F4u));
	A(uvec4(0x14A5C080u,0x18E7E854u,0x18E79090u,0x1D081BA8u));
	A(uvec4(0x18E7691Au,0x1D08C492u,0x18E7F9A4u,0x2129EBFEu));
	A(uvec4(0x21295444u,0x294AE6F9u,0x2529E090u,0x2D8BE5F9u));
	A(uvec4(0x296AFFFEu,0x2D6B076Fu,0x296BA5A5u,0x31ACE165u));
	A(uvec4(0x296B1989u,0x31ACF6B4u,0x2D8B8FE2u,0x31ACF6FFu));
	A(uvec4(0x2D8BA290u,0x31AC8FAAu,0x2529BFBFu,0x2D8B3F6Fu));
	A(uvec4(0x18C6BFBFu,0x25292E6Fu,0x10A50607u,0x1CE74514u));
	A(uvec4(0x14A69040u,0x81F0E0D0u,0x82109494u,0xA2F7F9E5u));
	A(uvec4(0x9AB4EAE4u,0xA2F7D7EBu,0x96948B5Eu,0xA718D3C7u));
	A(uvec4(0xA2D6A9BEu,0xAB1841C1u,0xA6F8D141u,0xB35AE5E0u));
	A(uvec4(0x8E312F7Fu,0xAF590B1Fu,0x4219707u,0x821684Fu));
	A(uvec4(0x5F6Bu,0x4210107u,0x5454u,0x401F468u));
	A(uvec4(0xFF3Fu,0x421A4FFu,0x21F8F9u,0x1086F4F8u));
	A(uvec4(0x1086E9F8u,0x14A7D4E8u,0x8433A1Eu,0x252AF9BAu));
	A(uvec4(0x4219383u,0x8438384u,0x862A4F8u,0xC635CA0u));
	A(uvec4(0xC63B6BBu,0xC6353AAu,0xC635455u,0xC63E550u));
	A(uvec4(0xC63F030u,0xC63FFFCu,0xC630A02u,0xC63FF2Bu));
	A(uvec4(0x8635555u,0xC63D3FFu,0xC63003Fu,0xC63FF00u));
	A(uvec4(0x8630F05u,0xC63010Fu,0x4421357u,0x4425513u));
	A(uvec4(0x863969Bu,0xC635545u,0xC634141u,0xC6379A4u));
	A(uvec4(0x4215B2Fu,0x8639687u,0x422FFFCu,0x843FFFFu));
	A(uvec4(0x863F0C0u,0xC63F3F3u,0x863F57Du,0xC6350F4u));
	A(uvec4(0x863D551u,0xC63F5F5u,0xC639540u,0xC63EAA5u));
	A(uvec4(0xC63A550u,0x1085E9A9u,0x10A558D0u,0x14C6D095u));
	A(uvec4(0x14C6FCF8u,0x18E7FBFDu,0x14C6C3EFu,0x18E7BFD6u));
	A(uvec4(0x18E7E1E0u,0x1D08B8D1u,0x1D08E6A4u,0x2129EED7u));
	A(uvec4(0x21299054u,0x2D6BBAD5u,0x296AF654u,0x2D8BDEF3u));
	A(uvec4(0x296B6990u,0x31ACA76Eu,0x2D8BD0A4u,0x35CD7DE0u));
	A(uvec4(0x2D8B17C7u,0x31ACFBFBu,0x2D8B2FAFu,0x318CC35Fu));
	A(uvec4(0x296A564Bu,0x318CAB1Bu,0x2129AA7Fu,0x296B1A2Eu));
	A(uvec4(0x14A60B1Bu,0x21290106u,0x14A61000u,0x252BD450u));
	A(uvec4(0x2109E4E0u,0x9694FDF8u,0x9694FDF4u,0xAB186BBEu));
	A(uvec4(0x8A31FFFFu,0xA2D62F7Fu,0x8E31F8F6u,0xA2F6FEFCu));
	A(uvec4(0xA2D61900u,0xAF39D645u,0x9253FEFEu,0xB35A3FFFu));
	A(uvec4(0x2D4A070Bu,0x9EB60112u,0x2F7Fu,0x421561Bu));
	A(uvec4(0x280Au,0x3322u,0xE0F4u,0x421D0E0u));
	A(uvec4(0x1A050u,0x42182E1u,0x421E0F0u,0x1085C1D0u));
	A(uvec4(0x10857D3Du,0x14A6D5EEu,0x14A6D0D0u,0x2D4BD0D0u));
	A(uvec4(0x4210302u,0x35AD0B07u,0x442E9FDu,0xC63D4D5u));
	A(uvec4(0x8635455u,0xC64595Du,0xC63E5A5u,0xC63D5E4u));
	A(uvec4(0xC63C3FFu,0xC63F3FFu,0xC63FFFFu,0xC63CFFFu));
	A(uvec4(0xC635741u,0xC635757u,0xC63033Fu,0xC630303u));
	A(uvec4(0xFFFFu,0x843FFFFu,0x442333Fu,0x4423333u));
	A(uvec4(0xC637470u,0xC63FD7Du,0x4216FBFu,0xC631F6Fu));
	A(uvec4(0x421F9F2u,0x843FFFDu,0x863A091u,0xC63E974u));
	A(uvec4(0x8639965u,0xC635A9Cu,0x8630A02u,0xC63C28Bu));
	A(uvec4(0xC63B9B0u,0xC63EAA9u,0xC63E894u,0xC84F5F9u));
	A(uvec4(0xC84FDF8u,0x1085FBFDu,0x10A5A9A0u,0x18E799E5u));
	A(uvec4(0x14A5C4E5u,0x18E75752u,0x18E79419u,0x1D0858B4u));
	A(uvec4(0x18E79265u,0x2129E9C6u,0x1D08A454u,0x296A99B9u));
	A(uvec4(0x254A4919u,0x2D8BDAECu,0x296BA4DCu,0x318C8B5Bu));
	A(uvec4(0x2D8BA081u,0x35ADAAE5u,0x31ACC319u,0x35CD9E2Eu));
	A(uvec4(0x318C3FEBu,0x31ACC0FFu,0x296A6FAAu,0x31AC5F4Fu));
	A(uvec4(0x294AAAFAu,0x318C0A5Bu,0x14C66B5Bu,0x296B061Au));
	A(uvec4(0x14A65217u,0x1CE7E080u,0x1CE99080u,0x8631F9E4u));
	A(uvec4(0x8211F4E4u,0xA718FDF9u,0x85F0ABFFu,0xA2F68182u));
	A(uvec4(0x9673C70Au,0xAB18FFE7u,0xA2F71B52u,0xAF396F6Bu));
	A(uvec4(0xA6F7D0D2u,0xAB1869C0u,0x10632F7Fu,0xAF3A0B1Fu));
	A(uvec4(0x4210E1Eu,0xC430A1Fu,0x5B5Bu,0x401E786u));
	A(uvec4(0x1B1Au,0x4015A17u,0xD1D1u,0x421D0D1u));
	A(uvec4(0xD7C7u,0x4217F5Fu,0x42181C1u,0xC640044u));
	A(uvec4(0xC63FFFFu,0x1085FCFEu,0x1085E0E4u,0x2D4BE4E0u));
	A(uvec4(0x4211F0Fu,0x35AD3F2Fu,0x422E9E8u,0x863A9E5u));
	A(uvec4(0x863FFFFu,0xC63F7FCu,0xC634696u,0xC634746u));
	A(uvec4(0xC63F0F3u,0xC630FCFu,0xC630F0Fu,0xC63FFC3u));
	A(uvec4(0xC63FFF3u,0xC633FFFu,0x8635757u,0xC630757u));
	A(uvec4(0xFFFFu,0x843FFFFu,0x4420333u,0x4420303u));
	A(uvec4(0x863FAFEu,0xC633EBEu,0x421D79Bu,0x863F5E2u));
	A(uvec4(0x8635544u,0xC63FDD7u,0xC638000u,0xC63E0E0u));
	A(uvec4(0xC635A55u,0xC630B0Fu,0xC63E540u,0xC63E4E4u));
	A(uvec4(0xC639190u,0xC64DA96u,0xC639090u,0x1085E9A4u));
	A(uvec4(0x10A5F850u,0x14A540F4u,0x14A5C4D4u,0x14C6F8FEu));
	A(uvec4(0x14C6F585u,0x18E7FEF9u,0x18E7D0C1u,0x1D08E0A0u));
	A(uvec4(0x1D089085u,0x2529D0D0u,0x2129A954u,0x2D6BFAA9u));
	A(uvec4(0x296B9D85u,0x2D8CF658u,0x2D8BA581u,0x35CDB9B4u));
	A(uvec4(0x2D8B65EBu,0x35CDE894u,0x2D8BBEB9u,0x35CD85CBu));
	A(uvec4(0x2D8B1E2Fu,0x35ADFA66u,0x2D8BFD6Cu,0x35ADA6F9u));
	A(uvec4(0x1D08AFABu,0x318C1B5Fu,0x14A6075Bu,0x21294102u));
	A(uvec4(0x14C79040u,0x8211F8E4u,0x39CFE994u,0x9AB4FAF9u));
	A(uvec4(0x8A116FBEu,0xA2F7051Bu,0x85F080C1u,0x9674D590u));
	A(uvec4(0x9EB5FDFAu,0xAF39F8E8u,0xAB181555u,0xAF5AFF05u));
	A(uvec4(0x9A95A59Au,0xB35A2F6Au,0xC430207u,0xAB180001u));
	A(uvec4(0x4210506u,0x8432A1Bu,0xDBD3u,0x4217FEFu));
	A(uvec4(0x2B1Au,0x4010213u,0x54D4u,0x401D154u));
	A(uvec4(0x1665Bu,0x421D2A5u,0x1E484u,0x421EFEFu));
	A(uvec4(0x843F8F8u,0x1085A4A4u,0x1064E4E4u,0x2D6CE4E4u));
	A(uvec4(0x10843F3Fu,0x39AEBF7Fu,0x421FCFEu,0x843FDFDu));
	A(uvec4(0xC63FFF3u,0xC635D7Cu,0xC63DFCFu,0xC63FFDFu));
	A(uvec4(0xC63CFCFu,0xC63FFFFu,0xFFFFu,0xC63FFFFu));
	A(uvec4(0x8635F5Fu,0xC631757u,0x8631717u,0xC635555u));
	A(uvec4(0xFFFFu,0x843FFFFu,0x442FF3Fu,0x442C0FFu));
	A(uvec4(0x4216F7Fu,0xC63835Fu,0x421FDF8u,0x863FFFFu));
	A(uvec4(0x863A5A4u,0xC63FFABu,0xC63F5F4u,0xC63F5F5u));
	A(uvec4(0xC63D747u,0xC6377D5u,0xFFFFu,0xC63FFFFu));
	A(uvec4(0xC63A550u,0x1085B9A9u,0xC84A5E5u,0x10A5B5A4u));
	A(uvec4(0x10A5D541u,0x14A514ECu,0x14A5E590u,0x18E7FEF9u));
	A(uvec4(0x18E71004u,0x1CE714D5u,0x18E76450u,0x2129D9A5u));
	A(uvec4(0x1D08B8F8u,0x2549F5F4u,0x254A69F4u,0x2D6BD55Fu));
	A(uvec4(0x296BF8E5u,0x31ACFFFEu,0x2D8C91E1u,0x35ADBEA5u));
	A(uvec4(0x31AC5068u,0x35CE78E4u,0x31ACC700u,0x35CD9FFDu));
	A(uvec4(0x318C3BCDu,0x35CDE12Au,0x2D8B7D5Bu,0x31AD212Eu));
	A(uvec4(0x14C61B6Fu,0x296B0607u,0x18C74000u,0x358DD490u));
	A(uvec4(0x254BF9F8u,0x8A32FFFEu,0x89F0AEFEu,0x9273155Au));
	A(uvec4(0x85CF5BBFu,0x8E32E047u,0x8A11E490u,0xAF39FDF8u));
	A(uvec4(0xAB18F6A4u,0xB35AFFFAu,0xA718EAA5u,0xBB9C005Au));
	A(uvec4(0x81EF7FBFu,0xAB391F2Fu,0x4219DFBu,0xC43478Fu));
	A(uvec4(0x4215765u,0x8430B57u,0x5B6Fu,0x421BA47u));
	A(uvec4(0x6905u,0x4011C7Au,0xD1D1u,0x4014591u));
	A(uvec4(0x1D7D3u,0x4219FDBu,0x5FAFu,0x4211F9Fu));
	A(uvec4(0x421FDFEu,0xC63FCFDu,0xC64F4F4u,0x294BE4F4u));
	A(uvec4(0x2D6CA924u,0x39CF90F8u,0x8430100u,0x1CE80302u));
	A(uvec4(0xC63211Au,0xC63F727u,0xC633FFFu,0xC633F3Fu));
	A(uvec4(0xC633F3Fu,0xC633C3Fu,0xC63FCFCu,0xC633CFCu));
	A(uvec4(0x8635B5Bu,0xC634547u,0x8637F7Fu,0x8631F7Fu));
	A(uvec4(0x4423F3Fu,0x843FF3Fu,0x442E080u,0x843FFFAu));
	A(uvec4(0x421F4E2u,0x843FFFDu,0x863E495u,0xC63FDB4u));
	A(uvec4(0xC63FFFFu,0xC633FFCu,0xC635A56u,0xC84E4A5u));
	A(uvec4(0xC63FCFCu,0xC64FFF3u,0xC634141u,0x1084AE56u));
	A(uvec4(0xC849969u,0x1085B8A9u,0xC84F6F5u,0x10A5F0F6u));
	A(uvec4(0x10A5C0E0u,0x14C6FEF6u,0x14C68519u,0x1D0824C2u));
	A(uvec4(0x18E7C2F0u,0x1D08A504u,0x18E7A999u,0x2129C2D5u));
	A(uvec4(0x21294040u,0x2D8CE190u,0x296A5894u,0x35ADAFA9u));
	A(uvec4(0x2D8BEB53u,0x35CD3DEDu,0x318C5A2Du,0x39EE9FA2u));
	A(uvec4(0x318C8245u,0x39CEBFE4u,0x31AC465Bu,0x39CE1401u));
	A(uvec4(0x318C3136u,0x35CD2221u,0x1CE76FBFu,0x2D6B1B2Fu));
	A(uvec4(0x14C69243u,0x2109F4E0u,0x20E9E4D0u,0x81F0F9F4u));
	A(uvec4(0x85F065BAu,0x8E321554u,0x85EF0A0Au,0x9232AEE0u));
	A(uvec4(0x8E119490u,0xAB18F9E4u,0xAF39B4A4u,0xB37BE9A4u));
	A(uvec4(0xA7181F6Eu,0xB37B1F1Fu,0x9AD61505u,0xB7BD2E29u));
	A(uvec4(0x2D8C7F2Fu,0x92B5BFBFu,0x218D5Fu,0x8434C8Cu));
	A(uvec4(0x210702u,0x421FEAFu,0x4216CA0u,0x442871Fu));
	A(uvec4(0x6F52u,0x421AFBFu,0xD5D5u,0x4019195u));
	A(uvec4(0x1DA9Bu,0x421C5D5u,0x5F1Fu,0x4211F1Fu));
	A(uvec4(0x421F8FCu,0xC63E4F8u,0x1084E4F4u,0x294BF8F4u));
	A(uvec4(0x2D6CF4E5u,0x39CFE594u,0x8630702u,0x35AE0B07u));
	A(uvec4(0x863F9FAu,0xC63FEF8u,0xC63FFFFu,0xC63FCFFu));
	A(uvec4(0xC63FF3Fu,0xC63FFFFu,0x8636F7Eu,0xC631B1Fu));
	A(uvec4(0x8635557u,0x8635455u,0xFFFFu,0x843FFFFu));
	A(uvec4(0x442FFF3u,0x843FFFFu,0x8634000u,0xC63E490u));
	A(uvec4(0x8639554u,0xC64EFE6u,0xC63FF3Fu,0xC64FFFFu));
	A(uvec4(0xC634959u,0xC64AF5Au,0xC6382E0u,0xC63FFFFu));
	A(uvec4(0xC639959u,0x1085B5D4u,0xC84576Eu,0x10856EC7u));
	A(uvec4(0xC84F9F8u,0x1085FFBBu,0xC846B6Au,0x14A5F1F1u));
	A(uvec4(0x10A5ED7Eu,0x14C6F4E7u,0x14C64150u,0x1D08E001u));
	A(uvec4(0x14C7B4ECu,0x1D082878u,0x1D070000u,0x2D6BD550u));
	A(uvec4(0x254A48E5u,0x318CE5F0u,0x2D8BDFDFu,0x31ACB4FFu));
	A(uvec4(0x2D8CF783u,0x35CDC5BCu,0x31AC78A6u,0x39CECBDEu));
	A(uvec4(0x35ADB82Au,0x39EEF7EAu,0x31AC6554u,0x39CE4B02u));
	A(uvec4(0x25295FAFu,0x31AC1B2Fu,0x18C64B1Fu,0x294A9146u));
	A(uvec4(0x18C7A554u,0x3DAEE9E9u,0x356CFDF8u,0x89F0BEF9u));
	A(uvec4(0x89EF59A5u,0x9674E481u,0x8E119040u,0xAF3AE5A5u));
	A(uvec4(0xA2D6F9A8u,0xB37AFFFEu,0xAF5AA0E4u,0xB79B9BC5u));
	A(uvec4(0xA7181F1Bu,0xBB9C7E1Fu,0x8E732A3Eu,0xAF7B5A06u));
	A(uvec4(0x3DEF7E7Fu,0x92B50B2Fu,0x421782Cu,0x8435199u));
	A(uvec4(0x2165FEu,0x421A793u,0x4217CFAu,0x4211439u));
	A(uvec4(0x4218803u,0x421E9F8u,0x5651u,0x4216B57u));
	A(uvec4(0xFDD9u,0x421FCBDu,0x5F1Fu,0x421BE6Bu));
	A(uvec4(0xE4F4u,0xC43E4E4u,0x1085F8F8u,0x252AF8F8u));
	A(uvec4(0x294BE5F5u,0x39AFA494u,0x8630B0Bu,0x39AE1F1Bu));
	A(uvec4(0x863FFF2u,0xC63F2FCu,0xC63FFFCu,0xC63FFFFu));
	A(uvec4(0xC63FFFFu,0xC630FFFu,0x8631A1Bu,0xC63061Au));
	A(uvec4(0x8635F5Du,0x843515Fu,0xFFFFu,0x843FFFFu));
	A(uvec4(0x8639550u,0xC63FAA5u,0x8639554u,0xC63FEA5u));
	A(uvec4(0xC635490u,0x1085BA65u,0xC840003u,0xC850100u));
	A(uvec4(0xC63F751u,0xC6474FFu,0xC634745u,0xC64F557u));
	A(uvec4(0xC63E4F4u,0x108561A5u,0xC84F6F4u,0x1085FE9Fu));
	A(uvec4(0xC847EFCu,0x10A5FFFFu,0x10A51E00u,0x14C6821Fu));
	A(uvec4(0x10A569E4u,0x18E7E525u,0x14C6ECE0u,0x18E74C3Eu));
	A(uvec4(0x18E7D481u,0x2109F8F4u,0x2129F8E8u,0x296BE8E4u));
	A(uvec4(0x296AB8D1u,0x318CEB7Cu,0x2D8BF0D4u,0x35CDD9E8u));
	A(uvec4(0x31AC7491u,0x3E0F979Au,0x31AC5D87u,0x39EEFF6Au));
	A(uvec4(0x35CDC590u,0x3E0F0640u,0x31AC254Bu,0x39CE4B19u));
	A(uvec4(0x18A56FAFu,0x2D6B5B1Bu,0x1CE79450u,0x396CFEE8u));
	A(uvec4(0x2D2AF9E4u,0x85CFD5AAu,0x85CED045u,0x92525E78u));
	A(uvec4(0x8E319450u,0xAB18E9A4u,0xA2D6F8E4u,0xB37AFFFDu));
	A(uvec4(0xB35AE5E5u,0xB79BC190u,0xB37B3D95u,0xBB9C4666u));
	A(uvec4(0x1463BFFFu,0xB77B0B2Fu,0xC4200FFu,0x86100000u));
	A(uvec4(0x4210007u,0x25090000u,0x4210042u,0x4421B19u));
	A(uvec4(0x4218002u,0x8210AFCu,0x4211B00u,0x4210007u));
	A(uvec4(0xFAFEu,0x4214091u,0x421BF61u,0x442A42Au));
	A(uvec4(0xF7F1u,0x421FFFFu,0x421A511u,0x421E0F0u));
	A(uvec4(0x421C0D0u,0x822C0C0u,0xC64F4F9u,0x294BE4E4u));
	A(uvec4(0x2D6CAFA5u,0x358DE0FEu,0xC642F1Fu,0x318D3F3Fu));
	A(uvec4(0x863F8F9u,0xC63FCF8u,0xFFFFu,0xC63FFFFu));
	A(uvec4(0x8637FBFu,0xC631B6Fu,0x863566Bu,0x8635546u));
	A(uvec4(0x8635440u,0xC63E554u,0x863FE80u,0xC63FFFFu));
	A(uvec4(0xC635500u,0xC63FA5Au,0xC630000u,0xC630030u));
	A(uvec4(0xC840A59u,0x14A5965Bu,0xC631505u,0x10855755u));
	A(uvec4(0xC635AA5u,0xC849746u,0xC63A5A5u,0x1084E195u));
	A(uvec4(0xC639591u,0x1085A6B9u,0xC84A5F4u,0x14A59699u));
	A(uvec4(0x1085F4F0u,0x14A50134u,0x10A5F6E1u,0x14A64AA4u));
	A(uvec4(0x14A5B0F5u,0x14C769ADu,0x14C6D491u,0x1D08D540u));
	A(uvec4(0x1D08E4D4u,0x254AE969u,0x254AE1D0u,0x2D8CE49Cu));
	A(uvec4(0x296BB895u,0x35CEE5A9u,0x2D8BBDB5u,0x35CEF8EAu));
	A(uvec4(0x35CD1010u,0x3E0FF171u,0x35CD3ED9u,0x3DEF6E57u));
	A(uvec4(0x35AD54D3u,0x3E0F271Au,0x25292F7Fu,0x35AD1A4Bu));
	A(uvec4(0x1CE7D2CAu,0x2929A4A1u,0x24E855AAu,0x81ADE494u));
	A(uvec4(0x354BF8E0u,0x8E109FBEu,0x85EEE081u,0x9EB5FEF8u));
	A(uvec4(0x9EB6E490u,0xB37AFEF9u,0xB77BA450u,0xBBBC19B8u));
	A(uvec4(0x9674FFFFu,0xB79B2FFFu,0x96736FFFu,0xB35A010Bu));
	A(uvec4(0x8220003u,0x81EF0000u,0x42111D5u,0x843FF05u));
	A(uvec4(0x55BFu,0x843FF45u,0x5A6u,0x4226F55u));
	A(uvec4(0xFCF3u,0x401F1FFu,0x1F5Au,0x421BF7Fu));
	A(uvec4(0x94EAu,0x4015595u,0x42105FAu,0x4218000u));
	A(uvec4(0xD2FBu,0x4215F5Fu,0x21969Bu,0x421E0E4u));
	A(uvec4(0x4214880u,0x421CB8Eu,0xC63E8F8u,0x20E9E8E8u));
	A(uvec4(0x252AFEF9u,0x358DF8F9u,0x18E72F3Fu,0x35AE7F3Fu));
	A(uvec4(0xC63FCF0u,0xC63F7F7u,0xC63FFFFu,0xC63FF3Fu));
	A(uvec4(0x8630B1Bu,0xC630606u,0x8639040u,0xC63E590u));
	A(uvec4(0xC635000u,0xC63F4A4u,0xC63DDD4u,0xC63FFFFu));
	A(uvec4(0xC630080u,0x1063FF0Au,0xC63FF05u,0x1063FFFFu));
	A(uvec4(0x10A50000u,0x14C6AE54u,0xC849B47u,0x1085BF0Bu));
	A(uvec4(0xC6377D3u,0xC84FF7Fu,0xC631E95u,0xC845B6Du));
	A(uvec4(0xC63A995u,0x1085A4B5u,0x1084A595u,0x14C669B4u));
	A(uvec4(0xC84A156u,0x14A6BDF5u,0x10A5EF9Au,0x14A62FBFu));
	A(uvec4(0x10A5D5A5u,0x18C7F4E1u,0x18E7E8E4u,0x2129E5A8u));
	A(uvec4(0x2129A0A4u,0x254AF044u,0x254AE5F1u,0x318CF4FEu));
	A(uvec4(0x296AEFFCu,0x35ADFEEBu,0x31ACA664u,0x3DEFE6C7u));
	A(uvec4(0x39CD2464u,0x3E0F6F8Bu,0x35AD596Bu,0x820F5221u));
	A(uvec4(0x2D6B1E2Fu,0x39CE5A4Bu,0x1CC60B2Fu,0x2D6B460Bu));
	A(uvec4(0x1CC79454u,0x314AFAE9u,0x396C1040u,0xA6F7D000u));
	A(uvec4(0x81AE9040u,0xB35B2FA9u,0x1CC7FFFFu,0x9EB605AFu));
	A(uvec4(0xC43FFFFu,0xA2F70056u,0xC43AAFFu,0xAB180005u));
	A(uvec4(0xC63012Fu,0x9E950000u,0xC21E9A4u,0xC64FFFBu));
	A(uvec4(0x443FEA4u,0xC64FFF9u,0xC636400u,0xC65AABDu));
	A(uvec4(0xC645500u,0xC66FE55u,0x8635500u,0xC87FFA5u));
	A(uvec4(0x4215605u,0x1087FFAAu,0x4210500u,0xC85BF5Au));
	A(uvec4(0x1501u,0x4435F56u,0x95A9u,0x4211B96u));
	A(uvec4(0xB5Fu,0x4011D5Bu,0x1E4E4u,0x42180E5u));
	A(uvec4(0x4219F87u,0x422AF9Fu,0xC63F8F8u,0x1CE8FCF8u));
	A(uvec4(0x2509F8F8u,0x316CA4E4u,0x252A3F3Fu,0x358DBE7Eu));
	A(uvec4(0xC630201u,0x18C70302u,0xC632F6Fu,0xC630B1Bu));
	A(uvec4(0x8635505u,0xC63FDF5u,0x863FEF4u,0xC63FFFFu));
	A(uvec4(0xC639550u,0x1083F5F5u,0xFFFFu,0x1063FFFFu));
	A(uvec4(0xFFFFu,0x1063FFFFu,0xFFFFu,0x1063FFFFu));
	A(uvec4(0x10A5655Fu,0x14A6B9B0u,0x10855515u,0x14A67E65u));
	A(uvec4(0xC639645u,0x14A66E96u,0xFFFFu,0xC64FFFFu));
	A(uvec4(0xC63D9D5u,0x1085F9E4u,0x10A50505u,0x14C6D4C0u));
	A(uvec4(0x10A5596Cu,0x14C69743u,0xC855A5Au,0x14C6D196u));
	A(uvec4(0x10A5FAE8u,0x18C7FEFFu,0x18E7A8D1u,0x254AE094u));
	A(uvec4(0x254A3850u,0x2D6B71C5u,0x254AC5A4u,0x35ADFAE5u));
	A(uvec4(0x318C6958u,0x3DEFFFDBu,0x39CD6DA8u,0x86316565u));
	A(uvec4(0x35AD4FBFu,0x3E0F799Cu,0x2D6BBFFEu,0x39CE1F2Bu));
	A(uvec4(0x20E76F6Fu,0x318C1A5Bu,0x20E74040u,0x3DAEC000u));
	A(uvec4(0x29299000u,0xBB9CFEF4u,0x85EFFFF8u,0xBB7C7FFFu));
	A(uvec4(0x20E8071Fu,0xAF3A0002u,0xC43071Fu,0x250A0000u));
	A(uvec4(0xC43BB41u,0xC64FFFDu,0xC64E800u,0xC850046u));
	A(uvec4(0xC649B3Fu,0xC6400ABu,0xC637AD4u,0xC65EA55u));
	A(uvec4(0xC650000u,0x212EF990u,0xC659400u,0x256FFFFEu));
	A(uvec4(0x14C8A900u,0x2DB2FFFAu,0x1CE96A00u,0x2D91FFBFu));
	A(uvec4(0x14C85600u,0x254FFFAFu,0x10A71500u,0x214EBF6Au));
	A(uvec4(0x4431505u,0x18EBBF6Au,0x4210100u,0x14A71F06u));
	A(uvec4(0x5255u,0x216F67u,0x99D9u,0x421E499u));
	A(uvec4(0x421A959u,0x84390B9u,0xC63F8F8u,0x2509E4F8u));
	A(uvec4(0x2509E5F4u,0x2D4BF9E9u,0x2D4BB9B9u,0x358D5455u));
	A(uvec4(0xC630202u,0x294B0706u,0xC635505u,0xC63EB55u));
	A(uvec4(0xC63E954u,0x1083FFFAu,0xC635554u,0x1484FAA5u));
	A(uvec4(0x10835550u,0x14845F55u,0x10830F0Fu,0x1083030Fu));
	A(uvec4(0xFFFFu,0x1063FFFFu,0xFFFFu,0x1063FFFFu));
	A(uvec4(0x1085C549u,0x14A62462u,0x10A5A55Au,0x18C7E9E4u));
	A(uvec4(0xC851A1Au,0x18C75B57u,0xC635554u,0x10A5574Bu));
	A(uvec4(0xC64F8F5u,0x1085E5A9u,0x10A55140u,0x18C76D19u));
	A(uvec4(0x10A52F5Bu,0x14A50124u,0x10A575E1u,0x14A6FEFAu));
	A(uvec4(0x14A6C4E0u,0x1CE7F054u,0x18E7FEE9u,0x2529F8FAu));
	A(uvec4(0x254AD080u,0x35ADFDE4u,0x318C21EAu,0x39CEFFD3u));
	A(uvec4(0x35ADFA9Cu,0x8210A5A4u,0x39CE8343u,0x8210ADE8u));
	A(uvec4(0x318CAB5Bu,0x8210175Bu,0x292A1B6Fu,0x35CE0E07u));
	A(uvec4(0x21080000u,0xAF5AF0C0u,0x1484FEE4u,0xBB9CFFFFu));
	A(uvec4(0xBB9C0102u,0xBBBCEACAu,0x10642F7Fu,0xBBBD1F2Fu));
	A(uvec4(0xC430007u,0x18861515u,0xC640100u,0xC65F980u));
	A(uvec4(0x863A800u,0xC65FFFFu,0xC645500u,0x1086FFA9u));
	A(uvec4(0xC645400u,0x14CAEAA5u,0x1087E440u,0x2970FEF9u));
	A(uvec4(0x254DA990u,0x35D4FFFEu,0x31B25500u,0x3E37FE99u));
	A(uvec4(0x31D49540u,0x8258FFEAu,0x35F59600u,0x8238FF96u));
	A(uvec4(0x2D915A01u,0x3E17AF6Fu,0x256F1605u,0x31B4AF5Bu));
	A(uvec4(0x1D0B6B06u,0x2570FFAFu,0x10856B05u,0x210DFFAFu));
	A(uvec4(0x4210600u,0x18EABF5Bu,0x210000u,0xC660701u));
	A(uvec4(0x421A496u,0x421E6F2u,0x842F4F8u,0x1CC7A4E4u));
	A(uvec4(0x18A7E9FEu,0x292A90E5u,0x252AE9FEu,0x2D4C54A5u));
	A(uvec4(0xC840B0Bu,0x294B1F1Bu,0xC635945u,0x1484FEDDu));
	A(uvec4(0x1084FAA4u,0x1484FFFFu,0xFFFFu,0x1483FFFFu));
	A(uvec4(0x14830000u,0x14840F00u,0x10835505u,0x14835755u));
	A(uvec4(0xFFFFu,0x1083FFFFu,0xFFFFu,0x1063FFFFu));
	A(uvec4(0x863F8FDu,0x14A596E1u,0x14A56DB4u,0x18C78169u));
	A(uvec4(0x14A57A3Du,0x18C76BAEu,0xC646662u,0x14A57F5Bu));
	A(uvec4(0xC63F8E5u,0x14A5FEF9u,0x10A585FDu,0x14C66687u));
	A(uvec4(0x10A5A293u,0x14A57CA6u,0x10A582DAu,0x14C68552u));
	A(uvec4(0x14A5E4E0u,0x1D0895B8u,0x1D08A590u,0x2D8CF5E8u));
	A(uvec4(0x2D6B81B8u,0x39CEAEF6u,0x35ADB2BCu,0x3DEFDCA5u));
	A(uvec4(0x39CEC081u,0x8210BD78u,0x39CEA757u,0x86310906u));
	A(uvec4(0x2D8C9A1Bu,0x3DEF6B65u,0x18A61B6Fu,0x318C8617u));
	A(uvec4(0x1CC6FDF8u,0xBB9CFFFEu,0xB79C2A95u,0xBBBC12C0u));
	A(uvec4(0xBB9C7FB7u,0xBBBC04EEu,0x14852F2Fu,0xBB9C3F2Fu));
	A(uvec4(0xC435B63u,0x1065409Au,0xC659454u,0xC66F8E4u));
	A(uvec4(0xC65FFF4u,0x1087FFFBu,0x10869590u,0x14A9F9E5u));
	A(uvec4(0x14C99040u,0x2990E4E0u,0x296FE594u,0x35F5FAFAu));
	A(uvec4(0x35F5D550u,0x3A1679E0u,0x3E379050u,0x8EBAE4E4u));
	A(uvec4(0x86795510u,0x9AFBFFA9u,0x86790500u,0x9AFC5B56u));
	A(uvec4(0x3A170501u,0x8EBB5B56u,0x31D41A01u,0x3E385B1Bu));
	A(uvec4(0x25710605u,0x31D5AF4Bu,0x212D1B06u,0x2971AF6Bu));
	A(uvec4(0x1D0B0500u,0x25506F59u,0x4232F0Bu,0x1CEAFFBFu));
	A(uvec4(0x4210400u,0x14A70701u,0x421F8F8u,0x1085E4F4u));
	A(uvec4(0x14A690E4u,0x1CC80450u,0x14A7FAFFu,0x21095095u));
	A(uvec4(0x14A52F1Fu,0x252A6A6Eu,0x1084FDFCu,0x1484FFF9u));
	A(uvec4(0xFFFFu,0x1484FFFFu,0xFFFFu,0x1483FFFFu));
	A(uvec4(0x14830F0Fu,0x14843F0Fu,0x1083156Bu,0x1483AB15u));
	A(uvec4(0x10830000u,0x10830F00u,0xFFFFu,0x1083FFFFu));
	A(uvec4(0xC633A5Bu,0x1085AAAEu,0x442F9FEu,0x18C7D1E5u));
	A(uvec4(0x14A67D1Du,0x1D08B6FBu,0xC649F7Fu,0x14A5DBC3u));
	A(uvec4(0x10A56590u,0x18C7BB7Du,0x10A54BE6u,0x14A5B71Bu));
	A(uvec4(0x108507FBu,0x14A5D145u,0x10A55545u,0x14C6A6B9u));
	A(uvec4(0x14A5A0D5u,0x2129A4D0u,0x1D08F5E9u,0x2D8BF8F0u));
	A(uvec4(0x31AC5040u,0x820FB488u,0x39CE55D0u,0x82307DA5u));
	A(uvec4(0x39CEE2AFu,0x8210584Au,0x39CE4046u,0x82107BA5u));
	A(uvec4(0x25081B6Fu,0x3DEF1516u,0x1CE790C0u,0x8E53C040u));
	A(uvec4(0x9694E8EBu,0xBB9CFEFDu,0xB39B0495u,0xBBBCFFAAu));
	A(uvec4(0xAF5A6465u,0xBBBDBFBAu,0x8611BF3Fu,0xB79CFFFFu));
	A(uvec4(0x292B6A00u,0xB37CFFFFu,0x10860101u,0xA3190B07u));
	A(uvec4(0x1087D880u,0x1088E5E4u,0x14A8F8F4u,0x14C9FCFCu));
	A(uvec4(0x18EBF4E0u,0x2D92E4F4u,0x31B3F9E4u,0x35F6FAF9u));
	A(uvec4(0x35F6A554u,0x3E38E5D5u,0x8258E4E4u,0x96FCF9F5u));
	A(uvec4(0x9AFC5450u,0xA33DED9Du,0x92DC1F0Au,0x9F3C6F5Bu));
	A(uvec4(0x86591F0Bu,0x92DC5B0Bu,0x39F61F1Bu,0x82596F6Fu));
    //if(Double_pixelID == 24*7)
        //col = vec4(1.,0.,0.,1.);
    //-------------------------------------------------------------------------
	C = col + texelFetch(iChannel0,SV_DispatchThreadID,0);
    
}