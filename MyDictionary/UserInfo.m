//
// Created by Kate Polyakova on 2/6/15.
// Copyright (c) 2015 Kate Polyakova. All rights reserved.
//

#import "UserInfo.h"


@implementation UserInfo {

}
- (instancetype)initWithId:(NSString *)id phone:(NSString *)phone fullName:(NSString *)fullName countryCode:(NSString *)countryCode city:(NSString *)city streetAddress:(NSString *)streetAddress {
    self = [super init];
    if (self) {
        self.id = id;
        self.phone = phone;
        self.fullName = fullName;
        self.countryCode = countryCode;
        self.city = city;
        self.streetAddress = streetAddress;
    }

    return self;
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.id=%@", self.id];
    [description appendFormat:@", self.phone=%@", self.phone];
    [description appendFormat:@", self.fullName=%@", self.fullName];
    [description appendFormat:@", self.countryCode=%@", self.countryCode];
    [description appendFormat:@", self.city=%@", self.city];
    [description appendFormat:@", self.streetAddress=%@", self.streetAddress];
    [description appendString:@">"];
    return description;
}


+ (instancetype)infoWithId:(NSString *)id phone:(NSString *)phone fullName:(NSString *)fullName countryCode:(NSString *)countryCode city:(NSString *)city streetAddress:(NSString *)streetAddress {
    return [[self alloc] initWithId:id phone:phone fullName:fullName countryCode:countryCode city:city streetAddress:streetAddress];
}

+ (instancetype)infoWithDictionary: (NSDictionary *) dict {
    UserInfo *result = [self infoWithId:dict[@"id"]
                                  phone:dict[@"phone"]
                               fullName:dict[@"full_name"]
                            countryCode:dict[@"country_code"]
                                   city:dict[@"city"]
                          streetAddress:dict[@"street_address"]];
    return result;
}

@end