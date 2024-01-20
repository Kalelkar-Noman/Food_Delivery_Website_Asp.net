using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;
using System.Configuration;

namespace Food_Delivery_Website
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        //readonly SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=D:\\Projects\\Food_Delivery_Website_Asp.net\\DB\\Food_Delivery.mdf;Integrated Security=True;Connect Timeout=30");
        //readonly SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\KNA\\Documents\\Projects_College\\Food_Delivery_Website\\DB\\Food_Delivery.mdf;Integrated Security=True;Connect Timeout=30");
        readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Food_DeliveryConnectionString"].ConnectionString);
        public void Refresher(string Query)
        {
            SqlCommand cmd = new SqlCommand(Query, con);
            try
            {
                con.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(dr);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            catch(Exception e)
            {
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "alert", "alert('OOPs, something went wrong''" + e.Message+"' );", true);
            }
            finally
            {
                con.Close();
            }          
        }
        public void Querier(string Query)
        {
            SqlCommand cmd = new SqlCommand(Query, con);
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                ScriptManager.RegisterStartupScript(Page, this.GetType(), "alert", "alert('OOPs, something went wrong''" + e.Message + "' );", true);
            }
            finally
            {
                con.Close();
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Refresher("select * from Items");
            HttpCookie cookie = Request.Cookies["user_id"];
            
            if (cookie != null)
            {
                string cookieValue = cookie.Value;
                SqlCommand cmd = new SqlCommand("select * from Users where id='" + cookieValue + "'", con);
                string access = "";
                try
                {
                    con.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    
                    if (dr.HasRows)
                    {
                        dr.Read();
                        access = dr["user_access"].ToString();
                        //if (access == "admin")
                        //{
                        //    //con.Close();
                        //    Refresher("select * from Items");
                        //}
                        //else
                        //{
                        //    Response.Redirect("Main_Page.aspx");
                        //}
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
                    if (access == "admin")
                    {
                        //con.Close();
                        Refresher("select * from Items");
                    }
                    else
                    {
                        Response.Redirect("Main_Page.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("Main_Page.aspx");
            }

            
        }

        protected void Admin_add_submit_Click(object sender, EventArgs e)
        {
            string originalFilename = Path.GetFileName(Item_image.FileName);
            string extension = Path.GetExtension(originalFilename);

            // Generate new filename with date and time
            DateTime now = DateTime.Now;
            string newFilename = "image_" + now.ToString("yyyyMMddHHmmss") + extension;

            string filepath = Server.MapPath("~/UploadedImages/") + newFilename; // Remove extra space in path

            if (Item_image.HasFile)
            {
                Item_image.SaveAs(filepath);
            }
            Querier("INSERT INTO Items(item_name,item_price,item_image,item_category,item_description) Values('" + Item_name.Text + "','" + Item_price.Text + "','" + newFilename + "','" + Item_category.Text + "','"+Item_description.Text+"')");
            Refresher("select * from Items");
        }

        protected void Admin_update_submit_Click(object sender, EventArgs e)
        {
            string originalFilename = Path.GetFileName(Item_image.FileName);
            string extension = Path.GetExtension(originalFilename);

            // Generate new filename with date and time
            DateTime now = DateTime.Now;
            string newFilename = "image_" + now.ToString("yyyyMMddHHmmss") + extension;

            string filepath = Server.MapPath("~/UploadedImages/") + newFilename; // Remove extra space in path

            if (Item_image.HasFile)
            {
                Item_image.SaveAs(filepath);
            }
            Querier("update Items set item_name='" + Item_name.Text + "',item_price='" + Item_price.Text + "',item_image='" + newFilename + "',item_category='" + Item_category.Text + "',item_description='" + Item_description.Text + "' where item_id='" + Item_id.Text + "'");
            Refresher("select * from items where item_id='"+Item_id.Text+"'");
        }

        protected void Admin_search_submit_Click(object sender, EventArgs e)
        {
            string query = "SELECT * FROM Items WHERE ";

            if (!string.IsNullOrEmpty(Item_id.Text))
            {
                // If ID is provided, use it as the primary search condition
                query += "item_id = '" + Item_id.Text + "'";
            }
            else
            {
                // If ID is empty, construct the query with other fields
                if (!string.IsNullOrEmpty(Item_name.Text))
                {
                    query += "item_name LIKE '%" + Item_name.Text + "%'";
                }
                if (!string.IsNullOrEmpty(Item_price.Text))
                {
                    if (query.Contains("="))
                    {
                        query += " AND ";
                    }
                    //if (!string.IsNullOrEmpty(query)) query += " AND ";
                    query += "item_price = '" + Item_price.Text + "'";
                }
                if (!string.IsNullOrEmpty(Item_category.Text))
                {
                    //if (!string.IsNullOrEmpty(query)) query += " AND ";
                    if (query.Contains("="))
                    {
                        query += " AND ";
                    }
                    query += "item_category LIKE '%" + Item_category.Text + "%'";
                }
            }
            //Refresher("select * from Items where item_id='"+ Item_id.Text +"' or item_name like '%"+Item_name.Text+"%' or item_price = '"+Item_price.Text+"' or item_category like '"+Item_category.Text+"'");
            Refresher(query);
        }

        protected void Admin_delete_submit_Click(object sender, EventArgs e)
        {
            Querier("delete from Items where item_name like '" + Item_name.Text + "' or item_price='" + Item_price.Text + "' or item_category like '" + Item_category.Text + "' or item_id='" + Item_id.Text + "'");
            Refresher("select * from items");
        }
    }
}