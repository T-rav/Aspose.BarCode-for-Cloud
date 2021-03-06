package barcode.cloud.aspose.com.barcodeexample.generatingSaving.cloudStorage;

import java.io.File;
import java.io.InputStream;

import com.aspose.barcode.api.BarcodeApi;
import com.aspose.barcode.model.SaaSposeResponse;
import com.aspose.storage.api.StorageApi;

import barcode.cloud.aspose.com.barcodeexample.utils.CommonUtils;
import barcode.cloud.aspose.com.barcodeexample.utils.Configuration;

/**
 * This sample code allows you to generate barcode with appropriate code text
 * location using Aspose BarCode Cloud API.
 * 
 */
public class GenerateBarcodewithAppropriateCodeTextLocation {

	public static void executeGenerateBarcodewithAppropriateCodeTextLocation(){
		//ExStart: GenerateBarcodewithAppropriateCodeTextLocation


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
			
			// Height of the bar.
			Float barHeight = 0.0f;
			
			//Set height, Width and quality of the image.
			Float imageHeight = 0.0f;
			Float imageWidth = 0.0f;
			String imageQuality = "default";

			// Set Angle of barcode orientation
			Float rotAngle = 0.0f;
			
			// Set Margin of image border
			Float topMargin = 0.0f;
			Float bottomMargin = 0.0f;
			Float leftMargin = 0.0f;
			Float rightMargin = 0.0f;
			
			// Sets if checksum will be added to barcode image.
			String enableChecksum = "";
			
			//Set 3rd party cloud storage server (if any)
			String storage = "";
			// Set folder location at cloud storage
			String folder = "";

			// Set local file (if any)
			File file = null;

			// invoke Aspose.BarCode Cloud SDK API to generate barcode with
			// appropriate code text location and put in cloud storage
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
				CommonUtils.copyInputStreamToFile(responseStream,new File(name + "." + format));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		//ExEnd: GenerateBarcodewithAppropriateCodeTextLocation

	}

}
