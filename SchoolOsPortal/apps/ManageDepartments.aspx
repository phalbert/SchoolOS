<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="ManageDepartments.aspx.cs" Inherits="ManageDepartments" %>

<%@ Register TagPrefix="uc" TagName="ListDepartmentsUserControl" Src="~/CustomUserControls/ListDepartments.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveDepartmentUserControl" Src="~/CustomUserControls/CommingSoon.ascx" %>

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
                    <li id="ListDepartmentsLink" runat="server" class="active">
                        <asp:LinkButton ID="ListDepartmentsLinkButton" runat="server" OnClick="btnTabPane_Click">View Departments</asp:LinkButton></li>
                    <li id="SaveDepartmentLink" runat="server" >
                        <asp:LinkButton ID="SaveDepartmentLinkButton" runat="server" OnClick="btnTabPane_Click">Save Department</asp:LinkButton></li>
                </ul>
            </div>

            <div class="container" style="margin-top: 30px;">
                <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
                    <asp:View ID="ListDepartmentsView" runat="server">
                        <uc:ListDepartmentsUserControl ID="ListDepartmentsUserControl" runat="server" />
                    </asp:View>
                    <asp:View ID="SaveDepartmentView" runat="server">
                        <uc:SaveDepartmentUserControl ID="SaveDepartmentUserControl" runat="server" />
                    </asp:View>
                </asp:MultiView>
            </div>
            <!-------------------------------------------------------- /.content ----------------------------------------->
           
        </aside>
    </div>
</asp:Content>