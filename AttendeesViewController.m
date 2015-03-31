//
//  AttendeesViewController.m
//  TechSymposium
//
//  Created by Kiran Bandla on 3/31/15.
//  Copyright (c) 2015 MCOE. All rights reserved.
//

#import "AttendeesViewController.h"
#import "AttendeeModel.h"
#import "AttendeeDAO.h"
#import "AttendeeTableViewCell.h"

@interface AttendeesViewController ()
{
    NSMutableArray *filteredAttendees;
    NSMutableArray *placeholderArray;
    NSMutableArray *attendeeArray;
    BOOL isFiltered;
}
@end

@implementation AttendeesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    isFiltered = false;
    filteredAttendees = [[NSMutableArray alloc] init];
    placeholderArray = [[NSMutableArray alloc] init];

    AttendeeDAO *attendeeDAO = [[AttendeeDAO alloc] init];
    attendeeArray = [attendeeDAO getAttendeeArray];
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
-(NSMutableArray *) returnPlaceholderArray
{
    if(isFiltered)
    {
        return filteredAttendees;
    }
    else
    {
        return attendeeArray;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[self returnPlaceholderArray] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
 placeholderArray = [self returnPlaceholderArray];
    static NSString *simpleTableIdentifier = @"AttendeeCell";

    AttendeeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"AttendeeTableViewCell" bundle:nil] forCellReuseIdentifier:simpleTableIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        
        
        
    }
    AttendeeModel *attendee = [placeholderArray objectAtIndex:indexPath.row];
    
 // Configure the cell...
    cell.name.text = attendee.name;
    cell.designation.text = attendee.designation;
    [cell.mailToButton setTag:indexPath.row];
   [cell.mailToButton addTarget:self action:@selector(mailToAttendee:) forControlEvents:(UIControlEventTouchUpInside)];
   // [cell.mailToButton addTarget:<#(id)#> action:<#(SEL)#> forControlEvents:<#(UIControlEvents)#>]
 
    return cell;
}

#pragma mark- searchbar

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText;   // called when text changes (including clear)
{
    [self filterContentForSearchText:searchBar.text];
    if([searchText isEqualToString:@""] || searchText==nil) {
        isFiltered = false;
        [self.tableView reloadData];
        [searchBar resignFirstResponder];

    }
    
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar                    // called when keyboard search button pressed
{
   [searchBar resignFirstResponder];
   
    
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar                    // called when cancel button pressed
{
    isFiltered = false;
    [self.tableView reloadData];
    [searchBar resignFirstResponder];

    
}

- (void)filterContentForSearchText:(NSString*)searchText
{
    // [searchResults removeAllObjects];
    NSString *searchQuery = @"SELF.name contains[c] %@";
    // NSLog(@"%@",searchQuery);
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:searchQuery, searchText];
    filteredAttendees = [attendeeArray filteredArrayUsingPredicate:resultPredicate];
    isFiltered = true;
    [self.tableView reloadData];
}
#pragma mark - custom UI
-(void) setNavigationBar
{
    
    
    self.title = @"Attendees";
    
}
-(void) mailToAttendee:(id)sender
{
    AttendeeModel *attendee = [placeholderArray objectAtIndex:[sender tag]];
    NSString *mailAddress = @"mailto:";
    mailAddress = [mailAddress stringByAppendingString:attendee.email];
    NSURL *mailURL        = [[NSURL alloc] initWithString:mailAddress];
    [[UIApplication sharedApplication] openURL:mailURL];
}

@end
