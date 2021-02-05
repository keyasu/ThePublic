//
//  ProductDefine.h
//  ObjcTools
//
//  Created by douhuo on 2021/2/2.
//  Copyright © 2021 wangergang. All rights reserved.
//

#ifndef ProductDefine_h
#define ProductDefine_h



//日志打印 Meegar
#ifdef DEBUG

//#define DLog(format, ...) printf("")
#define DLog(format, ...) printf("""\
====================================================== \n\
>>>>>>>> \n\
class: <%p %s:(%d) \n\
method: %s\n%s\n\
<<<<<<<< \n\
======================================================\n\
""", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String])

#else
    
#define DLog(format, ...)
//#define DLog(str, args...) ((void)0)
#endif



#ifdef DEBUG
///在测试环境
#define indebug 1

#else
///不在测试环境
#define indebug 0

#endif



#endif /* ProductDefine_h */
