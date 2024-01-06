using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Food_Delivery_Website
{
    public partial class SignUp_User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["user_otp"];
            if (cookie != null)
            {
                string cookieValue = cookie.Value;
                Response.Write(cookieValue);
            }
            else
            {
                Response.Write("cookie not found");
            }
        }
    }
}