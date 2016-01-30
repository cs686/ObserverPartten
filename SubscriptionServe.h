//
//  SubscriptionServe.h
//  OberservePattern
//
//  Created by cq on 16/1/30.
//  Copyright © 2016年 songsong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SubscriptionServeProtocol.h"

@interface SubscriptionServe : NSObject

#pragma mark - 刊物的订阅号信息

/**
 *  创建订阅号
 *
 *  @param subscriptionNumber 订阅号
 */
+ (void)createSubscriptionNumber:(NSString *) subscriptionNumber;

/**
 *  移除订阅号
 *
 *  @param subscriptionNumber 订阅号
 */
+ (void)removeSubscriptinNumber:(NSString *) subscriptionNumber;

#pragma mark - 用户信息遵循一定的协议才能够满足订阅条件

/**
 *  添加订阅用户到具体的订阅号
 *
 *  @param custom             用户
 *  @param subscriptionNumber 订阅号
 */
+ (void)addCustom:(id<SubscriptionServeProtocol>)custom withSubscriptinNumber:(NSString *) subscriptionNumber;

+ (void)removeCustom:(id<SubscriptionServeProtocol>)custom withSubscriptinNumber:(NSString *) subscriptionNumber;
/**
 *  发送订阅消息
 *
 *  @param message            消息
 *  @param subscriptionNumber 订阅号
 */

+ (void)sendMessage:(id)message toSubscriptinNumber:(NSString *) subscriptionNumber;

@end
