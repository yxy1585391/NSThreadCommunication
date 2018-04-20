//
//  XMGApps.h
//  线程间通信
//
//  Created by fenggao on 2018/4/20.
//  Copyright © 2018年 com.zhonglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMGApps : NSObject

@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *icon;
@property (nonatomic,strong) NSString *download;

+(instancetype)appWithDict:(NSDictionary *)dict;
@end
