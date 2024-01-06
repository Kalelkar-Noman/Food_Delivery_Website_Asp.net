using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;
namespace Food_Delivery_Website
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        readonly SqlConnection con = new SqlConnection("Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\KNA\\Documents\\Projects_College\\Food_Delivery_Website\\DB\\Food_Delivery.mdf;Integrated Security=True;Connect Timeout=30");
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
        }

        protected void Admin_add_submit_Click(object sender, EventArgs e)
        {
            string originalFilename = Path.GetFileName(Item_image.FileName);
            string extension = Path.GetExtension(originalFilename);
            string newFilename = "image-" + Guid.NewGuid().ToString() + extension;
            string filepath = Server.MapPath("~/UploadedImages/ ") + newFilename;
            Item_image.SaveAs(filepath);
            Querier("INSERT INTO Items(item_name,item_price,item_image,item_category,item_description) Values('" + Item_name.Text + "','" + Item_price.Text + "','" + newFilename + "','" + Item_category.Text + "','"+Item_description.Text+"')");
            Refresher("select * from Items");
        }

        protected void Admin_update_submit_Click(object sender, EventArgs e)
        {
            //select* from Items where item_name like 'test 2' OR item_price = '200' OR item_category like '';
            //try {
            //    con.Open();
            //    SqlCommand cmd = new SqlCommand("select * from Items where item_id='" + Item_id.Text + "'", con);
            //    con.Open();
            //    SqlDataReader dr = cmd.ExecuteReader();
            //    if (dr.HasRows)
            //    {
            //        dr.Read();
            //        string oldImageName = dr["item_image"].ToString();
            //        string oldFilepath = Server.MapPath("./UploadedImages/") + oldImageName;
                  
            //        if (File.Exists(oldFilepath))
            //        {
            //            File.Delete(oldFilepath);

            //        }
            //        else
            //        {
            //            ScriptManager.RegisterStartupScript(Page, this.GetType(), "alert", "alert('Previous image not found.');", true);
            //        }
            //    }
            //}
            //catch(Exception ee) {
            //    ScriptManager.RegisterStartupScript(Page, this.GetType(), "alert", "alert('OOPs, something went wrong''" + ee.Message + "' );", true);
            //} finally {
            //    con.Close();
            //}
            string originalFilename = Path.GetFileName(Item_image.FileName);
            string extension = Path.GetExtension(originalFilename);
            string newFilename = "image-" + Guid.NewGuid().ToString() + extension;
            string filepath = Server.MapPath("~/UploadedImages/ ") + newFilename;
            Item_image.SaveAs(filepath);
            Querier("update Items set item_name='" + Item_name.Text + "',item_price='" + Item_price.Text + "',item_image='" + newFilename + "',item_category='" + Item_category.Text + "',item_description='" + Item_description.Text + "' where item_id='" + Item_id.Text + "'");
            Refresher("select * from items where item_id='"+Item_id.Text+"'");
        }

        protected void Admin_search_submit_Click(object sender, EventArgs e)
        {
            Refresher("select * from Items where item_id='"+Item_id.Text+"' OR item_name like '%"+Item_name.Text+"%' OR item_price = '"+Item_price.Text+"' OR item_category like '"+Item_category.Text+"'");
        }

        protected void Admin_delete_submit_Click(object sender, EventArgs e)
        {
            Querier("delete from Items where item_name like '" + Item_name.Text + "' or item_price='" + Item_price.Text + "' or item_category like '" + Item_category.Text + "' or item_id='" + Item_id.Text + "'");
            Refresher("select * from items");
        }
    }
}