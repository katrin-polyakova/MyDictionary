//
//  MyDictionaryTests.m
//  MyDictionaryTests
//
//  Created by Kate Polyakova on 2/6/15.
//  Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TestUtils.h"
#import "UserInfo.h"

static NSString *const TARGET_ID = @"4c7b26dc-48b3-4342-98a5-4bb617831d06"; //last
//static NSString *const TARGET_ID = @"2b299072-bf0f-417c-b854-4c937d12db8e"; //middle
//static NSString *const TARGET_ID = @"69afee3a-6c18-439b-9971-91293e06180e"; //begin

@interface MyDictionaryTests : XCTestCase

@end

@implementation MyDictionaryTests

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
    XCTAssert(YES, @"Pass");
}

- (void)testExample_searchInArray {

    [self measureMetrics:[[self class] defaultPerformanceMetrics] automaticallyStartMeasuring:NO forBlock:^{
        NSMutableArray *preparedArray = [self buildPreparedArray];

        [self startMeasuring];
        __block UserInfo *targetObject;

        [TestUtils performBlock: ^() {

            int targetIndex = [preparedArray indexOfObjectPassingTest:^BOOL(UserInfo * obj, NSUInteger idx, BOOL *stop) {
                return [obj.id isEqualToString:TARGET_ID];
            }];

            if(targetIndex != NSNotFound){
                targetObject = preparedArray[targetIndex];
            }

        } nTimes:1000];
        [self stopMeasuring];

        NSLog(@"%@", targetObject);

    }];    
}
    
-(NSMutableArray *)buildPreparedArray {
        NSArray *rawData = [TestUtils loadRawDataArray];
        
        NSMutableArray *preparedArray = [[NSMutableArray alloc] initWithCapacity:rawData.count];
        for(NSDictionary *dict in rawData) {
            UserInfo *userInfo = [UserInfo infoWithDictionary:dict];
            [preparedArray addObject:userInfo];
        }
        return preparedArray;
}

- (void)testExample_searchInDictionary {
    [self measureMetrics:[[self class] defaultPerformanceMetrics] automaticallyStartMeasuring:NO forBlock:^{
        NSDictionary *preparedDictionary = [self buildPreparedDictionary];

        [self startMeasuring];
         __block UserInfo *targetObject;
        [TestUtils performBlock: ^() {
            targetObject = preparedDictionary[TARGET_ID];
        } nTimes:1000];


        [self stopMeasuring];

        NSLog(@"%@", targetObject);
    }];


}

- (NSDictionary *)buildPreparedDictionary {

    NSArray *rawData = [TestUtils loadRawDataArray];

    NSMutableDictionary *result = [[NSMutableDictionary alloc] initWithCapacity:rawData.count];
    for (NSDictionary *dict in rawData) {
        UserInfo *info = [UserInfo infoWithDictionary:dict];
        result[info.id] = info;
    }
    return result;


}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
