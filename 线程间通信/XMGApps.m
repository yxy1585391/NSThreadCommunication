//
//  XMGApps.m
//  线程间通信
//
//  Created by fenggao on 2018/4/20.
//  Copyright © 2018年 com.zhonglu. All rights reserved.
//

#import "XMGApps.h"

@implementation XMGApps

+(instancetype)appWithDict:(NSDictionary *)dict
{
    XMGApps *app = [[XMGApps alloc] init];
    //转模型
    //KVC 注意点--> --对应
    [app setValuesForKeysWithDictionary:dict];
}
@end
