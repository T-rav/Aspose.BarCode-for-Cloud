use lib 'lib';
use strict;
use warnings;
use utf8;
use File::Slurp; # From CPAN
use JSON;
use AsposeBarCodeCloud::BarcodeApi;
use AsposeBarCodeCloud::ApiClient;
use AsposeBarCodeCloud::Configuration;
use AsposeBarCodeCloud::Object::BarcodeBuilder;
use AsposeBarCodeCloud::Object::BarcodeBuildersList;

my $configFile = '../../config/config.json';
my $configPropsText = read_file($configFile);
my $configProps = decode_json($configPropsText);

my $data_path = '../../../../Data/';
my $out_path = $configProps->{'out_folder'};

#ExStart:1
$AsposeBarCodeCloud::Configuration::app_sid = $configProps->{'app_sid'};
$AsposeBarCodeCloud::Configuration::api_key = $configProps->{'api_key'};
$AsposeBarCodeCloud::Configuration::debug = 1;

# Instantiate Aspose.BarCode API SDK
my $barcodeApi = AsposeBarCodeCloud::BarcodeApi->new();

my $format = 'png';
my @bar1 = AsposeBarCodeCloud::Object::BarcodeBuilder->new('TypeOfBarcode' => 'qr', 'Text' => 'NewBarCode');
my @bar2 = AsposeBarCodeCloud::Object::BarcodeBuilder->new('TypeOfBarcode' => 'qr', 'Text' => 'Aspose');
my @barbuilders = AsposeBarCodeCloud::Object::BarcodeBuildersList->new('BarcodeBuilders' => [@bar1, @bar2], 'XStep' => 10, 'YStep' => 10);

# Invoke Aspose.BarCode Cloud SDK API to generate multiple barcodes                                                          
my $response = $barcodeApi->PostGenerateMultiple(format => $format, body=>@barbuilders);
#ExEnd:1