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
    public partial class Building_Estimator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonCalculateArea_Click(object sender, EventArgs e)
        {
            TextBoxArea.Text = (float.Parse(TextBoxLength.Text) * float.Parse(TextBoxBreadth.Text)).ToString();
        }

        protected void ButtonCalculateCement_Click(object sender, EventArgs e)
        {
            TextBoxCement.Text = (float.Parse(TextBoxLength.Text) * float.Parse(TextBoxBreadth.Text) * 0.4).ToString();
        }

        protected void ButtonCalculateSand_Click(object sender, EventArgs e)
        {
            TextBoxSand.Text = (float.Parse(TextBoxLength.Text) * float.Parse(TextBoxBreadth.Text) * 0.816).ToString();
        }

        protected void ButtonCalculateAggregate_Click(object sender, EventArgs e)
        {
            TextBoxAggregate.Text = (float.Parse(TextBoxLength.Text) * float.Parse(TextBoxBreadth.Text) * 0.608).ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBoxSteel.Text = (float.Parse(TextBoxLength.Text) * float.Parse(TextBoxBreadth.Text) * 4).ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            TextBoxBricks.Text = (float.Parse(TextBoxLength.Text) * float.Parse(TextBoxBreadth.Text) * 8).ToString();
        }

        protected void ButtonCreateChart_Click(object sender, EventArgs e)
        {
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["FYPConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);
            

            SqlCommand cmd = new SqlCommand("INSERT INTO Building_Estimator (Name,Length,Breadth,Area,Cement,Sand,Aggregate,Steel,Bricks,building_name) VALUES('" + FormView1.SelectedValue + "','" + TextBoxLength.Text + "','" + TextBoxBreadth.Text + "','" + TextBoxArea.Text + "','" + TextBoxCement.Text + "','" + TextBoxSand.Text + "','" + TextBoxAggregate.Text + "','" + TextBoxSteel.Text + "','" + TextBoxBricks.Text + "','" + TextBoxName.Text + "')", con);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();
            MessageBox.Show("Data saved");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonReset_Click(object sender, EventArgs e)
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
                SqlCommand cmd1 = new SqlCommand("TRUNCATE TABLE Building_Estimator",con);
                con.Open();

                cmd1.ExecuteNonQuery();

                con.Close();
                Server.Transfer("./Building Estimator.aspx");

                MessageBox.Show("Data reset successful");
            }




            
        }

        protected void view_Click(object sender, EventArgs e)
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
                GridViewSavedData.Visible = true;
            }

        }
    }
}