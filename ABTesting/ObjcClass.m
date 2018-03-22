//
//  ObjcClass.m
//  ABTesting
//
//  Created by shindyu on 2018/03/22.
//  Copyright © 2018年 shindyu. All rights reserved.
//

#import "ObjcClass.h"
#import "ABTesting-Swift.h"

@implementation ObjcClass
//  // objc側から直接experimentId指定しないようにする方が安全
//- (NSString*) getBucketIdString {
//    NSString *bucketId = [ABTesting getBucketIdForExperimentId:@"Hoge"];
//    return bucketId;
//}

- (NSString*) getBucketIdStringTest3 {
    NSString *bucketId = [ABTesting getBucketIdTest3];
    return bucketId;
}
@end
