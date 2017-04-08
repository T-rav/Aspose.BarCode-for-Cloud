package com.aspose.barcode.cloud.client.examples.managingRecognition.cloudStorage;

import java.nio.file.Path;

import com.aspose.barcode.api.BarcodeApi;
import com.aspose.barcode.cloud.client.examples.Configuration;
import com.aspose.barcode.cloud.client.examples.Utils;
import com.aspose.barcode.model.Barcode;
import com.aspose.barcode.model.BarcodeResponseList;
import com.aspose.storage.api.StorageApi;

/**
 * This sample code allows you to read barcode using Aspose BarCode Cloud API.
 * 
 */
public class ReadBarcodeFromAsposeCloudStorage {

	public static void main(String[] args) {
		//ExStart: ReadBarcodeFromAsposeCloudStorage
		
		// ExStart:1

		try {

			// Instantiate Aspose Storage Cloud API SDK
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

			// Instantiate Aspose BarCode Cloud API SDK
			BarcodeApi barcodeApi = new BarcodeApi(Configuration.apiKey, Configuration.appSID, true);

			// set input file name
			String name = "sample-barcode.jpeg";
			
			//The barcode type.
			//If this parameter is empty, autodetection of all supported types is used.
			String type = "";
			
			//Sets mode for checksum validation during recognition
			String checksumValidation = "";
			
			//Sets if FNC symbol stripping should be performed. 
			Boolean stripFnc = Boolean.TRUE;

			//Sets recognition of rotated barcode
			Integer rotationAngle = Integer.MIN_VALUE;
			
			//Sets exact number of barcodes to recognize 
			Integer barcodesCount = Integer.MIN_VALUE;
			
			//Set recognition of barcode inside specified Rectangle region
			Integer rectX = Integer.SIZE;
			Integer rectY = Integer.SIZE;			
			Integer rectWidth = Integer.MIN_VALUE;
			Integer rectHeight = Integer.MIN_VALUE;
			
			//Set 3rd party cloud storage server (if any)
			String storage = "";
			
			// Set folder location at cloud storage
			String folder = "";

			
		    Path inputFile = Utils.getPath(ReadBarcodeFromAsposeCloudStorage.class, name);

			// upload files to aspose cloud storage
			storageApi.PutCreate(name, "", "",
			        inputFile.toFile());

			// invoke Aspose.BarCode Cloud SDK API to read barcode from Aspose
			// Cloud Storage
			BarcodeResponseList apiResponse = barcodeApi.GetBarcodeRecognize(
					name, type, checksumValidation, stripFnc, rotationAngle,
					barcodesCount, rectX, rectY, rectWidth, rectHeight,
					storage, folder);

			if (apiResponse != null && apiResponse.getStatus().equals("OK")) {

				for (Barcode barcode : apiResponse.getBarcodes()) {
					System.out.println("Codetext: " + barcode.getBarcodeValue()
							+ "\nType: " + barcode.getBarcodeType());
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		//ExEnd: ReadBarcodeFromAsposeCloudStorage
	}

}
