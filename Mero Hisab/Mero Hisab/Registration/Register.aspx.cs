using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace applicatiob_dev.Register
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //check username for dupication
            DataView data = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            bool duplicate = data.Table.Rows.Count > 0;

            if (!duplicate)
            {
                SqlDataSource1.InsertParameters["Username"].DefaultValue = TextBoxUsername.Text;
                SqlDataSource1.InsertParameters["password"].DefaultValue = TextBoxPassword.Text;
                SqlDataSource1.InsertParameters["email"].DefaultValue = TextBoxEmail.Text;
                SqlDataSource1.Insert();

                Response.Redirect("~/Login.aspx");


            }
            else
            {
                LabelMessgae.Text = "Username already exist";

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}