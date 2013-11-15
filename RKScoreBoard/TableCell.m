//
//  TableCell.m
//  RKScoreBoard
//
//  Created by John Fertitta on 11/14/13.
//  Copyright (c) 2013 RunKeeper. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(int)hit:(BOOL)isPlayer1 inMode:(ModeEnum)mode {
    int hitCount = 1 * mode;
    int points = 0;
    
    if (isPlayer1) {
        if (hitCount == 0) {
            //remove
            self.timesHit1--;
            
            if (self.timesHit1 < 0) self.timesHit1 = 0;
            
            if (self.timesHit1 >= 3) {
                points = -1 * self.value;
            }
        } else {
            if (self.timesHit1 > 3) {
                points = hitCount * self.value;
                self.timesHit1 += hitCount;
            } else {
                self.timesHit1 += hitCount;
                if (self.timesHit1 > 3) {
                    points = (self.timesHit1 - 3) * self.value;
                } else {
                    points = 0;
                }
            }
        }
    } else {
        if (hitCount == 0) {
            //remove
            self.timesHit2--;
            
            if (self.timesHit2 < 0) self.timesHit2 = 0;
            
            if (self.timesHit2 >= 3) {
                points = -1 * self.value;
            }
        } else {
            if (self.timesHit2 > 3) {
                points = hitCount * self.value;
                self.timesHit2 += hitCount;
            } else {
                self.timesHit2 += hitCount;
                if (self.timesHit2 > 3) {
                    points = (self.timesHit2 - 3) * self.value;
                } else {
                    points = 0;
                }
            }
        }
    }
    
    [self drawMarks];
    
    return points;
}

-(void)drawMarks {
    if (self.value == 0) {
        self.mark1.text = @"";
        self.mark2.text = @"";
        return;
    }
    
    if (self.timesHit1 >= 3) {
        self.mark1.text = @"O";
    } else if (self.timesHit1 == 2) {
        self.mark1.text = @"X";
    } else if (self.timesHit1 == 1) {
        self.mark1.text = @"/";
    } else {
        self.mark1.text = @"";
    }
    
    if (self.timesHit2 >= 3) {
        self.mark2.text = @"O";
    } else if (self.timesHit2 == 2) {
        self.mark2.text = @"X";
    } else if (self.timesHit2 == 1) {
        self.mark2.text = @"/";
    } else {
        self.mark2.text = @"";
    }
}

@end
