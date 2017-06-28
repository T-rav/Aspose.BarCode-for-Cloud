var fs = require('fs');
var assert = require('assert');
var BarcodeApi = require('asposebarcodecloud');

var configProps = require('../../Config/config.json');
var data_path = '../../../../data/';

var AppSID = configProps.app_sid;
var AppKey = configProps.api_key;
var outFolder = configProps.out_folder;

// ExStart:1
var config = {'appSid':AppSID,'apiKey':AppKey , 'debug' : true};

// Instantiate Aspose.BarCode API SDK
var barcodeApi = new BarcodeApi(config);

var format = "png";
var body =
{
 'BarcodeBuilders': 
  [
	{
		'TypeOfBarcode' : 'qr',
		'Text': 'NewBarCode'
	},
	{
		'TypeOfBarcode' : 'qr',
		'Text': 'Aspose'
	}   
 ],
	'XStep' : 10,
	'YStep' : 10
};

try {
	// Invoke Aspose.BarCode Cloud SDK API to generate to generate multiple barcodes        
	barcodeApi.PostGenerateMultiple(format, body, function(responseMessage) {
				console.log (responseMessage.status);
			});

}catch (e) {
  console.log("exception in example");
  console.log(e);
}
//ExEnd:1