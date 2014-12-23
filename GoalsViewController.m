//
//  GoalsViewController.m
//  10K
//
//  Created by HoodsDream on 11/8/14.
//  Copyright (c) 2014 HoodsDream. All rights reserved.
//

#import "GoalsViewController.h"
#import "THCoreDataStack.h"
#import "GoalCell.h"
#import "LDProgressView.h"
#import "GoalEntryViewController.h"

@interface GoalsViewController () <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) UIImage *userImage;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIImage *userBackgroundImage;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *userHeadline;

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;


@end

@implementation GoalsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.fetchedResultsController performFetch:nil];
    
    [self setHeaderImage:[UIImage imageNamed:@"abstractbg.jpg"]];
    [self setTitleText:[NSString stringWithFormat:@"%@'s Goals", self.userName]];
    [self setSubtitleText:self.userHeadline];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, [self headerHeight] - 240, 160,160)];
    
        [self.imageView setImage:self.userImage];
    
        self.imageView.layer.cornerRadius = 80;
        self.imageView.layer.borderWidth = 4.0f;
        self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.imageView.layer.masksToBounds = YES;
        [self addHeaderOverlayView:self.imageView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.fetchedResultsController.sections.count;
}

-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    
    static NSString *cellIdentifier = @"Cell";
    GoalCell *cell = (GoalCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.goalTitle.text = @"Marvel Vs Capcom 2 Pro!";
    cell.goalBackground.image = [UIImage imageNamed:@"mvc2.jpg"];
    
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"GoalsTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    return cell;
}



- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 201;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
