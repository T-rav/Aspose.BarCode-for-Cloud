using System;
using Com.Aspose.Barcode.Api;
using Com.Aspose.Barcode.Model;
using Com.Aspose.Storage.Api;

namespace CSharp.GeneratingSaving.CloudStorage
{
    class GenerateMultipleBarCodes
    {
        public static void Run()
        {

            // ExStart:1
            // Instantiate Aspose BarCode Cloud API SDK
            BarcodeApi barcodeApi = new BarcodeApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            string format = "png";
            BarcodeBuilders body = new BarcodeBuilders();

            BarcodeBuilder barcodeBuilder1 = new BarcodeBuilder();
            barcodeBuilder1.TypeOfBarcode = "qr";
            barcodeBuilder1.Text = "The Latest barcode";

            BarcodeBuilder barcodeBuilder2 = new BarcodeBuilder();
            barcodeBuilder2.TypeOfBarcode = "qr";
            barcodeBuilder2.Text = "The Latest barcode";

            body.BarcodeBuilderList = new System.Collections.Generic.List<BarcodeBuilder> { barcodeBuilder1, barcodeBuilder2 };

            try
            {
                // Invoke Aspose.BarCode Cloud SDK API to generate multiple barcodes
                ResponseMessage apiResponse = barcodeApi.PostGenerateMultiple(format, body);
                if ((apiResponse != null) && (apiResponse.Status == "Ok"))
                {                   
                    Console.WriteLine("Generate Multiple BarCodes, Done!");
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("error:" + ex.Message + "\n" + ex.StackTrace);
            }
            // ExEnd:1
        }
    }
}
