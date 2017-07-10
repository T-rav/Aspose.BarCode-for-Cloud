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

	public function generateACodablockFTypeBarcode() {

		$text = "(01)23456789012";
        $type = "codablockF";
        $format = "jpg";
           
        $result = $this->barcode->GetBarcodeGenerate($text, $type, $format, $resolutionX = null, $resolutionY = null, $dimensionX = null, $dimensionY = null, $enableChecksum = null);
        $fh = fopen(realpath(__DIR__ . '/../../../..') . '/Data/Output/barcode_out.jpg', 'w');
        fwrite($fh, $result);
        fclose($fh);
	}
}

$generateBarcode = new GenerateBarcode();
$generateBarcode->generateACodablockFTypeBarcode();

?>
//ExEnd: