//
//  YSPDFPageViewCell.m
//  PDF
//
//  Created by yangsen on 17/6/9.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "YSPDFPageViewCell.h"
#import "YSPDFPageView.h"

@interface YSPDFPageViewCell()
{
    YSPDFPageView *_pageView;
}
@end
@implementation YSPDFPageViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _pageView = [[YSPDFPageView alloc] init];
        [self addSubview:_pageView];
    }
    return self;
}

- (void)setIndexPathRow:(NSInteger)indexPathRow{
    _indexPathRow = indexPathRow;
    _pageView.pageNumber = indexPathRow;
}

- (void)setDocument:(YSPDFDocument *)document{
    _document = document;
    _pageView.pdfDocument = document;
}

- (void)drawRect:(CGRect)rect{

    _pageView.frame = self.bounds;
}
@end
