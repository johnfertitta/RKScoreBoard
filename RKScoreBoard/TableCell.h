//
//  TableCell.h
//  RKScoreBoard
//
//  Created by John Fertitta on 11/14/13.
//  Copyright (c) 2013 RunKeeper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCell : UITableViewCell

@property (nonatomic) int timesHit1;

@property (nonatomic) int timesHit2;

@property (nonatomic) int value;

@property (nonatomic,retain) IBOutlet UILabel* score;

@property (nonatomic,retain) IBOutlet UILabel* mark1;

@property (nonatomic,retain) IBOutlet UILabel* mark2;

-(int)hit:(BOOL)isPlayer1 remove:(BOOL)remove;

@end
