//
// Created by Kate Polyakova on 2/6/15.
// Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserInfo : NSObject

@property NSString *id;
@property NSString *phone;
@property NSString *fullName;
@property NSString *countryCode;
@property NSString *city;
@property NSString *streetAddress;

- (instancetype)initWithId:(NSString *)id phone:(NSString *)phone fullName:(NSString *)fullName countryCode:(NSString *)countryCode city:(NSString *)city streetAddress:(NSString *)streetAddress;
+ (instancetype)infoWithId:(NSString *)id phone:(NSString *)phone fullName:(NSString *)fullName countryCode:(NSString *)countryCode city:(NSString *)city streetAddress:(NSString *)streetAddress;

+ (instancetype)infoWithDictionary:(NSDictionary *)dict;

- (NSString *)description;

@end