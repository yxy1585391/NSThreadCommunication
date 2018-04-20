//
//  ShowViewController.m
//  线程间通信
//
//  Created by fenggao on 2018/4/20.
//  Copyright © 2018年 com.zhonglu. All rights reserved.
//

#import "ShowViewController.h"
#import "XMGApps.h"
@interface ShowViewController ()
@property (nonatomic,strong) NSArray *apps;
@property (nonatomic,strong) NSMutableDictionary *images;

@end

@implementation ShowViewController

- (NSMutableDictionary *)images
{
    if (_images ==nil) {
        _images = [NSMutableDictionary dictionary];
    }
    return _images;
}

-(NSArray *)apps
{
    if(_apps ==nil){
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apps.plist" ofType:nil]];
    }
    //字典转模型
    NSMutableArray *arrM = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        //字典转换成模型
        [arrM addObject:[XMGApps appWithDict:dict]];
    }
    _apps = arrM;
    return _apps;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.apps.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建cell
    static NSString *ID = @"app";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //设置cell
    XMGApps *model = self.apps[indexPath.row];
    cell.textLabel.text =model.name;
    cell.detailTextLabel.text = model.download;
    //思路 先判断该图片是否已经下载过了.如果已经下载过了就直接使用,否则再去下载
    /*
     if(已经下载过了){
     }else{
     }
     */
    //尝试去字典中取图片
    UIImage *image = [self.images objectForKey:model.icon];
    if (image) {
        //显示图片
    }else{
        //设置图片
        NSURL *url = [NSURL URLWithString:@""];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        //保存到字典中
        [self.images setObject:image forKey:model.download];
    }
    
    //返回cell
    return cell;
}
/*
 UI不流畅 - 图片的下载操作在主线程中处理 ==>在子线程中下载图片
           重复下载的问题  内存缓存 进行优化
*/

@end





















