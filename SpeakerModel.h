//
//  SpeakerModel.h
//  TechSymposium
//
//  Created by Kiran Bandla on 3/25/15.
//  Copyright (c) 2015 MCOE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpeakerModel : NSObject

@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSString *designation;
@property(nonatomic,strong) NSString *desc;
@property(nonatomic,strong) NSString *eid;
@property(nonatomic,strong) NSString *firstName;
@property(nonatomic,strong) NSString *lastName;
@property(nonatomic,assign) long updatedDate;
@property(nonatomic,strong) NSString *image;
@property(nonatomic,strong) NSData *imageData;




@end
