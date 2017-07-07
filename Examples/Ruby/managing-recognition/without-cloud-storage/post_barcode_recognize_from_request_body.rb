#ExStart:
require 'aspose_barcode_cloud'

class RecognizeBarcode

  include AsposeBarcodeCloud
  include AsposeStorageCloud

  def initialize
    #Get App key and App SID from https://cloud.aspose.com
    AsposeApp.app_key_and_sid("", "")
    @barcode_api = BarcodeApi.new
  end
  
  # Read Barcode from Request Body.
  def post_barcode_recognize_from_request_body
      file_name = "barcode.png"
      opts = {type: "Code39Standard", checksumValidation: "", stripFnc: false, rotationAngle: 0, file: File.open("../../../../data/" << file_name,"r") { |io| io.read }}
      response = @barcode_api.post_barcode_recognize_from_urlor_content(opts)
  end

end

recognizeBarcode = RecognizeBarcode.new()
puts recognizeBarcode.post_barcode_recognize_from_request_body
#ExEnd:
