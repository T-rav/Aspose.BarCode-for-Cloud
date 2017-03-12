//
//  GenerateBarcodeWithCloudStorage.h
//  Aspose.Barcode
//
//  Created by Muhammad Sohail Ismail on 12/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ASPBarcodeApi;

@interface GenerateBarcodeWithCloudStorage : NSObject

@property(nonatomic, strong) ASPBarcodeApi *barcodeApi;

- (void) generateBarcodeOnAsposeCloudStorage;
- (void) generateBarcodeWithAppropriateCodeTextLocation;
- (void) generateBarcodeWithChecksumOption;
- (void) rotateBarcodeImageWithSuitableAngle;
- (void) setBarcodeImageHeightWidthQualitySettings;
- (void) setBarcodeImageMargin;
- (void) setBarcodeImageResolution;
- (void) setBarsHeightInBarcodeImage;
- (void) setXAndYDimensionsOfBarcode;
- (void) specifyBarcodeImageSaveFormat;
- (void) specifyCodetextAndSymbologyForBarcode;

@end
