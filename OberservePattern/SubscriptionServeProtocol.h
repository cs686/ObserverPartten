//
//  SubscriptionServeProtocol.h
//  OberservePattern
//
//  Created by cq on 16/1/30.
//  Copyright © 2016年 songsong. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SubscriptionServeProtocol <NSObject>

- (void)subscriptionMessage:(id)message SubscriptinNumber:(NSString *) subscriptionNumber;

@end
