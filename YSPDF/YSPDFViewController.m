//
//  YSPDFView.m
//  PDF
//
//  Created by yangsen on 17/6/9.
//  Copyright © 2017年 yangsen. All rights reserved.
//

#import "YSPDFViewController.h"
#import "YSPDFPageViewCell.h"

@interface YSPDFViewController()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    YSPDFDocument *_pdfDocument;
    UICollectionView *_collectionView;
}
@end
@implementation YSPDFViewController

+ (id)pdfViewWithPDFDocument:(YSPDFDocument *)pdfDocument{

    YSPDFViewController *pdfVC = [[YSPDFViewController alloc]init];
    pdfVC->_pdfDocument = pdfDocument;
    return pdfVC;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setData];
    [self setUI];
}

- (void)setData{
    self.showDirection = YSPDFShowDirectionVertical;
}

- (void)setUI{

    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 1;
    flowLayout.minimumInteritemSpacing = 1;
    flowLayout.itemSize        = self.view.bounds.size;
    flowLayout.scrollDirection = (UICollectionViewScrollDirection)self.showDirection;
    _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    _collectionView.delegate   = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[YSPDFPageViewCell class] forCellWithReuseIdentifier:@"YSPDFPageViewCell"];
    [self.view addSubview:_collectionView];
}

//MARK: collectionView 代理
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _pdfDocument.numberOfPage;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    YSPDFPageViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"YSPDFPageViewCell" forIndexPath:indexPath];
    cell.indexPathRow = indexPath.row;
    cell.document     = _pdfDocument;
    return cell;
}

@end
