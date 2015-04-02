//
//  BreakoutDAO.m
//  TechSymposium
//
//  Created by Kiran Bandla on 3/31/15.
//  Copyright (c) 2015 MCOE. All rights reserved.
//

#import "BreakoutDAO.h"
#import "BreakoutModel.h"
#import "DateModel.h"

@implementation BreakoutDAO

-(NSMutableArray *) getBreakoutArray
{
    NSMutableArray *breakoutArray = [[NSMutableArray alloc]init];
    NSMutableArray *breakoutJsonArray = [[NSMutableArray alloc]init];
    breakoutJsonArray = [self parseBreakoutJson];
    
    for(int i=0;i< breakoutJsonArray.count;i++)
    {
        BreakoutModel *breakout = [[BreakoutModel alloc] init];
        breakout.chairNames = [[NSMutableArray alloc] init];
        breakout.sessionDates = [[NSMutableArray alloc] init];

        NSMutableArray *sessionStatus =[[NSMutableArray alloc] init];
        breakout.isOngoing = false;

        
       NSMutableArray *chairs = [[breakoutJsonArray objectAtIndex:i] objectForKey:@"chairs"];
        for(int ch=0;ch< chairs.count;ch++)
        {
            NSString *chairName = [[chairs objectAtIndex:ch] objectForKey:@"name"];
            [breakout.chairNames addObject:chairName];
        }
        NSMutableArray *dates = [[breakoutJsonArray objectAtIndex:i] objectForKey:@"date"];
        for(int ch=0;ch< dates.count;ch++)
        {
            DateModel *dateModel = [[DateModel alloc] init];
            dateModel.ds= [[dates objectAtIndex:ch] objectForKey:@"ds"];
            dateModel.time= [[dates objectAtIndex:ch] objectForKey:@"time"];

            dateModel.startTime = [[[dates objectAtIndex:ch] objectForKey:@"stdStartTime"] doubleValue];
            dateModel.endTime= [[[dates objectAtIndex:ch] objectForKey:@"stdEndTime"] doubleValue];
            dateModel.status = [dateModel checkOccurrence:dateModel.startTime stdEndTime:dateModel.endTime];
            [breakout.sessionDates addObject:dateModel];
            [sessionStatus addObject:dateModel.status];
        }
        
        
       breakout.sessionDetails = [[breakoutJsonArray objectAtIndex:i] objectForKey:@"description"];

        
        NSMutableArray *participants = [[breakoutJsonArray objectAtIndex:i] objectForKey:@"participants"];
        breakout.participants = participants;
        if([sessionStatus containsObject:@"current"])
        {
            breakout.isOngoing = TRUE;
            
        }
        breakout.topicName = [[breakoutJsonArray objectAtIndex:i] objectForKey:@"topic"];
        
        [breakoutArray addObject:breakout];
        
    }
    
    return breakoutArray;
}

-(NSMutableArray *) parseBreakoutJson
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Breakout" ofType:@"json"];
    NSString *attendeeJson = [[NSString alloc]initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    NSError *error = nil;
    NSMutableArray *attendeeJsonArray = [NSJSONSerialization JSONObjectWithData:[attendeeJson dataUsingEncoding:NSUTF8StringEncoding] options:(kNilOptions) error:&error];
    return attendeeJsonArray;
}



@end
