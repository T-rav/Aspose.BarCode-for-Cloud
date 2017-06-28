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
$AsposeStorageCloud::Configuration::app_sid = $AsposeBarCodeCloud::Configuration::app_sid;
$AsposeStorageCloud::Configuration::api_key = $AsposeBarCodeCloud::Configuration::api_key;

# Instantiate Aspose.Storage API SDK 
my $storageApi = AsposeStorageCloud::StorageApi->new();

# Instantiate Aspose.BarCode API SDK
my $barcodeApi = AsposeBarCodeCloud::BarcodeApi->new();

my $name = 'barcode.png';
my $file = 'sample.txt';

# Upload file to aspose cloud storage 
my $response = $storageApi->PutCreate(Path => $name, file => $data_path.$name);

# Invoke Aspose.BarCode Cloud SDK API to generate image with multiple barcodes                                                          
$response = $barcodeApi->PutGenerateMultiple(name => $name, file => $data_path.$file);
#ExEnd:1