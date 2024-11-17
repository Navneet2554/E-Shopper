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
    public partial class detail : System.Web.UI.Page
    {
        string str = @"Data Source=SUEMDH-WINDOWS\SQL;Initial Catalog=project;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GridView1.DataSource = SqlDataSource1;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            Label11.Text = "";
            GridView1.EditRowStyle.BackColor = System.Drawing.Color.Orange;
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
            Label11.Text = "";
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label fn = GridView1.Rows[e.RowIndex].FindControl("label8") as Label;
            Label ln = GridView1.Rows[e.RowIndex].FindControl("label9") as Label;
            Label em = GridView1.Rows[e.RowIndex].FindControl("label10") as Label;
            DropDownList gn = GridView1.Rows[e.RowIndex].FindControl("DropDownList1") as DropDownList;
            TextBox ad = GridView1.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;
            TextBox ph = GridView1.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
            TextBox rl = GridView1.Rows[e.RowIndex].FindControl("TextBox3") as TextBox;
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand("update Users set Gender = '"+gn.SelectedValue+"',Address = '"+ad.Text+"',Phone='"+ph.Text+"',Role = '"+rl.Text+"' where Email = '"+em.Text+"'",con);
            cmd.ExecuteNonQuery();
            Label11.Text = "Row Has Been Updated";
            GridView1.EditIndex = -1;
            SqlDataSource1.DataBind();
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }

        protected void LinkButton5_Click(object sender, EventArgs e)
        {
            TextBox fn = GridView1.FooterRow.FindControl("TextBox4") as TextBox;
            TextBox ln = GridView1.FooterRow.FindControl("TextBox5") as TextBox;
            TextBox em = GridView1.FooterRow.FindControl("TextBox6") as TextBox;
            DropDownList gn = GridView1.FooterRow.FindControl("DropDownList2") as DropDownList;
            TextBox ad = GridView1.FooterRow.FindControl("TextBox8") as TextBox;
            TextBox ph = GridView1.FooterRow.FindControl("TextBox9") as TextBox;
            TextBox rl = GridView1.FooterRow.FindControl("TextBox10") as TextBox;
            using (SqlConnection con = new SqlConnection(str))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Users (Fname, Lname, Email, Gender, Address, Phone, Password, Role) VALUES (@Fname, @Lname, @Email, @Gender, @Address, @Phone, @Password, @Role)", con))
                {
                    cmd.Parameters.AddWithValue("@Fname", fn.Text);
                    cmd.Parameters.AddWithValue("@Lname", ln.Text);
                    cmd.Parameters.AddWithValue("@Email", em.Text);
                    cmd.Parameters.AddWithValue("@Gender", gn.SelectedValue);
                    cmd.Parameters.AddWithValue("@Address", ad.Text);
                    cmd.Parameters.AddWithValue("@Phone", ph.Text);
                    cmd.Parameters.AddWithValue("@Password", 123);
                    cmd.Parameters.AddWithValue("@Role", rl.Text);

                    cmd.ExecuteNonQuery();
                    Label11.Text = "Inserted Successfully";
                }
            }
            SqlDataSource1.DataBind();
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label em = GridView1.Rows[e.RowIndex].FindControl("label3") as Label;
            SqlConnection con = new SqlConnection(str);
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from Users where Email=@em", con);
            cmd.Parameters.AddWithValue("@em", em.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Label11.Text = "Record Deleted";
            GridView1.EditIndex = -1;
            SqlDataSource1.DataBind();
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataBind();
        }
    }
}