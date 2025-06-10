using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace last_hour
{
    public partial class Steel_Calculator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonCalculateSteelWeight_Click(object sender, EventArgs e)
        {
            TextBoxSteelWeight.Text = (((float.Parse(TextBoxDia.Text) *float.Parse(TextBoxDia.Text))/162.28) * float.Parse(TextBoxLength.Text) * float.Parse(TextBoxQuantity.Text)).ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["FYPConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);


            SqlCommand cmd = new SqlCommand("INSERT INTO [Steel Calculate] (Name,Diameter,Length,Nos,Quantity) VALUES('" + FormView1.SelectedValue + "','" + TextBoxDia.Text + "','" + TextBoxLength.Text + "','" + TextBoxQuantity.Text + "','" + TextBoxSteelWeight.Text + "')", con);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();
            GridView2.DataBind();
            MessageBox.Show("Data saved");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            //check username for dupication
            DataView data = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            bool duplicate = data.Table.Rows.Count > 0;

            if (!duplicate)
            {


                MessageBox.Show("No Data Available");


            }
            else
            {
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["FYPConnectionString"].ConnectionString;

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd1 = new SqlCommand("TRUNCATE TABLE [Steel Calculate] ", con);
                con.Open();

                cmd1.ExecuteNonQuery();

                con.Close();

                MessageBox.Show("Data reset successful");
                Response.Redirect("Steel Calculator.aspx");



            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //check username for dupication
            DataView data = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            bool duplicate = data.Table.Rows.Count > 0;

            if (!duplicate)
            {


                MessageBox.Show("No Data Available");


            }
            else
            {
                GridView2.DataBind();
                GridView2.Visible = true;
            }
        }
    }
}