//
//  BreakoutTableViewCell.h
//  TechSymposium
//
//  Created by Kiran Bandla on 3/31/15.
//  Copyright (c) 2015 MCOE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BreakoutTableViewCell : UITableViewCell

@property(nonatomic,strong) IBOutlet UILabel *name;
@property(nonatomic,strong) IBOutlet UIImageView *image;
@property(nonatomic,strong) IBOutlet UILabel *chairs;
@property(nonatomic,strong) IBOutlet UILabel *participants;

@property(nonatomic,strong) IBOutlet UIView *status;
@end
