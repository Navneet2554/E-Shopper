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
    public partial class addtocart : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=SUEMDH-WINDOWS\SQL;Initial Catalog=project;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    Session["addproduct"] = "false";
                    DataTable dt = new DataTable();
                    DataRow dr;
                    dt.Columns.Add("sno");
                    dt.Columns.Add("pid");
                    dt.Columns.Add("pname");
                    dt.Columns.Add("pimage");
                    dt.Columns.Add("pprice");
                    dt.Columns.Add("pquantity");
                    dt.Columns.Add("ptotalprice");

                    if (Request.QueryString["id"] != null)
                    {
                        if (Session["Buyitem"] == null)
                        {
                            dr = dt.NewRow();
                            SqlConnection con = new SqlConnection(@"Data Source=SUEMDH-WINDOWS\SQL;Initial Catalog=project;Integrated Security=True");
                            SqlDataAdapter da = new SqlDataAdapter("select * from product1 where P_ID =  '" + Request.QueryString["id"] + "'", con);
                            DataSet ds = new DataSet();
                            da.Fill(ds);


                            dr["sno"] = 1;
                            dr["pid"] = ds.Tables[0].Rows[0]["P_ID"].ToString();
                            dr["pname"] = ds.Tables[0].Rows[0]["P_NAME"].ToString();
                            dr["pimage"] = ds.Tables[0].Rows[0]["P_IMAGE"].ToString();
                            dr["pprice"] = ds.Tables[0].Rows[0]["P_PRICE"].ToString();
                            dr["pquantity"] = Request.QueryString["quantity"];

                            int price = Convert.ToInt32(ds.Tables[0].Rows[0]["P_PRICE"].ToString());
                            int quantity = Convert.ToInt32(Request.QueryString["quantity"].ToString());
                            int Total = price * quantity;
                            dr["ptotalprice"] = Total;

                            dt.Rows.Add(dr);
                            con.Open();
                            SqlCommand cmd = new SqlCommand("insert into cart values ('" + dr["sno"] + "','" + dr["pid"] + "','" + dr["pname"] + "','" + dr["pimage"] + "','" + dr["pquantity"] + "','" + Session["username"].ToString() + "')", con);
                            cmd.ExecuteNonQuery();
                            con.Close();
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            Session["Buyitem"] = dt;
                            Button1.Enabled = true;

                            GridView1.FooterRow.Cells[5].Text = "Total Amount";
                            GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        }
                        else
                        {
                            dt = (DataTable)Session["Buyitem"];
                            int sr;
                            sr = dt.Rows.Count;

                            dr = dt.NewRow();
                            SqlConnection scon = new SqlConnection(@"Data Source=SUEMDH-WINDOWS\SQL;Initial Catalog=project;Integrated Security=True");
                            SqlDataAdapter da = new SqlDataAdapter("select * from product1 where P_ID = " + Request.QueryString["id"], scon);
                            DataSet ds = new DataSet();
                            da.Fill(ds);
                            dr["sno"] = sr + 1;
                            dr["pid"] = ds.Tables[0].Rows[0]["P_ID"].ToString();
                            dr["pname"] = ds.Tables[0].Rows[0]["P_NAME"].ToString();
                            dr["pimage"] = ds.Tables[0].Rows[0]["P_IMAGE"].ToString();
                            dr["pprice"] = ds.Tables[0].Rows[0]["P_PRICE"].ToString();
                            dr["pquantity"] = Request.QueryString["quantity"];

                            int price = Convert.ToInt32(ds.Tables[0].Rows[0]["P_PRICE"].ToString());
                            int quantity = Convert.ToInt32(Request.QueryString["quantity"].ToString());
                            int Total = price * quantity;
                            dr["ptotalprice"] = Total;

                            dt.Rows.Add(dr);
                            con.Open();
                            SqlCommand cmd = new SqlCommand("insert into cart values ('" + dr["sno"] + "','" + dr["pid"] + "','" + dr["pname"] + "','" + dr["pimage"] + "','" + dr["pprice"] + "','" + dr["pquantity"] + "','" + Session["username"].ToString() + "')", con);
                            cmd.ExecuteNonQuery();
                            con.Close();
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                            Session["Buyitem"] = dt;
                            Button1.Enabled = true;

                            GridView1.FooterRow.Cells[5].Text = "Total Amount";
                            GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                            Response.Redirect("addtocart.aspx");

                            GridView1.FooterRow.Cells[5].Text = "Total Amount";
                            GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();

                        }
                    }
                    else
                    {
                        dt = (DataTable)Session["Buyitem"];
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        if (GridView1.Rows.Count > 0)
                        {
                            GridView1.FooterRow.Cells[5].Text = "Total Amount";
                            GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        }
                    }
                }
                string OrderDate = DateTime.Now.ToShortDateString();
                Session["Orderdate"] = OrderDate;
                orderid();

            }
        }

            public int grandtotal()
            {
                DataTable dt = new DataTable();
                dt = (DataTable)Session["Buyitem"];
                int row = dt.Rows.Count;
                int i = 0;
                int totalp = 0;
                if(i<row)
                {
                    totalp = totalp + Convert.ToInt32(dt.Rows[i]["pprice"].ToString());
                    i= i+1;

                }
                return totalp;
            }
            public void orderid()
            {
                string oid = "abCdefghIjklmnoprStuvwXyz0123456789";
                Random r = new Random();
                char[] myArray = new char[5];
                for (int i = 0; i < 5; i++)
                {
                    myArray[i] = oid[(int)(35*r.NextDouble())];

                }
                string orderid;
                orderid = DateTime.Now.Hour.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString()
                    + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(myArray) + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
                Session["Orderid"] = orderid;

            }

            protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
            {
                DataTable dt = new DataTable();
                dt = (DataTable)Session["Buyitem"];
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    int id;
                    id = Convert.ToInt32(dt.Rows[i]["pid"].ToString());
                    int sr;
                    int sr1;
                    string qdata;
                    string dtdata;
                    sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                    TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                    qdata = cell.Text;
                    dtdata = sr.ToString();
                    sr1 = Convert.ToInt32(qdata);

                    if(sr == sr1)
                    {
                        RemoveFromDatabase(id);
                        dt.Rows[i].Delete();
                        dt.AcceptChanges();
                        break;
                    }
                }

                for (int i = 1; i <= dt.Rows.Count; i++)
                {
                    dt.Rows[i - 1]["sno"] = i;
                    dt.AcceptChanges();

                }
                Session["Buyitem"] = dt;
                Response.Redirect("addtocart.aspx");
            }
            private void RemoveFromDatabase(int sno)
            {
                string connectionString = @"Data Source=SUEMDH-WINDOWS\SQL;Initial Catalog=project;Integrated Security=True";
                using (SqlConnection con = new SqlConnection(connectionString))
                {
                    con.Open();
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM cart WHERE P_ID = @sno", con))
                    {
                        cmd.Parameters.AddWithValue("@sno", sno);
                        cmd.ExecuteNonQuery();
                    }
                    con.Close();
                }
            }

            protected void Button1_Click(object sender, EventArgs e)
            {
                DataTable dt;
                dt = (DataTable)Session["Buyitem"];
                for (int i = 0; i <= dt.Rows.Count - 1; i++)
                {
                    SqlConnection scon = new SqlConnection(@"Data Source=SUEMDH-WINDOWS\SQL;Initial Catalog=project;Integrated Security=True");

                    scon.Open();
                    SqlCommand cmd = new SqlCommand("insert into order2 (email,orderid,sno,productid,productname,price,quantity,orderdate)values(@Email, @OrderId, @Sno, @ProductId, @ProductName, @Price, @Quantity, @OrderDate)", scon);
                    cmd.Parameters.AddWithValue("@Email", Session["username"].ToString());
                    cmd.Parameters.AddWithValue("@OrderId", Session["Orderid"].ToString());
                    cmd.Parameters.AddWithValue("@Sno", dt.Rows[i]["sno"].ToString());
                    cmd.Parameters.AddWithValue("@ProductId", dt.Rows[i]["pid"].ToString());
                    cmd.Parameters.AddWithValue("@ProductName", dt.Rows[i]["pname"].ToString());
                    cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(dt.Rows[i]["pprice"]));
                    cmd.Parameters.AddWithValue("@Quantity", Convert.ToDecimal(dt.Rows[i]["pquantity"]));
                    cmd.Parameters.AddWithValue("@OrderDate", Convert.ToDateTime(Session["orderdate"]));
                        cmd.ExecuteNonQuery();
                        scon.Close();
                }
                       Response.Redirect("placeorder.aspx");
            }
    }
}