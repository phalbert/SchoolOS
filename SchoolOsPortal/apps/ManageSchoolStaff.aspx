<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="ManageSchoolStaff.aspx.cs" Inherits="ManageSchoolStaff" %>


<%@ Register TagPrefix="uc" TagName="ListStaffMembersUserControl" Src="~/CustomUserControls/ListStaffMembers.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveStaffMembersUserControl" Src="~/CustomUserControls/SaveStaffMembers.ascx" %>
<%@ Register TagPrefix="uc" TagName="ApproveStaffMembersUserControl" Src="~/CustomUserControls/ApproveStaffMembers.ascx" %>


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

        <aside class="right-side" style="padding-left: 20px;">

            <!------------------------------------------------------- Main content --------------------------------------->
            <div class="row">
                <ul class="nav nav-tabs" style="padding-top: 50px;">
                    <li id="ListStaffMembersLink" runat="server" class="active">
                        <asp:LinkButton ID="ListStaffMembersLinkButton" runat="server" OnClick="btnTabPane_Click">View School Staff</asp:LinkButton></li>
                    <li id="SaveStaffMembersLink" runat="server">
                        <asp:LinkButton ID="SaveStaffMembersLinkButton" runat="server" OnClick="btnTabPane_Click">Save Staff Member</asp:LinkButton></li>
                    <li id="ApproveStaffMembersLink" runat="server">
                        <asp:LinkButton ID="ApproveStaffMembersLinkButton" runat="server" OnClick="btnTabPane_Click">Approve Staff Member</asp:LinkButton></li>
                </ul>
            </div>

            <div class="container" style="margin-top: 30px;">
                <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
                    <asp:View ID="ListStaffMembersView" runat="server">
                        <uc:ListStaffMembersUserControl ID="ListStaffMembersUserControl" runat="server" />
                    </asp:View>
                    <asp:View ID="SaveStaffMembersView" runat="server">
                        <uc:SaveStaffMembersUserControl ID="SaveStaffMembersUserControl" runat="server" />
                    </asp:View>
                    <asp:View ID="ApproveStaffMembersView" runat="server">
                        <uc:ApproveStaffMembersUserControl ID="ApproveStaffMembersUserControl" runat="server" />
                    </asp:View>
                </asp:MultiView>
            </div>
            <!-------------------------------------------------------- /.content ----------------------------------------->

        </aside>
    </div>
</asp:Content>
