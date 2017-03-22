//
//  GenerateBarcodeWithCloudStorage.m
//  Aspose.Barcode
//
//  Created by Muhammad Sohail Ismail on 12/03/2017.
//  Copyright © 2017 Aspose. All rights reserved.
//

#import "GenerateBarcodeWithCloudStorage.h"
#import "ASPBarcodeApi.h"
#import "ASPStorageApi.h"

@implementation GenerateBarcodeWithCloudStorage

- (id)init {
    self = [super init];
    
    self.barcodeApi = [[ASPBarcodeApi alloc] init];
    
    return self;
}

- (void) generateBarcodeOnAsposeCloudStorage {
//ExStart:GenerateBarcodeOnAsposeCloudStorage

    [self.barcodeApi putBarcodeGenerateFileWithCompletionBlock:@"sample-barcode"
                                                          text:@"Aspose.Barcode"
                                                          type:@"qr"
                                                        format:@"PNG"
                                                   resolutionX:[NSNumber numberWithFloat:96.0]
                                                   resolutionY:[NSNumber numberWithFloat:96.0]
                                                    dimensionX:[NSNumber numberWithFloat:0.7]
                                                    dimensionY:[NSNumber numberWithFloat:2.0]
                                                  codeLocation:@"Below"
                                                        grUnit:@"mm"
                                                      autoSize:@"true"
                                                     barHeight:[NSNumber numberWithFloat:0.0]
                                                   imageHeight:[NSNumber numberWithFloat:0.0]
                                                    imageWidth:[NSNumber numberWithFloat:0.0]
                                                  imageQuality:@"default"
                                                      rotAngle:[NSNumber numberWithFloat:0.0]
                                                     topMargin:[NSNumber numberWithFloat:0.0]
                                                  bottomMargin:[NSNumber numberWithFloat:0.0]
                                                    leftMargin:[NSNumber numberWithFloat:0.0]
                                                   rightMargin:[NSNumber numberWithFloat:0.0]
                                                enableChecksum:@"No"
                                                       storage:nil
                                                        folder:nil
                                                          file:nil
                                             completionHandler:^(ASPBaseResponse *output, NSError *error) {
                                                 NSLog(@"Code %@ Status %@", output.code, output.status);
                                             }];
//ExEnd:GenerateBarcodeOnAsposeCloudStorage
}

- (void) generateBarcodeWithAppropriateCodeTextLocation {
//ExStart:GenerateBarcodeWithAppropriateCodeTextLocation

    [self.barcodeApi putBarcodeGenerateFileWithCompletionBlock:@"sample-barcode"
                                                          text:@"Aspose.Barcode"
                                                          type:@"Code128"
                                                        format:@"PNG"
                                                   resolutionX:[NSNumber numberWithFloat:0.0]
                                                   resolutionY:[NSNumber numberWithFloat:0.0]
                                                    dimensionX:[NSNumber numberWithFloat:0.0]
                                                    dimensionY:[NSNumber numberWithFloat:0.0]
                                                  codeLocation:@"Below"
                                                        grUnit:@"mm"
                                                      autoSize:@"true"
                                                     barHeight:[NSNumber numberWithFloat:0.0]
                                                   imageHeight:[NSNumber numberWithFloat:0.0]
                                                    imageWidth:[NSNumber numberWithFloat:0.0]
                                                  imageQuality:@"default"
                                                      rotAngle:[NSNumber numberWithFloat:0.0]
                                                     topMargin:[NSNumber numberWithFloat:0.0]
                                                  bottomMargin:[NSNumber numberWithFloat:0.0]
                                                    leftMargin:[NSNumber numberWithFloat:0.0]
                                                   rightMargin:[NSNumber numberWithFloat:0.0]
                                                enableChecksum:@"Yes"
                                                       storage:nil
                                                        folder:nil
                                                          file:nil
                                             completionHandler:^(ASPBaseResponse *output, NSError *error) {
                                                 NSLog(@"Code %@ Status %@", output.code, output.status);
                                             }];
//ExEnd:GenerateBarcodeWithAppropriateCodeTextLocation

}

- (void) generateBarcodeWithChecksumOption {
//ExStart:GenerateBarcodeWithChecksumOption

    [self.barcodeApi putBarcodeGenerateFileWithCompletionBlock:@"sample-barcode"
                                                          text:@"Aspose.Barcode"
                                                          type:@"Code128"
                                                        format:@"PNG"
                                                   resolutionX:[NSNumber numberWithFloat:0.0]
                                                   resolutionY:[NSNumber numberWithFloat:0.0]
                                                    dimensionX:[NSNumber numberWithFloat:0.0]
                                                    dimensionY:[NSNumber numberWithFloat:0.0]
                                                  codeLocation:@"Above"
                                                        grUnit:@"mm"
                                                      autoSize:@"true"
                                                     barHeight:[NSNumber numberWithFloat:0.0]
                                                   imageHeight:[NSNumber numberWithFloat:0.0]
                                                    imageWidth:[NSNumber numberWithFloat:0.0]
                                                  imageQuality:@"default"
                                                      rotAngle:[NSNumber numberWithFloat:0.0]
                                                     topMargin:[NSNumber numberWithFloat:0.0]
                                                  bottomMargin:[NSNumber numberWithFloat:0.0]
                                                    leftMargin:[NSNumber numberWithFloat:0.0]
                                                   rightMargin:[NSNumber numberWithFloat:0.0]
                                                enableChecksum:@"Yes"
                                                       storage:nil
                                                        folder:nil
                                                          file:nil
                                             completionHandler:^(ASPBaseResponse *output, NSError *error) {
                                                 NSLog(@"Code %@ Status %@", output.code, output.status);
                                             }];
//ExEnd:GenerateBarcodeWithChecksumOption
}

- (void) rotateBarcodeImageWithSuitableAngle {
//ExStart:RotateBarcodeImageWithSuitableAngle

    [self.barcodeApi putBarcodeGenerateFileWithCompletionBlock:@"sample-barcode"
                                                          text:@"Aspose.Barcode"
                                                          type:@"Code128"
                                                        format:@"PNG"
                                                   resolutionX:[NSNumber numberWithFloat:0.0]
                                                   resolutionY:[NSNumber numberWithFloat:0.0]
                                                    dimensionX:[NSNumber numberWithFloat:0.0]
                                                    dimensionY:[NSNumber numberWithFloat:0.0]
                                                  codeLocation:@"Above"
                                                        grUnit:@"mm"
                                                      autoSize:@"true"
                                                     barHeight:[NSNumber numberWithFloat:0.0]
                                                   imageHeight:[NSNumber numberWithFloat:0.0]
                                                    imageWidth:[NSNumber numberWithFloat:0.0]
                                                  imageQuality:@"default"
                                                      rotAngle:[NSNumber numberWithFloat:90.0]
                                                     topMargin:[NSNumber numberWithFloat:0.0]
                                                  bottomMargin:[NSNumber numberWithFloat:0.0]
                                                    leftMargin:[NSNumber numberWithFloat:0.0]
                                                   rightMargin:[NSNumber numberWithFloat:0.0]
                                                enableChecksum:@"Yes"
                                                       storage:nil
                                                        folder:nil
                                                          file:nil
                                             completionHandler:^(ASPBaseResponse *output, NSError *error) {
                                                 NSLog(@"Code %@ Status %@", output.code, output.status);
                                             }];
//ExEnd:RotateBarcodeImageWithSuitableAngle
}

- (void) setBarcodeImageHeightWidthQualitySettings {
//ExStart:SetBarcodeImageHeightWidthQualitySettings

    [self.barcodeApi putBarcodeGenerateFileWithCompletionBlock:@"sample-barcode"
                                                          text:@"Aspose.Barcode"
                                                          type:@"Code128"
                                                        format:@"PNG"
                                                   resolutionX:[NSNumber numberWithFloat:0.0]
                                                   resolutionY:[NSNumber numberWithFloat:0.0]
                                                    dimensionX:[NSNumber numberWithFloat:0.0]
                                                    dimensionY:[NSNumber numberWithFloat:0.0]
                                                  codeLocation:@"Above"
                                                        grUnit:@"mm"
                                                      autoSize:@"true"
                                                     barHeight:[NSNumber numberWithFloat:0.0]
                                                   imageHeight:[NSNumber numberWithFloat:1.0]
                                                    imageWidth:[NSNumber numberWithFloat:1.0]
                                                  imageQuality:@"default"
                                                      rotAngle:[NSNumber numberWithFloat:0.0]
                                                     topMargin:[NSNumber numberWithFloat:0.0]
                                                  bottomMargin:[NSNumber numberWithFloat:0.0]
                                                    leftMargin:[NSNumber numberWithFloat:0.0]
                                                   rightMargin:[NSNumber numberWithFloat:0.0]
                                                enableChecksum:@"Yes"
                                                       storage:nil
                                                        folder:nil
                                                          file:nil
                                             completionHandler:^(ASPBaseResponse *output, NSError *error) {
                                                 NSLog(@"Code %@ Status %@", output.code, output.status);
                                             }];
//ExEnd:SetBarcodeImageHeightWidthQualitySettings
}

- (void) setBarcodeImageMargin {
//ExStart:SetBarcodeImageMargin

    [self.barcodeApi putBarcodeGenerateFileWithCompletionBlock:@"sample-barcode"
                                                          text:@"Aspose.Barcode"
                                                          type:@"Code128"
                                                        format:@"PNG"
                                                   resolutionX:[NSNumber numberWithFloat:0.0]
                                                   resolutionY:[NSNumber numberWithFloat:0.0]
                                                    dimensionX:[NSNumber numberWithFloat:0.0]
                                                    dimensionY:[NSNumber numberWithFloat:0.0]
                                                  codeLocation:@"Above"
                                                        grUnit:@"mm"
                                                      autoSize:@"true"
                                                     barHeight:[NSNumber numberWithFloat:0.0]
                                                   imageHeight:[NSNumber numberWithFloat:0.0]
                                                    imageWidth:[NSNumber numberWithFloat:0.0]
                                                  imageQuality:@"default"
                                                      rotAngle:[NSNumber numberWithFloat:0.0]
                                                     topMargin:[NSNumber numberWithFloat:2.0]
                                                  bottomMargin:[NSNumber numberWithFloat:2.0]
                                                    leftMargin:[NSNumber numberWithFloat:2.0]
                                                   rightMargin:[NSNumber numberWithFloat:2.0]
                                                enableChecksum:@"Yes"
                                                       storage:nil
                                                        folder:nil
                                                          file:nil
                                             completionHandler:^(ASPBaseResponse *output, NSError *error) {
                                                 NSLog(@"Code %@ Status %@", output.code, output.status);
                                             }];
//ExEnd:SetBarcodeImageMargin
}

- (void) setBarcodeImageResolution {
//ExStart:SetBarcodeImageResolution

    [self.barcodeApi putBarcodeGenerateFileWithCompletionBlock:@"sample-barcode"
                                                          text:@"Aspose.Barcode"
                                                          type:@"Code128"
                                                        format:@"PNG"
                                                   resolutionX:[NSNumber numberWithFloat:200.0]
                                                   resolutionY:[NSNumber numberWithFloat:200.0]
                                                    dimensionX:[NSNumber numberWithFloat:0.0]
                                                    dimensionY:[NSNumber numberWithFloat:0.0]
                                                  codeLocation:@"Above"
                                                        grUnit:@"mm"
                                                      autoSize:@"true"
                                                     barHeight:[NSNumber numberWithFloat:0.0]
                                                   imageHeight:[NSNumber numberWithFloat:0.0]
                                                    imageWidth:[NSNumber numberWithFloat:0.0]
                                                  imageQuality:@"default"
                                                      rotAngle:[NSNumber numberWithFloat:0.0]
                                                     topMargin:[NSNumber numberWithFloat:0.0]
                                                  bottomMargin:[NSNumber numberWithFloat:0.0]
                                                    leftMargin:[NSNumber numberWithFloat:0.0]
                                                   rightMargin:[NSNumber numberWithFloat:0.0]
                                                enableChecksum:@"Yes"
                                                       storage:nil
                                                        folder:nil
                                                          file:nil
                                             completionHandler:^(ASPBaseResponse *output, NSError *error) {
                                                 NSLog(@"Code %@ Status %@", output.code, output.status);
                                             }];
//ExEnd:SetBarcodeImageResolution
}

- (void) setBarsHeightInBarcodeImage {
//ExStart:SetBarsHeightInBarcodeImage

    [self.barcodeApi putBarcodeGenerateFileWithCompletionBlock:@"sample-barcode"
                                                          text:@"Aspose.Barcode"
                                                          type:@"Code128"
                                                        format:@"PNG"
                                                   resolutionX:[NSNumber numberWithFloat:0.0]
                                                   resolutionY:[NSNumber numberWithFloat:0.0]
                                                    dimensionX:[NSNumber numberWithFloat:0.0]
                                                    dimensionY:[NSNumber numberWithFloat:0.0]
                                                  codeLocation:@"Above"
                                                        grUnit:@"mm"
                                                      autoSize:@"true"
                                                     barHeight:[NSNumber numberWithFloat:50.0]
                                                   imageHeight:[NSNumber numberWithFloat:0.0]
                                                    imageWidth:[NSNumber numberWithFloat:0.0]
                                                  imageQuality:@"default"
                                                      rotAngle:[NSNumber numberWithFloat:0.0]
                                                     topMargin:[NSNumber numberWithFloat:0.0]
                                                  bottomMargin:[NSNumber numberWithFloat:0.0]
                                                    leftMargin:[NSNumber numberWithFloat:0.0]
                                                   rightMargin:[NSNumber numberWithFloat:0.0]
                                                enableChecksum:@"Yes"
                                                       storage:nil
                                                        folder:nil
                                                          file:nil
                                             completionHandler:^(ASPBaseResponse *output, NSError *error) {
                                                 NSLog(@"Code %@ Status %@", output.code, output.status);
                                             }];
//ExEnd:SetBarsHeightInBarcodeImage
}

- (void) setXAndYDimensionsOfBarcode {
//ExStart:SetXAndYDimensionsOfBarcode

    [self.barcodeApi putBarcodeGenerateFileWithCompletionBlock:@"sample-barcode"
                                                          text:@"Aspose.Barcode"
                                                          type:@"Code128"
                                                        format:@"PNG"
                                                   resolutionX:[NSNumber numberWithFloat:0.0]
                                                   resolutionY:[NSNumber numberWithFloat:0.0]
                                                    dimensionX:[NSNumber numberWithFloat:1.0]
                                                    dimensionY:[NSNumber numberWithFloat:0.5]
                                                  codeLocation:@"Above"
                                                        grUnit:@"mm"
                                                      autoSize:@"true"
                                                     barHeight:[NSNumber numberWithFloat:0.0]
                                                   imageHeight:[NSNumber numberWithFloat:0.0]
                                                    imageWidth:[NSNumber numberWithFloat:0.0]
                                                  imageQuality:@"default"
                                                      rotAngle:[NSNumber numberWithFloat:0.0]
                                                     topMargin:[NSNumber numberWithFloat:0.0]
                                                  bottomMargin:[NSNumber numberWithFloat:0.0]
                                                    leftMargin:[NSNumber numberWithFloat:0.0]
                                                   rightMargin:[NSNumber numberWithFloat:0.0]
                                                enableChecksum:@"Yes"
                                                       storage:nil
                                                        folder:nil
                                                          file:nil
                                             completionHandler:^(ASPBaseResponse *output, NSError *error) {
                                                 NSLog(@"Code %@ Status %@", output.code, output.status);
                                             }];
//ExEnd:SetXAndYDimensionsOfBarcode
}

- (void) specifyBarcodeImageSaveFormat {
//ExStart:SpecifyBarcodeImageSaveFormat

    [self.barcodeApi putBarcodeGenerateFileWithCompletionBlock:@"sample-barcode"
                                                          text:@"Aspose.Barcode"
                                                          type:@"Code128"
                                                        format:@"PNG"
                                                   resolutionX:[NSNumber numberWithFloat:0.0]
                                                   resolutionY:[NSNumber numberWithFloat:0.0]
                                                    dimensionX:[NSNumber numberWithFloat:0.0]
                                                    dimensionY:[NSNumber numberWithFloat:0.0]
                                                  codeLocation:@"Above"
                                                        grUnit:@"mm"
                                                      autoSize:@"true"
                                                     barHeight:[NSNumber numberWithFloat:0.0]
                                                   imageHeight:[NSNumber numberWithFloat:0.0]
                                                    imageWidth:[NSNumber numberWithFloat:0.0]
                                                  imageQuality:@"default"
                                                      rotAngle:[NSNumber numberWithFloat:0.0]
                                                     topMargin:[NSNumber numberWithFloat:0.0]
                                                  bottomMargin:[NSNumber numberWithFloat:0.0]
                                                    leftMargin:[NSNumber numberWithFloat:0.0]
                                                   rightMargin:[NSNumber numberWithFloat:0.0]
                                                enableChecksum:@"Yes"
                                                       storage:nil
                                                        folder:nil
                                                          file:nil
                                             completionHandler:^(ASPBaseResponse *output, NSError *error) {
                                                 NSLog(@"Code %@ Status %@", output.code, output.status);
                                             }];
//ExEnd:SpecifyBarcodeImageSaveFormat
}

- (void) specifyCodetextAndSymbologyForBarcode {
//ExStart:SpecifyCodetextAndSymbologyForBarcode

    [self.barcodeApi putBarcodeGenerateFileWithCompletionBlock:@"sample-barcode"
                                                          text:@"Aspose.Barcode"
                                                          type:@"Code128"
                                                        format:@"PNG"
                                                   resolutionX:[NSNumber numberWithFloat:0.0]
                                                   resolutionY:[NSNumber numberWithFloat:0.0]
                                                    dimensionX:[NSNumber numberWithFloat:0.0]
                                                    dimensionY:[NSNumber numberWithFloat:0.0]
                                                  codeLocation:@"Above"
                                                        grUnit:@"mm"
                                                      autoSize:@"true"
                                                     barHeight:[NSNumber numberWithFloat:0.0]
                                                   imageHeight:[NSNumber numberWithFloat:0.0]
                                                    imageWidth:[NSNumber numberWithFloat:0.0]
                                                  imageQuality:@"default"
                                                      rotAngle:[NSNumber numberWithFloat:0.0]
                                                     topMargin:[NSNumber numberWithFloat:0.0]
                                                  bottomMargin:[NSNumber numberWithFloat:0.0]
                                                    leftMargin:[NSNumber numberWithFloat:0.0]
                                                   rightMargin:[NSNumber numberWithFloat:0.0]
                                                enableChecksum:@"Yes"
                                                       storage:nil
                                                        folder:nil
                                                          file:nil
                                             completionHandler:^(ASPBaseResponse *output, NSError *error) {
                                                 NSLog(@"Code %@ Status %@", output.code, output.status);
                                             }];
//ExEnd:SpecifyCodetextAndSymbologyForBarcode
}
@end
