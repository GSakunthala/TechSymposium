//
//  SpeakerDetailsViewController.m
//  TechSymposium
//
//  Created by Kiran Bandla on 3/27/15.
//  Copyright (c) 2015 MCOE. All rights reserved.
//

#import "SpeakerDetailsViewController.h"

@interface SpeakerDetailsViewController ()

@end

@implementation SpeakerDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDetails];
    self.title = @"Speaker";

    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidAppear:(BOOL)animated {

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) loadDetails
{
    _name.text        = _selectedSpeaker.name;
    _designation.text = _selectedSpeaker.designation;
    _desc.text = _selectedSpeaker.desc;
   NSData *imageData = [[NSData alloc]initWithBase64EncodedString:_selectedSpeaker.image options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *profPicimage = [UIImage imageWithData:imageData];
    _profPic.image = profPicimage;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
