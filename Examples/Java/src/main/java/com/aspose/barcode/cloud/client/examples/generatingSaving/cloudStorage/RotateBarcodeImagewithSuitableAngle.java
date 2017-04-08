package com.aspose.barcode.cloud.client.examples.generatingSaving.cloudStorage;

import java.io.File;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import com.aspose.barcode.api.BarcodeApi;
import com.aspose.barcode.cloud.client.examples.Configuration;
import com.aspose.barcode.model.SaaSposeResponse;
import com.aspose.storage.api.StorageApi;

/**
 * This sample code allows you to rotate barcode image with suitable angle using
 * Aspose BarCode Cloud API.
 * 
 */
public class RotateBarcodeImagewithSuitableAngle {
	//ExStart: RotateBarcodeImagewithSuitableAngle

	public static void main(String[] args) {

		

		// ExStart:1

		try {

			// Instantiate Aspose.Storage Cloud API SDK
			StorageApi storageApi = new StorageApi(Configuration.apiKey, Configuration.appSID, true);

			// Instantiate Aspose.BarCode Cloud API SDK
			BarcodeApi barcodeApi = new BarcodeApi(Configuration.apiKey, Configuration.appSID, true);

			// Set the barcode file name created on server.
			String name = "sample-barcode";
			
			// Set Text to encode inside barcode.
			String text = "AsposeBarCode";
			
			// Set Barcode Symbology
			String type = "Code128";
			
			// Set Generated Barcode Image Format
			String format = "png";

			// Set Resolution along X and Y in dpi.
			Float resolutionX = 0.0f;
			Float resolutionY = 0.0f;
			
			//Set Width and Height of barcode unit
			Float dimensionX = 0.0f;
			Float dimensionY = 0.0f;
			
			//Set Location, Measurement  of the code
			String codeLocation = "Above";
			String grUnit = "mm";
			
			// Sets if barcode's size will be updated automatically
			String autoSize = "true";
			
			// Set Height of the bar.
			Float barHeight = 0.0f;
			
			//Set height, Width and quality of the image.
			Float imageHeight = 0.0f;
			Float imageWidth = 0.0f;
			String imageQuality = "default";
			
			// Set Angle of barcode orientation
			Float rotAngle = 90f;
			
			// Set Margin of image border
			Float topMargin = 0.0f;
			Float bottomMargin = 0.0f;
			Float leftMargin = 0.0f;
			Float rightMargin = 0.0f;
			
			// Sets if checksum will be added to barcode image.
			String enableChecksum = "Yes";

			//Set 3rd party cloud storage server (if any)
			String storage = "";
			
			// Set folder location at cloud storage
			String folder = "";
			
			// Set local file (if any)
			File file = null;

			// invoke Aspose.BarCode Cloud SDK API to generate and rotate
			// barcode image with suitable angle
			SaaSposeResponse apiResponse = barcodeApi.PutBarcodeGenerateFile(
					name, text, type, format, resolutionX, resolutionY,
					dimensionX, dimensionY, codeLocation, grUnit, autoSize,
					barHeight, imageHeight, imageWidth, imageQuality, rotAngle,
					topMargin, bottomMargin, leftMargin, rightMargin,
					enableChecksum, storage, folder, file);

			if (apiResponse != null && apiResponse.getStatus().equals("OK")) {
				// download generated barcode from cloud storage
				com.aspose.storage.model.ResponseMessage storageRes = storageApi
						.GetDownload(name, null, null);
				InputStream responseStream = storageRes.getInputStream();
				final Path destination = Paths.get(name + "."
						+ format);
				Files.copy(responseStream, destination,
						StandardCopyOption.REPLACE_EXISTING);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		//ExEnd: RotateBarcodeImagewithSuitableAngle
	}

}
