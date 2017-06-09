//
//  YSPDFView.h
//  PDF
//
//  Created by yangsen on 17/6/9.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSPDFDocument.h"

typedef NS_ENUM(NSInteger, YSPDFShowDirection){

    YSPDFShowDirectionVertical,      // 垂直方向
    YSPDFShowDirectionHorizontal     // 水平方向
};
@interface YSPDFViewController : UIViewController

@property (assign, nonatomic) YSPDFShowDirection showDirection;

+ (id)pdfViewWithPDFDocument:(YSPDFDocument *)pdfDocument;

@end
