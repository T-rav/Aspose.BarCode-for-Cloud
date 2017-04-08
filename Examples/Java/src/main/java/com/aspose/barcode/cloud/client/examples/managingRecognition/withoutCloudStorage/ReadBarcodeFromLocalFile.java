package com.aspose.barcode.cloud.client.examples.managingRecognition.withoutCloudStorage;

import com.aspose.barcode.api.BarcodeApi;
import com.aspose.barcode.cloud.client.examples.Configuration;
import com.aspose.barcode.model.Barcode;
import com.aspose.barcode.model.BarcodeReader;
import com.aspose.barcode.model.BarcodeResponseList;
import com.aspose.barcode.model.ChecksumValidation;

/**
 * This sample code allows you to read barcode from local image using Aspose BarCode Cloud API.
 * 

 */
public class ReadBarcodeFromLocalFile {

	public static void main(String[] args) {
		//ExStart: ReadBarcodeFromLocalFile
		

		// ExStart:1

		try {

			// Instantiate Aspose BarCode Cloud API SDK
			BarcodeApi barcodeApi = new BarcodeApi(Configuration.apiKey, Configuration.appSID, true);

			// set input file name
			String name = "sample-barcode.jpeg";

			// The barcode type.
			// If this parameter is empty, autodetection of all supported types
			// is used.
			String type = "";

			String folder = "";

			BarcodeReader body = new BarcodeReader();

			// Sets if FNC symbol stripping should be performed
			body.setStripFNC(true);

			// Set mode for checksum validation during recognition
			body.setChecksumValidation(ChecksumValidation.OFF);

			// invoke Aspose.BarCode Cloud SDK API to recognition of a barcode
			// from file on server with parameters in body
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
		//ExEnd: ReadBarcodeFromLocalFile
	}

}
