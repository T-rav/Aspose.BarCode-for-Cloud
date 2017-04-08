package com.aspose.barcode.cloud.client.examples.managingRecognition.withoutCloudStorage;

import java.nio.file.Path;

import com.aspose.barcode.api.BarcodeApi;
import com.aspose.barcode.cloud.client.examples.Configuration;
import com.aspose.barcode.cloud.client.examples.Utils;
import com.aspose.barcode.model.Barcode;
import com.aspose.barcode.model.BarcodeReader;
import com.aspose.barcode.model.BarcodeResponseList;
import com.aspose.barcode.model.BinarizationHints;
import com.aspose.barcode.model.ChecksumValidation;
import com.aspose.storage.api.StorageApi;

/**
 * This sample code allows users to read barcode by apply various available
 * image processing algorithms using Aspose BarCode Cloud API.
 * 
 */
public class ReadBarcodesbyApplyingImageProcessingAlgorithm {

	public static void main(String[] args) {
		//ExStart: ReadBarcodesbyApplyingImageProcessingAlgorithm
		
		// ExStart:1

		try {

			// Instantiate Aspose Storage Cloud API SDK
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

			// Instantiate Aspose BarCode Cloud API SDK
			BarcodeApi barcodeApi = new BarcodeApi(Configuration.apiKey, Configuration.appSID, true);

			// Set the barcode file name created on server
			String name = "sample-barcode.jpeg";

			// The barcode type.
			// If this parameter is empty, autodetection of all supported types is used
			String type = "";

			// Set folder location at cloud storage
			String folder = "";

			BarcodeReader body = new BarcodeReader();

			// Set if FNC symbol stripping should be performed.
			body.setStripFNC(true);

			// Set mode for checksum validation during recognition
			body.setChecksumValidation(ChecksumValidation.OFF);

			// Set special mode of barcode binarization
			body.setBinarizationHints(BinarizationHints.ComplexBackground);

			Path inputFile = Utils.getPath(ReadBarcodesbyApplyingImageProcessingAlgorithm.class, name);
			// upload files to aspose cloud storage
			storageApi.PutCreate(name, "", "", inputFile.toFile());

			// invoke Aspose.BarCode Cloud SDK API to recognition of a barcode
			// by apply various available image processing algorithms
			BarcodeResponseList apiResponse = barcodeApi
					.PutBarcodeRecognizeFromBody(name, type, folder, body);

			if (apiResponse != null && apiResponse.getStatus().equals("OK")) {

				for (Barcode barcode : apiResponse.getBarcodes()) {
					System.out.println("Codetext: " + barcode.getBarcodeValue()
							+ "\nType: " + barcode.getBarcodeType());
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		//ExEnd: ReadBarcodesbyApplyingImageProcessingAlgorithm
	}

}
