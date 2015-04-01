//
//  BreakoutsViewController.h
//  SegmentBreakoutsXIB
//
//  Created by Kiran Bandla on 3/31/15.
//  Copyright (c) 2015 Honeywell International Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BreakoutsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UISegmentedControl *sessionSegment;
- (IBAction)onChangeOfSegment:(id)sender;
@property (strong, nonatomic) IBOutlet UITableView *sessionTable;

@end
