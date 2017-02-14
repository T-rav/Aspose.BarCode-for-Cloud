var fs = require('fs');
var assert = require('assert');
var BarcodeApi = require('asposebarcodecloud');
var StorageApi = require('asposestoragecloud');

var configProps = require('../../Config/config.json');
var data_path = '../../../../Data/';

var AppSID = configProps.app_sid;
var AppKey = configProps.api_key;
var outFolder = configProps.out_folder;

// ExStart:1
var config = {'appSid':AppSID,'apiKey':AppKey , 'debug' : true};

// Instantiate Aspose.Storage API SDK
var storageApi = new StorageApi(config);

// Instantiate Aspose.BarCode API SDK
var barcodeApi = new BarcodeApi(config);

// Set Filename of image
var name = "sample-barcode.png";

// Set Text to encode inside barcode
var text = "Aspose.BarCode for Cloud";

// Set Barcode Symbology
var type = "QR";

// Set Barcode Image Format
var format = "PNG";

// Set Resolution along X and Y in dpi.
var resolutionX = 96.0;
var resolutionY = 96.0;

// Set Width and Height of barcode unit
var dimensionX = 0.7;
var dimensionY = 2.0;

// Sets if checksum will be added to barcode image
var enableChecksum = "NO";

try {
	// Upload source file to aspose cloud storage
	storageApi.PutCreate(name  , null, null, data_path + name  , function(responseMessage) {
		assert.equal(responseMessage.status, 'OK');
	
// Invoke Aspose.BarCode Cloud SDK API to create barcode and get barcode image as a stream        
	barcodeApi.GetBarcodeGenerate(text, type, format, resolutionX, resolutionY, dimensionX, dimensionY, enableChecksum, function(responseMessage) {
			assert.equal(responseMessage.status, 'OK');
			// Download generated barcode from api response
			var outfilename = name + "." + format;
			var writeStream = fs.createWriteStream(outFolder + outfilename);
			writeStream.write(responseMessage.body);			      
	});
});

}catch (e) {
  console.log("exception in example");
  console.log(e);
}
//ExEnd:1