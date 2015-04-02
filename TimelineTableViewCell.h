//
//  TimelineTableViewCell.h
//  TechSymposium
//
//  Created by Kiran Bandla on 4/1/15.
//  Copyright (c) 2015 MCOE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimelineTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *sessionDate;
@property (strong, nonatomic) IBOutlet UILabel *sessionTime;

@end
