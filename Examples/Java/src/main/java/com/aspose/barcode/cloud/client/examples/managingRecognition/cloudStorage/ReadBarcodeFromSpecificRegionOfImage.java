package com.aspose.barcode.cloud.client.examples.managingRecognition.cloudStorage;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import com.aspose.barcode.api.BarcodeApi;
import com.aspose.barcode.model.Barcode;
import com.aspose.barcode.model.BarcodeResponseList;
import com.aspose.storage.api.StorageApi;

/**
 * This sample code allows you to read barcode from specific region of image on
 * the Aspose Cloud Storage using Aspose BarCode Cloud API.
 * 
 */
public class ReadBarcodeFromSpecificRegionOfImage {

	public static void main(String[] args) {
		//ExStart: ReadBarcodeFromSpecificRegionOfImage
		Properties prop = new Properties();
		String propFileName = "config.properties";
		// App SID
		String appSID = "";
		// App Key
		String apiKey = "";
		// output folder
		String outFolder = "c:\\temp\\";

		InputStream inputStream = ReadBarcodeFromSpecificRegionOfImage.class
				.getClassLoader().getResourceAsStream(propFileName);
		try {
			if (inputStream != null) {
				prop.load(inputStream);
				appSID = prop.getProperty("app_sid");
				apiKey = prop.getProperty("api_key");
				outFolder = prop.getProperty("out_folder");

			} else {
				System.out.println("property file '" + propFileName
						+ "' not found in the classpath");
				System.exit(1);
			}
		} catch (IOException ioe) {
			System.out.println("property file '" + propFileName
					+ "' not found in the classpath");
			ioe.printStackTrace();
			System.exit(1);
		}

		// ExStart:1

		try {

			// Instantiate Aspose.Storage Cloud API SDK
			StorageApi storageApi = new StorageApi(apiKey, appSID, true);

			// Instantiate Aspose.BarCode Cloud API SDK
			BarcodeApi barcodeApi = new BarcodeApi(apiKey, appSID, true);

			// set input file name
			String name = "sample-barcode.jpeg";
			
			//The barcode type.
			//If this parameter is empty, autodetection of all supported types is used
			String type = "";

			//Sets mode for checksum validation during recognition
			String checksumValidation = "On";

			//Sets if FNC symbol stripping should be performed. 
			Boolean stripFnc = Boolean.TRUE;
			
			//Sets recognition of rotated barcode
			Integer rotationAngle = 0;
			
			//Sets exact number of barcodes to recognize 
			Integer barcodesCount = 0;
			
			//Set recognition of barcode inside specified Rectangle region
			Integer rectX = 10;
			Integer rectY = 10;
			Integer rectWidth = 200;
			Integer rectHeight = 200;
			
			//Set 3rd party cloud storage server (if any)
			String storage = "";
			
			// Set folder location at cloud storage
			String folder = "";

			// upload files to aspose cloud storage
			storageApi.PutCreate(name, "", "",
					new File(ReadBarcodeFromSpecificRegionOfImage.class
							.getResource("/" + name).toURI()));

			// invoke Aspose.BarCode Cloud SDK API to read barcode with specific
			// region of image
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
		//ExEnd: ReadBarcodeFromSpecificRegionOfImage
	}

}
