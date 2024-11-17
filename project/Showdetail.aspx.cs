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
    public partial class Showdetail : System.Web.UI.Page
    {
        protected void Button1_Click2(object sender, EventArgs e)
        {
            string con = @"Data Source=SUEMDH-WINDOWS\SQL;Initial Catalog=project;Integrated Security=True";
            using (SqlConnection sqlcon = new SqlConnection(con))
            {
                sqlcon.Open();
                SqlDataAdapter da = new SqlDataAdapter("select * from Users", sqlcon);
                DataTable dtbl = new DataTable();
                da.Fill(dtbl);
                Database.DataSource = dtbl;
                Database.DataBind();
            }
        }
        protected void Button1_Click1(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("userupdate.aspx");
        }
        protected void click(object sender, EventArgs e)
        {
            
        }
    }
}