//
//  NSDateComponents+SexyDates.h
//  SexyDates
//
//  Created by Dominique d'Argent on 15/05/14.
//
//

#import <Foundation/Foundation.h>

@interface NSDateComponents (SexyDates)

- (NSDate *)until:(NSDate *)date;
- (NSDate *)ago;

- (NSDate *)since:(NSDate *)date;
- (NSDate *)fromNow;

@end
