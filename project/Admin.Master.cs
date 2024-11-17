using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["username"] == null)
            {
                Label1.Visible = false;
                Menu1.Visible = false;
                Button1.Visible = false;
            }
            else
            {
                Label1.Text = "Logged In as " + Session["Email"].ToString();
                Menu1.Visible = true;
                Button1.Visible = true;
            }

        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("User.aspx");
        }

        protected void Menu1_MenuItemClick(object sender, MenuEventArgs e)
        {

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Random ran = new Random();
            int i = ran.Next(1,5);
            Image5.ImageUrl = "~/Photo/" + i.ToString() + ".jpeg";
        }
    }
}