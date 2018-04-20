//
//  ViewController.m
//  线程间通信
//
//  Created by fenggao on 2018/4/20.
//  Copyright © 2018年 com.zhonglu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIImageView *imageView;
@end

@implementation ViewController

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //创建队列
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    //封装下载图片的操作
    NSBlockOperation *download = [NSBlockOperation blockOperationWithBlock:^{
       
        //url
        NSURL *url = [NSURL URLWithString:@""];
        NSData *imageData = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:imageData];
        
        //在主线程中显示图片
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
           
            self.imageView.image = image;
            NSLog(@"UI-------%@",[NSThread currentThread]);
        }];
    }];
    
    //把操作添加到队列
    [queue addOperation:download];
}

@end





