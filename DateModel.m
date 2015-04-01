//
//  Date.m
//  TechSymposium
//
//  Created by Kiran Bandla on 3/31/15.
//  Copyright (c) 2015 MCOE. All rights reserved.
//

#import "DateModel.h"

@implementation DateModel

-(NSString*) checkOccurrence:(double) stdStartTime stdEndTime:(double)stdEndTime
{
    

    double currentDate = [[NSDate date] timeIntervalSince1970];
    NSLog(@"%f",currentDate);
    
    NSString* eventOccursIn = @"future";
    
    // Past Events
    if(currentDate >= stdEndTime){
        eventOccursIn = @"past";
    }// Current Events
    else if(currentDate < stdEndTime && currentDate >= stdStartTime){
        eventOccursIn = @"current";
    }// Future events
    else if(currentDate < stdStartTime){
        eventOccursIn = @"future";
    }
    return eventOccursIn;
}

@end
