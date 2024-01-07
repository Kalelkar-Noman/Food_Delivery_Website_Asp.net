using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Food_Delivery_Website
{
    public partial class Profile_Page : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Food_DeliveryConnectionString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["cookieName"];

            if (cookie != null)
            {
                string cookieValue = cookie.Value;
                SqlCommand cmd = new SqlCommand("select * from Users where id='"+cookieValue+"'", con);
                try
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        dr.Read();

                    }
                }
                catch (Exception ee)
                {
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "alert", "alert('OOPs, something went wrong''" + ee.Message + "' );", true);
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                Response.Redirect("SignUp-User.aspx");
            }
        }
    }
}