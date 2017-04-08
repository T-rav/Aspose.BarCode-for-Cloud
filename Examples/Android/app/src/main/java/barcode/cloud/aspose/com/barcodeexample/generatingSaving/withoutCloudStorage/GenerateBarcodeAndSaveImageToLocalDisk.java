package barcode.cloud.aspose.com.barcodeexample.generatingSaving.withoutCloudStorage;

import java.io.File;
import java.io.InputStream;

import com.aspose.barcode.api.BarcodeApi;
import com.aspose.barcode.model.ResponseMessage;

import barcode.cloud.aspose.com.barcodeexample.utils.CommonUtils;
import barcode.cloud.aspose.com.barcodeexample.utils.Configuration;

/**
 * This sample code allows you to create barcode and save image to local disk
 * using Aspose BarCode Cloud API.
 * 
 */
public class GenerateBarcodeAndSaveImageToLocalDisk {

	public static void executeGenerateBarcodeAndSaveImageToLocalDisk() {
		//ExStart: GenerateBarcodeAndSaveImageToLocalDisk



		// ExStart:1
		try {

			// Instantiate Aspose.BarCode Cloud API SDK
			BarcodeApi barcodeApi = new BarcodeApi(Configuration.apiKey, Configuration.appSID, true);

			// Set Filename of image.
			String name = "sample-barcode";
			
			// Set Text to encode inside barcode
			String text = "Aspose.BarCode";
			
			// Set Barcode Symbology
			String type = "QR";
			
			// Set Barcode Image Format
			String format = "PNG";
			
			// Set Resolution along X and Y in dpi.
			Float resolutionX = 96.0f;
			Float resolutionY = 96.0f;
			
			//Set Width and Height of barcode unit
			Float dimensionX = 0.7f;
			Float dimensionY = 2.0f;
			
			// Sets if checksum will be added to barcode image.
			String enableChecksum = "NO";

			// invoke Aspose.BarCode Cloud SDK API to create barcode and get
			// barcode image as a stream
			ResponseMessage apiResponse = barcodeApi.GetBarcodeGenerate(text,
					type, format, resolutionX, resolutionY, dimensionX,
					dimensionY, enableChecksum);

			if (apiResponse != null && apiResponse.getStatus().equals("OK")) {

				// download generated barcode image from api response
				InputStream responseStream = apiResponse.getInputStream();
				CommonUtils.copyInputStreamToFile(responseStream,new File(name + "." + format));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		//ExEnd: GenerateBarcodeAndSaveImageToLocalDisk
	}
}
