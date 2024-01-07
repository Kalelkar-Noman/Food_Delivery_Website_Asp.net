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
            Save.Visible = false;

            HttpCookie cookie = Request.Cookies["user_id"];
            string cookieValue = cookie.Value;
            //SqlCommand cmd = new SqlCommand("select * from Users where Id='" + cookieValue + "'", con);
            ////SqlCommand cmd = new SqlCommand("select * from Items where item_category like '"+productCategory+"'", con);
            //try
            //{
            //    con.Open();
            //    Repeater1.DataSource = cmd.ExecuteReader();
            //    Repeater1.DataBind();

            //}
            //catch (Exception ee)
            //{
            //    ScriptManager.RegisterStartupScript(Page, this.GetType(), "alert", "alert('OOPs, something went wrong''" + ee.Message + "' );", true);
            //}
            //finally
            //{
            //    con.Close();
            //}
            //string cookieValue = cookie.Value;
            if (cookie != null)
            {

                SqlCommand cmd = new SqlCommand("select * from Users where id='" + cookieValue + "'", con);
                try
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        dr.Read();
                        Input_address.Text = dr["user_address"].ToString();
                        Input_city.Text = dr["user_city"].ToString();
                        Input_country.Text = dr["user_country"].ToString();
                        Input_email.Text = dr["user_email"].ToString();
                        Input_name.Text = dr["user_name"].ToString();
                        Input_number.Text = dr["user_number"].ToString();
                        Input_pincode.Text = dr["user_pincode"].ToString();
                        Input_state.Text = dr["user_state"].ToString();
                        Input_password.Text = dr["user_password"].ToString();
                    }
                }
                catch (Exception ee)
                {
                    //  Response.Write(ee.Message);
                    ScriptManager.RegisterStartupScript(Page, this.GetType(), "alert", "alert('OOPs, something went wrong''" + ee.Message + "' );", true);
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                Response.Redirect("Main_Page.aspx");
            }




        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            Save.Visible = true;

        }

        protected void Save_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["user_id"];
            string cookieValue = cookie.Value;

           
            try
            {
                SqlCommand cmd = new SqlCommand("update Users set user_name='" + Input_name.Text + "',user_address='" + Input_address.Text + "',user_number='" + Input_number.Text + "',user_state='" + Input_state.Text + "',user_country='" + Input_country.Text + "',user_email='" + Input_email.Text + "',user_pincode='" + Input_pincode.Text + "',user_password='" + Input_password.Text + "',user_city='" + Input_city.Text + "' where Id='" + cookieValue + "'", con);
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("update Users set user_name='" + Input_name.Text + "',user_address='" + Input_address.Text + "',user_number='" + Input_number.Text + "',user_state='" + Input_state.Text + "',user_country='" + Input_country.Text + "',user_email='" + Input_email.Text + "',user_pincode='" + Input_pincode.Text + "',user_password='" + Input_password.Text + "',user_city='" + Input_city.Text + "' where Id='" + cookieValue + "'");
            }
            catch (Exception ee)
            {
                //Response.Write(ee.Message);
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "alert", "alert('OOPs, something went wrong''" + ee.Message + "' );", true);
            }
            finally
            {
                con.Close();
            }
        }
    }
}