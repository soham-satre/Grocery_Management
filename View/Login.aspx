<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GroceryShop.View.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Login</title>
    <link rel="stylesheet" href="../Assest/lib/Bootstrap/css/bootstrap.min.css" />
</head>
<body>
    <div class="container-fluid">
        <div class="row" style="height: 90px">
        </div>
        
        <div class="row">
            <div class="col-md-2">
            </div>
            <div class="col-md-4">
                <img src="../Assest/Images/Grocery.png" class="img-fluid" alt="Grocery Shop">
            </div>
            <div class="col-md-4">
                <h1 style="color: Navy">Sign Up</h1>
                <form id="form1" runat="server">
                    <div class="mb-3">
                        <label id="Label1" for="EmailId" class="form-label" style="color: Navy" runat="server">Email address</label>
                        <input type="text" class="form-control" id="EmailId" aria-describedby="emailHelp" required="required" runat="server">
                    </div>
                    <div class="mb-3">
                        <label id="Label2" for="UserPasswordTb" class="form-label" style="color: Navy" runat="server">Password</label>
                        <input type="password" class="form-control" id="UserPasswordTb" required="required" runat="server">
                    </div>
                    <div class="mb-3 form-check">
                        <input class="form-check-input" type="radio" name="Radio" id="SellerRadio" runat="server">
                        <label class="form-check-label" for="SellerRadio" style="color: Navy">Seller</label>
                    </div>
                    <div class="mb-4 form-check">
                        <input class="form-check-input" type="radio" name="Radio" id="AdminRadio" checked="true" runat="server">
                        <label class="form-check-label" for="AdminRadio" style="color: Navy">Admin</label>
                    </div>
                    <div class="mb-3 d-grid">
                        <label id="InfoMsg" runat="server"></label>
                        <asp:Button ID="LoginBtn" Text="LOGIN" CssClass="btn btn-primary btn-block" runat="server" OnClick="SaveBtn_Click"/>
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
