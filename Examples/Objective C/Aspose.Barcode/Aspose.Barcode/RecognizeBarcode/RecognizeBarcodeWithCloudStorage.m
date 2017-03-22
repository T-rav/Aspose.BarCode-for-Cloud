//
//  RecognizeBarcodeWithCloudStorage.m
//  Aspose.Barcode
//
//  Created by Muhammad Sohail Ismail on 12/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import "RecognizeBarcodeWithCloudStorage.h"
#import "ASPBarcodeApi.h"
#import "Utils.h"

@implementation RecognizeBarcodeWithCloudStorage

- (id)init {
    self = [super init];
    
    self.barcodeApi = [[ASPBarcodeApi alloc] init];
    
    return self;
}

- (void) readBarcodeFromAsposeCloudStorage {
//ExStart:
    NSString *fileName = @"sample-barcode.jpeg";
    [Utils uploadFile:fileName];
    
    [self.barcodeApi getBarcodeRecognizeWithCompletionBlock:fileName
                                                       type:@""
                                         checksumValidation:nil
                                                   stripFnc:nil
                                              rotationAngle:nil
                                              barcodesCount:nil
                                                      rectX:nil
                                                      rectY:nil
                                                  rectWidth:nil
                                                 rectHeight:nil
                                                    storage:nil
                                                     folder:nil
                                          completionHandler:^(ASPBarcodeResponseList *output, NSError *error) {
                                              NSLog(@"%@", output);
                                          }];
//ExEnd:
}

- (void) readBarcodeFromSpecificRegionOfImage {
//ExStart:
    NSString *fileName = @"sample-barcode.jpeg";
    [Utils uploadFile:fileName];
    
    [self.barcodeApi getBarcodeRecognizeWithCompletionBlock:fileName
                                                       type:@""
                                         checksumValidation:nil
                                                   stripFnc:nil
                                              rotationAngle:nil
                                              barcodesCount:nil
                                                      rectX:[NSNumber numberWithInt:10]
                                                      rectY:[NSNumber numberWithInt:10]
                                                  rectWidth:[NSNumber numberWithInt:200]
                                                 rectHeight:[NSNumber numberWithInt:200]
                                                    storage:nil
                                                     folder:nil
                                          completionHandler:^(ASPBarcodeResponseList *output, NSError *error) {
                                              NSLog(@"%@", output);
                                          }];
//ExEnd:
}

- (void) recognizeSpecifiedCountOfBarcodes {
//ExStart:
    NSString *fileName = @"sample-barcode.jpeg";
    [Utils uploadFile:fileName];
    
    [self.barcodeApi getBarcodeRecognizeWithCompletionBlock:fileName
                                                       type:@""
                                         checksumValidation:@"On"
                                                   stripFnc:[NSNumber numberWithBool:YES]
                                              rotationAngle:nil
                                              barcodesCount:[NSNumber numberWithInt:1]
                                                      rectX:[NSNumber numberWithInt:0]
                                                      rectY:[NSNumber numberWithInt:0]
                                                  rectWidth:[NSNumber numberWithInt:0]
                                                 rectHeight:[NSNumber numberWithInt:0]
                                                    storage:nil
                                                     folder:nil
                                          completionHandler:^(ASPBarcodeResponseList *output, NSError *error) {
                                              NSLog(@"%@", output);
                                          }];
//ExEnd:
}

@end
