//
//  ViewConrollerTest.m
//  HeliosUnitTest
//
//  Created by beyo-zhaoyf on 2017/7/25.
//  Copyright © 2017年 beyo-zhaoyf. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
@interface ViewConrollerTest : XCTestCase

@end

@implementation ViewConrollerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    ViewController *vc = [[ViewController alloc]init];
    NSInteger actualValue = [vc testAdd:2 and: 3];
    NSInteger expectValue = 5;
    XCTAssertEqual(actualValue, expectValue);
    
    XCTestExpectation *loginExpectation = [self expectationWithDescription:@"login"];
    
    
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
