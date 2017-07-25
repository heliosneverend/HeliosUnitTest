//
//  HeliosUnitTestTests.m
//  HeliosUnitTestTests
//
//  Created by beyo-zhaoyf on 2017/7/25.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "API_Text.h"
@interface HeliosUnitTestTests : XCTestCase

@end

@implementation HeliosUnitTestTests

- (void)setUp {
    [super setUp];
    NSLog(@"test开始");
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    NSLog(@"test结束");
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    NSLog(@"testing");
    ViewController *VC = [[ViewController alloc]init];
    NSInteger num =  [VC getNum];
    XCTAssert(num < 11,@"number should less than 10");
    XCTestExpectation *loginExpection = [self expectationWithDescription:@"login"];
    [API_Text requestWithMethod:@"login" withPath:@"HeliosPath" complate:^(id respone, NSError *error) {
        switch ([respone integerValue]) {
            case 0:
            {
                [loginExpection fulfill];
        
                NSLog(@"登录成功了");
            }
                break;
                
            default:
                break;
        }
        if (error) {
            NSLog(@"出错了");
        }
    }];
    //必须加超时处理 不然断言无法往下执行
    [self waitForExpectationsWithTimeout:30 handler:^(NSError * _Nullable error) {
        
    }];

}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
        NSLog(@"性能测试,block 运行10次 的时间");
        ViewController *VC = [[ViewController alloc]init];
        NSInteger num =  [VC getNum];
        
    }];
}

@end
