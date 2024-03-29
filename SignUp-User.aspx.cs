﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Food_Delivery_Website
{
    public partial class SignUp_User : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Projects\\Food_Delivery_Website_Asp.net\\DB\\Food_Delivery.mdf;Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {
            //HttpCookie cookie = Request.Cookies["user_otp"];
            //if (cookie != null)
            //{
            //    string cookieValue = cookie.Value;
            //    Response.Write(cookieValue);
            //}
            //else
            //{
            //    Response.Write("cookie not found");
            //}
        }

        protected void Submit_form_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["user_otp"];
            HttpCookie loginstatus = Request.Cookies["loginstatus"];
            if (cookie != null && (loginstatus.ToString()!="false" || loginstatus ==null ) )
            {
                //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alertScript", "alert('This alert is triggered from server-side code.');", true);
                int cookieValue = Convert.ToInt32(cookie.Value);           
                if (cookieValue == Convert.ToInt32(Otp_inputbox.Text))
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alertScript", "alert('successfull login.');", true);
                    SqlCommand cmd = new SqlCommand("insert into Users(user_name,user_access,user_address,user_number,user_state,user_country,user_email,user_pincode,user_password,user_city) values('" + User_name.Text+ "','normal','" + Address_line1.Text+" "+Address_line2.Text + "','" + Phone_number.Text + "','" + State_input.Text + "','" + Countrylist.SelectedValue + "','" + Email_input.Text + "','" + Pin_input.Text + "','" + User_pass.Text + "','"+City_input.Text+"')", con);
                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ee)
                    {
                        //ScriptManager.RegisterStartupScript(Page, this.GetType(), "alert", "alert('OOPs, something went wrong''" + e.Message + "' );", true);
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alertScript", "alert('OOPs, something went wrong''" + ee.Message + "');", true);
                    }
                    
                    
                    Response.Redirect("Main_Page.aspx");
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "alertScript", "alert('Failed Signup.');", true);
                }

            }
            else
            {
                Response.Redirect("Main_Page.aspx");
            }
        }
    }
}