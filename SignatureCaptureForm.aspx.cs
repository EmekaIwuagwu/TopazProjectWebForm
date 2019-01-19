using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace SakalGBSignatureProcess
{
    public partial class SignatureCaptureForm : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //Request.QueryString["username"] = holder.Text;
            string userid = HttpContext.Current.Request.LogonUserIdentity.Name;
            holder.Text = userid;
        }
     }
}