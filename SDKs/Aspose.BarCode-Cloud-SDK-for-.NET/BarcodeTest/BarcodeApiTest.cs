using Com.Aspose.Barcode.Api;
using Com.Aspose.Barcode.Model;
using Com.Aspose.Storage.Api;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace BarcodeTest
{
    
    
    /// <summary>
    ///This is a test class for TestBarcodeApi and is intended
    ///to contain all TestBarcodeApi Unit Tests
    ///</summary>
    [TestClass()]
    public class TestBarcodeApi
    {
        protected string APIKEY = "xxxx";
        protected string APPSID = "xxxx";
        protected string BASEPATH = "http://api.aspose.cloud/v1.1";

        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Additional test attributes
        // 
        //You can use the following additional attributes as you write your tests:
        //
        //Use ClassInitialize to run code before running the first test in the class
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup to run code after all tests in a class have run
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize to run code before running each test
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup to run code after each test has run
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///A test for GetBarcodeGenerate
        ///</summary>
        [TestMethod()]
        public void TestGetBarcodeGenerate()
        {
            BarcodeApi target = new BarcodeApi(APIKEY, APPSID, BASEPATH);
            
            string text = "TestGetBarcodeGenerate";
            string type = "1";
            string format = "jpeg";
            float? resolutionX = null;
            float? resolutionY = null;
            float? dimensionX = null;
            float? dimensionY = null;
            string enableChecksum = "";
            
            ResponseMessage actual;
            actual = target.GetBarcodeGenerate(text, type, format, resolutionX, resolutionY, dimensionX, dimensionY, enableChecksum);

            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new ResponseMessage(), actual.GetType()); 
        }
        /// <summary>
        ///A test for GetBarcodeGenerate
        ///</summary>
        [TestMethod()]
        public void TestGetCodablockFBarcodeGenerate()
        {
            BarcodeApi target = new BarcodeApi(APIKEY, APPSID, BASEPATH);

            string text = "(01)23456789012";
            string type = "codablockF";
            string format = "jpg";
            float? resolutionX = null;
            float? resolutionY = null;
            float? dimensionX = null;
            float? dimensionY = null;
            string enableChecksum = "";

            ResponseMessage actual;
            actual = target.GetBarcodeGenerate(text, type, format, resolutionX, resolutionY, dimensionX, dimensionY, enableChecksum);

            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new ResponseMessage(), actual.GetType());
        }
        /// <summary>
        ///A test for GetBarcodeRecognize
        ///</summary>
        [TestMethod()]
        public void TestGetBarcodeRecognize()
        {
            BarcodeApi target = new BarcodeApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);


            string name = "barcodePng.png";
            string type = "";
            string checksumValidation = "";
            bool? stripFnc = null;
            int? rotationAngle = null;
            int? barcodesCount = null;
            int? rectX = null;
            int? rectY = null;
            int? rectWidth = null;
            int? rectHeight = null;
            string storage = "";
            string folder = "";

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes(Common.GetDataDir() + name)); 
            
            BarcodeResponseList actual;
            actual = target.GetBarcodeRecognize(name, type, checksumValidation, stripFnc, rotationAngle, barcodesCount, rectX, rectY, rectWidth, rectHeight, storage, folder);

            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new BarcodeResponseList(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PostBarcodeRecognizeFromUrlorContent
        ///</summary>
        [TestMethod()]
        public void TestPostBarcodeRecognizeFromUrlorContent()
        {
            BarcodeApi target = new BarcodeApi(APIKEY, APPSID, BASEPATH);

            string type = "ean13";
            string checksumValidation = "";
            bool? stripFnc = false;
            int? rotationAngle = null;
            string url = "http://www.barcoding.com/images/Barcodes/code93.gif";
            byte[] file = null;
            
            BarcodeResponseList actual;
            actual = target.PostBarcodeRecognizeFromUrlorContent(type, checksumValidation, stripFnc, rotationAngle, url, file);
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new BarcodeResponseList(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PostBarcodeRecognizeFromRequestBody
        ///</summary>
        [TestMethod()]
        public void TestPostBarcodeRecognizeFromRequestBody()
        {
            BarcodeApi target = new BarcodeApi(APIKEY, APPSID, BASEPATH);

            string type = "Code39Standard";
            string checksumValidation = "";
            bool? stripFnc = false;
            int? rotationAngle = null;
            string requestbody = @"iVBORw0KGgoAAAANSUhEUgAAAH0AAABOCAYAAAANbhkmAAAAAXNSR0IArs4c6QAAAARnQU1BAACx
                                    jwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAmpSURBVHhe7ZeBcVRJEkQxD4MwB1/WFTzR8UQn
                                    PFLTv5naf7F7J72IiqzM7JaaGbiN+/Tywbvj40t/h3x86e+Qjy/9HfK3v/RPn378iGjA39k5h6vd
                                    HpydFNgz9r1DfGfRzt2ZPhfNBHdT5jcXu0fg7+ycw9VuD85OCuwZ+94hvrNo5+5Mn4tmgrsp85uL
                                    3SPwd3bO4Wq3B2cnBfaMfe8Q31m0c3emz0Uzwd2U+c3F7hH4OzvncLXbg7OTAnvGvneI7yzauTvT
                                    56KZ4G7K/OZi9wj8nZ1zuNrtwdlJgT1j3zvEdxbt3J3pc9FMcDdlfnOxewT+zs45XO324OykwJ6x
                                    7x3iO4t27s70uWgmuJsyv7nYPQJ/Z+ccrnZ7cHZSYM/Y9w7xnUU7d2f6XDQT3E2Z31zsHoG/s3MO
                                    V7s9ODspsGfse4f4zqKduzN9LpoJ7qbMby52j8Df2TmHq90enJ0U2DP2vUN8Z9HO3Zk+F80Ed1Pm
                                    Nxe7R+Dv7JzD1W4Pzk4K7Bn73iG+s2jn7kyfi2aCuynzm4vdI/B3ds7harcHZycF9ox97xDfWbRz
                                    d6bPRTPB3ZT5zcXuEfg7O+dwtduDs5MCe8a+d4jvLNq5O9Pnopngbsr85mL3CPydnXO42u3B2UmB
                                    PWPfO8R3Fu3cnelz0UxwN2V+c7F7BP7Ozjlc7fbg7KTAnrHvHeI7i3buzvS5aCa4mzK/udg9An9n
                                    5xyudntwdlJgz9j3DvGdRTt3Z/pcNBPcTZnfXOwegb+zcw5Xuz04OymwZ+x7h/jOop27M30umgnu
                                    psxvLnaPwN/ZOYer3R6cnRTYM/a9Q3xn0c7dmT4XzQR3U+Y3F7tH4O/snMPVbg/OTgrsGfveIb6z
                                    aOfuTJ+LZoK7KfObi90j8Hd2zuFqtwdnJwX2jH3vEN9ZtHN3ps9FM8HdlPnNxe4R+Ds753C124Oz
                                    kwJ7xr53iO8s2rk70+eimeBuyvzmYvcI/J2dc7ja7cHZSYE9Y987xHcW7dyd6XPRTHA3ZX5zsXsE
                                    /s7OOVzt9uDspMCese8d4juLdu7O9LloJribMr+52D0Cf2fnHK52e3B2UmDP2PcO8Z1FO3dn+lw0
                                    E9xNmd9c7B6Bv7NzDle7PTg7KbBn7HuH+M6inbszfS6aCe6mzG8udo/A39k5h6vdHpydFNgz9r1D
                                    fGfRzt2ZPhfNBHdT5jcXu0fg7+ycw9VuD85OCuwZ+94hvrNo5+5Mn4tmgrsp85uL3SPwd3bO4Wq3
                                    B2cnBfaMfe8Q31m0c3emz0Uzwd2U+c3F7hH4OzvncLXbg7OTAnvGvneI7yzauTvT56KZ4G7K/OZi
                                    9wj8nZ1zuNrtwdlJgT1j3zvEdxbt3J3pc9FMcDdlfnOxewT+zs45XO324OykwJ6x7x3iO4t27s70
                                    uWgmuJsyv7nYPQJ/Z+ccrnZ7cHZSYM/Y9w7xnUU7d2f6XDQT3E2Z31zsHoG/s3MOV7s9ODspsGfs
                                    e4f4zqKduzN9LpoJ7qbMby52j8Df2TmHq90enJ0U2DP2vUN8Z9HO3Zk+F80Ed1PmNxe7R+Dv7JzD
                                    1W4Pzk4K7Bn73iG+s2jn7kyfi2aCuynzm4vdI/B3ds7harcHZycF9ox97xDfWbRzd6bPRTPB3ZT5
                                    zcXuEfg7O+dwtduDs5MCe8a+d4jvLNq5O9Pnopngbsr85mL3CPydnXO42u3B2UmBPWPfO8R3Fu3c
                                    nelz0UxwN2V+c7F7BP7Ozjlc7fbg7KTAnrHvHeI7i3buzvS5aCa4mzK/udg9An9n5xyudntwdlJg
                                    z9j3DvGdRTt3Z/pcNBPcTZnfXOwegb+zcw5Xuz04OymwZ+x7h/jOop27M30umgnupsxvLnaPwN/Z
                                    OYer3R6cnRTYM/a9Q3xn0c7dmT4XzQR3U+Y3F7tH4O/snMPVbg/OTgrsGfveIb6zaOfuTJ+LZoK7
                                    KfObi90j8Hd2zuFqtwdnJwX2jH3vEN9ZtHN3ps9FM8HdlPnNxe4R+Ds753C124OzkwJ7xr53iO8s
                                    2rk70+eimeBuyvzmYvcI/J2dc7ja7cHZSYE9Y987xHcW7dyd6XPRTHA3ZX5zsXsE/s7OOVzt9uDs
                                    pMCese8d4juLdu7O9LloJribMr+52D0Cf2fnHK52e3B2UmDP2PcO8Z1FO3dn+lw0E9xNmd9c7B6B
                                    v7NzDle7PTg7KbBn7HuH+M6inbszfS6aCe6mzG8udo/A39k5h6vdHpydFNgz9r1DfGfRzt2ZPhfN
                                    BHdT5jcXu0fg7+ycw9VuD85OCuwZ+94hvrNo5+5Mn4tmgrsp85uL3SPwd3bO4Wq3B2cnBfaMfe8Q
                                    31m0c3emz0Uzwd2U+c3F7hH4OzvncLXbg7OTAnvGvneI7yzauTvT56KZ4G7K/OZi9wj8nZ1zuNrt
                                    wdlJgT1j3zvEdxbt3J3pc9FMcDdlfnOxewT+zs45XO324OykwJ6x7x3iO4t27s70uWgmuJsyv7nY
                                    PQJ/Z+ccrnZ7cHZSYM/Y9w7xnUU7d2f6XDQT3E2Z31zsHoG/s3MOV7s9ODspsGfse4f4zqKduzN9
                                    LpoJ7qbMby52j8Df2TmHq90enJ0U2DP2vUN8Z9HO3Zk+F80Ed1PmNxe7R+Dv7JzD1W4Pzk4K7Bn7
                                    3iG+s2jn7kyfi2aCuynzm4vdI/B3ds7harcHZycF9ox97xDfWbRzd6bPRTPB3ZT5zcUdj/gneM/v
                                    /tt/4vf84f0T3PHuP7r57evn11/CfP76baU/ePSI3fln8x98e/n6+cvLX8v98D/OPvdzfocz1vDX
                                    l18/m/ny+ounv/P3t/vsz/nxC37yeqYywx3rhPPNb19fPn/Kw/lDfH7xn+3NI3bnn81f+evlCx/M
                                    z57j+lBe7/7Jz3nL4w/v8b3Z73z79t+hr+715739i2Aev/s5jjf5A/ffbPt+xO78s/n37fuHyIfy
                                    4MP5ya8Pev9zHvP4w/v+uz5//f5Tr/iT33l+O/+L8vv71s/9+uXf96V/f+3lo3bnn81/cfGl8y9j
                                    fUnPvvMh+ZeWefQX4KnfuXm7fkb4+bMm736S/90v/fUL+pU/+86HcEc/882/xqd/5+O3v7nnvwST
                                    dz/J01/6mwcXu/PP5r948MHVhw/nnzPAX8Dodz760n/95yFw7+f/umT+i1/8+T8Mv/1h+UP8/uA3
                                    7M4/m/+kPrgHH/4rz77zAa8f/s8Pmy9n/Usf/856O3Dn0X82wr/hXzr4b+Kf/OvZnX82/8HvH1z/
                                    X6pP+qCffecjfvv568Of/84HX/rpS/23fOkf/H/x8aW/Qz6+9HfIx5f+Dvn40t8dLy//AXQHkzvG
                                    9DEyAAAAAElFTkSuQmCC";
            

            BarcodeResponseList actual;
            actual = target.PostBarcodeRecognizeFromRequestBody(type, checksumValidation, stripFnc, rotationAngle, requestbody);
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new BarcodeResponseList(), actual.GetType());
        }

        /// <summary>
        ///A test for PostGenerateMultiple
        ///</summary>
        [TestMethod()]
        public void TestPostGenerateMultiple()
        {
            BarcodeApi target = new BarcodeApi(APIKEY, APPSID, BASEPATH);
                        
            string format = "png";
            BarcodeBuilders body = new BarcodeBuilders();

            BarcodeBuilder barcodeBuilder1 = new BarcodeBuilder();
            barcodeBuilder1.TypeOfBarcode = "qr";
            barcodeBuilder1.Text = "The Latest barcode";

            BarcodeBuilder barcodeBuilder2 = new BarcodeBuilder();
            barcodeBuilder2.TypeOfBarcode = "qr";
            barcodeBuilder2.Text = "The Latest barcode";

            body.BarcodeBuilderList = new System.Collections.Generic.List<BarcodeBuilder> { barcodeBuilder1, barcodeBuilder2 };

                        
            ResponseMessage actual;
            actual = target.PostGenerateMultiple(format, body);
            Assert.AreEqual(200, actual.Code);
            Assert.IsInstanceOfType(new ResponseMessage(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PutBarcodeGenerateFile
        ///</summary>
        [TestMethod()]
        public void TestPutBarcodeGenerateFile()
        {
            BarcodeApi target = new BarcodeApi(APIKEY, APPSID, BASEPATH);
            

            string name = "testbar.png";
            string text = "Aspose.Barcode for Cloud";
            string type = "qr";
            string format = "";
            float? resolutionX = null;
            float? resolutionY = null;
            float? dimensionX = null;
            float? dimensionY = null;
            string codeLocation = "";
            string grUnit = "";
            string autoSize = "";
            float? barHeight = null;
            float? imageHeight = null;
            float? imageWidth = null;
            string imageQuality = "";
            float? rotAngle = null;
            float? topMargin = null;
            float? bottomMargin = null;
            float? leftMargin = null;
            float? rightMargin = null;
            string enableChecksum = "";
            string storage = "";
            string folder = "";
            byte[] file = null;
            
            SaaSposeResponse actual;
            actual = target.PutBarcodeGenerateFile(name, text, type, format, resolutionX, resolutionY, dimensionX, dimensionY, codeLocation, grUnit, autoSize, barHeight, imageHeight, imageWidth, imageQuality, rotAngle, topMargin, bottomMargin, leftMargin, rightMargin, enableChecksum, storage, folder, file);
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new SaaSposeResponse(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PutBarcodeRecognizeFromBody
        ///</summary>
        [TestMethod()]
        public void TestPutBarcodeRecognizeFromBody()
        {
            BarcodeApi target = new BarcodeApi(APIKEY, APPSID, BASEPATH);
            StorageApi storageApi = new StorageApi(APIKEY, APPSID, BASEPATH);


            string name = "barcodePng.png";
            string type = "";
            string folder = "";
            BarcodeReader body = new BarcodeReader();
            body.StripFNC = true;
            body.ChecksumValidation = "OFF";

            storageApi.PutCreate(name, null, null, System.IO.File.ReadAllBytes(Common.GetDataDir() + name)); 
            
            BarcodeResponseList actual;
            actual = target.PutBarcodeRecognizeFromBody(name, type, folder, body);
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new BarcodeResponseList(), actual.GetType()); 
        }

        /// <summary>
        ///A test for PutGenerateMultiple
        ///</summary>
        [TestMethod()]
        public void TestPutGenerateMultiple()
        {
            BarcodeApi target = new BarcodeApi(APIKEY, APPSID, BASEPATH);
            

            string name = "barcodePng.png";
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
            
            SaaSposeResponse actual;
            actual = target.PutGenerateMultiple(name, format, folder, body);
            Assert.AreEqual("200", actual.Code);
            Assert.IsInstanceOfType(new SaaSposeResponse(), actual.GetType()); 
        }
    }
}
