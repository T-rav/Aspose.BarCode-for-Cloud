//
//  RecognizeBarcodeWithCloudStorage.h
//  Aspose.Barcode
//
//  Created by Muhammad Sohail Ismail on 12/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ASPBarcodeApi;

@interface RecognizeBarcodeWithCloudStorage : NSObject

@property(nonatomic, strong) ASPBarcodeApi *barcodeApi;

- (void) readBarcodeFromAsposeCloudStorage;
- (void) readBarcodeFromSpecificRegionOfImage;

@end
