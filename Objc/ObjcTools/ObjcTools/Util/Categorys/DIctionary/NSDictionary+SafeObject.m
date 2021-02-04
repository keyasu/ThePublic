//
//  NSDictionary+SafeObject.m
//  ObjcTools
//
//  Created by douhuo on 2021/2/4.
//  Copyright © 2021 wangergang. All rights reserved.
//

#import "NSDictionary+SafeObject.h"
#import <objc/runtime.h>


@implementation NSObject (Swizzling)
 
//+ (BOOL)gl_swizzleMethod:(SEL)origSel withMethod:(SEL)altSel {
//    Method origMethod = class_getInstanceMethod(self, origSel);
//    Method altMethod = class_getInstanceMethod(self, altSel);
//    if (!origMethod || !altMethod) {
//        return NO;
//    }
//    class_addMethod(self,
//                    origSel,
//                    class_getMethodImplementation(self, origSel),
//                    method_getTypeEncoding(origMethod));
//    class_addMethod(self,
//                    altSel,
//                    class_getMethodImplementation(self, altSel),
//                    method_getTypeEncoding(altMethod));
//    method_exchangeImplementations(class_getInstanceMethod(self, origSel),
//                                   class_getInstanceMethod(self, altSel));
//    return YES;
//}
//
//+ (BOOL)gl_swizzleClassMethod:(SEL)origSel withMethod:(SEL)altSel {
//    return [object_getClass((id)self) gl_swizzleMethod:origSel withMethod:altSel];
//}

@end

@implementation NSDictionary (SafeObject)

- (id)SafeObject:(NSString *)keyname {
    id r = [self objectForKey:keyname];
    if (r == nil) {
        return @"";
    }
    if ([r isKindOfClass:[NSNull class]]) {
        return @""; //5.3容错
    }
    if (r == NULL) {
        return @"";
    }
    return r;
}


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        Method oldObjectAtIndex1 = class_getInstanceMethod(objc_getClass("__NSPlaceholderDictionary"), @selector(initWithObjects:forKeys:count:));
        Method newObjectAtIndex1 = class_getInstanceMethod(objc_getClass("__NSPlaceholderDictionary"), @selector(gl_initWithObjects:forKeys:count:));
        method_exchangeImplementations(oldObjectAtIndex1, newObjectAtIndex1);
    });
}

+ (instancetype)gl_dictionaryWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key) {
            continue;
        }
        if (!obj) {
            obj = [NSNull null];
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    return [self gl_dictionaryWithObjects:safeObjects forKeys:safeKeys count:j];
}

- (instancetype)gl_initWithObjects:(const id [])objects forKeys:(const id<NSCopying> [])keys count:(NSUInteger)cnt {
    id safeObjects[cnt];
    id safeKeys[cnt];
    NSUInteger j = 0;
    for (NSUInteger i = 0; i < cnt; i++) {
        id key = keys[i];
        id obj = objects[i];
        if (!key) {
            continue;
        }
        if (!obj) {
            obj = [NSNull null];
        }
        safeKeys[j] = key;
        safeObjects[j] = obj;
        j++;
    }
    return [self gl_initWithObjects:safeObjects forKeys:safeKeys count:j];
}


@end


@implementation NSMutableDictionary (NilSafe)

//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Class class = NSClassFromString(@"__NSDictionaryM");
//        [class gl_swizzleMethod:@selector(setObject:forKey:) withMethod:@selector(gl_setObject:forKey:)];
//        [class gl_swizzleMethod:@selector(setObject:forKeyedSubscript:) withMethod:@selector(gl_setObject:forKeyedSubscript:)];
//    });
//}
//
//- (void)gl_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
//    if (!aKey) {
//        return;
//    }
//    if (!anObject) {
//        anObject = [NSNull null];
//    }
//    [self gl_setObject:anObject forKey:aKey];
//}
//
//- (void)gl_setObject:(id)obj forKeyedSubscript:(id<NSCopying>)key {
//    if (!key) {
//        return;
//    }
//    if (!obj) {
//        obj = [NSNull null];
//    }
//    [self gl_setObject:obj forKeyedSubscript:key];
//}

@end

@implementation NSNull (NilSafe)


//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        [self gl_swizzleMethod:@selector(methodSignatureForSelector:) withMethod:@selector(gl_methodSignatureForSelector:)];
//        [self gl_swizzleMethod:@selector(forwardInvocation:) withMethod:@selector(gl_forwardInvocation:)];
//    });
//}
//
//- (NSMethodSignature *)gl_methodSignatureForSelector:(SEL)aSelector {
//    NSMethodSignature *sig = [self gl_methodSignatureForSelector:aSelector];
//    if (sig) {
//        return sig;
//    }
//    return [NSMethodSignature signatureWithObjCTypes:@encode(void)];
//}
//
//- (void)gl_forwardInvocation:(NSInvocation *)anInvocation {
//    NSUInteger returnLength = [[anInvocation methodSignature] methodReturnLength];
//    if (!returnLength) {
//        // nothing to do
//        return;
//    }
//
//    // set return value to all zero bits
//    char buffer[returnLength];
//    memset(buffer, 0, returnLength);
//
//    [anInvocation setReturnValue:buffer];
//}



@end
