using System;
using Com.Aspose.Barcode.Api;
using Com.Aspose.Barcode.Model;
using Com.Aspose.Storage.Api;

namespace CSharp.GeneratingSaving.CloudStorage
{
    class GenerateCodablockFBarCode
    {
        public static void Run()
        {

            // ExStart:1
            // Instantiate Aspose BarCode Cloud API SDK
            BarcodeApi barcodeApi = new BarcodeApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            string text = "(01)23456789012";
            string type = "codablockF";
            string format = "jpg";
            float? resolutionX = null;
            float? resolutionY = null;
            float? dimensionX = null;
            float? dimensionY = null;
            string enableChecksum = "";            

            try
            {
                // Invoke Aspose.BarCode Cloud SDK API to generate CodablockF type BarCode
                ResponseMessage apiResponse = barcodeApi.GetBarcodeGenerate(text, type, format, resolutionX, resolutionY, dimensionX, dimensionY, enableChecksum);
                if ((apiResponse != null) && (apiResponse.Status == "Ok"))
                {
                    Console.WriteLine("Generate CodablockF type BarCode, Done!");
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
