//ExStart:
<?php
require_once realpath(__DIR__ . '/../..') . '/vendor/autoload.php';
require_once realpath(__DIR__ . '/../..') . '/Utils.php';

use Aspose\Barcode\BarcodeApi;
use Aspose\Barcode\AsposeApp;

class GenerateBarcode {

	public $barcodeApi;

	public function __construct() {
		AsposeApp::$appSID = Utils::appSID;
		AsposeApp::$apiKey = Utils::apiKey;
		$this->barcodeApi = new BarcodeApi();
	}

	public function generateBarcodeAndSaveImageToLocalDisk() {

		// Set Filename of image
		$name = "sample-barcode";

		// Set Text to encode inside barcode
		$text = "Aspose.BarCode";

		// Set Barcode Symbology
		$type = "QR";

		// Set Barcode Image Format
		$format = "PNG";

		// Sets if checksum will be added to barcode image.
		$enableChecksum = null;

		// Set optional params (if any)
		$resolutionX = 96.0;
		$resolutionY = 96.0;
		$dimensionX = 0.7;
		$dimensionY = 2.0;

		// invoke Aspose.BarCode Cloud SDK API to create barcode and get barcode image as a stream
		$response = $this->barcodeApi->GetBarcodeGenerate ( $name, $type, $format, $resolutionX, $resolutionY, $dimensionX, $dimensionY, $enableChecksum );
		if ($response != null) {
			// Save response stream to a file
			$fileName =  realpath(__DIR__ . '/../../../..') . '/Data/Output/' . $name . "." . $format;
			$fh = fopen ( $fileName, 'w' ) or die ( 'cant open file' );
			fwrite ( $fh, $response );
			fclose ( $fh );
		}
	}
}

$generateBarcode = new GenerateBarcode();
$generateBarcode->generateBarcodeAndSaveImageToLocalDisk();

?>
//ExEnd: