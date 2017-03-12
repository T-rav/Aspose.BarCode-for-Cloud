//
//  RecognizeBarcodeWithoutCloudStorage.h
//  Aspose.Barcode
//
//  Created by Muhammad Sohail Ismail on 12/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ASPBarcodeApi;

@interface RecognizeBarcodeWithoutCloudStorage : NSObject

@property(nonatomic, strong) ASPBarcodeApi *barcodeApi;

- (void)readBarcodeFromExternalImageURL;
- (void)readBarcodeFromLocalImage;
- (void)readBarcodesByApplyingImageProcessingAlgorithm;

@end
