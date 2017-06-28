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

var name = "barcode.png";
var file = "sample.txt";

try {
// Upload source file to aspose cloud storage
	storageApi.PutCreate(name  , null, null, data_path + name  , function(responseMessage) {
		assert.equal(responseMessage.status, 'OK');

	// Invoke Aspose.BarCode Cloud SDK API to generate image with multiple barcodes        
	barcodeApi.PutGenerateMultiple(name, null, null, data_path + file, function(responseMessage) {
			assert.equal(responseMessage.status, 'OK');
			// Download generated barcode from storage server
			storageApi.GetDownload(name, null, null, function(responseMessage) {
				assert.equal(responseMessage.status, 'OK');
				
				var writeStream = fs.createWriteStream(outFolder + "generateimagewithmultiplebarcodes.png");
				writeStream.write(responseMessage.body);
				});      
			});
});


}catch (e) {
  console.log("exception in example");
  console.log(e);
}
//ExEnd:1