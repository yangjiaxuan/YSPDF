//
//  YSPDFDocument.m
//  FrameDemo
//
//  Created by yangsen on 17/4/12.
//  Copyright © 2017年 sitemap. All rights reserved.
//

#import "YSPDFDocument.h"

@interface YSPDFDocument()
{
    
}
@end
@implementation YSPDFDocument

NSString * SetPDFDocumentRef(NSURL *filePath, CGPDFDocumentRef *pdfDocumentRef)
{
    NSString *errorDesc = nil;
    
    CFURLRef urlRef = (__bridge CFURLRef)(filePath);
    CGPDFDocumentRef document = CGPDFDocumentCreateWithURL (urlRef);
    if (document) {
        NSInteger pages = CGPDFDocumentGetNumberOfPages(document);
        if (pages != 0) {
            *pdfDocumentRef = document;
            return nil;
        }
        errorDesc = [NSString stringWithFormat:@"%@ 文件没有内容！\n", filePath.path];
    }
    else{
        errorDesc = [NSString stringWithFormat:@"无法通过%@ 获取PDF类型文件",filePath.path];
    }
    return errorDesc;
    
}

+ (id)pdfDocumentWithResource:(NSString *)name ofType:(NSString *)type{
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:type];
    return [self pdfDocumentWithPath:path];
}

+ (id)pdfDocumentWithPath:(NSString *)path{
    if (path.length) {
        NSURL *filePath = [NSURL fileURLWithPath:path];
        return [self pdfDocumentWithFilePath:filePath];
    }
    return nil;
}

+ (id)pdfDocumentWithFilePath:(NSURL *)path{
    if (path) {
        CGPDFDocumentRef pdfDocumentRef;
        NSString *error = SetPDFDocumentRef(path, &pdfDocumentRef);
        if (error == nil) {
            YSPDFDocument *pdfDocument = [[YSPDFDocument alloc]init];
            pdfDocument.numberOfPage   = CGPDFDocumentGetNumberOfPages(pdfDocumentRef);
            pdfDocument->_pdfDocumentRef = pdfDocumentRef;
            return pdfDocument;
        }
    }
    return nil;
}

- (void)dealloc{
    CGPDFDocumentRelease(_pdfDocumentRef);
}
@end

@interface YSPDFPage()

@end
@implementation YSPDFPage

+ (YSPDFPage *)pdfPageWithDoucment:(YSPDFDocument *)pdfDocument pageNumber:(NSInteger)pageNum{
    if (pdfDocument) {
        CGPDFPageRef pageRef = CGPDFDocumentGetPage(pdfDocument.pdfDocumentRef, pageNum);
        if (pageRef) {
            YSPDFPage *pdfPage = [[YSPDFPage alloc] init];
            pdfPage->_pdfPageRef = pageRef;
            return pdfPage;
        }
    }
    return nil;
}

- (void)showOnContxt:(CGContextRef)context{
    if (_pdfPageRef && context) {
        CGContextDrawPDFPage (context, _pdfPageRef);
    }
}

@end
