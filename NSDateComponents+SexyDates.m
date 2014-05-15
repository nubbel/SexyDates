//
//  NSDateComponents+SexyDates.m
//  SexyDates
//
//  Created by Dominique d'Argent on 15/05/14.
//
//

#import "NSDateComponents+SexyDates.h"

@implementation NSDateComponents (SexyDates)

- (NSDate *)until:(NSDate *)date {
    return [[NSCalendar currentCalendar] dateByAddingComponents:[self sexyDates_invertedDateComponents]
                                                         toDate:date
                                                        options:0];
}

- (NSDate *)ago {
    return [self until:[NSDate date]];
}

- (NSDate *)since:(NSDate *)date {
    return [[NSCalendar currentCalendar] dateByAddingComponents:self
                                                         toDate:date
                                                        options:0];
}

- (NSDate *)fromNow {
    return [self since:[NSDate date]];
}


#pragma mark - Private

#define SexyDates_SafeInvertDateComponent(components, unit) \
        if (components.unit != NSDateComponentUndefined) { \
            components.unit *= -1; \
        }

- (NSDateComponents *)sexyDates_invertedDateComponents {
    NSDateComponents *invertedComponents = [self copy];

    SexyDates_SafeInvertDateComponent(invertedComponents, second);
    SexyDates_SafeInvertDateComponent(invertedComponents, minute);
    SexyDates_SafeInvertDateComponent(invertedComponents, hour);
    SexyDates_SafeInvertDateComponent(invertedComponents, day);
    SexyDates_SafeInvertDateComponent(invertedComponents, week);
    SexyDates_SafeInvertDateComponent(invertedComponents, month);
    SexyDates_SafeInvertDateComponent(invertedComponents, year);

    return invertedComponents;
}

@end
