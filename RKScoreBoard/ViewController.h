//
//  ViewController.h
//  RKScoreBoard
//
//  Created by John Fertitta on 11/14/13.
//  Copyright (c) 2013 RunKeeper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModeEnum.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) int dartsLeft;

@property (nonatomic) BOOL isPlayer1;

@property (nonatomic) int score1;
@property (nonatomic) int score2;

@property (nonatomic,retain) IBOutlet UIButton* player1;
@property (nonatomic,retain) IBOutlet UIButton* player2;

@property (nonatomic,retain) IBOutlet UILabel* player1Score;
@property (nonatomic,retain) IBOutlet UILabel* player2Score;

@property (nonatomic,retain) IBOutlet UITableView* tableView;

@property (nonatomic) ModeEnum mode;

-(IBAction)doubleClicked:(id)sender;

-(IBAction)trippleClicked:(id)sender;

-(IBAction)removeClicked:(id)sender;

-(IBAction)player1Clicked:(id)sender;

-(IBAction)player2Clicked:(id)sender;
@end

