//
//  GenerateBarcodeWithoutCloudStorage.m
//  Aspose.Barcode
//
//  Created by Muhammad Sohail Ismail on 12/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import "GenerateBarcodeWithoutCloudStorage.h"
#import "ASPBarcodeApi.h"
#import "ASPStorageApi.h"

@implementation GenerateBarcodeWithoutCloudStorage

- (id)init {
    self = [super init];
    
    self.barcodeApi = [[ASPBarcodeApi alloc] init];
    
    return self;
}


- (void) generateABarcodeAndGetAsImageStream {
//ExStart:GenerateABarcodeAndGetAsImageStream

    [self.barcodeApi getBarcodeGenerateWithCompletionBlock:@"sample-barcode"
                                                      type:@"datamatrix"
                                                    format:@"PNG"
                                               resolutionX:nil
                                               resolutionY:nil
                                                dimensionX:nil
                                                dimensionY:nil
                                            enableChecksum:nil
                                         completionHandler:^(NSURL *output, NSError *error) {
                                             NSLog(@"%@", output);
                                         }];
//ExEnd:GenerateABarcodeAndGetAsImageStream
}

- (void) generateBarcodeAndSaveImageToLocalDisk {
//ExStart:GenerateBarcodeAndSaveImageToLocalDisk

    [self.barcodeApi getBarcodeGenerateWithCompletionBlock:@"sample-barcode"
                                                      type:@"QR"
                                                    format:@"PNG"
                                               resolutionX:[NSNumber numberWithFloat:96.0]
                                               resolutionY:[NSNumber numberWithFloat:96.0]
                                                dimensionX:[NSNumber numberWithFloat:0.7]
                                                dimensionY:[NSNumber numberWithFloat:2.0]
                                            enableChecksum:nil
                                         completionHandler:^(NSURL *output, NSError *error) {
                                             NSLog(@"%@", output);
                                         }];
//ExEnd:GenerateBarcodeAndSaveImageToLocalDisk
}

@end
