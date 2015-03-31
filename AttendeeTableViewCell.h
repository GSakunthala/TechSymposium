//
//  AttendeeTableViewCell.h
//  TechSymposium
//
//  Created by Kiran Bandla on 3/31/15.
//  Copyright (c) 2015 MCOE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AttendeeTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *designation;
@property (strong, nonatomic) IBOutlet UIButton *mailToButton;


@end
