//
//  SubscriptionServe.m
//  OberservePattern
//
//  Created by cq on 16/1/30.
//  Copyright © 2016年 songsong. All rights reserved.
//

#import "SubscriptionServe.h"

static NSMutableDictionary *_subscriptionDictionary=nil;

@implementation SubscriptionServe

+ (void)initialize {
    if ((self == [SubscriptionServe class])) {
        _subscriptionDictionary=[NSMutableDictionary dictionary];
    }
}

+ (void)createSubscriptionNumber:(NSString *) subscriptionNumber{
    NSParameterAssert(subscriptionNumber);
    NSHashTable *hashTable =[self existSubscriptinNumber:subscriptionNumber];
    if (hashTable == nil) {
        hashTable=[NSHashTable weakObjectsHashTable];
        [_subscriptionDictionary setObject:hashTable forKey:subscriptionNumber];
    }
}
+ (void)removeSubscriptinNumber:(NSString *) subscriptionNumber{
    NSParameterAssert(subscriptionNumber);
    NSHashTable *hashTable =[self existSubscriptinNumber:subscriptionNumber];
    if (hashTable == nil) {
        hashTable=[NSHashTable weakObjectsHashTable];
        [_subscriptionDictionary removeObjectForKey:subscriptionNumber];
    }

}
+ (void)addCustom:(id<SubscriptionServeProtocol>)custom withSubscriptinNumber:(NSString *) subscriptionNumber{
    NSParameterAssert(custom);
    NSParameterAssert(subscriptionNumber);
    NSHashTable *hashTable=[self existSubscriptinNumber:subscriptionNumber];
    [hashTable addObject:custom];
}

+ (void)removeCustom:(id<SubscriptionServeProtocol>)custom withSubscriptinNumber:(NSString *) subscriptionNumber{
    NSParameterAssert(subscriptionNumber);
    NSHashTable *hashTable=[self existSubscriptinNumber:subscriptionNumber];
    [hashTable removeObject:custom];
}
+ (void)sendMessage:(id)message toSubscriptinNumber:(NSString *) subscriptionNumber{
    NSParameterAssert(subscriptionNumber);
    NSHashTable *hashTable=[self existSubscriptinNumber:subscriptionNumber];
    if (hashTable) {
        NSEnumerator *enimerator =[hashTable objectEnumerator];
        id<SubscriptionServeProtocol> object=nil;
        while (object =[enimerator nextObject]) {
            if ([object respondsToSelector:@selector(subscriptionMessage:SubscriptinNumber:)]) {
                [object subscriptionMessage:message SubscriptinNumber:subscriptionNumber];
            }
        }
    }
}

+ (NSHashTable *)existSubscriptinNumber:(NSString *) subscriptionNumber{
    return [_subscriptionDictionary objectForKey:subscriptionNumber];
}

@end
