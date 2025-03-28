<%@ Page Title="" Language="C#" MasterPageFile="~/View/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Sellers.aspx.cs" Inherits="GroceryShop.View.Admin.Sellers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style> 
        .form-label { 
            margin-bottom: 10px; /* Adjust the value as needed */ 
        }
        .form-group {
            margin-bottom: 20px;
        }
        .text-danger {
            color: #FF5050;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="mybody" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-8"><br /><img src="../../Assest/Images/diet.png"/><h3>Manage Sellers</h3></div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <h2>Sellers Details</h2>
                <div class="form-group">
                    <label for="SNameTb" class="form-label" style="color: Navy">Seller Name </label>
                    &nbsp;<input type="text" class="form-control" id="SNameTb" runat="server">
                </div>
                <div class="form-group">
                    <label for="SEmailTb" class="form-label" style="color: Navy">Seller Email&nbsp; </label>
                    &nbsp;<input type="text" class="form-control" id="SEmailTb" runat="server">
                    <asp:RegularExpressionValidator 
                        ID="RegularExpressionValidator1" runat="server" ControlToValidate="SEmailTb" 
                        Display="Dynamic" ErrorMessage="*Please Enter Valid Email" 
                        ForeColor="#FF5050" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="sellerPassTb" class="form-label" style="color: Navy">Seller Password&nbsp; </label>
                    &nbsp;<input type="text" class="form-control" id="sellerPassTb" runat="server">
                </div>
                <div class="form-group">
                    <label for="PhoneTb" class="form-label" style="color: Navy">Seller Phone Number&nbsp; </label>
                    &nbsp;<input type="text" class="form-control" id="PhoneTb" runat="server">
                    <asp:RegularExpressionValidator 
                        ID="RegularExpressionValidator2" runat="server" ControlToValidate="PhoneTb" 
                        Display="Dynamic" ErrorMessage="*Enter Valid Number" ForeColor="#FF5050" 
                        ValidationExpression="(0|91)?[6-9][0-9]{9}"></asp:RegularExpressionValidator>
                </div>
                <div class="form-group">
                    <label for="SellAddressTb" class="form-label" style="color: Navy">Seller Address&nbsp; </label>
                    &nbsp;<input type="text" class="form-control" id="SellAddressTb" runat="server">
                </div>
                <label id="Errmsg" runat="server" class="text-danger"></label><br /><br />
                <asp:Button ID="SaveBtn" Text="SAVE" CssClass="btn btn-primary btn-block" runat="server" OnClick="SaveBtn_Click"/>
                <asp:Button ID="UpdateBtn" Text="UPDATE" CssClass="btn btn-primary btn-block" runat="server" OnClick="UpdateBtn_Click"/>
                <asp:Button ID="DeleteBtn" Text="DELETE" CssClass="btn btn-primary btn-block" runat="server" OnClick="DeleteBtn_Click"/>
                <asp:Button ID="ResetBtn" Text="RESET" CssClass="btn btn-primary btn-block" runat="server" onclick="ResetBtn_Click"/>
            </div>
            <div class="col-md-8">
                <asp:GridView runat="server" CssClass="table table-hover" ID="SellerGv" 
                    AutoGenerateSelectButton="True" 
                    OnSelectedIndexChanged="SellerGv_SelectedIndexChanged"></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
