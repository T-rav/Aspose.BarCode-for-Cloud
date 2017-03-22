//
//  RecognizeBarcodeWithoutCloudStorage.m
//  Aspose.Barcode
//
//  Created by Muhammad Sohail Ismail on 12/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import "RecognizeBarcodeWithoutCloudStorage.h"
#import "ASPBarcodeApi.h"
#import "Utils.h"

@implementation RecognizeBarcodeWithoutCloudStorage

- (id)init {
    self = [super init];
    
    self.barcodeApi = [[ASPBarcodeApi alloc] init];
    
    return self;
}

- (void)readBarcodeFromExternalImageURL {
//ExStart:
    [self.barcodeApi postBarcodeRecognizeFromUrlorContentWithCompletionBlock:@""
                                                          checksumValidation:nil
                                                                    stripFnc:[NSNumber numberWithBool:NO]
                                                               rotationAngle:[NSNumber numberWithInt:0]
                                                                         url:@"http://i.imgur.com/khXftYq.png"
                                                                        file:nil
                                                           completionHandler:^(ASPBarcodeResponseList *output, NSError *error) {
                                                               NSLog(@"%@", output);
                                                           }];
//ExEnd:

}

- (void)readBarcodeFromLocalImage {
//ExStart:
    NSString *fileName = @"sample-barcode.jpeg";
    [Utils uploadFile:fileName];
    
    ASPBarcodeReader *barcodeReader = [[ASPBarcodeReader alloc] init];
    barcodeReader.stripFNC = [NSNumber numberWithBool:YES];
    barcodeReader.checksumValidation = @"Off";
    
    [self.barcodeApi putBarcodeRecognizeFromBodyWithCompletionBlock:fileName
                                                      barcodeReader:barcodeReader
                                                               type:@"Code39Standard"
                                                             folder:nil
                                                  completionHandler:^(ASPBarcodeResponseList *output, NSError *error) {
                                                      NSLog(@"%@", output);
                                                  }];
//ExEnd:

}

- (void)readBarcodesByApplyingImageProcessingAlgorithm {
//ExStart:
    NSString *fileName = @"sample-barcode.jpeg";
    [Utils uploadFile:fileName];
    
    ASPBarcodeReader *barcodeReader = [[ASPBarcodeReader alloc] init];
    barcodeReader.stripFNC = [NSNumber numberWithBool:YES];
    barcodeReader.checksumValidation = @"Off";
    barcodeReader.binarizationHints = @"ComplexBackground";
    
    [self.barcodeApi putBarcodeRecognizeFromBodyWithCompletionBlock:fileName
                                                      barcodeReader:barcodeReader
                                                               type:@"Code39Standard"
                                                             folder:nil
                                                  completionHandler:^(ASPBarcodeResponseList *output, NSError *error) {
                                                      NSLog(@"%@", output);
                                                  }];
//ExEnd:

}

@end
