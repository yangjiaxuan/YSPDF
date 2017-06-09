//
//  YSPDFPageViewCell.h
//  PDF
//
//  Created by yangsen on 17/6/9.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSPDFDocument.h"

@interface YSPDFPageViewCell : UICollectionViewCell

@property (strong, nonatomic) YSPDFDocument *document;
@property (assign, nonatomic) NSInteger      indexPathRow;

@end
