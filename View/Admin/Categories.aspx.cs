using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GroceryShop.View.Admin
{
    public partial class Categories : System.Web.UI.Page
    {
        Models.Functions Con;
        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Models.Functions();
            ShowCategories();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }
        private void ShowCategories()
        {
            string Query = "select * from Categorytb1";
            CategoryGv.DataSource = Con.getData(Query);
            CategoryGv.DataBind();
        }

        protected void Savebtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (CatNameTb.Value == "" || CatRemarkTb.Value == "")
                {
                    Errmsg.InnerText = "Missing Data";
                }
                else
                {
                    string CatName = CatNameTb.Value;
                    string CatRem = CatRemarkTb.Value;

                    string Query = "insert into Categorytb1 (CatName, CatDescription) values('{0}','{1}')";
                    Query = string.Format(Query, CatName, CatRem);
                    Con.SetData(Query);
                    ShowCategories();
                    Errmsg.InnerText = "Category Added.....!";
                }
            }
            catch (Exception Ex)
            {
                Errmsg.InnerText = Ex.Message;
            }
        }

        protected void updatebtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (CatNameTb.Value == "" || CatRemarkTb.Value == "")
                {
                    Errmsg.InnerText = "Missing Data";
                }
                else
                {
                    string CatName = CatNameTb.Value;
                    string CatRem = CatRemarkTb.Value;

                    string Query = "update Categorytb1 set CatName='{0}', CatDescription='{1}' where CatId='{2}'";
                    Query = string.Format(Query, CatName, CatRem, CategoryGv.SelectedRow.Cells[1].Text);
                    Con.SetData(Query);
                    ShowCategories();
                    Errmsg.InnerText = "Category Updated.....!";
                }
            }
            catch (Exception Ex)
            {
                Errmsg.InnerText = Ex.Message;
            }
        }

        protected void Deletebtn_Click(object sender, EventArgs e)
        {
            try
            {
                if (CatNameTb.Value == "")
                {
                    Errmsg.InnerText = "Missing Data";
                }
                else
                {
                    string Query = "delete from Categorytb1 where CatId={0}";
                    Query = string.Format(Query, CategoryGv.SelectedRow.Cells[1].Text);
                    Con.SetData(Query);
                    ShowCategories();
                    Errmsg.InnerText = "Category Deleted.....!";
                }
            }
            catch (Exception Ex)
            {
                Errmsg.InnerText = Ex.Message;
            }
        }
        int key = 0;
        protected void CategoryGv_SelectedIndexChanged(object sender, EventArgs e)
        {
            CatNameTb.Value = CategoryGv.SelectedRow.Cells[2].Text;
            CatRemarkTb.Value = CategoryGv.SelectedRow.Cells[3].Text;

            if (CatNameTb.Value == "")
            {
                key = 0;
            }
            else
            {
                key = Convert.ToInt32(CategoryGv.SelectedRow.Cells[1].Text);
            }
        }
    }
}
