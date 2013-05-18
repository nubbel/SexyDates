//
//  NSNumber+SexyDates.h
//  SexyDates
//
//  Created by Dominique d'Argent on 2/26/13.
//  Copyright (c) 2013 Dominique d'Argent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (SexyDates)

- (NSNumber *)second;
- (NSNumber *)seconds;

- (NSNumber *)minute;
- (NSNumber *)minutes;

- (NSNumber *)hour;
- (NSNumber *)hours;

- (NSNumber *)day;
- (NSNumber *)days;

- (NSNumber *)week;
- (NSNumber *)weeks;

- (NSNumber *)month;
- (NSNumber *)months;

- (NSNumber *)year;
- (NSNumber *)years;

- (NSDate *)until:(NSDate *)date;
- (NSDate *)ago;

- (NSDate *)since:(NSDate *)date;
- (NSDate *)fromNow;

@end
