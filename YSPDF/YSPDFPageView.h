//
//  YSPDFPageView.h
//  FrameDemo
//
//  Created by yangsen on 17/4/12.
//  Copyright © 2017年 sitemap. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSPDFDocument.h"

@interface YSPDFPageView : UIView

@property (strong, nonatomic) YSPDFDocument *pdfDocument;
@property (assign, nonatomic) NSInteger      pageNumber;

+ (id)pdfPageViewWithDocument:(YSPDFDocument *)document pageNum:(NSInteger)pageNum;

+ (id)pdfPageViewWithDocument:(YSPDFDocument *)document pageNum:(NSInteger)pageNum frame:(CGRect)frame;

@end
