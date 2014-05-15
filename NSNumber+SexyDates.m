//
//  NSNumber+SexyDates.m
//  SexyDates
//
//  Created by Dominique d'Argent on 2/26/13.
//  Copyright (c) 2013 Dominique d'Argent. All rights reserved.
//

#import "NSNumber+SexyDates.h"
#import <objc/runtime.h>


typedef NSInteger SexyDatesDuration;

static char SEXY_DATES_COMPONENTS_KEY;

@implementation NSNumber (SexyDates)

#pragma mark - Sexy durations
- (NSNumber *)second {
    return [self seconds];
}

- (NSNumber *)seconds {
    return [self sexyDates_numberForComponent:@"second"];
}

- (NSNumber *)minute {
    return [self minutes];
}

- (NSNumber *)minutes {
    return [self sexyDates_numberForComponent:@"minute"];
}

- (NSNumber *)hour {
    return [self hours];
}

- (NSNumber *)hours {
    return [self sexyDates_numberForComponent:@"hour"];
}

- (NSNumber *)day {
    return [self days];
}

- (NSNumber *)days {
    return [self sexyDates_numberForComponent:@"day"];
}

- (NSNumber *)week {
    return [self weeks];
}

- (NSNumber *)weeks {
    return [self sexyDates_numberForComponent:@"week"];
}

- (NSNumber *)month {
    return [self months];
}

- (NSNumber *)months {
    return [self sexyDates_numberForComponent:@"month"];
}

- (NSNumber *)year {
    return [self years];
}

- (NSNumber *)years {
    return [self sexyDates_numberForComponent:@"year"];
}

#pragma mark - Sexy dates
- (NSDate *)until:(NSDate *)date {
    return [[NSCalendar currentCalendar] dateByAddingComponents:self.sexyDates_invertedDateComponents
                                                         toDate:date
                                                        options:0];
}

- (NSDate *)ago {
    return [self until:[NSDate date]];
}

- (NSDate *)since:(NSDate *)date {
    return [[NSCalendar currentCalendar] dateByAddingComponents:self.sexyDates_dateComponents
                                                         toDate:date
                                                        options:0];
}

- (NSDate *)fromNow {
    return [self since:[NSDate date]];
}

#pragma mark - Private
- (instancetype)sexyDates_numberForComponent:(NSString *)component {
    static NSDictionary *componentFactors;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        componentFactors = @{
                             @"second": @(1),
                             @"minute": @(1 * 60),
                             @"hour"  : @(1 * 60 * 60),
                             @"day"   : @(1 * 60 * 60 * 24),
                             @"week"  : @(1 * 60 * 60 * 24 * 7),
                             @"month" : @(1 * 60 * 60 * 24 * 7 * 30),
                             @"year"  : @(1 * 60 * 60 * 24 * 7 * 30 * 12)
                             };
    });
    
    
    SexyDatesDuration f = [componentFactors[component] sexyDates_durationValue];
    
    NSNumber *number = @([self sexyDates_durationValue] * f);
    [number.sexyDates_dateComponents setValue:self forKey:component];
    
    return number;
}

- (SexyDatesDuration)sexyDates_durationValue {
    return [self integerValue];
}

- (NSDateComponents *)sexyDates_dateComponents {
    static NSMapTable *hashTable = nil;
    if (!hashTable) {
        hashTable = [[NSMapTable alloc] init];
    }

    NSString *hash = [hashTable objectForKey:self];
    if (!hash) {
        hash = [NSString stringWithFormat:@"%lu", (unsigned long)self.hash];
        [hashTable setObject:hash forKey:self];
    }
    
    NSDateComponents *components = objc_getAssociatedObject(hash, &SEXY_DATES_COMPONENTS_KEY);
    
    if (!components) {
        components = [[NSDateComponents alloc] init];
        
        components.second = 0;
        components.minute = 0;
        components.hour   = 0;
        components.day    = 0;
        components.week   = 0;
        components.month  = 0;
        components.year   = 0;
        
        objc_setAssociatedObject(hash,
                                 &SEXY_DATES_COMPONENTS_KEY,
                                 components,
                                 OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return components;
}

// returns a copy of the original date components
- (NSDateComponents *)sexyDates_invertedDateComponents {
    NSDateComponents *components = [self.sexyDates_dateComponents copy];
    
    components.second *= -1;
    components.minute *= -1;
    components.hour   *= -1;
    components.day    *= -1;
    components.week   *= -1;
    components.month  *= -1;
    components.year   *= -1;
    
    return components;
}

@end
