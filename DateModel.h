//
//  Date.h
//  TechSymposium
//
//  Created by Kiran Bandla on 3/31/15.
//  Copyright (c) 2015 MCOE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateModel : NSObject
@property(nonatomic,strong) NSString *ds;
@property(nonatomic,strong) NSString *time;
@property(nonatomic,assign) double startTime;
@property(nonatomic,assign) double endTime;
@property(nonatomic,strong) NSString *location;
@property(nonatomic,strong) NSString *status;
-(NSString*) checkOccurrence:(double) stdStartTime stdEndTime:(double)stdEndTime;

@end
