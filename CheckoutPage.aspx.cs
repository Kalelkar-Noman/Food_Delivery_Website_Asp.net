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
    public partial class CheckoutPage : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Food_DeliveryConnectionString"].ConnectionString);
        //readonly SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Projects\\Food_Delivery_Website_Asp.net\\DB\\Food_Delivery.mdf;Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {
            //HttpCookie cookie = Request.Cookies["user_id"];
           
            //if (cookie != null)
            //{
            //    string cookieValue = cookie.Value;
            //    SqlCommand cmd = new SqlCommand("select * from Users where id='" + cookieValue + "'", con);
            //    try
            //    {
            //        con.Open();
            //        SqlDataReader dr = cmd.ExecuteReader();
            //        if (dr.HasRows)
            //        {
            //            dr.Read();
            //            Label1.Text = dr["user_name"].ToString();
            //        }
            //        else
            //        {
            //            Label1.Text ="please log in";
            //        }
            //    }
            //    catch (Exception ee)
            //    {
            //        //  Response.Write(ee.Message);
            //        ScriptManager.RegisterStartupScript(Page, this.GetType(), "alert", "alert('OOPs, something went wrong''" + ee.Message + "' );", true);
            //    }
            //    finally
            //    {
            //        con.Close();
            //    }
            //}
            //else
            //{
            //    Response.Redirect("Main_Page.aspx");
            //}
        }
    }
}