#include <Pantomime/CWKOI8_U.h>

static struct charset_code code_table[]={
{0x20,0x0020}, {0x21,0x0021}, {0x22,0x0022}, {0x23,0x0023}, {0x24,0x0024}, 
{0x25,0x0025}, {0x26,0x0026}, {0x27,0x0027}, {0x28,0x0028}, {0x29,0x0029}, 
{0x2a,0x002a}, {0x2b,0x002b}, {0x2c,0x002c}, {0x2d,0x002d}, {0x2e,0x002e}, 
{0x2f,0x002f}, {0x30,0x0030}, {0x31,0x0031}, {0x32,0x0032}, {0x33,0x0033}, 
{0x34,0x0034}, {0x35,0x0035}, {0x36,0x0036}, {0x37,0x0037}, {0x38,0x0038}, 
{0x39,0x0039}, {0x3a,0x003a}, {0x3b,0x003b}, {0x3c,0x003c}, {0x3d,0x003d}, 
{0x3e,0x003e}, {0x3f,0x003f}, {0x40,0x0040}, {0x41,0x0041}, {0x42,0x0042}, 
{0x43,0x0043}, {0x44,0x0044}, {0x45,0x0045}, {0x46,0x0046}, {0x47,0x0047}, 
{0x48,0x0048}, {0x49,0x0049}, {0x4a,0x004a}, {0x4b,0x004b}, {0x4c,0x004c}, 
{0x4d,0x004d}, {0x4e,0x004e}, {0x4f,0x004f}, {0x50,0x0050}, {0x51,0x0051}, 
{0x52,0x0052}, {0x53,0x0053}, {0x54,0x0054}, {0x55,0x0055}, {0x56,0x0056}, 
{0x57,0x0057}, {0x58,0x0058}, {0x59,0x0059}, {0x5a,0x005a}, {0x5b,0x005b}, 
{0x5c,0x005c}, {0x5d,0x005d}, {0x5e,0x005e}, {0x5f,0x005f}, {0x60,0x0060}, 
{0x61,0x0061}, {0x62,0x0062}, {0x63,0x0063}, {0x64,0x0064}, {0x65,0x0065}, 
{0x66,0x0066}, {0x67,0x0067}, {0x68,0x0068}, {0x69,0x0069}, {0x6a,0x006a}, 
{0x6b,0x006b}, {0x6c,0x006c}, {0x6d,0x006d}, {0x6e,0x006e}, {0x6f,0x006f}, 
{0x70,0x0070}, {0x71,0x0071}, {0x72,0x0072}, {0x73,0x0073}, {0x74,0x0074}, 
{0x75,0x0075}, {0x76,0x0076}, {0x77,0x0077}, {0x78,0x0078}, {0x79,0x0079}, 
{0x7a,0x007a}, {0x7b,0x007b}, {0x7c,0x007c}, {0x7d,0x007d}, {0x7e,0x007e}, 
{0x7f,0x007f}, {0x80,0x2500}, {0x81,0x2502}, {0x82,0x250c}, {0x83,0x2510}, 
{0x84,0x2514}, {0x85,0x2518}, {0x86,0x251c}, {0x87,0x2524}, {0x88,0x252c}, 
{0x89,0x2534}, {0x8a,0x253c}, {0x8b,0x2580}, {0x8c,0x2584}, {0x8d,0x2588}, 
{0x8e,0x258c}, {0x8f,0x2590}, {0x90,0x2591}, {0x91,0x2592}, {0x92,0x2593}, 
{0x93,0x2320}, {0x94,0x25a0}, {0x95,0x2219}, {0x96,0x221a}, {0x97,0x2248}, 
{0x98,0x2264}, {0x99,0x2265}, {0x9a,0x00a0}, {0x9b,0x2321}, {0x9c,0x00b0}, 
{0x9d,0x00b2}, {0x9e,0x00b7}, {0x9f,0x00f7}, {0xa0,0x2550}, {0xa1,0x2551}, 
{0xa2,0x2552}, {0xa3,0x0451}, {0xa4,0x0454}, {0xa5,0x2554}, {0xa6,0x0456}, 
{0xa7,0x0457}, {0xa8,0x2557}, {0xa9,0x2558}, {0xaa,0x2559}, {0xab,0x255a}, 
{0xac,0x255b}, {0xad,0x0491}, {0xae,0x255d}, {0xaf,0x255e}, {0xb0,0x255f}, 
{0xb1,0x2560}, {0xb2,0x2561}, {0xb3,0x0401}, {0xb4,0x0404}, {0xb5,0x2563}, 
{0xb6,0x0406}, {0xb7,0x0407}, {0xb8,0x2566}, {0xb9,0x2567}, {0xba,0x2568}, 
{0xbb,0x2569}, {0xbc,0x256a}, {0xbd,0x0490}, {0xbe,0x256c}, {0xbf,0x00a9}, 
{0xc0,0x044e}, {0xc1,0x0430}, {0xc2,0x0431}, {0xc3,0x0446}, {0xc4,0x0434}, 
{0xc5,0x0435}, {0xc6,0x0444}, {0xc7,0x0433}, {0xc8,0x0445}, {0xc9,0x0438}, 
{0xca,0x0439}, {0xcb,0x043a}, {0xcc,0x043b}, {0xcd,0x043c}, {0xce,0x043d}, 
{0xcf,0x043e}, {0xd0,0x043f}, {0xd1,0x044f}, {0xd2,0x0440}, {0xd3,0x0441}, 
{0xd4,0x0442}, {0xd5,0x0443}, {0xd6,0x0436}, {0xd7,0x0432}, {0xd8,0x044c}, 
{0xd9,0x044b}, {0xda,0x0437}, {0xdb,0x0448}, {0xdc,0x044d}, {0xdd,0x0449}, 
{0xde,0x0447}, {0xdf,0x044a}, {0xe0,0x042e}, {0xe1,0x0410}, {0xe2,0x0411}, 
{0xe3,0x0426}, {0xe4,0x0414}, {0xe5,0x0415}, {0xe6,0x0424}, {0xe7,0x0413}, 
{0xe8,0x0425}, {0xe9,0x0418}, {0xea,0x0419}, {0xeb,0x041a}, {0xec,0x041b}, 
{0xed,0x041c}, {0xee,0x041d}, {0xef,0x041e}, {0xf0,0x041f}, {0xf1,0x042f}, 
{0xf2,0x0420}, {0xf3,0x0421}, {0xf4,0x0422}, {0xf5,0x0423}, {0xf6,0x0416}, 
{0xf7,0x0412}, {0xf8,0x042c}, {0xf9,0x042b}, {0xfa,0x0417}, {0xfb,0x0428}, 
{0xfc,0x042d}, {0xfd,0x0429}, {0xfe,0x0427}, {0xff,0x042a}, };

@implementation CWKOI8_U

- (id) init
{
	return [super initWithCodeCharTable: code_table  length: sizeof(code_table)/sizeof(code_table[0])];
}

- (NSString *) name
{
	return @"koi8-u";
}

@end

