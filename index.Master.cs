using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Food_Delivery_Website
{
    public partial class Index : System.Web.UI.MasterPage
    {
        readonly SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\KNA\\Documents\\Projects_College\\Food_Delivery_Website\\DB\\Food_Delivery.mdf;Integrated Security=True;Connect Timeout=30");

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Search_Btn_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select * from Items where item_name like '%" + Search_text.Text + "%'", con);
            try
            {
                con.Open();
                Search_Repeater.DataSource = cmd.ExecuteReader();
                Search_Repeater.DataBind();
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

        protected void Login_user_Click(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select * from Users where user_email like '" + Login_Email.Text + "' AND user_password like '" + Login_password.Text + "'", con);
            try
            {
                con.Open();
                   SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows){
                    dr.Read();
                    HttpCookie user_id = new HttpCookie("user_id")
                    {
                        Value = dr["id"].ToString(),
                        Expires = DateTime.Now.AddDays(7) // Set expiration to 7 days from now
                    };
                    HttpCookie user_type = new HttpCookie("user_type")
                    {
                        Value = dr["user_access"].ToString(),
                        Expires = DateTime.Now.AddDays(7) // Set expiration to 7 days from now
                    };
                    Response.Cookies.Add(user_id);
                    Response.Cookies.Add(user_type);
                    HttpCookie loginstatus = Request.Cookies["loginstatus"];
                    if (loginstatus != null)
                    {
                        loginstatus.Value = "true";
                        loginstatus.Expires = DateTime.Now.AddDays(7); // Optional: Update expiration
                        Response.Cookies.Add(loginstatus);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "alert", "alert('OOPs, credentials went wrong');", true);
                    //ScriptManager.RegisterStartupScript(Page, this.GetType(), "alert", "alert('OOPs, password went wrong", true);
                }
                //ScriptManager.RegisterStartupScript(Page, this.GetType(), "alert", "alert('OOPs, password went wrong 4');", true);
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

        protected void Search_text_TextChanged(object sender, EventArgs e)
        {
            SqlCommand cmd = new SqlCommand("select * from Items where item_name like '%" + Search_text.Text + "%'", con);
            try
            {
                con.Open();
                Search_Repeater.DataSource = cmd.ExecuteReader();
                Search_Repeater.DataBind();
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
    }
}