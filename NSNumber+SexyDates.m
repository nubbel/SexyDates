//
//  NSNumber+SexyDates.m
//  SexyDates
//
//  Created by Dominique d'Argent on 2/26/13.
//  Copyright (c) 2013 Dominique d'Argent. All rights reserved.
//

#import "NSNumber+SexyDates.h"


@implementation NSNumber (SexyDates)

#pragma mark - Sexy durations
- (NSDateComponents *)second {
    return [self seconds];
}

- (NSDateComponents *)seconds {
    NSDateComponents *components = [NSDateComponents new];
    components.second = [self integerValue];

    return components;
}

- (NSDateComponents *)minute {
    return [self minutes];
}

- (NSDateComponents *)minutes {
    NSDateComponents *components = [NSDateComponents new];
    components.minute = [self integerValue];

    return components;
}

- (NSDateComponents *)hour {
    return [self hours];
}

- (NSDateComponents *)hours {
    NSDateComponents *components = [NSDateComponents new];
    components.hour = [self integerValue];

    return components;
}

- (NSDateComponents *)day {
    return [self days];
}

- (NSDateComponents *)days {
    NSDateComponents *components = [NSDateComponents new];
    components.day = [self integerValue];

    return components;
}

- (NSDateComponents *)week {
    return [self weeks];
}

- (NSDateComponents *)weeks {
    NSDateComponents *components = [NSDateComponents new];
    components.week = [self integerValue];

    return components;
}

- (NSDateComponents *)month {
    return [self months];
}

- (NSDateComponents *)months {
    NSDateComponents *components = [NSDateComponents new];
    components.month = [self integerValue];

    return components;
}

- (NSDateComponents *)year {
    return [self years];
}

- (NSDateComponents *)years {
    NSDateComponents *components = [NSDateComponents new];
    components.year = [self integerValue];

    return components;
}

@end
