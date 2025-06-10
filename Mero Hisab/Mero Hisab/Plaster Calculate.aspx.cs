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
    public partial class Plaster_Calculate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBoxResultVolume.Text = (float.Parse(TextBoxLength.Text) * float.Parse(TextBoxBreadth.Text) * float.Parse(DropDownListplaster.Text)*0.01).ToString();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            TextBoxResultArea.Text = (float.Parse(TextBoxLength.Text) * float.Parse(TextBoxBreadth.Text)).ToString();
        }

        protected void ButtonReset_Click(object sender, EventArgs e)
        {
            TextBoxBreadth.Text = "";
            TextBoxLength.Text = "";
            TextBoxResultArea.Text = "";
            TextBoxResultVolume.Text = "";

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["FYPConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);


            SqlCommand cmd = new SqlCommand("INSERT INTO Plaster_Calculate (Name,Thickness,Length,Breadth,Volume,Area) VALUES('" + FormView1.SelectedValue + "','" + DropDownListplaster.Text + "','" + TextBoxLength.Text + "','" + TextBoxBreadth.Text + "','" + TextBoxResultVolume.Text + "','" + TextBoxResultArea.Text + "')", con);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();
            MessageBox.Show("Data saved");
        }

        protected void ButtonResetPlaster_Click(object sender, EventArgs e)
        {
            //check username for dupication
            DataView data = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            bool duplicate = data.Table.Rows.Count > 0;

            if (!duplicate)
            {


                MessageBox.Show("No Data Available");


            }
            else
            {
                string cs = System.Configuration.ConfigurationManager.ConnectionStrings["FYPConnectionString"].ConnectionString;

                SqlConnection con = new SqlConnection(cs);
                SqlCommand cmd1 = new SqlCommand("TRUNCATE TABLE Plaster_Calculate ", con);
                con.Open();

                cmd1.ExecuteNonQuery();

                con.Close();

                MessageBox.Show("Data reset successful");



            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void ButtonView_Click(object sender, EventArgs e)
        {
            //check username for dupication
            DataView data = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
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