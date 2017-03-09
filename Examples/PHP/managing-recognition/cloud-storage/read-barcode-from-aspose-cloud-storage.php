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

	public function readBarcodeFromAsposeCloudStorage() {

		// Set input file name
		$name = "sample-barcode.jpeg";

		// The barcode type.
		// If this parameter is empty, autodetection of all supported types is used.
		$type = "";

		// Set mode for checksum validation during recognition
		$checksumValidation = "";

		// Set if FNC symbol stripping should be performed.
		$stripFnc = "";

		// Set recognition of rotated barcode
		$rotationAngle = "";

		// Set exact number of barcodes to recognize
		$barcodesCount = "";

		// Set recognition of barcode inside specified Rectangle region
		$rectX = "";
		$rectY = "";
		$rectWidth = "";
		$rectHeight = "";

		// Set 3rd party cloud storage server (if any)
		$storage = "";

		// Set folder location at cloud storage
		$folder = "";

		// Set local file (if any)
		$file = null;

		// Upload file to Aspose Cloud Storage
		Utils::uploadFile($name);
		
		// invoke Aspose.BarCode Cloud SDK API to read barcode from Aspose Cloud Storage
		$response = $this->barcodeApi->GetBarcodeRecognize ( $name, $type, $checksumValidation, $stripFnc, $rotationAngle, $barcodesCount, $rectX, $rectY, $rectWidth, $rectHeight, $storage, $folder );
		print_r ( $response );
	}
}

$recognizeBarcode = new RecognizeBarcode();
$recognizeBarcode->readBarcodeFromAsposeCloudStorage();

?>