//
//  YSPDFDocument.h
//  FrameDemo
//
//  Created by yangsen on 17/4/12.
//  Copyright © 2017年 sitemap. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

@interface YSPDFDocument : NSObject

@property (assign, nonatomic, readonly) CGPDFDocumentRef pdfDocumentRef;
@property (assign, nonatomic) NSInteger numberOfPage;

+ (id)pdfDocumentWithResource:(NSString *)name ofType:(NSString *)type;

+ (id)pdfDocumentWithPath:(NSString *)path;

+ (id)pdfDocumentWithFilePath:(NSURL *)path;

@end

@interface YSPDFPage : NSObject

@property (assign, nonatomic, readonly) CGPDFPageRef pdfPageRef;

+ (YSPDFPage *)pdfPageWithDoucment:(YSPDFDocument *)pdfDocument pageNumber:(NSInteger)pageNum;

- (void)showOnContxt:(CGContextRef)context;

@end
