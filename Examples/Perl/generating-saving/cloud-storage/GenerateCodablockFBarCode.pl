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
my $out_path = $configProps->{'out_folder'};

#ExStart:1
$AsposeBarCodeCloud::Configuration::app_sid = $configProps->{'app_sid'};
$AsposeBarCodeCloud::Configuration::api_key = $configProps->{'api_key'};
$AsposeBarCodeCloud::Configuration::debug = 1;

$AsposeStorageCloud::Configuration::app_sid = $configProps->{'app_sid'};
$AsposeStorageCloud::Configuration::api_key = $configProps->{'api_key'};
$AsposeStorageCloud::Configuration::debug = 1;

# Instantiate Aspose.Storage API SDK 
my $storageApi = AsposeStorageCloud::StorageApi->new();

# Instantiate Aspose.BarCode API SDK
my $barcodeApi = AsposeBarCodeCloud::BarcodeApi->new();

# Set Filename of image
my $name = 'codablockF.jpg';

# Set Text to encode inside barcode
my $text = '(01)23456789012';

# Set Barcode Symbology
my $type = 'codablockF';

# Set Barcode Image Format
my $format = 'jpg';

# Invoke Aspose.BarCode Cloud SDK API to create codablockF barcode and put in cloud storage                   
my $response = $barcodeApi->PutBarcodeGenerateFile(name => $name, text => $text, type => $type, format => $format);

if($response->{'Status'} eq 'OK'){
	# Download barcode from cloud storage
	my $output_file = $out_path. $name . '.' . $format;
	$response = $storageApi->GetDownload(Path => $name);
	write_file($output_file, { binmode => ":raw" }, $response->{'Content'});
}
#ExEnd:1