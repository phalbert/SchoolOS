<%@ Page Language="C#" MasterPageFile="~/Main.master" Title="Change Password" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="panel" style="padding-top:50px">
        <div class="panel-body">
            <div class="col-lg-3">
            </div>
            <div class="col-lg-6">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <asp:Label ID="lblMsg" runat="server">Change Your Password Using Form Below</asp:Label>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <label>
                                    Old Password</label>
                                <asp:TextBox runat="server" ID="txtOldPassword" TextMode="Password" CssClass="form-control" Text="" />
                                <p class="help-block">
                                    Your current Password</p>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-lg-6">
                                <label>
                                    New Password</label>
                                <asp:TextBox runat="server" ID="txtNewPassword" TextMode="Password" CssClass="form-control" Text="" />
                                <p class="help-block">
                                    Your New Password</p>
                            </div>
                            <div class="col-lg-6">
                                <label>
                                    Confirm Password</label>
                                <asp:TextBox runat="server" ID="txtConfirmPassword" TextMode="Password" CssClass="form-control" Text="" />
                                <p class="help-block">
                                    Confirm Your New Password. Renter it.</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="text-center">
                                <asp:Button ID="btnSave" CssClass="btn btn-success" Text="Save Details" Width="200"
                                    runat="server" OnClick="btnSave_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
            </div>
        </div>
    </div>
    <hr />
    <br />
    <div class="panel" style="padding-top:50px" id="resetPanel" runat="server" visible="false">
        <div class="panel-body">
            <div class="col-lg-3">
            </div>
            <div class="col-lg-6">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <asp:Label ID="otherLbl" runat="server">Reset user credentials</asp:Label>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <label>
                                    User Id</label>
                                <asp:TextBox runat="server" ID="txtUserValue" CssClass="form-control" Text="" />
                                <p class="help-block">
                                    Your current Password</p>
                            </div>
                            <div class="col-lg-6">
                                <label>
                                    Search User</label>
                                <asp:Button ID="Button2" CssClass="btn btn-success" Text="Search" Width="200"
                                    runat="server" OnClick="btnSearch_Click" />
                                <p class="help-block">
                                    Search for a user using their id</p>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-lg-6">
                                <label>
                                    Name</label>
                                <asp:TextBox runat="server" ID="txtName"  Enabled="false" CssClass="form-control" Text="" />
                                <p class="help-block">
                                    User's full name</p>
                            </div>
                            <div class="col-lg-6">
                                <label>
                                    User Type</label>
                                <asp:TextBox runat="server" ID="txtType" CssClass="form-control" Text="" Enabled="false"/>
                                <p class="help-block">
                                    The user's type in the system</p>
                            </div>
                        </div>
                        <div class="row" runat="server" id="customersBlock">
                            <div class="col-lg-6">
                                <label>
                                    Merchant</label>
                                <asp:TextBox runat="server" ID="txtMerchant" Enabled="false" CssClass="form-control" Text="" />
                                <p class="help-block">
                                    User's Account</p>
                            </div>
                            <div class="col-lg-6">
                                <label>Credentials</label>
                                 <asp:DropDownList ID="ddCredType" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="Password" Value="PASSWORD"></asp:ListItem>
                                    <asp:ListItem Text="Pin" Value="PIN"></asp:ListItem>                                    
                                </asp:DropDownList><p class="help-block">
                                    Choose credentials to reset</p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="text-center">
                                <asp:Button ID="Button1" CssClass="btn btn-success" Text="Reset" Width="200"
                                    runat="server" OnClick="btnChange_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
            </div>
        </div>
    </div>
</asp:Content>
