//ExStart:
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

	public function readBarcodeFromExternalImageURL() {

		// Set the image file url
		$url = "http://i.imgur.com/khXftYq.png";

		// The barcode type.
		// If this parameter is empty, autodetection of all supported types is used.
		$type = "";

		// Set mode for checksum validation during recognition
		$checksumValidation = "";

		// Set if FNC symbol stripping should be performed.
		$stripFnc = false;

		// Set recognition of rotated barcode
		$rotationAngle = 0;

		// Set exact number of barcodes to recognize
		$barcodesCount = 0;

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
		$file = "empty.fle";

		// invoke Aspose.BarCode Cloud SDK API to read barcode from external image URL
		$response = $this->barcodeApi->PostBarcodeRecognizeFromUrlorContent ( $type, $checksumValidation, $stripFnc, $rotationAngle, $url, $file );
		print_r ( $response );	
	}
}

$recognizeBarcode = new RecognizeBarcode();
$recognizeBarcode->readBarcodeFromExternalImageURL();

?>
//ExEnd: