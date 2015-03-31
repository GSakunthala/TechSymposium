//
//  AttendeeDAO.m
//  TechSymposium
//
//  Created by Kiran Bandla on 3/31/15.
//  Copyright (c) 2015 MCOE. All rights reserved.
//

#import "AttendeeDAO.h"
#import "AttendeeModel.h"
@implementation AttendeeDAO

-(NSMutableArray *) getAttendeeArray
{
    NSMutableArray *attendeeArray = [[NSMutableArray alloc]init];
    NSMutableArray *attendeeJsonArray = [[NSMutableArray alloc]init];
    attendeeJsonArray = [self parseAttendeeJson];
    
    for(int i=0;i< attendeeJsonArray.count;i++)
    {
        AttendeeModel *attendee = [[AttendeeModel alloc] init];
        attendee.name = [[attendeeJsonArray objectAtIndex:i] objectForKey:@"name"];
        attendee.designation = [[attendeeJsonArray objectAtIndex:i] objectForKey:@"designation"];
        attendee.email = [[attendeeJsonArray objectAtIndex:i] objectForKey:@"email"];
        [attendeeArray addObject:attendee];
        
    }
    
    return attendeeArray;
}

-(NSMutableArray *) parseAttendeeJson
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Attendee" ofType:@"json"];
    NSString *attendeeJson = [[NSString alloc]initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:NULL];
    NSError *error = nil;
    NSMutableArray *attendeeJsonArray = [NSJSONSerialization JSONObjectWithData:[attendeeJson dataUsingEncoding:NSUTF8StringEncoding] options:(kNilOptions) error:&error];
    return attendeeJsonArray;
}

@end
