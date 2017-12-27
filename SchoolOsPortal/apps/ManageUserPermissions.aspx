<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ManageUserPermissions.aspx.cs" Inherits="ManageUserPermissions" %>

<%@ Register TagPrefix="uc" TagName="SaveUserTypeUserControl" Src="~/CustomUserControls/SaveUserType.ascx" %>
<%@ Register TagPrefix="uc" TagName="ListUserTypesUserControl" Src="~/CustomUserControls/ListUserTypes.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveSublinkUserControl" Src="~/CustomUserControls/SaveSublink.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveMainLinkUserControl" Src="~/CustomUserControls/SaveMainLink.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveMenuItemUserControl" Src="~/CustomUserControls/SaveMenuItem.ascx" %>
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
                    <li id="ListUserTypesLink" runat="server" class="active">
                        <asp:LinkButton ID="ListUserTypesLinkButton" runat="server" OnClick="btnTabPane_Click">View UserTypes</asp:LinkButton></li>
                    <li id="SaveUserTypeLink" runat="server" >
                        <asp:LinkButton ID="SaveUserTypeLinkButton" runat="server" OnClick="btnTabPane_Click">Save UserType</asp:LinkButton></li>
                    <li id="SaveSublink" runat="server">
                        <asp:LinkButton ID="SaveSublinkButton" runat="server" OnClick="btnTabPane_Click">Save SubLink</asp:LinkButton></li>
                      <li id="SaveMainLink" runat="server">
                        <asp:LinkButton ID="SaveMainLinkButton" runat="server" OnClick="btnTabPane_Click">Save MainLink</asp:LinkButton></li>
                       <li id="SaveMenuItemLink" runat="server">
                        <asp:LinkButton ID="SaveMenuItemLinkButton" runat="server" OnClick="btnTabPane_Click">Save Menu Item</asp:LinkButton></li>
                </ul>
            </div>

            <div class="container" style="margin-top: 30px;">
                <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
                    <asp:View ID="ListUserTypesView" runat="server">
                        <uc:ListUserTypesUserControl ID="ListUserTypesUserControl" runat="server" />
                    </asp:View>
                    <asp:View ID="SaveUserTypeView" runat="server">
                        <uc:SaveUserTypeUserControl ID="SaveUserTypeUserControl" runat="server" />
                    </asp:View>
                    <asp:View ID="SaveSublinkView" runat="server">
                        <uc:SaveSublinkUserControl ID="SaveSublinkUserControl" runat="server" />
                    </asp:View>
                     <asp:View ID="SaveMainLinkView" runat="server">
                        <uc:SaveMainLinkUserControl ID="SaveMainLinkUserControl" runat="server" />
                    </asp:View>
                      <asp:View ID="SaveMenuItemView" runat="server">
                        <uc:SaveMenuItemUserControl ID="SaveMenuItemUserControl" runat="server" />
                    </asp:View>
                </asp:MultiView>
            </div>
            <!-------------------------------------------------------- /.content ----------------------------------------->
           
        </aside>
    </div>

</asp:Content>

