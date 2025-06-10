using DocumentFormat.OpenXml.Office2010.CustomUI;
using Stripe.Terminal;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Windows.Controls;
using TextBox = System.Windows.Controls.TextBox;

namespace last_hour
{
    public partial class Brick_Calculator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonVolume_Click(object sender, EventArgs e)
        {
            TextBoxVolume.Text = (float.Parse(TextBoxLength.Text) * float.Parse(TextBoxBreadth.Text) * float.Parse(TextBoxDepth.Text)).ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBoxNoOfBricks.Text = ((float.Parse(TextBoxVolume.Text)) / (0.25 * 0.125 * 0.58)).ToString();
        }

        protected void ButtonMortar_Click(object sender, EventArgs e)
        {
            TextBoxVolumeOfMortar.Text = ((float.Parse(TextBoxNoOfBricks.Text)) * (0.01 * 0.01 * 0.01)).ToString();
        }

        protected void ButtonCalculateCement_Click(object sender, EventArgs e)
        {
            if (DropDownListMortar.SelectedItem.Text == "1:4")
            {
                TextBoxCement.Text = (0.2 * (float.Parse(TextBoxVolumeOfMortar.Text))).ToString();
            }
            if (DropDownListMortar.SelectedItem.Text == "1:6")
            {
                TextBoxCement.Text = (0.143 * (float.Parse(TextBoxVolumeOfMortar.Text))).ToString();
            }


        }

        protected void ButtonCalculateSand_Click(object sender, EventArgs e)
        {
            if (DropDownListMortar.SelectedItem.Text == "1:4")
            {
                TextBoxSand.Text = (0.8 * (float.Parse(TextBoxVolumeOfMortar.Text))).ToString();
            }
            if (DropDownListMortar.SelectedItem.Text == "1:6")
            {
                TextBoxSand.Text = (0.86 * (float.Parse(TextBoxVolumeOfMortar.Text))).ToString();
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {

            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["FYPConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);


            SqlCommand cmd = new SqlCommand("INSERT INTO Brick_Calculator (name,Length,Breadth,Thickness,Ratio,[Brick Volume],[No Of Bricks],[Mortar Volume],[Cement(Cu.M)],[Sand(Cu.M)]) VALUES('" + FormView2.SelectedValue + "','" + TextBoxLength.Text + "','" + TextBoxBreadth.Text + "','" + TextBoxDepth.Text + "','" + DropDownListMortar.Text + "','" + TextBoxVolume.Text + "','" + TextBoxNoOfBricks.Text + "','" + TextBoxVolumeOfMortar.Text + "','" + TextBoxCement.Text + "','" + TextBoxSand.Text + "')", con);

            con.Open();

            cmd.ExecuteNonQuery();

            con.Close();
            Server.Transfer("./Brick Calculator.aspx");
            MessageBox.Show("Data successfully Saved");
        }


        protected void Button2_Click(object sender, EventArgs e)
        {
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["FYPConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);
            SqlCommand cmd1 = new SqlCommand("TRUNCATE TABLE Brick_Calculator", con);
            con.Open();

            cmd1.ExecuteNonQuery();

            con.Close();
            Server.Transfer("./Brick Calculator.aspx");

            MessageBox.Show("Reset successful");

        }

        

        protected void Button2_Click1(object sender, EventArgs e)
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
                GridView3.Visible = true;
            }
            
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}

        
    
