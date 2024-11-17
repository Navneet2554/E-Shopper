using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace project
{
    public partial class additem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=SUEMDH-WINDOWS\SQL;Initial Catalog=project;Integrated Security=True");
            if (FileUpload1.HasFile)
            {
                Random ran = new Random();
                int pid = ran.Next(1,99999);
                string filename = FileUpload1.PostedFile.FileName;
                string filepath = "Photo/" + FileUpload1.FileName;
                FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Photo/") + filename);
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO product1 VALUES ('"+pid.ToString()+"','"+TextBox4.Text+"' , '"+TextBox2.Text+"' , '"+filepath+"','"+TextBox3.Text+"')",con);
                cmd.ExecuteNonQuery();
                con.Close();
                Label1.Text = "Product Added Sucessfully";
                Response.Redirect("User.aspx");
            }
        }
    }
}