<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ManageUserProfile.aspx.cs" Inherits="ManageUserProfile" %>

<%@ Register TagPrefix="uc" TagName="SaveSystemUsersControl" Src="~/CustomUserControls/SaveSystemUser.ascx" %>
<%@ Register TagPrefix="uc" TagName="ChangePasswordUserControl" Src="~/CustomUserControls/ChangePassword.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        .daterangepicker.opensleft:after {
            display: none;
        }

        .date-picker-wrapper {
            z-index: 2;
        }

        .form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control {
            background-color: #fff;
        }

        .daterangepicker.opensright:after {
            content: none;
        }
    </style>

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!---------------------------------- Left side column. contains the logo and sidebar ---------------------------------------->

        <aside class="right-side" style="padding-left:20px;">
           
            <!------------------------------------------------------- Main content --------------------------------------->
            <div class="row">
                <ul class="nav nav-tabs" style="padding-top: 50px;">
                    <li id="ChangePasswordLink" runat="server" class="active">
                        <asp:LinkButton ID="ChangePasswordLinkButton" runat="server" OnClick="btnTabPane_Click">Change Password</asp:LinkButton></li>
                    <li id="SaveSystemUsersLink" runat="server" >
                        <asp:LinkButton ID="SaveSystemUsersLinkButton" runat="server" OnClick="btnTabPane_Click">Change User Details</asp:LinkButton></li>
                     
                </ul>
            </div>

            <div class="container" style="margin-top: 30px;">
                <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
                    <asp:View ID="ChangePasswordView" runat="server">
                        <uc:ChangePasswordUserControl ID="ChangePasswordUserControl" runat="server" />
                    </asp:View>
                    <asp:View ID="SaveSystemUsersView" runat="server">
                        <uc:SaveSystemUsersControl ID="SaveSystemUsersControl" runat="server" />
                    </asp:View>
                </asp:MultiView>
            </div>
            <!-------------------------------------------------------- /.content ----------------------------------------->
           
        </aside>
    </div>

</asp:Content>
