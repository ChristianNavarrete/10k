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
    [super awakeFromNib];
    
    
    self.allTimeProgressView = [[LDProgressView alloc] initWithFrame:CGRectMake(20, 130, _gradientView.frame.size.width-40, 14)];
    self.allTimeProgressView.progress = self.allTimeValue;
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


+ (CGFloat)heightForEntry:(GoalEntry *)entry {
    const CGFloat topMargin = 35.0f;
    const CGFloat bottomMargin = 80.0f;
    const CGFloat minHeight = 106.0f;
    
    UIFont *font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
    
    CGRect boundingBox = [entry.title boundingRectWithSize:CGSizeMake(202, CGFLOAT_MAX) options:(NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName: font} context:nil];
    
    return MAX(minHeight, CGRectGetHeight(boundingBox) + topMargin + bottomMargin);
}

- (void)configureCellForEntry:(GoalEntry *)entry {
    self.goalTitle.text = entry.title;
    self.allTimeValue = entry.allTimeFloat;
    self.dailyValue = entry.dailyFloat;
    self.goalBackground.image = [UIImage imageWithData:entry.background];
}


@end
