//
//  SpeakerViewController.m
//  TechSymposium
//
//  Created by Kiran Bandla on 3/24/15.
//  Copyright (c) 2015 MCOE. All rights reserved.
//

#import "SpeakerViewController.h"
#import "SpeakerTableViewCell.h"
#import "SpeakerModel.h"
#import "SpeakerDAO.h"

#import "SpeakerDetailsViewController.h"

@interface SpeakerViewController ()
{
    NSMutableArray *speakerArray;

}
@end

@implementation SpeakerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    SpeakerDAO *speakerDAO = [[SpeakerDAO alloc] init];
    speakerArray= [speakerDAO getSpeakerArray];
    [self setNavigationBar];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return speakerArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SpeakerCell";
    SpeakerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"SpeakerTableViewCell" bundle:nil] forCellReuseIdentifier:simpleTableIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    }
    
    SpeakerModel *speakercell = [speakerArray objectAtIndex:indexPath.row];
     NSData *data = [[NSData alloc]initWithBase64EncodedString:speakercell.image options:NSDataBase64DecodingIgnoreUnknownCharacters];
    UIImage *profPic = [UIImage imageWithData:data];
    cell.profPic.image = profPic;
    cell.name.text = speakercell.name;
    cell.designation.text = speakercell.designation;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger selectedCellNo =  indexPath.row;
    SpeakerModel *selectedSpeaker =  [speakerArray objectAtIndex:selectedCellNo];
    
    SpeakerDetailsViewController *speakerDetailsVC = [[SpeakerDetailsViewController alloc] init];
    speakerDetailsVC.selectedSpeaker = selectedSpeaker;
    

    [self.navigationController pushViewController:speakerDetailsVC animated:YES];
    // [self presentViewController:speakerDetailsVC animated:YES completion:NULL];
    
    
}
-(void) setNavigationBar
{
    
  
    self.title = @"Speaker";

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
