//
//  API_Text.m
//  HeliosUnitTest
//
//  Created by beyo-zhaoyf on 2017/7/25.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import "API_Text.h"
#import <AFNetworking.h>
@interface API_Text ()
@property (readwrite, nonatomic, strong) AFHTTPRequestOperationManager *manager;
@end
@implementation API_Text
+ (void)requestWithMethod:(NSString *)method
                 withPath:(NSString *)path
                 complate:(void(^)(id respone,NSError *error))complete {
    NSLog(@"methond -> %@",method);
    NSLog(@"path -> %@",path);
    complete(@"0",nil);
    
}
@end

