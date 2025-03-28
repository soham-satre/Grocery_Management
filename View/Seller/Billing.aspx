<%@ Page Title="" Language="C#" MasterPageFile="~/View/Seller/SellerMaster.Master"
    AutoEventWireup="true" CodeBehind="Billing.aspx.cs" Inherits="GroceryShop.View.Seller.Billing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style> 
        .form-label { 
            margin-bottom: 25px; /* Adjust the value as needed */ 
        } 
    </style>
<script type="text/javascript">
    function PrintPanel() {
        var PGrid = document.getElementById('<%=BillingGV.ClientID %>');
        PGrid.border = 0;
        var Pwin = window.open('', 'PrintGrid', 'left=100, top=100,width=1024,height=768,toolbar=0,scrollbars=1,status=0,resizable=1');
        Pwin.document.write('<html><head><title>Print Grid</title></head><body>');
        Pwin.document.write(PGrid.outerHTML);
        Pwin.document.write('</body></html>');
        Pwin.document.close();
        Pwin.focus();
        Pwin.print();
        Pwin.close();
    }
</script>

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="row">
                    <div class="col">
                    <br />
                        <div class="mb-3">
                            <label for="PNameTb" class="form-label" style="color: Navy">Product Name</label>
                            <input type="text" class="form-control" id="PNameTb" runat="server" required="required">
                        </div>
                        <div class="mb-3">
                            <label for="PNameTb" class="form-label" style="color: Navy">Product Price</label>
                            <input type="text" class="form-control" id="PrPriceTb" runat="server" required="required">
                        </div>
                        <div class="mb-3">
                            <label for="PNameTb" class="form-label" style="color: Navy">Product Quantity</label>
                            <input type="text" class="form-control" id="PrQtyTb" runat="server" required="required">
                        </div>
                    </div>
                    <div class="col">
                    <img src="../../Assest/Images/dollar.png" alt="Doller Sign"/><br /><br />
                     <label id="Errmsg" runat="server" class="text-danger"></label><br /><br /><br /><br />
                <asp:Button ID="AddToBill" Text="AddToBill" CssClass="btn btn-warning btn-block" 
                            runat="server" onclick="AddToBill_Click" />
                <asp:Button ID="Reset" Text="Reset" CssClass="btn btn-primary btn-block" runat="server"/>
                    </div>
                </div> 
                <div class="row">
                    <div class="col">
                      <asp:GridView runat="server" CssClass="table table-hover" ID="ProductGv"
                    AutoGenerateSelectButton="True" 
                            onselectedindexchanged="ProductGv_SelectedIndexChanged" ></asp:GridView>
                    </div>
                </div>
            </div>

            <div class="col-md-7">
                <div class="row">
                <div class="col-3"></div>
               <div class="col"> <h1 class="table-warning pl-2">Client Billing</h1></div>
                </div>
                <div class="row">
                    <asp:GridView ID="BillingGV" runat="server" class="table">
                    </asp:GridView>
                </div>
                <div class="row">
                <div class="col"></div>
                <div class="col"><h3 id="GrdTotTb" class="table-success" runat="server"></h3></div>
                <div class="col d-grid"><asp:Button ID="PrintBtn" Text="Bill" 
                        CssClass="btn btn-warning btn-block" runat="server" onClientClick="PrintPanel()"/></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
