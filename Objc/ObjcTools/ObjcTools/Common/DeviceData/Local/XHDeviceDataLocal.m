//
//  XHDeviceDataLocal.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/20.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "XHDeviceDataLocal.h"
#import "IOPSKeys.h"
#import "IOPowerSources.h"


@interface XHDeviceDataLocal ()


@end

@implementation XHDeviceDataLocal

+ (instancetype)shared {
    static XHDeviceDataLocal * insatnce = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        insatnce = [[XHDeviceDataLocal alloc] init];
        insatnce.device = [[UIDevice alloc]init];
        insatnce.dicInfo = [[NSBundle mainBundle] infoDictionary];
        NSLog(@"应用所有信息 %@", insatnce.dicInfo);
    });
    return insatnce;
}

//MARK: tools
- (double)getCurrentBatteryLevel
{
    //Returns a blob of Power Source information in an opaque CFTypeRef.
    CFTypeRef blob = IOPSCopyPowerSourcesInfo();
    
    //Returns a CFArray of Power Source handles, each of type CFTypeRef.
    CFArrayRef sources = IOPSCopyPowerSourcesList(blob);
    
    CFDictionaryRef pSource = NULL;
    const void *psValue;
    
    //Returns the number of values currently in an array.
    int numOfSources = CFArrayGetCount(sources);
    
    //Error in CFArrayGetCount
    if (numOfSources == 0)
    {
        NSLog(@"Error in CFArrayGetCount");
        return -1.0f;
    }
    
    //Calculating the remaining energy
    for (int i = 0 ; i < numOfSources ; i++)
    {
        //Returns a CFDictionary with readable information about the specific power source.
        pSource = IOPSGetPowerSourceDescription(blob, CFArrayGetValueAtIndex(sources, i));
        if (!pSource)
        {
            NSLog(@"Error in IOPSGetPowerSourceDescription");
            return -1.0f;
        }
        psValue = (CFStringRef)CFDictionaryGetValue(pSource, CFSTR(kIOPSNameKey));
        
        int curCapacity = 0;
        int maxCapacity = 0;
        double percent;
        
        psValue = CFDictionaryGetValue(pSource, CFSTR(kIOPSCurrentCapacityKey));
        CFNumberGetValue((CFNumberRef)psValue, kCFNumberSInt32Type, &curCapacity);
        
        psValue = CFDictionaryGetValue(pSource, CFSTR(kIOPSMaxCapacityKey));
        CFNumberGetValue((CFNumberRef)psValue, kCFNumberSInt32Type, &maxCapacity);
        
        percent = ((double)curCapacity/(double)maxCapacity * 100.0f);
        
        return percent;
    }
    return -1.0f;
}








@end
