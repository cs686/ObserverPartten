//
//  ViewController.m
//  OberservePattern
//
//  Created by cq on 16/1/30.
//  Copyright © 2016年 songsong. All rights reserved.
//

#import "ViewController.h"

static NSString *SCIENCE=@"SCIENCE";

@interface ViewController ()<SubscriptionServeProtocol>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建刊物
    [SubscriptionServe createSubscriptionNumber:SCIENCE];
    //添加用户
    [SubscriptionServe addCustom:self
           withSubscriptinNumber:SCIENCE];
    //发送消息
    [SubscriptionServe sendMessage:@"V 1.0" toSubscriptinNumber:SCIENCE];
}

- (void)subscriptionMessage:(id)message SubscriptinNumber:(NSString *)subscriptionNumber {
    NSLog(@"%@",message);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
