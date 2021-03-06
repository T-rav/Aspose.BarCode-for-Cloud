<?php

require_once realpath(__DIR__) . '/Utils.php';

use Aspose\Barcode\BarcodeApi;
use Aspose\Barcode\AsposeApp;

class BarcodeApiTest extends PHPUnit_Framework_TestCase {

    protected $barcode;

    protected function setUp()
    {        
        AsposeApp::$appSID = Utils::appSID;
        AsposeApp::$apiKey = Utils::apiKey;
        $this->barcode = new BarcodeApi();
    }
    
    public function testGetBarcodeGenerate()
    {
        $text = "BarcodeTextHere";
        $type = "1";
        $format = "jpeg";
        $resolutionX = 0.0;
        $resolutionY = 0.0;
        $dimensionX = 0.0;
        $dimensionY = 0.0;		
        $enableChecksum = "";
	       
        $result = $this->barcode->GetBarcodeGenerate($text, $type, $format, $resolutionX, $resolutionY, $dimensionX, $dimensionY, $enableChecksum);
	    $this->assertInternalType('string',$result );
    }

    public function testGenerateACodablockFTypeBarcode()
    {
        $text = "(01)23456789012";
        $type = "codablockF";
        $format = "jpg";
           
        $result = $this->barcode->GetBarcodeGenerate($text, $type, $format, $resolutionX = null, $resolutionY = null, $dimensionX = null, $dimensionY = null, $enableChecksum = null);
        $fh = fopen(realpath(__DIR__ . '/../../../../..') . '/Data/Output/barcode_out.jpg', 'w');
        fwrite($fh, $result);
        fclose($fh);
        $this->assertFileExists(realpath(__DIR__ . '/../../../../..') . '/Data/Output/barcode_out.jpg');
    }
             
    public function testGetBarcodeRecognize()
    {  
        $name = 'barcode.png';
        $type = 'Code39Standard';

	    Utils::uploadFile($name);
        $result = $this->barcode->GetBarcodeRecognize($name, $type, $checksumValidation = null, $stripFnc = null, $rotationAngle = null, $barcodesCount = null, $rectX = null, $rectY = null, $rectWidth = null, $rectHeight = null, $storage = null, $folder = null);
        $this->assertInternalType('array', $result->Barcode);
	    $this->assertInstanceOf('\Aspose\Barcode\Models\BarcodeResponseList', $result);
    }
    
    public function testPostBarcodeRecognizeFromUrlorContent()
    {  
        $file = 'barcode-swagger.png';
        $url = "http://upload.wikimedia.org/wikipedia/commons/thumb/0/0b/Code_3_of_9.svg/262px-Code_3_of_9.svg.png";
        $result = $this->barcode->PostBarcodeRecognizeFromUrlorContent($type = 'Code39Standard', $checksumValidation = null, $stripFnc = null, $rotationAngle = null, $url, $file);
	    $this->assertInstanceOf('\Aspose\Barcode\Models\BarcodeResponseList', $result);
        $this->assertInternalType('array', $result->Barcode);
    }
    
    public function testPostBarcodeRecognizeFromRequestBody()
    {  
        $fileName = 'barcode.png';
        $file = realpath(__DIR__ . '/../../../../..') . '/Data/' . $fileName;

        $type = 'Code39Standard';
        $checksumValidation = "";
        $stripFnc = false;
        $rotationAngle = 0;

        $result = $this->barcode->PostBarcodeRecognizeFromUrlorContent($type, $checksumValidation, $stripFnc, $rotationAngle, $url = null, $file);
        $this->assertInstanceOf('\Aspose\Barcode\Models\BarcodeResponseList', $result);
    }

    public function testPutBarcodeGenerateFile()
    {
        $name = 'barcode-generate.png';
        $text = 'BarcodeText';
        $type = '1';
        $format = 'png';
        $resolutionX = 0.0;
        $resolutionY = 0.0;
        $dimensionX = 0.0;
        $dimensionY = 0.0;
        $codeLocation = "";
        $grUnit = "";
        $autoSize = "";
        $barHeight = 0.0;
        $imageHeight = 0.0;
        $imageWidth = 0.0;
        $imageQuality = "";
        $rotAngle = 0.0;
        $topMargin = 0.0;
        $bottomMargin = 0.0;
        $leftMargin = 0.0;
        $rightMargin = 0.0;
        $enableChecksum = "";
        $storage = "";
        $folder = "";        
        $file = "";
        $result = $this->barcode->PutBarcodeGenerateFile($name, $text, $type, $format, 
                                    $resolutionX, $resolutionY, $dimensionX, $dimensionY, 
                                    $codeLocation, $grUnit, $autoSize, $barHeight, 
                                    $imageHeight, $imageWidth, $imageQuality, $rotAngle, 
                                    $topMargin, $bottomMargin, $leftMargin, $rightMargin, 
                                    $enableChecksum, $storage, $folder, $file);
	    $this->assertInstanceOf('\Aspose\Barcode\Models\SaaSposeResponse', $result);
        $this->assertEquals(200, $result->Code);
    }
    
    public function testPutBarcodeRecognizeFromBody()
    {
        $name = "barcode.png";
        $type = "1";
        $folder = "";
        $body = '{
                    "ChecksumValidation": "Default",
                    "StripFNC": true
                  }';
	
	    Utils::uploadFile($name);
        $result = $this->barcode->PutBarcodeRecognizeFromBody($name, $type, $folder, $body);
	    $this->assertInstanceOf('\Aspose\Barcode\Models\BarcodeResponseList', $result);
        $this->assertEquals(200, $result->Code);
    }
    
    //PostGenerateMultiple
    public function testPostGenerateMultiple()
    {
        $format = "png";
        $body =  '{"XStep":1,"YStep":2,"BarcodeBuilders":[{"TypeOfBarcode":"qr","Text":"The new qr","AutoSize":true}]}';
    	//$result = $this->barcode->PostGenerateMultiple($format, $body);
        //$this->assertEquals(200, $result->Code);
    }
    
    //PutGenerateMultiple
    public function testPutGenerateMultiple()
    {
        $name = "newfile.jpg";
        $format = "";
        $folder = "";
        $file =  realpath(__DIR__ . '/../../../../..'). '/Data/sample.txt';
	
	   $result = $this->barcode->PutGenerateMultiple($name, $format, $folder, $file);
	   $this->assertInstanceOf('\Aspose\Barcode\Models\SaaSposeResponse', $result);
	   $this->assertEquals(200, $result->Code);
    }
        
}    
