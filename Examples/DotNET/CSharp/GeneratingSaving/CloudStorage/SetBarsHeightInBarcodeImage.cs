using System;
using Com.Aspose.Barcode.Api;
using Com.Aspose.Barcode.Model;
using Com.Aspose.Storage.Api;

namespace CSharp.GeneratingSaving.CloudStorage
{
    class SetBarsHeightInBarcodeImage
    {
        public static void Run()
        {

            // ExStart:1
            // Instantiate Aspose Storage Cloud API SDK
            StorageApi storageApi = new StorageApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            // Instantiate Aspose BarCode Cloud API SDK
            BarcodeApi barcodeApi = new BarcodeApi(Common.APP_KEY, Common.APP_SID, Common.BASEPATH);

            // Set the barcode file name created on server.
            String name = "sample-barcode";

            // Set Text to encode inside barcode.
            String text = "AsposeBarCode";

            // Set Barcode Symbology
            String type = "QR";

            // Set Generated Barcode Image Format
            String format = "png";

            // Set Resolution along X and Y in dpi.
            float? resolutionX = 0.0f;
            float? resolutionY = 0.0f;

            // Set Width and Height of barcode unit
            float? dimensionX = 0.0f;
            float? dimensionY = 0.0f;

            // Set Location, Measurement  of the code
            String codeLocation = "Above";
            String grUnit = "mm";

            // Sets if barcode's size will be updated automatically
            String autoSize = "true";

            // Height of the bar.
            float? barHeight = 150.0f;

            // Set height, Width and quality of the image.
            float? imageHeight = 0.0f;
            float? imageWidth = 0.0f;
            String imageQuality = "default";

            // Set Angle of barcode orientation
            float? rotAngle = null;

            // Set Margin of image border
            float? topMargin = 0.0f;
            float? bottomMargin = 0.0f;
            float? leftMargin = 0.0f;
            float? rightMargin = 0.0f;

            // Sets if checksum will be added to barcode image.
            String enableChecksum = "Yes";

            // Set 3rd party cloud storage server (if any)
            String storage = "";
            String folder = "";

            // Set local file (if any)
            byte[] file = null;

            try
            {
                // Invoke Aspose.BarCode Cloud SDK API to generate image with specific bars height
                SaaSposeResponse apiResponse = barcodeApi.PutBarcodeGenerateFile(name, text, type, format, resolutionX, resolutionY, dimensionX, dimensionY, codeLocation, grUnit, autoSize, barHeight, imageHeight, imageWidth, imageQuality, rotAngle, topMargin, bottomMargin, leftMargin, rightMargin, enableChecksum, storage, folder, file);
                if (apiResponse != null)
                {
                    // Download generated barcode from cloud storage
                    Com.Aspose.Storage.Model.ResponseMessage storageRes = storageApi.GetDownload(name, null, null);

                    // Save response stream to a file 
                    System.IO.File.WriteAllBytes(Common.OUTFOLDER + name + "." + format, storageRes.ResponseStream);
                    Console.WriteLine("Set Height of the Bars in the Barcode Image, Done!");
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
