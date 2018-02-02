//
//  UIViewController+NewYearPresent.m
//  AVPLAYER
//
//  Created by 胡杨林 on 2018/1/24.
//  Copyright © 2018年 胡杨林. All rights reserved.
//

#import "UIViewController+NewYearPresent.h"
#import <objc/runtime.h>
@implementation UIViewController (NewYearPresent)

+(void)load{
    [super load];
    Method originMethod = class_getInstanceMethod([self class], @selector(viewWillAppear:));
    Method NewYearMethod = class_getInstanceMethod([self class], @selector(NewYearViewWillAppear:));
    method_exchangeImplementations(originMethod, NewYearMethod);
    /*
     + (void)load {
     [super load];
     // 通过class_getInstanceMethod()函数从当前对象中的method list获取method结构体，如果是类方法就使用class_getClassMethod()函数获取。
     Method fromMethod = class_getInstanceMethod([self class], @selector(viewDidLoad));
     Method toMethod = class_getInstanceMethod([self class], @selector(swizzlingViewDidLoad));
     *  我们在这里使用class_addMethod()函数对Method Swizzling做了一层验证，如果self没有实现被交换的方法，会导致失败。
     *  而且self没有交换的方法实现，但是父类有这个方法，这样就会调用父类的方法，结果就不是我们想要的结果了。
     *  所以我们在这里通过class_addMethod()的验证，如果self实现了这个方法，class_addMethod()函数将会返回NO，我们就可以对其进行交换了。
    if (!class_addMethod([self class], @selector(viewDidLoad), method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
        method_exchangeImplementations(fromMethod, toMethod);
    }
     */
}

-(void)NewYearViewWillAppear:(BOOL)animated{
    [self NewYearViewWillAppear:animated];
    NSLog(@"黑科技触发");
}

@end
