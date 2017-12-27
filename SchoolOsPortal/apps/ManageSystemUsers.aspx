<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="ManageSystemUsers.aspx.cs" Inherits="ManageSystemUsers" %>

<%@ Register TagPrefix="uc" TagName="ListSystemUsersControl" Src="~/CustomUserControls/ListSystemUsers.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveSystemUsersControl" Src="~/CustomUserControls/SaveSystemUser.ascx" %>
<%@ Register TagPrefix="uc" TagName="ApproveSystemUsersControl" Src="~/CustomUserControls/ApproveSystemUsers.ascx" %>

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
                    <li id="ListSystemUsersLink" runat="server" class="active">
                        <asp:LinkButton ID="ListSystemUsersLinkButton" runat="server" OnClick="btnTabPane_Click">View System Users</asp:LinkButton></li>
                    <li id="SaveSystemUsersLink" runat="server" >
                        <asp:LinkButton ID="SaveSystemUsersLinkButton" runat="server" OnClick="btnTabPane_Click">Save System User</asp:LinkButton></li>
                      <li id="ApproveSystemUsersLink" runat="server" >
                        <asp:LinkButton ID="ApproveSystemUsersLinkButton" runat="server" OnClick="btnTabPane_Click">Approve New System Users</asp:LinkButton></li>
                </ul>
            </div>

            <div class="container" style="margin-top: 30px;">
                <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
                    <asp:View ID="ListSystemUsersView" runat="server">
                        <uc:ListSystemUsersControl ID="ListSystemUsersControl" runat="server" />
                    </asp:View>
                    <asp:View ID="SaveSystemUsersView" runat="server">
                        <uc:SaveSystemUsersControl ID="SaveSystemUsersControl" runat="server" />
                    </asp:View>
                    <asp:View ID="ApproveSystemUsersView" runat="server">
                        <uc:ApproveSystemUsersControl ID="ApproveSystemUsersControl" runat="server" />
                    </asp:View>
                </asp:MultiView>
            </div>
            <!-------------------------------------------------------- /.content ----------------------------------------->
           
        </aside>
    </div>

</asp:Content>
