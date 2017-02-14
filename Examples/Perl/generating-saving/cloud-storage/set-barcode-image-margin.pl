use lib 'lib';
use strict;
use warnings;
use utf8;
use File::Slurp; # From CPAN
use JSON;

use AsposeStorageCloud::StorageApi;
use AsposeStorageCloud::ApiClient;
use AsposeStorageCloud::Configuration;

use AsposeBarCodeCloud::BarcodeApi;
use AsposeBarCodeCloud::ApiClient;
use AsposeBarCodeCloud::Configuration;

my $configFile = '../../config/config.json';
my $configPropsText = read_file($configFile);
my $configProps = decode_json($configPropsText);

my $data_path = '../../../../Data/';
my $out_path = $configProps->{'out_folder'};;

#ExStart:1
$AsposeBarCodeCloud::Configuration::app_sid = $configProps->{'app_sid'};
$AsposeBarCodeCloud::Configuration::api_key = $configProps->{'api_key'};
$AsposeBarCodeCloud::Configuration::debug = 1;
$AsposeStorageCloud::Configuration::app_sid = $AsposeBarCodeCloud::Configuration::app_sid;
$AsposeStorageCloud::Configuration::api_key = $AsposeBarCodeCloud::Configuration::api_key;

# Instantiate Aspose.Storage API SDK 
my $storageApi = AsposeStorageCloud::StorageApi->new();

# Instantiate Aspose.BarCode API SDK
my $barcodeApi = AsposeBarCodeCloud::BarcodeApi->new();

# Set the barcode file name created on server
my $name = 'sample-barcode.png';

# Set Text to encode inside barcode
my $text = 'Aspose.BarCode for Cloud';

# Set Barcode Symbology
my $type = 'Code128';

# Set Generated Barcode Image Format
my $format = 'PNG';

# Set Margin of image border
my $topMargin = 2.0;
my $bottomMargin = 2.0;
my $leftMargin = 2.0;
my $rightMargin = 2.0;

# Upload file to aspose cloud storage 
my $response = $storageApi->PutCreate(Path => $name, file => $data_path.$name);

# Invoke Aspose.BarCode Cloud SDK API to generate image with specific image margins                                                           
$response = $barcodeApi->PutBarcodeGenerateFile(name => $name, text => $text, type => $type, format => $format,
	topMargin => $topMargin, bottomMargin => $bottomMargin, leftMargin => $leftMargin, rightMargin => $rightMargin);

if($response->{'Status'} eq 'OK'){
	# Download barcode from cloud storage
	my $output_file = $out_path . $name . '.' . $format;
	$response = $storageApi->GetDownload(Path => $name);
	write_file($output_file, { binmode => ":raw" }, $response->{'Content'});
}
#ExEnd:1