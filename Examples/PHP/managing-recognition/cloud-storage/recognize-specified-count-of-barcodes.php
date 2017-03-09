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

	public function recognizeSpecifiedCountOfBarcodes() {

		// Set input file name
		$name = "sample-barcode.jpeg";

		// The barcode type.
		// If this parameter is empty, autodetection of all supported types is used.
		$type = "";

		// Set mode for checksum validation during recognition
		$checksumValidation = "On";

		// Set if FNC symbol stripping should be performed.
		$stripFnc = "True";

		// Set recognition of rotated barcode
		$rotationAngle = "";

		// Set exact number of barcodes to recognize
		$barcodesCount = "1";

		// Set recognition of barcode inside specified Rectangle region
		$rectX = 0;
		$rectY = 0;
		$rectWidth = 0;
		$rectHeight = 0;

		// Set 3rd party cloud storage server (if any)
		$storage = "";

		// Set folder location at cloud storage
		$folder = "";

		// Set local file (if any)
		$file = null;

		// upload file to aspose cloud storage
		Utils::uploadFile($name);

		// invoke Aspose.BarCode Cloud SDK API to read barcode
		$response = $this->barcodeApi->GetBarcodeRecognize ( $name, $type, $checksumValidation, $stripFnc, $rotationAngle, $barcodesCount, $rectX, $rectY, $rectWidth, $rectHeight, $storage, $folder );
		print_r ( $response );
	}
}

$recognizeBarcode = new RecognizeBarcode();
$recognizeBarcode->recognizeSpecifiedCountOfBarcodes();
?>