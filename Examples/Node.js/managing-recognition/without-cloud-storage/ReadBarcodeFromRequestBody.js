var fs = require('fs');
var assert = require('assert');
var BarcodeApi = require('asposebarcodecloud');
var StorageApi = require('asposestoragecloud');

var configProps = require('../../Config/config.json');
var data_path = '../../../../Data/';

var AppSID = configProps.app_sid;
var AppKey = configProps.api_key;
var outFolder = configProps.out_folder;

// ExStart:1
var config = {'appSid':AppSID,'apiKey':AppKey , 'debug' : true};

// Instantiate Aspose Storage API SDK
var storageApi = new StorageApi(config);

// Instantiate Aspose.BarCode API SDK
var barcodeApi = new BarcodeApi(config);

// Set the barcode type
var type = "Code39Standard";

// Set request body. Request body can contain raw data bytes of the image or encoded with base64 
var body = "iVBORw0KGgoAAAANSUhEUgAAAH0AAABOCAYAAAANbhkmAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAmpSURBVHhe7ZeBcVRJEkQxD4MwB1/WFTzR8UQnPFLTv5naf7F7J72IiqzM7JaaGbiN+/Tywbvj40t/h3x86e+Qjy/9HfK3v/RPn378iGjA39k5h6vdHpydFNgz9r1DfGfRzt2ZPhfNBHdT5jcXu0fg7+ycw9VuD85OCuwZ+94hvrNo5+5Mn4tmgrsp85uL" + 
                "3SPwd3bO4Wq3B2cnBfaMfe8Q31m0c3emz0Uzwd2U+c3F7hH4OzvncLXbg7OTAnvGvneI7yzauTvT" + 
                "56KZ4G7K/OZi9wj8nZ1zuNrtwdlJgT1j3zvEdxbt3J3pc9FMcDdlfnOxewT+zs45XO324OykwJ6x" + 
                "7x3iO4t27s70uWgmuJsyv7nYPQJ/Z+ccrnZ7cHZSYM/Y9w7xnUU7d2f6XDQT3E2Z31zsHoG/s3MO" + 
                "V7s9ODspsGfse4f4zqKduzN9LpoJ7qbMby52j8Df2TmHq90enJ0U2DP2vUN8Z9HO3Zk+F80Ed1Pm" + 
                "Nxe7R+Dv7JzD1W4Pzk4K7Bn73iG+s2jn7kyfi2aCuynzm4vdI/B3ds7harcHZycF9ox97xDfWbRz" + 
                "d6bPRTPB3ZT5zcXuEfg7O+dwtduDs5MCe8a+d4jvLNq5O9Pnopngbsr85mL3CPydnXO42u3B2UmB" + 
                "PWPfO8R3Fu3cnelz0UxwN2V+c7F7BP7Ozjlc7fbg7KTAnrHvHeI7i3buzvS5aCa4mzK/udg9An9n" + 
                "5xyudntwdlJgz9j3DvGdRTt3Z/pcNBPcTZnfXOwegb+zcw5Xuz04OymwZ+x7h/jOop27M30umgnu" + 
                "psxvLnaPwN/ZOYer3R6cnRTYM/a9Q3xn0c7dmT4XzQR3U+Y3F7tH4O/snMPVbg/OTgrsGfveIb6z" + 
                "aOfuTJ+LZoK7KfObi90j8Hd2zuFqtwdnJwX2jH3vEN9ZtHN3ps9FM8HdlPnNxe4R+Ds753C124Oz" + 
                "kwJ7xr53iO8s2rk70+eimeBuyvzmYvcI/J2dc7ja7cHZSYE9Y987xHcW7dyd6XPRTHA3ZX5zsXsE" + 
                "/s7OOVzt9uDspMCese8d4juLdu7O9LloJribMr+52D0Cf2fnHK52e3B2UmDP2PcO8Z1FO3dn+lw0" + 
                "E9xNmd9c7B6Bv7NzDle7PTg7KbBn7HuH+M6inbszfS6aCe6mzG8udo/A39k5h6vdHpydFNgz9r1D" + 
                "fGfRzt2ZPhfNBHdT5jcXu0fg7+ycw9VuD85OCuwZ+94hvrNo5+5Mn4tmgrsp85uL3SPwd3bO4Wq3" + 
                "B2cnBfaMfe8Q31m0c3emz0Uzwd2U+c3F7hH4OzvncLXbg7OTAnvGvneI7yzauTvT56KZ4G7K/OZi" + 
                "9wj8nZ1zuNrtwdlJgT1j3zvEdxbt3J3pc9FMcDdlfnOxewT+zs45XO324OykwJ6x7x3iO4t27s70" + 
                "uWgmuJsyv7nYPQJ/Z+ccrnZ7cHZSYM/Y9w7xnUU7d2f6XDQT3E2Z31zsHoG/s3MOV7s9ODspsGfs" + 
                "e4f4zqKduzN9LpoJ7qbMby52j8Df2TmHq90enJ0U2DP2vUN8Z9HO3Zk+F80Ed1PmNxe7R+Dv7JzD" + 
                "1W4Pzk4K7Bn73iG+s2jn7kyfi2aCuynzm4vdI/B3ds7harcHZycF9ox97xDfWbRzd6bPRTPB3ZT5" + 
                "zcXuEfg7O+dwtduDs5MCe8a+d4jvLNq5O9Pnopngbsr85mL3CPydnXO42u3B2UmBPWPfO8R3Fu3c" + 
                "nelz0UxwN2V+c7F7BP7Ozjlc7fbg7KTAnrHvHeI7i3buzvS5aCa4mzK/udg9An9n5xyudntwdlJg" + 
                "z9j3DvGdRTt3Z/pcNBPcTZnfXOwegb+zcw5Xuz04OymwZ+x7h/jOop27M30umgnupsxvLnaPwN/Z" + 
                "OYer3R6cnRTYM/a9Q3xn0c7dmT4XzQR3U+Y3F7tH4O/snMPVbg/OTgrsGfveIb6zaOfuTJ+LZoK7" + 
                "KfObi90j8Hd2zuFqtwdnJwX2jH3vEN9ZtHN3ps9FM8HdlPnNxe4R+Ds753C124OzkwJ7xr53iO8s" + 
                "2rk70+eimeBuyvzmYvcI/J2dc7ja7cHZSYE9Y987xHcW7dyd6XPRTHA3ZX5zsXsE/s7OOVzt9uDs" + 
                "pMCese8d4juLdu7O9LloJribMr+52D0Cf2fnHK52e3B2UmDP2PcO8Z1FO3dn+lw0E9xNmd9c7B6B" + 
                "v7NzDle7PTg7KbBn7HuH+M6inbszfS6aCe6mzG8udo/A39k5h6vdHpydFNgz9r1DfGfRzt2ZPhfN" + 
                "BHdT5jcXu0fg7+ycw9VuD85OCuwZ+94hvrNo5+5Mn4tmgrsp85uL3SPwd3bO4Wq3B2cnBfaMfe8Q" + 
                "31m0c3emz0Uzwd2U+c3F7hH4OzvncLXbg7OTAnvGvneI7yzauTvT56KZ4G7K/OZi9wj8nZ1zuNrt" +  
                "wdlJgT1j3zvEdxbt3J3pc9FMcDdlfnOxewT+zs45XO324OykwJ6x7x3iO4t27s70uWgmuJsyv7nY" + 
                "PQJ/Z+ccrnZ7cHZSYM/Y9w7xnUU7d2f6XDQT3E2Z31zsHoG/s3MOV7s9ODspsGfse4f4zqKduzN9" + 
                "LpoJ7qbMby52j8Df2TmHq90enJ0U2DP2vUN8Z9HO3Zk+F80Ed1PmNxe7R+Dv7JzD1W4Pzk4K7Bn7" + 
                "3iG+s2jn7kyfi2aCuynzm4vdI/B3ds7harcHZycF9ox97xDfWbRzd6bPRTPB3ZT5zcUdj/gneM/v" + 
                "/tt/4vf84f0T3PHuP7r57evn11/CfP76baU/ePSI3fln8x98e/n6+cvLX8v98D/OPvdzfocz1vDX" + 
                "l18/m/ny+ounv/P3t/vsz/nxC37yeqYywx3rhPPNb19fPn/Kw/lDfH7xn+3NI3bnn81f+evlCx/M" + 
                "z57j+lBe7/7Jz3nL4w/v8b3Z73z79t+hr+715739i2Aev/s5jjf5A/ffbPt+xO78s/n37fuHyIfy" + 
                "4MP5ya8Pev9zHvP4w/v+uz5//f5Tr/iT33l+O/+L8vv71s/9+uXf96V/f+3lo3bnn81/cfGl8y9jfUnPvvMh+ZeWefQX4KnfuXm7fkb4+bMm736S/90v/fUL+pU/+86HcEc/882/xqd/5+O3v7nnvwST" + 
                "dz/J01/6mwcXu/PP5r948MHVhw/nnzPAX8Dodz760n/95yFw7+f/umT+i1/8+T8Mv/1h+UP8/uA3" + 
                "7M4/m/+kPrgHH/4rz77zAa8f/s8Pmy9n/Usf/856O3Dn0X82wr/hXzr4b+Kf/OvZnX82/8HvH1z/" + 
                "X6pP+qCffecjfvv568Of/84HX/rpS/23fOkf/H/x8aW/Qz6+9HfIx5f+Dvn40t8dLy//AXQHkzvG" + 
                "9DEyAAAAAElFTkSuQmCC"; 


try {
	
	
		// Invoke Aspose.BarCode Cloud SDK API to recognition of a barcode from request body        
		barcodeApi.PostBarcodeRecognizeFromRequestBody (type, null, null, function(responseMessage) {
			assert.equal(responseMessage.status, 'OK');
			responseMessage.body.Barcodes.forEach(function(barcode) {
				console.log("Type :: " + barcode.BarcodeType);
				
			});
		});		
	

}catch (e) {
  console.log("exception in example");
  console.log(e);
}
//ExEnd:1