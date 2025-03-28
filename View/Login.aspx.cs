using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace GroceryShop.View
{
    public partial class Login : System.Web.UI.Page
    {
        protected Models.Functions Con;

        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Models.Functions();
        }

        public static string SName;
        int Skey;

        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required for rendering controls
        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            if (AdminRadio.Checked)
            {
                if (EmailId.Value == "admin@1213gmail.com" && UserPasswordTb.Value == "1234")
                {
                    System.Diagnostics.Debug.WriteLine("Admin login successful");
                    Response.Redirect("View/Admin/Sellers.aspx");
                }
                else
                {
                    InfoMsg.InnerText = "Invalid Admin....!";
                }
            }
            else
            {
                string Query = "SELECT SellId, SellName, SellEmail, SellPassword FROM SellerTb WHERE SellEmail = @SellEmail AND SellPassword = @SellPassword";
                var parameters = new Dictionary<string, object>
                {
                    { "@SellEmail", EmailId.Value },
                    { "@SellPassword", UserPasswordTb.Value }
                };
                DataTable dt = Con.getData(Query, parameters);
                if (dt.Rows.Count == 0)
                {
                    InfoMsg.InnerText = "Invalid User.....!";
                }
                else
                {
                    SName = EmailId.Value;
                    Skey = Convert.ToInt32(dt.Rows[0][0].ToString());
                    System.Diagnostics.Debug.WriteLine("User login successful");
                    Response.Redirect("View/Admin/Dashboard.aspx");
                }
            }
        }
    }
}
