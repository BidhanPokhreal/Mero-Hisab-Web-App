using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace last_hour
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonConcreteCalculate_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Concrete Calculate.aspx");

        }

        protected void ButtonPlasterCalculate_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Plaster Calculate.aspx");
        }

        protected void ButtonBuildingEstimator_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Building Estimator.aspx");

        }

        protected void ButtonBrickCalculator_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Brick Calculator.aspx");
        }
        

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ButtonSteel_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Steel Calculator.aspx");
        }

        protected void ButtonCarpenting_Click(object sender, EventArgs e)
        {
            Response.Redirect("./Carpenting.aspx");
        }
    }
}