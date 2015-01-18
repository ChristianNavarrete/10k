//
//  GoalEntry.m
//  10K
//
//  Created by HoodsDream on 11/17/14.
//  Copyright (c) 2014 HoodsDream. All rights reserved.
//

#import "GoalEntry.h"


@implementation GoalEntry

@dynamic title;
@dynamic background;
@dynamic allTimeFloat;
@dynamic dailyFloat;
@dynamic date;

- (NSString *)sectionName {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM yyyy"];
    
    return [dateFormatter stringFromDate:date];
}

@end
