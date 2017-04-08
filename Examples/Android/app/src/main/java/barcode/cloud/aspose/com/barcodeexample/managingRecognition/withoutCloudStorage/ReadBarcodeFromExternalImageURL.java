package barcode.cloud.aspose.com.barcodeexample.managingRecognition.withoutCloudStorage;

import android.util.Log;

import java.io.File;

import com.aspose.barcode.api.BarcodeApi;
import com.aspose.barcode.model.Barcode;
import com.aspose.barcode.model.BarcodeResponseList;

import barcode.cloud.aspose.com.barcodeexample.utils.Configuration;

/**
 * This sample code allows you to read barcode from external image URL using
 * Aspose BarCode Cloud API.
 * 
 */
public class ReadBarcodeFromExternalImageURL {

	public static void executeReadBarcodeFromExternalImageURL() {
		//ExStart: ReadBarcodeFromExternalImageURL


		try {

			// Instantiate Aspose BarCode Cloud API SDK
			BarcodeApi barcodeApi = new BarcodeApi(Configuration.apiKey, Configuration.appSID, true);

			//The barcode type.
			//If this parameter is empty, autodetection of all supported types is used.
			String type = "";
			
			//Set mode for checksum validation during recognition
			String checksumValidation = "";

			//Sets if FNC symbol stripping should be performed
			Boolean stripFnc = false;
			
			//Sets recognition of rotated barcode
			Integer rotationAngle = 0;
			
			//Set the image file url 
			String url = "http://www.barcoding.com/images/Barcodes/code93.gif";
			
			File file = null;

			// invoke Aspose.BarCode Cloud SDK API to read barcode from external
			// image URL
			BarcodeResponseList apiResponse = barcodeApi
					.PostBarcodeRecognizeFromUrlorContent(type,
							checksumValidation, stripFnc, rotationAngle, url,
							file);

			if (apiResponse != null && apiResponse.getStatus().equals("OK")) {

				for (Barcode barcode : apiResponse.getBarcodes()) {
					Log.d("aspose-example","Codetext: " + barcode.getBarcodeValue()
							+ "\nType: " + barcode.getBarcodeType());
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		//ExEnd: ReadBarcodeFromExternalImageURL
	}

}
