//
//  GoalCell.m
//  10K
//
//  Created by HoodsDream on 11/8/14.
//  Copyright (c) 2014 HoodsDream. All rights reserved.
//

#import "GoalCell.h"





@implementation GoalCell

@synthesize goalTitle = _goalTitle;
@synthesize goalBackground = _goalBackground;
@synthesize gradientView = _gradientView;



- (void)awakeFromNib {
    
    self.dailyProgressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 130, _gradientView.frame.size.width-40, 18)];
    self.dailyProgressView.progress = *(self.dailyValue);
    self.dailyProgressView.color = [UIColor colorWithRed:0.00f green:0.60f blue:0.80f alpha:1.00f];
    self.dailyProgressView.flat = @YES;
    self.dailyProgressView.animate = @YES;
    self.dailyProgressView.center = CGPointMake(_gradientView.frame.size.width / 2 , _gradientView.frame.size.height / 2);
    
    [self addSubview:self.dailyProgressView];
    
    self.allTimeProgressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 130, _gradientView.frame.size.width-40, 14)];
    self.allTimeProgressView.progress = 0.4;
    self.allTimeProgressView.color = [UIColor colorWithRed:0.00f green:0.70f blue:0.00f alpha:1.00f];
    self.allTimeProgressView.flat = @YES;
    self.allTimeProgressView.animate = @YES;
    self.allTimeProgressView.center = CGPointMake(_gradientView.frame.size.width / 2 , _gradientView.frame.size.height / 2 + 60);
    
    [self addSubview:self.allTimeProgressView];
    
    
    _gradientView.alpha = 0.6;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:NO animated:NO];

    // Configure the view for the selected state
}

@end
