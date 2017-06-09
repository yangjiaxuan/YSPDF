//
//  YSPDFPageView.m
//  FrameDemo
//
//  Created by yangsen on 17/4/12.
//  Copyright © 2017年 sitemap. All rights reserved.
//

#import "YSPDFPageView.h"


@interface YSPDFPageView()
{
    YSPDFPage *_pdfPage;
}
@end
@implementation YSPDFPageView

+ (id)pdfPageViewWithDocument:(YSPDFDocument *)document pageNum:(NSInteger)pageNum{

    CGRect screenB = [UIScreen mainScreen].bounds;
    return [self pdfPageViewWithDocument:document pageNum:pageNum frame:screenB];
}

+ (id)pdfPageViewWithDocument:(YSPDFDocument *)document pageNum:(NSInteger)pageNum frame:(CGRect)frame{

    YSPDFPageView *pdfPageView = [[YSPDFPageView alloc] initWithFrame:frame];
    pdfPageView.pdfDocument = document;
    pdfPageView.pageNumber  = pageNum;
    return pdfPageView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.pageNumber      = -1;
    }
    return self;
}

- (void)setPageNumber:(NSInteger)pageNumber{
    _pageNumber = pageNumber;
    if(self.pdfDocument){
        _pdfPage = [YSPDFPage pdfPageWithDoucment:self.pdfDocument pageNumber:pageNumber];
        [self setNeedsDisplay];
    }
}

- (void)setPdfDocument:(YSPDFDocument *)pdfDocument{
    _pdfDocument = pdfDocument;
    if(self.pageNumber != -1){
        _pdfPage = [YSPDFPage pdfPageWithDoucment:pdfDocument pageNumber:self.pageNumber];
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect {
 
    if (_pdfPage) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextTranslateCTM(context, 0.0, self.bounds.size.height);
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextSaveGState(context);

        CGAffineTransform pdfTransform = CGPDFPageGetDrawingTransform(_pdfPage.pdfPageRef, kCGPDFCropBox, self.bounds, 0, true);
        CGContextConcatCTM(context, pdfTransform);
        
        [_pdfPage showOnContxt:context];

        CGContextRestoreGState(context);
    }
}


@end
