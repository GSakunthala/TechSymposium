//
//  SpeakerDetailsViewController.h
//  TechSymposium
//
//  Created by Kiran Bandla on 3/27/15.
//  Copyright (c) 2015 MCOE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpeakerModel.h"

@interface SpeakerDetailsViewController : UIViewController

   @property(nonatomic,weak) IBOutlet UILabel *name;
   @property(nonatomic,weak) IBOutlet UILabel *designation;
   @property(nonatomic,weak) IBOutlet UIImageView *profPic;

@property (strong, nonatomic) IBOutlet UITextView *desc;


@property(nonatomic,weak) SpeakerModel *selectedSpeaker;
@end
