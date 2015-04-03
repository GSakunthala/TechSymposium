//
//  BreakoutDetailsViewController.h
//  TechSymposium
//
//  Created by Kiran Bandla on 4/1/15.
//  Copyright (c) 2015 MCOE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BreakoutModel.h"

@interface BreakoutDetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UIView *bar;
@property (strong, nonatomic) IBOutlet UILabel *barText;
@property (strong, nonatomic) IBOutlet UILabel *topicName;
@property (strong, nonatomic) IBOutlet UILabel *participants;
@property (strong, nonatomic) IBOutlet UILabel *chairs;
@property (strong, nonatomic) IBOutlet UIView *about;
@property (strong, nonatomic) IBOutlet UITableView *timeLines;

@property (strong, nonatomic) IBOutlet UIView *aboutView;
@property (strong, nonatomic) IBOutlet UITextView *descriptionView;

@property (strong,nonatomic) BreakoutModel *selectedBreakout;

@end
