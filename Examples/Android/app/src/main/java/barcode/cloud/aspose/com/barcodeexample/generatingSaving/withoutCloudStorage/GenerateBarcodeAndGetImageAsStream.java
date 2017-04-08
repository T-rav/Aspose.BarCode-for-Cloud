package barcode.cloud.aspose.com.barcodeexample.generatingSaving.withoutCloudStorage;

import java.io.File;
import java.io.InputStream;

import com.aspose.barcode.api.BarcodeApi;
import com.aspose.barcode.model.ResponseMessage;

import barcode.cloud.aspose.com.barcodeexample.utils.CommonUtils;
import barcode.cloud.aspose.com.barcodeexample.utils.Configuration;

/**
 * This sample code allows you to create barcode and save image to a stream
 * object using Aspose Cloud Storage. 
 *  
 */
public class GenerateBarcodeAndGetImageAsStream {

	public static void executeGenerateBarcodeAndGetImageAsStream() {
		//ExStart: GenerateBarcodeAndGetImageAsStream


		try {

			// Instantiate Aspose.BarCode Cloud API SDK
			BarcodeApi barcodeApi = new BarcodeApi(Configuration.apiKey, Configuration.appSID, true);

			// Set Filename of image
			String name = "sample-barcode"; 
			
			// Set Text to encode inside barcode
			String text = "Aspose.BarCode"; 
			
			// Set Barcode Symbology
			String type = "datamatrix"; 
			
			// Set Barcode Image Format
			String format = "PNG"; 

			// Sets if checksum will be added to barcode image.
			String enableChecksum = "No"; 

			//Set optional params (if any) 
			Float resolutionX = null;
			Float resolutionY = null;
			Float dimensionX = null;
			Float dimensionY = null;
			

			// invoke Aspose.BarCode Cloud SDK API to create barcode and save image to a stream
			ResponseMessage apiResponse = barcodeApi.GetBarcodeGenerate(text,
					type, format, resolutionX, resolutionY, dimensionX,
					dimensionY, enableChecksum);

			if (apiResponse != null && apiResponse.getStatus().equals("OK")) {
				
				// download generated barcode from api response
				InputStream responseStream = apiResponse.getInputStream();
				CommonUtils.copyInputStreamToFile(responseStream,new File(name + "." + format));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		//ExEnd: GenerateBarcodeAndGetImageAsStream
	}

}
