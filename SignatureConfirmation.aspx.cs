using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SakalGBSignatureProcess
{
    public partial class SignatureConfirmation : System.Web.UI.Page
    {
        string base64string;
        string constring = WebConfigurationManager.ConnectionStrings["MYCON"].ConnectionString;

        public string ImageToBase64(System.Drawing.Image image, System.Drawing.Imaging.ImageFormat format)
        {
            using (MemoryStream ms = new MemoryStream())
            {
                // Convert Image to byte[]
                image.Save(ms, format);
                byte[] imageBytes = ms.ToArray();

                // Convert byte[] to Base64 String
                string base64String = Convert.ToBase64String(imageBytes);
                return base64String;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //Put user code to initialize the page here
            Topaz.SigPlusNET sigObj = new Topaz.SigPlusNET();
            sigObj.AutoKeyStart();

            Label1.Text = HttpContext.Current.Request.LogonUserIdentity.Name;

            //use the same data to decrypt signature
            sigObj.SetAutoKeyData(Request.Form["username"]);
            

               sigObj.AutoKeyFinish();
               sigObj.SetSigCompressionMode(1);
                sigObj.SetEncryptionMode(2);

            //Now, get sigstring from client
            //Sigstring can be stored in a database if 
            //a biometric signature is desired rather than an image
            sigObj.SetSigString(Request.Form["hidden"]);
             //if (sigObj.NumberOfTabletPoints() ==1)
            var one = 1;
            if(one == 1)
            {
                sigObj.SetImageFileFormat(0);
                sigObj.SetImageXSize(500);
                sigObj.SetImageYSize(150);
                sigObj.SetImagePenWidth(8);
                sigObj.SetJustifyX(5);
                sigObj.SetJustifyY(5);
                sigObj.SetJustifyMode(5);
                System.Drawing.Image img = sigObj.GetSigImage();
                base64string = ImageToBase64(img, System.Drawing.Imaging.ImageFormat.Jpeg);
                if (base64string.Length > 3000)
                {
                    using (SqlConnection con = new SqlConnection(constring))
                    {
                        con.Open();
                        // string sql = "insert into SakalPicturebase64 (username,systemuser,base64string) Values (@username,@systemuser,@base64string)";
                        string sql = "insert into SakalPicturebase64_test (systemuser,base64string) Values (@systemuser,@base64string)";
                        try
                        {
                            using (SqlCommand cmd = new SqlCommand(sql, con))
                            {
                                cmd.Parameters.AddWithValue("@systemuser", Label1.Text);
                                cmd.Parameters.AddWithValue("@base64string", base64string);
                                cmd.ExecuteNonQuery();
                                Response.Write("Information has been saved Correctly..");
                            }
                        }
                        catch (Exception ex)
                        {
                            Response.Write("Error: " + ex.ToString());
                        }
                        finally
                        {
                            con.Close();
                        }
                    }
                }

            }
            else
            {
                //signature has not been returned successfully!
                Response.Write("Not bad thou");
            }
        }
    }
}