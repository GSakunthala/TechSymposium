//
//  SpeakerDAO.m
//  TechSymposium
//
//  Created by Kiran Bandla on 3/27/15.
//  Copyright (c) 2015 MCOE. All rights reserved.
//

#import "SpeakerDAO.h"
#import "SpeakerModel.h"

@implementation SpeakerDAO


    -(NSMutableArray *) getSpeakerArray
    {
        NSMutableArray *speakerArray = [[NSMutableArray alloc] init];
        NSMutableArray *speakerJsonArray = [[NSMutableArray alloc] init];
      speakerJsonArray =  [self parseSpeakerJson];
        
        for (int i = 0; i < [speakerJsonArray count]; i++)
        {
            SpeakerModel *speaker = [[SpeakerModel alloc] init];
            speaker.name =[[speakerJsonArray objectAtIndex:i] objectForKey:@"name"];
            speaker.designation =[[speakerJsonArray objectAtIndex:i] objectForKey:@"designation"];
            speaker.image = [[speakerJsonArray objectAtIndex:i] objectForKey:@"image"] ;
            speaker.desc = [[speakerJsonArray objectAtIndex:i] objectForKey:@"description"] ;
            NSData *data = [[NSData alloc]initWithBase64EncodedString:speaker.image options:NSDataBase64DecodingIgnoreUnknownCharacters];
            speaker.imageData= data;
            [speakerArray addObject:speaker];

            
        }
             
        return speakerArray;
    }

-(NSMutableArray*) parseSpeakerJson
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Speaker" ofType:@"json"];
    NSString *speakerJson = [[NSString alloc] initWithContentsOfFile:filePath encoding:(NSUTF8StringEncoding) error:NULL];
    
    NSError *error =  nil;
    NSMutableArray *speakerJsonArray = [NSJSONSerialization JSONObjectWithData:[speakerJson dataUsingEncoding:NSUTF8StringEncoding] options:(kNilOptions) error:&error];
   // NSData* dataFromString = [NSKeyedArchiver archivedDataWithRootObject:speakerJson];

  //  NSDictionary *speakerJsonDict = [NSJSONSerialization JSONObjectWithData:dataFromString  options:(kNilOptions) error:&error];
    
 //   NSMutableArray *speakerJsonArray = [speakerJsonDict objectForKey:@"speakers"];
    return speakerJsonArray;
}
@end
