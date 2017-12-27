<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="ManageSchools.aspx.cs" Inherits="ManageSchools" %>


<%@ Register TagPrefix="uc" TagName="ListSchoolsUserControl" Src="~/CustomUserControls/ListSchools.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveSchoolsUserControl" Src="~/CustomUserControls/SaveSchool.ascx" %>
<%@ Register TagPrefix="uc" TagName="AprroveSchoolsUserControl" Src="~/CustomUserControls/ApproveSchools.ascx" %>

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
                    <li id="ListSchoolsLink" runat="server" class="active">
                        <asp:LinkButton ID="ListSchoolsLinkButton" runat="server" OnClick="btnTabPane_Click">View Schools</asp:LinkButton></li>
                    <li id="SaveSchoolsLink" runat="server" >
                        <asp:LinkButton ID="SaveSchoolsLinkButton" runat="server" OnClick="btnTabPane_Click">Save School</asp:LinkButton></li>
                    <li id="ApproveSchoolsLink" runat="server">
                        <asp:LinkButton ID="ApproveSchoolsLinkButton" runat="server" OnClick="btnTabPane_Click">Approve Schools</asp:LinkButton></li>
                </ul>
            </div>

            <div class="container" style="margin-top: 30px;">
                <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
                    <asp:View ID="ListSchoolsView" runat="server">
                        <uc:ListSchoolsUserControl ID="ListSchoolsUserControl" runat="server" />
                    </asp:View>
                    <asp:View ID="SaveSchoolsView" runat="server">
                        <uc:SaveSchoolsUserControl ID="SaveSchoolsUserControl" runat="server" />
                    </asp:View>
                    <asp:View ID="ApproveSchoolsView" runat="server">
                        <uc:AprroveSchoolsUserControl ID="ApproveSchoolsUserControl" runat="server" />
                    </asp:View>
                </asp:MultiView>
            </div>
            <!-------------------------------------------------------- /.content ----------------------------------------->
           
        </aside>
    </div>

</asp:Content>
