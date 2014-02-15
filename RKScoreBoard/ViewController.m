//
//  ViewController.m
//  RKScoreBoard
//
//  Created by John Fertitta on 11/14/13.
//  Copyright (c) 2013 RunKeeper. All rights reserved.
//

#import "ViewController.h"
#import "TableCell.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize player1;
@synthesize player2;

@synthesize player1Score;
@synthesize player2Score;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TableCell" bundle:nil] forCellReuseIdentifier:@"TableCell"];
    self.remove = false;
    self.score1 = 0;
    self.score2 = 0;
    
    self.isPlayer1 = YES;
    
    [self resetPlayerLabels];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView: (UITableView *)tableView
{
    return 1;
}

- (CGFloat) tableView: (UITableView*) tableView heightForRowAtIndexPath: (NSIndexPath*) indexPath
{
    return 55;
}

//------------------------------------------------------------------------------

- (NSInteger) tableView: (UITableView *) tableView numberOfRowsInSection: (NSInteger) section
{
    return 8;
}

//------------------------------------------------------------------------------

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	TableCell *cell =  (TableCell*)[tableView
                             dequeueReusableCellWithIdentifier:@"TableCell"];
    
    
	switch (indexPath.row) {
        case 0:
            cell.score.text = @"20";
            cell.value = 20;
            break;
        case 1:
            cell.score.text = @"19";
            cell.value = 19;
            break;
        case 2:
            cell.score.text = @"18";
            cell.value = 18;
            break;
        case 3:
            cell.score.text = @"17";
            cell.value = 17;
            break;
        case 4:
            cell.score.text = @"16";
            cell.value = 16;
            break;
        case 5:
            cell.score.text = @"15";
            cell.value = 15;
            break;
        case 6:
            cell.score.text = @"BULL";
            cell.value = 25;
            break;
        case 7:
            cell.score.text = @"EDIT";
            break;
    }
    
    
    return cell;
}

//------------------------------------------------------------------------------

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableCell *cell = (TableCell*)[tableView cellForRowAtIndexPath:indexPath];
    int points = [cell hit:self.isPlayer1 remove:self.remove];
    
    if (indexPath.row == 7) {
        self.remove = !self.remove;
    }
    
    if (self.isPlayer1) {
        self.score1 += points;
        self.player1Score.text = [NSString stringWithFormat:@"%d", self.score1];
    } else {
        self.score2 += points;
        self.player2Score.text = [NSString stringWithFormat:@"%d", self.score2];
    }
    [tableView reloadData];
}

-(void)resetPlayerLabels {
    [self.player1 setEnabled:YES];
    [self.player2 setEnabled:YES];
    
    if (self.isPlayer1) {
        [self.player1 setEnabled:NO];
    } else {
        [self.player2 setEnabled:NO];
    }
}

-(IBAction)player1Clicked:(id)sender {
    self.isPlayer1 = true;
    [self resetPlayerLabels];

}

-(IBAction)player2Clicked:(id)sender {
    self.isPlayer1 = false;
    [self resetPlayerLabels];
}


@end
