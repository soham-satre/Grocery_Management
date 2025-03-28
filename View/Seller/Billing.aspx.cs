using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace GroceryShop.View.Seller
{
    public partial class Billing : System.Web.UI.Page
    {
        Models.Functions Con;
        protected void Page_Load(object sender, EventArgs e)
        {
            Con = new Models.Functions();
            ShowProducts();
            if(!this.IsPostBack){
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[5]{
                new DataColumn("ID"),
                new DataColumn("Product"),
                new DataColumn("Price"),
                new DataColumn("Quantity"),
                new DataColumn("Total")
                });
                ViewState["Bill"]=dt;
                this.BindGrid();
            }
        }

        private void BindGrid()
        {
            BillingGV.DataSource=(DataTable)ViewState["Bill"];
            BillingGV.DataBind();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            // Required for rendering controls
        }
        private void ShowProducts()
        {
            string Query = "select PrId as Id, PrName as Name, PrCat as Category, PrPrice as Price, PrQty as Quantity from ProductTb";
            ProductGv.DataSource = Con.getData(Query);
            ProductGv.DataBind();
        }
        int key = 0;
        int stock;
        protected void ProductGv_SelectedIndexChanged(object sender, EventArgs e)
        {
            PNameTb.Value = ProductGv.SelectedRow.Cells[2].Text;
            PrPriceTb.Value = ProductGv.SelectedRow.Cells[3].Text;
           // PrQtyTb.Value = ProductGv.SelectedRow.Cells[4].Text;
            stock = Convert.ToInt32(ProductGv.SelectedRow.Cells[5].Text);
            if (stock <= 0) {
                Errmsg.InnerText= "Sold Out";
            }else{
            Errmsg.InnerText = ""+stock;
            }

            if (PNameTb.Value == "")
            {
                key = 0;
            }
            else
            {
                key = Convert.ToInt32(ProductGv.SelectedRow.Cells[1].Text);
            }
        }
        private void UpdateStock() {



            int newQty;
            newQty = Convert.ToInt32(ProductGv.SelectedRow.Cells[5].Text) - Convert.ToInt32(PrQtyTb.Value);
            string Query = "update ProductTb set PrQty='{0}' where PrId={1}";
            Query = string.Format(Query, newQty, ProductGv.SelectedRow.Cells[1].Text);
            Con.SetData(Query);
            ShowProducts();
            Errmsg.InnerText = "Quantity Updated.....!";
        }


        long GrdTotal = 0;
        protected void AddToBill_Click(object sender, EventArgs e)
        {
            int total = Convert.ToInt32(PrQtyTb.Value) * Convert.ToInt32(PrPriceTb.Value);
            DataTable dt=(DataTable)ViewState["Bill"];
            dt.Rows.Add(BillingGV.Rows.Count + 1, PNameTb.Value.Trim(), PrQtyTb.Value.Trim(), PrPriceTb.Value.Trim(),total);

            ViewState["Bill"]=dt;
            this.BindGrid();
            UpdateStock();
            GrdTotal = GrdTotal + (Convert.ToInt32(PrQtyTb.Value) * Convert.ToInt32(PrPriceTb.Value));
            GrdTotTb.InnerText = "Rs " + GrdTotal;
            PNameTb.Value = string.Empty;
            PrPriceTb.Value = string.Empty;
            PrQtyTb.Value = string.Empty;
        }

        
    }
}