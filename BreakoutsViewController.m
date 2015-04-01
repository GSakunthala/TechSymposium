//
//  BreakoutsViewController.m
//  SegmentBreakoutsXIB
//
//  Created by Kiran Bandla on 3/31/15.
//  Copyright (c) 2015 Honeywell International Inc. All rights reserved.
//

#import "BreakoutsViewController.h"
#import "BreakoutTableViewCell.h"
#import "BreakoutModel.h"
#import "BreakoutDAO.h"
#import "DateModel.h"

@interface BreakoutsViewController ()
{
    NSArray *mySessionArray;
    NSArray *allSessionArray;
    NSArray *placeholderArray;


}
@end

@implementation BreakoutsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    BreakoutDAO *breakoutDAO = [[BreakoutDAO alloc] init];
    
    mySessionArray = [breakoutDAO getBreakoutArray];
    allSessionArray =[breakoutDAO getBreakoutArray];
    [self setNavigationBar];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

-(NSArray *) returnPlaceholderArray
{
    if([_sessionSegment selectedSegmentIndex] == 0)
    {
        return mySessionArray;
    }
    else
    {
        return allSessionArray;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self returnPlaceholderArray].count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    placeholderArray = [self returnPlaceholderArray];
    static NSString *simpleTableIdentifier = @"BreakoutCell";
    BreakoutTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"BreakoutTableViewCell" bundle:nil] forCellReuseIdentifier:simpleTableIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        
        
        
    }
    BreakoutModel *breakout = [placeholderArray objectAtIndex:(indexPath.row)];
    
    cell.name.text = breakout.topicName;
    
    
    cell.chairs.text = [[@(breakout.chairNames.count) stringValue] stringByAppendingString:@" Session Chairs"];
    cell.participants.text = [[@(breakout.participants.count) stringValue] stringByAppendingString:@" Participant"];
   
    cell.status.hidden = !(breakout.isOngoing);
    return cell;
}



/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onChangeOfSegment:(id)sender {
    [_sessionTable reloadData];
}

#pragma mark- custom UI

-(void) setNavigationBar
{
    
    
    self.title = @"Breakouts";
    
}
@end
