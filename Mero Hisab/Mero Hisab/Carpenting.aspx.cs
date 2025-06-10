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
    public partial class Carpenting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonCalculateVolume_Click(object sender, EventArgs e)
        {
            TextBoxVolumeCuM.Text = (float.Parse(TextBoxLength.Text) * float.Parse(TextBoxBreadth.Text) * float.Parse(TextBoxDepth.Text)).ToString();
            TextBoxVolumeCuFt.Text = (float.Parse(TextBoxVolumeCuM.Text) / (3.281 * 3.281 * 3.281)).ToString();
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["FYPConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);


            SqlCommand cmd = new SqlCommand("INSERT INTO Carpenting (Name,Length,Breadth,Depth,Volume1,Volume2) VALUES('" +FormView1.SelectedValue + "','" + TextBoxLength.Text + "','" + TextBoxBreadth.Text + "','" + TextBoxDepth.Text + "','" + TextBoxVolumeCuM.Text + "','" + TextBoxVolumeCuFt.Text + "')", con);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();
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
                SqlCommand cmd1 = new SqlCommand("TRUNCATE TABLE Carpenting", con);
                con.Open();

                cmd1.ExecuteNonQuery();

                con.Close();
                Server.Transfer("./Carpenting.aspx");

                MessageBox.Show("Data reset successful");
            }



        }

        protected void ButtonView_Click(object sender, EventArgs e)
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
                GridView2.Visible = true;
            }
        }
    }
}