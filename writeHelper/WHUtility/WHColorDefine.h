//
//  WHColorDefine.h
//  writeHelper
//
//  Created by 张成敏 on 2021/4/1.
//

#ifndef WHColorDefine_h
#define WHColorDefine_h

#define RGBACOLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]

#define WHUIColorFromHEX(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define WH_MIAN_THEME_COLOR WHUIColorFromHEX(0x6782F2)
#define WH_WHITE_COLOR WHUIColorFromHEX(0xFFFFFF)
#define WH_GARY_COLOR WHUIColorFromHEX(0x707070)
#define WH_PURPLE_COLOR WHUIColorFromHEX(0x6C87F5)
#define WH_LIGHT_PURPLE_COLOR WHUIColorFromHEX(0x96A5E5)
#define WH_HEAD_PURPLE_COLOR WHUIColorFromHEX(0x758DF0)
#define WH_BLACK_COLOR WHUIColorFromHEX(0x3B3B3B)
#define WH_LIGHT_GRAY_COLOR WHUIColorFromHEX(0x797979)


#endif /* WHColorDefine_h */
