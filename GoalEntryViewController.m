//
//  GoalEntryViewController.m
//  10K
//
//  Created by HoodsDream on 12/21/14.
//  Copyright (c) 2014 HoodsDream. All rights reserved.
//

#import "GoalEntryViewController.h"
#import "GoalsViewController.h"
#import "GoalEntry.h"
#import "THCoreDataStack.h"
#import <CoreLocation/CoreLocation.h>

@interface GoalEntryViewController () <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *imageButton;
@property (strong, nonatomic) UIImage *pickedImage;



@end


@implementation GoalEntryViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageButton.layer.cornerRadius = CGRectGetWidth(self.imageButton.frame)/2.0f;
    


}

- (IBAction)doneButton:(id)sender {

        THCoreDataStack *coreDataStack = [THCoreDataStack defaultStack];
        GoalEntry *entry = [NSEntityDescription insertNewObjectForEntityForName:@"GoalEntry" inManagedObjectContext:coreDataStack.managedObjectContext];
    
        entry.title = self.textField.text;
        entry.date = [[NSDate date] timeIntervalSince1970];
        entry.background = UIImageJPEGRepresentation(self.pickedImage, 0.75f);
        entry.dailyFloat = 0.0f;
        entry.allTimeFloat = 0.0f;
        [coreDataStack saveContext];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
