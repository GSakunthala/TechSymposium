//
//  BreakoutDetailsViewController.m
//  TechSymposium
//
//  Created by Kiran Bandla on 4/1/15.
//  Copyright (c) 2015 MCOE. All rights reserved.
//

#import "BreakoutDetailsViewController.h"
#import "DateModel.h"
#import "TimelineTableViewCell.h"


@interface BreakoutDetailsViewController ()

@end

@implementation BreakoutDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Breakouts";
    [self loadDetails];
    [self adjustHeightOfViews];
    // Do any additional setup after loading the view from its nib.
    
    [_scrollView addSubview:_contentView];//if the contentView is not already inside your scrollview in your xib/StoryBoard doc
    
    _scrollView.contentSize = _contentView.frame.size;
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return _selectedBreakout.sessionDates.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *simpleTableIdentifier = @"TimelineCell";
    TimelineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (!cell) {
        [tableView registerNib:[UINib nibWithNibName:@"TimelineTableViewCell" bundle:nil] forCellReuseIdentifier:simpleTableIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
        
        
        
    }
    DateModel *timeLine = [_selectedBreakout.sessionDates objectAtIndex:(indexPath.row)];
    
    cell.sessionDate.text = timeLine.ds;
    cell.sessionTime.text = timeLine.time;

    if([timeLine.status  isEqual: @"current"])
    {
        cell.clockImage.image = [UIImage imageNamed:@"clock-green.png"];
        _bar.backgroundColor = [UIColor greenColor];
    }
    
    return cell;
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -custom methods

-(void) loadDetails
{
    DateModel *sessionDate = _selectedBreakout.sessionDates[0];
    
    _topicName.text        = _selectedBreakout.topicName;
    _barText.text = [[sessionDate.ds  stringByAppendingString:@"|"] stringByAppendingString:sessionDate.time];
    _participants.text = [[@(_selectedBreakout.participants.count) stringValue] stringByAppendingString:@" Participant"];
    
    for(NSString * chair in _selectedBreakout.chairNames)
    {
        _chairs.text = [[_chairs.text stringByAppendingString:@"\n"] stringByAppendingString:chair];
        
    }
    _descriptionView.text =  _selectedBreakout.sessionDetails;
    
    
}

- (void)adjustHeightOfViews
{
    
    CGRect descriptionViewframe = _descriptionView.frame;
    
    
    CGSize textViewSize = [_descriptionView sizeThatFits:CGSizeMake(_descriptionView.frame.size.width, FLT_MAX)];
    descriptionViewframe.size.height = textViewSize.height;
    _descriptionView.frame = descriptionViewframe;
    
    [_timeLines layoutIfNeeded];

    CGFloat height = _timeLines.contentSize.height;
    CGFloat superViewHeight = _timeLines.superview.frame.size.height;
    CGFloat tableViewY = _timeLines.frame.origin.y;
    CGFloat maxHeight = superViewHeight - tableViewY;
    
    CGFloat addedHeight = 0;
    // if the height of the content is greater than the maxHeight of
    // total space on the screen, limit the height to the size of the
    // superview.
    
    if (height > maxHeight)
    {
        height = maxHeight;
         addedHeight = maxHeight - height;
    }
    
    
    [UIView animateWithDuration:0.1 animations:^{
        CGRect frame =_timeLines.frame;
        frame.size.height = height;
        _timeLines.frame = frame;
        
        
        
        NSLog(@"---%f",descriptionViewframe.size.height);
        //increase contentview size accordingly
        CGRect frame1 =_contentView.frame;
        NSLog(@"---%f",frame1.size.height);

        frame1.size.height = _contentView.frame.size.height +( _timeLines.contentSize.height - 177 )+ (descriptionViewframe.size.height -100);
        NSLog(@"---%f",frame1.size.height);

        _contentView.frame = frame1;
       // _scrollView.frame = frame;
        
        
        CGFloat aftertableViewPos = height +  _timeLines.frame.origin.y;
        _aboutView.frame = CGRectMake(_aboutView.frame.origin.x
                                      , aftertableViewPos, _aboutView.frame.size.width, _aboutView.frame.size.height);
        
        _descriptionView.frame = CGRectMake(_descriptionView.frame.origin.x
                                            , aftertableViewPos + _aboutView.frame.size.height, _descriptionView.frame.size.width, _descriptionView.frame.size.height);
        
        
    }];
    
    //detailsview size
   /* CGRect frame = _descriptionView.frame;
    NSLog(@"%f----",_descriptionView.contentSize.height);
    frame.size.height = _descriptionView.contentSize.height;
    _descriptionView.frame = frame;*/
    
   
}

@end
