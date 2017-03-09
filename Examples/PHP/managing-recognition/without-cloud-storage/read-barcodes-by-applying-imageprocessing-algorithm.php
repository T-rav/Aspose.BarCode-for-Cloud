<?php
require_once realpath(__DIR__ . '/../..') . '/vendor/autoload.php';
require_once realpath(__DIR__ . '/../..') . '/Utils.php';

use Aspose\Barcode\BarcodeApi;
use Aspose\Barcode\AsposeApp;

class RecognizeBarcode {

	public $barcodeApi;

	public function __construct() {
		AsposeApp::$appSID = Utils::appSID;
		AsposeApp::$apiKey = Utils::apiKey;
		$this->barcodeApi = new BarcodeApi();
	}

	public function readBarcodesByApplyingImageProcessingAlgorithm() {

		// Set input file name
		$name = "sample-barcode.jpeg";

		// The barcode type.
		// If this parameter is empty, autodetection of all supported types is used.
		$type = "";

		// Set BarcodeReader object with special mode of barcode binarization
		$body = array (
				"StripFNC" => true,
				"ChecksumValidation" => "OFF",
				"BinarizationHints" => "ComplexBackground" 
		);

		// Set folder location at cloud storage
		$folder = "";

		// Upload file to Aspose Cloud Storage
		Utils::uploadFile($name);

		// invoke Aspose.BarCode Cloud SDK API to recognition of a barcode from file on server with parameters in body
		$response = $this->barcodeApi->PutBarcodeRecognizeFromBody ($name, $type, $folder, $body);
		print_r($response);	
	}
}

$recognizeBarcode = new RecognizeBarcode();
$recognizeBarcode->readBarcodesByApplyingImageProcessingAlgorithm();

?>