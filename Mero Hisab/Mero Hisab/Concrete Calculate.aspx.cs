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
    public partial class Concrete_Calculate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonCalculate_Click(object sender, EventArgs e)
        {

            TextBoxResultDryVolume.Text = (float.Parse(TextBoxLength.Text) * float.Parse(TextBoxBreadth.Text)*float.Parse(TextBoxDepth.Text)  ).ToString();


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            TextBoxResultArea.Text = (float.Parse(TextBoxLength.Text) * float.Parse(TextBoxBreadth.Text)).ToString();
        }

        protected void ButtonWetVolumeOfMixture_Click(object sender, EventArgs e)
        {
            TextBoxWetVolumeMix.Text = ((float.Parse(TextBoxLength.Text) * float.Parse(TextBoxBreadth.Text))+ (float.Parse(TextBoxLength.Text) * float.Parse(TextBoxBreadth.Text))*(52.4/100)).ToString();
            


        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (DropDownListTypeOfConcrete.SelectedItem.Text == "M20(1:1.5:3)")
            {
                TextBoxDryVolumeOfCementCuM.Text = ((1 / 5.5) * (float.Parse(TextBoxWetVolumeMix.Text))).ToString();
            }
            if(DropDownListTypeOfConcrete.SelectedItem.Text== "M15(1:2:4)")
            {
                TextBoxDryVolumeOfCementCuM.Text = ((0.143) * (float.Parse(TextBoxWetVolumeMix.Text))).ToString();
            }
           

        }

        protected void Button1_Click2(object sender, EventArgs e)
        {
            if (DropDownListTypeOfConcrete.SelectedItem.Text == "M20(1:1.5:3)")
            {
                TextBoxDryVolumeOfSandCuM.Text = ((1.5 / 5.5) * (float.Parse(TextBoxWetVolumeMix.Text))).ToString();
            }
            if (DropDownListTypeOfConcrete.SelectedItem.Text == "M15(1:2:4)")
            {
                TextBoxDryVolumeOfSandCuM.Text = ((1.5/7) * (float.Parse(TextBoxWetVolumeMix.Text))).ToString();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (DropDownListTypeOfConcrete.SelectedItem.Text == "M20(1:1.5:3)")
            {
                TextBoxDryVolumeOfAggregateCuM.Text = ((3 / 5.5) * (float.Parse(TextBoxWetVolumeMix.Text))).ToString();
            }
            if (DropDownListTypeOfConcrete.SelectedItem.Text == "M15(1:2:4)")
            {
                TextBoxDryVolumeOfAggregateCuM.Text = ((4 / 7) * (float.Parse(TextBoxWetVolumeMix.Text))).ToString();
            }

        }

        protected void Buttonsave_Click(object sender, EventArgs e)
        {
            string cs = System.Configuration.ConfigurationManager.ConnectionStrings["FYPConnectionString"].ConnectionString;

            SqlConnection con = new SqlConnection(cs);


            SqlCommand cmd = new SqlCommand("INSERT INTO concrete_calculate (name,length,breadth,depth,dry_volume,area,wet_volume,cement,sand,aggregate) VALUES('" + FormViewname.SelectedValue + "','" + TextBoxLength.Text + "','" + TextBoxBreadth.Text + "','" + TextBoxDepth.Text + "','" + TextBoxResultDryVolume.Text + "','" + TextBoxResultArea.Text + "','" + TextBoxWetVolumeMix.Text+ "','" + TextBoxDryVolumeOfCementCuM.Text+ "','" + TextBoxDryVolumeOfSandCuM.Text+ "','" + TextBoxDryVolumeOfAggregateCuM.Text+"')", con);

            con.Open();

            cmd.ExecuteNonQuery();
            GridView2.DataBind();

            con.Close();
            MessageBox.Show("Data saved");
        }

        protected void Buttonreset_Click(object sender, EventArgs e)
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
                SqlCommand cmd1 = new SqlCommand("TRUNCATE TABLE concrete_calculate ", con);
                con.Open();

                cmd1.ExecuteNonQuery();

                con.Close();
                
                MessageBox.Show("Data reset successful");
            }

        }

        protected void Buttonview_Click(object sender, EventArgs e)
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