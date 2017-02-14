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

# Instantiate Aspose.Storage API SDK 
my $storageApi = AsposeStorageCloud::StorageApi->new();

# Instantiate Aspose.BarCode API SDK
my $barcodeApi = AsposeBarCodeCloud::BarcodeApi->new();

# Set Filename of image
my $name = 'sample-barcode.png';

# Set Text to encode inside barcode
my $text = 'Aspose.BarCode for Cloud';

# Set Barcode Symbology
my $type = 'QR';

# Set Barcode Image Format
my $format = 'PNG';

# Set Resolution along X and Y in dpi
my $resolutionX = 96.0;
my $resolutionY = 96.0;

# Set Width and Height of barcode unit
my $dimensionX = 0.7;
my $dimensionY = 2.0;

# Sets if checksum will be added to barcode image
my $enableChecksum = 'NO';

# Upload file to aspose cloud storage 
my $response = $storageApi->PutCreate(Path => $name, file => $data_path.$name);

# Invoke Aspose.BarCode Cloud SDK API to create barcode and get barcode image as a stream                                   
$response = $barcodeApi->GetBarcodeGenerate(name => $name, text => $text, type => $type, format => $format,
								resolutionX => $resolutionX, resolutionY => $resolutionY, dimensionX => $dimensionX, dimensionY => $dimensionY, enableChecksum => $enableChecksum);

if($response->{'Status'} eq 'OK'){
	# Download barcode from api response
	my $output_file = $out_path . $name . '.' . $format;
	write_file($output_file, { binmode => ":raw" }, $response->{'Content'});
}
#ExEnd:1