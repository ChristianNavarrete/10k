//
//  GoalCell.h
//  10K
//
//  Created by HoodsDream on 11/8/14.
//  Copyright (c) 2014 HoodsDream. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <LDProgressView/LDProgressView.h>
#import "GoalEntry.h"


@interface GoalCell : UITableViewCell

@property (weak,nonatomic)IBOutlet UILabel *goalTitle;
@property (weak,nonatomic)IBOutlet UIImageView *goalBackground;
@property (weak, nonatomic) IBOutlet UIView *gradientView;
@property (strong, nonatomic) LDProgressView *dailyProgressView;
@property (strong, nonatomic) LDProgressView *allTimeProgressView;
@property (nonatomic) float dailyValue;
@property (nonatomic) float allTimeValue;

+ (CGFloat)heightForEntry:(GoalEntry *)entry;

- (void)configureCellForEntry:(GoalEntry *)entry;

@end
