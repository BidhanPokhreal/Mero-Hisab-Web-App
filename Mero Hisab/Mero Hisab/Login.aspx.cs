using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication15
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonSubmit_Click(object sender, EventArgs e)
        {
            //chaeck username and password
            DataView data = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            bool authenticated = data.Table.Rows.Count > 0;

            

            if (authenticated)
            {
                FormsAuthentication.RedirectFromLoginPage(TextBoxUsername.Text, false);





                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["FYPConnectionString"].ConnectionString;

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd1 = new SqlCommand("TRUNCATE TABLE LoginUser", con);
                con.Open();

                cmd1.ExecuteNonQuery();

                con.Close();

                SqlCommand cmd = new SqlCommand("INSERT INTO LoginUser (LoginUser) VALUES('" + TextBoxUsername.Text + "')", con);

                con.Open();

                cmd.ExecuteNonQuery();

                con.Close();
                Response.Redirect("~/Home.aspx");

            }
            else
            {
                LabelMessgae.Text = "inavalid login attempt";
            }
                
         }

        protected void ButtonRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registration/register.aspx");
        }
    }
}