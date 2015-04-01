//
//  BreakoutModel.h
//  TechSymposium
//
//  Created by Kiran Bandla on 3/31/15.
//  Copyright (c) 2015 MCOE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BreakoutModel : NSObject

@property(nonatomic,strong) NSString *topicName;
@property(nonatomic,strong) NSString *topicImage;

@property(nonatomic,strong) NSString *about;
@property(nonatomic,strong) NSString *eventId;

@property(nonatomic,strong) NSMutableArray *chairNames;
@property(nonatomic,strong) NSMutableArray *participants;
@property(nonatomic,strong) NSMutableArray *sessionDates;

@property(nonatomic,assign) BOOL *isOngoing;





@end
