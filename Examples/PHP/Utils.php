<?php
require_once __DIR__ . '/vendor/autoload.php';

use Aspose\Storage\StorageApi;
use Aspose\Storage\AsposeApp;

class Utils {
	# Get App key and App SID from https://cloud.aspose.com
	const appSID = "da77c9f5da014d91faf2961ecec2de66";
	const apiKey = "B01A15E5-1B83-4B9A-8EB3-0F2BFA6AC766";

	public static function uploadFile($fileName) {
		AsposeApp::$appSID = Utils::appSID;
		AsposeApp::$apiKey = Utils::apiKey;

		$storage = new StorageApi();

		$file = realpath(__DIR__ . '/../..') . '/Data/' . $fileName;
        $result = $storage->PutCreate($Path=$fileName, $versionId = null, $storage = null, $file); 
	} 
}

?>