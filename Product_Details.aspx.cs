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
    public partial class WebForm1 : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Food_DeliveryConnectionString"].ConnectionString);
        //readonly SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Projects\\Food_Delivery_Website_Asp.net\\DB\\Food_Delivery.mdf;Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {
            string Product_Id = Request.QueryString["ProductId"];

            if (Product_Id!=null)
            {
                SqlCommand cmd = new SqlCommand("select * from Items where item_id='" + Product_Id + "'", con);
                try
                {
                    con.Open();
                    Repeater1.DataSource = cmd.ExecuteReader();
                    Repeater1.DataBind();
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
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "alert", "alert('OOPs, no item' );", true);
                Response.Redirect("Main_Page.aspx");
            }
        }
    }
}