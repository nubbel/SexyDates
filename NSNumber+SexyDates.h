//
//  NSNumber+SexyDates.h
//  SexyDates
//
//  Created by Dominique d'Argent on 2/26/13.
//  Copyright (c) 2013 Dominique d'Argent. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumber (SexyDates)

- (NSDateComponents *)second;
- (NSDateComponents *)seconds;

- (NSDateComponents *)minute;
- (NSDateComponents *)minutes;

- (NSDateComponents *)hour;
- (NSDateComponents *)hours;

- (NSDateComponents *)day;
- (NSDateComponents *)days;

- (NSDateComponents *)week;
- (NSDateComponents *)weeks;

- (NSDateComponents *)month;
- (NSDateComponents *)months;

- (NSDateComponents *)year;
- (NSDateComponents *)years;

@end
