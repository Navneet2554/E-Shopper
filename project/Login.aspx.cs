using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace project
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] != null)
                {
                    Response.Redirect("User.aspx");
                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string email = TextBox1.Text;
            string password = TextBox2.Text;
            string role = RadioButtonAdmin.Checked ? "Admin" : "User";

            string connectionString = @"Data Source=SUEMDH-WINDOWS\SQL;Initial Catalog=project;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Users WHERE Email=@Email AND Password=@Password AND Role=@Role";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Password", password);
                cmd.Parameters.AddWithValue("@Role", role);

                conn.Open();
                int count = Convert.ToInt32(cmd.ExecuteScalar());
                conn.Close();

                if (count == 1)
                {

                    // Successful login
                    Label1.Text = "Login successful!";
                    Label1.ForeColor = System.Drawing.Color.Green;

                    // Store user information in session
                    Session["Email"] = email;
                    Session["Role"] = role;
                    Session["username"] = email;

                    // Redirect based on role
                    if (role == "Admin")
                    {
                        Response.Redirect("admin.aspx");
                    }
                    else
                    {
                        Session["buyitems"] = null;
                        fillcart();
                        Response.Redirect("User.aspx");
                    }
                }
                else
                {
                    // Failed login
                    Label1.Text = "Invalid email, password, or role.";
                    Label1.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        private void fillcart()
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("sno");
            dt.Columns.Add("pid");
            dt.Columns.Add("pname");
            dt.Columns.Add("pimage");
            dt.Columns.Add("pprice");
            dt.Columns.Add("pquantity");
            dt.Columns.Add("ptotalprice");

            String con = @"Data Source=SUEMDH-WINDOWS\SQL;Initial Catalog=project;Integrated Security=True";
            SqlConnection mycon = new SqlConnection(con);

            if (Session["username"] != null)
            {
                String myquery = "select * from cart where Email = '" + Session["username"].ToString() + "'";
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = myquery;
                cmd.Connection = mycon;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                da.Fill(ds);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    int i = 0;
                    int counter = ds.Tables[0].Rows.Count;
                    while (i < counter)
                    {
                        dr = dt.NewRow();
                        dr["sno"] = i + 1;
                        dr["pid"] = ds.Tables[0].Rows[i]["P_ID"].ToString();
                        dr["pname"] = ds.Tables[0].Rows[i]["P_NAME"].ToString();
                        dr["pimage"] = ds.Tables[0].Rows[i]["P_IMAGE"].ToString();
                        dr["pprice"] = ds.Tables[0].Rows[i]["P_PRICE"].ToString();
                        //dr["pquantity"] = Request.QueryString["quantity"];
                        dr["pquantity"] = ds.Tables[0].Rows[i]["P_QUANTITY"].ToString();
                        int price = Convert.ToInt32(ds.Tables[0].Rows[i]["P_PRICE"].ToString());
                        int quantity = Convert.ToInt32(ds.Tables[0].Rows[i]["P_QUANTITY"].ToString());
                        int total = price * quantity;
                        dr["ptotalprice"] = total;
                        dt.Rows.Add(dr);
                        i = i + 1;
                    }
                }
                else
                {
                    Session["buyitem"] = null;
                }
                Session["buyitem"] = dt;
            }
        }
    }
}
