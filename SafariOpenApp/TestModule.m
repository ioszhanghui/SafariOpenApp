//
//  TestModule.m
//  SafariOpenApp
//
//  Created by 小飞鸟 on 2019/05/10.
//  Copyright © 2019 小飞鸟. All rights reserved.
//

#import "TestModule.h"

NSString const * SchemeURL  = @"gomeshop://gorder.m.gome.com.cn/productDetail";

@implementation TestModule
/*注册 路由*/
+(void)registerURL{
    [GMURLRouter registerURLPattern:SchemeURL class:@"TestViewController"];
}
@end
