using System;
using Com.Aspose.Barcode.Api;
using Com.Aspose.Barcode.Model;
using Com.Aspose.Storage.Api;

namespace CSharp.GeneratingSaving.CloudStorage
{
    class GenerateImageWithMultipleBarCodes
    {
        public static void Run()
        {

            // ExStart:1
            // Instantiate Aspose Storage Cloud API SDK
            StorageApi storageApi = new StorageApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            // Instantiate Aspose BarCode Cloud API SDK
            BarcodeApi barcodeApi = new BarcodeApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            string name = "barcode.png";
            string format = "";
            string folder = "";
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
                // Upload source file to aspose cloud storage
                storageApi.PutCreate(name, "", "", System.IO.File.ReadAllBytes(Common.GetDataDir() + name));

                // Invoke Aspose.BarCode Cloud SDK API to generate image with multiple barcodes
                SaaSposeResponse apiResponse = barcodeApi.PutGenerateMultiple(name, format, folder, body);                
               
                if ((apiResponse != null) && (apiResponse.Status == "OK"))
                {
                    // Download generated barcode from cloud storage
                    Com.Aspose.Storage.Model.ResponseMessage storageRes = storageApi.GetDownload(name, null, null);

                    // Save response stream to a file 
                    System.IO.File.WriteAllBytes(Common.OUTFOLDER + name , storageRes.ResponseStream);
                    Console.WriteLine("Generate Image with Multiple BarCodes, Done!");
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
