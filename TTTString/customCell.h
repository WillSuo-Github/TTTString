//
//  customCell.h
//  TTTString
//
//  Created by ws on 16/4/14.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTTAttributedLabel.h"

@interface customCell : UITableViewCell

@property (nonatomic, copy, readwrite) NSString *titleStr;
@property (nonatomic, weak, readonly) TTTAttributedLabel *label;

@end
