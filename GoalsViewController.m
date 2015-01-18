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
#import "GoalEntry.h"
#import "LDProgressView.h"
#import "GoalEntryViewController.h"

@interface GoalsViewController () <NSFetchedResultsControllerDelegate>


@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIImage *userImage;
@property (strong, nonatomic) UIImage *userBackgroundImage;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *userHeadline;


@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;


@end

@implementation GoalsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.fetchedResultsController performFetch:nil];
    
    self.navigationItem.leftBarButtonItem = nil;
    
    self.navigationController.navigationBar.hidden = NO;
    
    [self setHeaderImage:[UIImage imageNamed:@"abstract.jpg"]];
    
    if (self.userName.length == 0) {
        self.userName = @"My";
    }
        [self setTitleText:[NSString stringWithFormat:@"%@'s Goals", self.userName]];
    
    
    if (self.userHeadline.length == 0) {
        self.userHeadline = @"Enter a Headline!";
    }
        [self setSubtitleText:self.userHeadline];
    
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width/2, [self headerHeight] - 240, 160,160)];
    
    if (self.userImage == nil) {
        self.userImage = [UIImage imageNamed:@"shoes.png"];
    }
        [self.imageView setImage:self.userImage];
    
        self.imageView.layer.cornerRadius = 80;
        self.imageView.layer.borderWidth = 4.0f;
        self.imageView.layer.borderColor = [UIColor whiteColor].CGColor;
        self.imageView.layer.masksToBounds = YES;
        [self addHeaderOverlayView:self.imageView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.fetchedResultsController.sections.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][section];
    return [sectionInfo numberOfObjects];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  //  [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    static NSString *cellIdentifier = @"Cell";
    
    GoalCell *cell = (GoalCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    GoalEntry *entry = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [cell configureCellForEntry:entry];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    GoalEntry *entry = [self.fetchedResultsController objectAtIndexPath:indexPath];
    return [GoalCell heightForEntry:entry];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

//FetchRequest methods/////////////////////////////////////////////////


- (NSFetchRequest *)entryListFetchRequest {
    
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"GoalEntry"];
    
    fetchRequest.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO]];
    
    return fetchRequest;
}

- (NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    THCoreDataStack *coreDataStack = [THCoreDataStack defaultStack];
    NSFetchRequest *fetchRequest = [self entryListFetchRequest];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:coreDataStack.managedObjectContext sectionNameKeyPath:@"sectionName" cacheName:nil];
    _fetchedResultsController.delegate = self;
    
    return _fetchedResultsController;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeUpdate:
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id<NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
