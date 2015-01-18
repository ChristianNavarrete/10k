//
//  GoalEntry.h
//  10K
//
//  Created by HoodsDream on 11/17/14.
//  Copyright (c) 2014 HoodsDream. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface GoalEntry : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSData * background;
@property (nonatomic) float allTimeFloat;
@property (nonatomic) float dailyFloat;
@property (nonatomic) NSTimeInterval date;
@property (nonatomic, readonly) NSString *sectionName;


@end
