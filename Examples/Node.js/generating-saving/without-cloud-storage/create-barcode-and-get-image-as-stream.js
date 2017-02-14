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
var type = "datamatrix";

// Set Barcode Image Format
var format = "PNG";

try {
	// Upload source file to aspose cloud storage
	storageApi.PutCreate(name  , null, null, data_path + name  , function(responseMessage) {
		assert.equal(responseMessage.status, 'OK');

	// Invoke Aspose.BarCode Cloud SDK API to create barcode and save image to a stream        
	barcodeApi.GetBarcodeGenerate(text, type, format, null, null, null, null, null, function(responseMessage) {
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