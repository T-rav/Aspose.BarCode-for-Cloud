#ExStart:
require 'aspose_barcode_cloud'

class GenerateBarcode

  include AsposeBarcodeCloud
  include AsposeStorageCloud

  def initialize
    #Get App key and App SID from https://cloud.aspose.com
    AsposeApp.app_key_and_sid("", "")
    @barcode_api = BarcodeApi.new
  end

  def upload_file(file_name)
    @storage_api = StorageApi.new 
    response = @storage_api.put_create(file_name, File.open("../../../data/" << file_name,"r") { |io| io.read } )
  end

  # Set/create document property.
  def generate_a_codablockf_type_barcode
      opts = {text: "(01)23456789012", type: "codablockF", format: "jpg"}
      response = @barcode_api.get_barcode_generate(opts)
  end

end

generateBarcode = GenerateBarcode.new()
puts generateBarcode.generate_a_codablockf_type_barcode
#ExEnd:
