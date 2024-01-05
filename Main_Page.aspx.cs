using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Food_Delivery_Website
{
    public partial class Main_Page : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\KNA\\Documents\\Projects_College\\Food_Delivery_Website\\DB\\Food_Delivery.mdf;Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select distinct item_category from Items", con);
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
            try {
                cmd = new SqlCommand("select * from Items", con);
                con.Open();
                Repeater2.DataSource = cmd.ExecuteReader();
                Repeater2.DataBind();
            }
            catch(Exception ee) {
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "alert", "alert('OOPs, something went wrong''" + ee.Message + "' );", true);
            } finally
            {
                con.Close();
            }

        }
    }
}