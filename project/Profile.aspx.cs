using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace project
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=SUEMDH-WINDOWS\SQL;Initial Catalog=project;Integrated Security=True");
            con.Open();
            SqlCommand smd = new SqlCommand("select * from Users where Email = '" + Session["username"] + "'", con);
            SqlDataReader rd = smd.ExecuteReader();
            while (rd.Read())
            {
                TextBox1.Text = rd.GetValue(1).ToString();
                TextBox2.Text = rd.GetValue(2).ToString();
                TextBox3.Text = rd.GetValue(3).ToString();
                DropDownList1.SelectedValue = rd.GetValue(4).ToString();
                TextBox4.Text = rd.GetValue(5).ToString();
                TextBox5.Text = rd.GetValue(6).ToString();
                Label3.Text = "Thanks For being our user";
            }
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}