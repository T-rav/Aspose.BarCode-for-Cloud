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

	public function postBarcodeRecognizeFromRequestBody() {

		$fileName = 'barcode.png';
        $file = realpath(__DIR__ . '/../../../..') . '/Data/' . $fileName;

        $type = 'Code39Standard';
        $checksumValidation = "";
        $stripFnc = false;
        $rotationAngle = 0;

        $result = $this->barcode->PostBarcodeRecognizeFromUrlorContent($type, $checksumValidation, $stripFnc, $rotationAngle, $url = null, $file);
		print_r($response);	
	}
}

$recognizeBarcode = new RecognizeBarcode();
$recognizeBarcode->postBarcodeRecognizeFromRequestBody();

?>
//ExEnd: