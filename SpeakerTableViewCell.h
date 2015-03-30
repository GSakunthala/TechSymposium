//
//  SpeakerTableViewCell.h
//  TechSymposium
//
//  Created by Kiran Bandla on 3/25/15.
//  Copyright (c) 2015 MCOE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpeakerTableViewCell : UITableViewCell
@property(weak,nonatomic) IBOutlet UIImageView *profPic;
@property(weak,nonatomic) IBOutlet UILabel *name;
@property(weak,nonatomic) IBOutlet UILabel *designation;

@end
