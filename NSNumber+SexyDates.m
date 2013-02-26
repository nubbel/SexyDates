//
//  NSNumber+SexyDates.m
//  SexyDates
//
//  Created by Dominique d'Argent on 2/26/13.
//  Copyright (c) 2013 Dominique d'Argent. All rights reserved.
//

#import "NSNumber+SexyDates.h"

#import <objc/runtime.h>


@interface NSNumber (SexyDatesPrivate)

@property (nonatomic, strong) NSDictionary *dateComponentsDictionary;

@end

static char DATE_COMPONENTS_DICTIONARY_KEY;

static NSString *const DATE_COMPONTENTS_MONTH_KEY = @"month";
static NSString *const DATE_COMPONTENTS_YEAR_KEY  = @"year";

@implementation NSNumber (SexyDatesPrivate)

- (void)setDateComponentsDictionary:(NSDictionary *)dateComponentsDictionary {
    objc_setAssociatedObject(self, &DATE_COMPONENTS_DICTIONARY_KEY, dateComponentsDictionary, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary *)dateComponentsDictionary {
    return objc_getAssociatedObject(self, &DATE_COMPONENTS_DICTIONARY_KEY);
}

- (NSDateComponents *)dateComponents:(BOOL)inverted {
    NSDictionary *dict = self.dateComponentsDictionary;
    if (dict) {
        NSInteger sign = inverted ? -1 : 1;
        
        NSDateComponents *components = [[NSDateComponents alloc] init];
        
        [dict enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSNumber *value, BOOL *stop) {
            if ([key isEqualToString:DATE_COMPONTENTS_MONTH_KEY]) {
                components.month = sign * [value integerValue];
            }
            else if ([key isEqualToString:DATE_COMPONTENTS_YEAR_KEY]) {
                components.year = sign * [value integerValue];
            }
        }];
        
        return components;
    }
    
    return nil;
}

@end


@implementation NSNumber (SexyDates)

- (NSTimeInterval)timeIntervalValue {
    return (NSTimeInterval)[self doubleValue];
}

- (NSNumber *)second {
    return [self seconds];
}

- (NSNumber *)seconds {
    return @([self timeIntervalValue]);
}

- (NSNumber *)minute {
    return [self minutes];
}

- (NSNumber *)minutes {
    return @([self timeIntervalValue] * 60.0);
}

- (NSNumber *)hour {
    return [self hours];
}

- (NSNumber *)hours {
    return @([self timeIntervalValue] * 60.0 * 60.0);
}

- (NSNumber *)day {
    return [self days];
}

- (NSNumber *)days {
    return @([self timeIntervalValue] * 60.0 * 60.0 * 24.0);
}

- (NSNumber *)week {
    return [self weeks];
}

- (NSNumber *)weeks {
    return [@([self timeIntervalValue] * 7.0) days];
}

- (NSNumber *)month {
    return [self months];
}

- (NSNumber *)months {
    NSNumber *number = [@([self timeIntervalValue] * 30.0) days];
    
    number.dateComponentsDictionary = @{DATE_COMPONTENTS_MONTH_KEY: @([self integerValue])};
    
    return number;
}

- (NSNumber *)year {
    return [self years];
}

- (NSNumber *)years {
    NSNumber *number = [@([self timeIntervalValue] * 365.0) days];
    
    number.dateComponentsDictionary = @{DATE_COMPONTENTS_YEAR_KEY: @([self doubleValue])};
    
    return number;
}

#pragma mark - Date creation
- (NSDate *)until:(NSDate *)date {
    NSDateComponents *components = [self dateComponents:YES];
    if (components) {
        return [[NSCalendar currentCalendar] dateByAddingComponents:components
                                                             toDate:date
                                                            options:0];
    }
    
    return [NSDate dateWithTimeInterval:-[self timeIntervalValue]
                              sinceDate:date];
}

- (NSDate *)ago {
    return [self until:[NSDate date]];
}

- (NSDate *)since:(NSDate *)date {
    NSDateComponents *components = [self dateComponents:NO];
    if (components) {
        return [[NSCalendar currentCalendar] dateByAddingComponents:components
                                                             toDate:date
                                                            options:0];
    }
    
    return [NSDate dateWithTimeInterval:[self timeIntervalValue]
                              sinceDate:date];
}

- (NSDate *)fromNow {
    return [self since:[NSDate date]];
}

@end
