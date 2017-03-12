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

	public function rotateBarcodeImageWithSuitableAngle() {
		// Set the barcode file name created on server.
		$name = "sample-barcode";

		// Set Text to encode inside barcode
		$text = "Aspose.BarCode";

		// Set Barcode Symbology
		$type = "Code128";

		// Set Generated Barcode Image Format
		$format = "PNG";

		// Set Resolution along X and Y in dpi
		$resolutionX = "0.0";
		$resolutionY = "0.0";

		// Set Width and Height of barcode unit
		$dimensionX = "0.0";
		$dimensionY = "0.0";

		// Set Location, Measurement of the code
		$codeLocation = "Above";
		$grUnit = "mm";

		// Set if barcode's size will be updated automatically
		$autoSize = "true";

		// Height of the bar.
		$barHeight = "0.0";

		// Set height, Width and quality of the image.
		$imageHeight = "0.0";
		$imageWidth = "0.0";
		$imageQuality = "default";

		// Set Angle of barcode orientation
		$rotAngle = "90.0";

		// Set Margin of image border
		$topMargin = "0.0";
		$bottomMargin = "0.0";
		$leftMargin = "0.0";
		$rightMargin = "0.0";

		// Sets if checksum will be added to barcode image.
		$enableChecksum = "Yes";

		// Set 3rd party cloud storage server (if any)
		$storage = "";

		// Set folder location at cloud storage
		$folder = "";

		// Set local file (if any)
		$file = null;

		// invoke Aspose.BarCode Cloud SDK API to generate and rotate barcode image with suitable angle
		$response = $this->barcodeApi->PutBarcodeGenerateFile ( $name, $text, $type, $format, $resolutionX, $resolutionY, $dimensionX, $dimensionY, $codeLocation, $grUnit, $autoSize, $barHeight, $imageHeight, $imageWidth, $imageQuality, $rotAngle, $topMargin, $bottomMargin, $leftMargin, $rightMargin, $enableChecksum, $storage, $folder, $file );
		print_r ( $response );
	}
}

$generateBarcode = new GenerateBarcode();
$generateBarcode->rotateBarcodeImageWithSuitableAngle();

?>
//ExEnd: