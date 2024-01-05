﻿using System;
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
            SqlCommand cmd = new SqlCommand("select * from Items where item_name like '" + Search_text.Text + "'", con);
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