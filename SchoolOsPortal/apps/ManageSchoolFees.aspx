<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="ManageSchoolFees.aspx.cs" Inherits="ManageSchoolFees" %>

<%@ Register TagPrefix="uc" TagName="SaveFeeUserControl" Src="~/CustomUserControls/SaveFee.ascx" %>
<%@ Register TagPrefix="uc" TagName="ApproveFeesUserControl" Src="~/CustomUserControls/ApproveFees.ascx" %>
<%@ Register TagPrefix="uc" TagName="ListFeesUserControl" Src="~/CustomUserControls/ListFees.ascx" %>
<%@ Register TagPrefix="uc" TagName="AssignFeesUserControl" Src="~/CustomUserControls/AssignFees.ascx" %>
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
                    <li id="ListFeesLink" runat="server" class="active">
                        <asp:LinkButton ID="ListFeesLinkButton" runat="server" OnClick="btnTabPane_Click">View School Fees</asp:LinkButton></li>
                    <li id="SaveFeeLink" runat="server" >
                        <asp:LinkButton ID="SaveFeeLinkButton" runat="server" OnClick="btnTabPane_Click">Save School Fee</asp:LinkButton></li>
                    <li id="ApproveFeesLink" runat="server">
                        <asp:LinkButton ID="ApproveFeesLinkButton" runat="server" OnClick="btnTabPane_Click">Approve School Fees</asp:LinkButton></li>
                      <li id="AssignFeesLink" runat="server">
                        <asp:LinkButton ID="AssignFeesLinkButton" runat="server" OnClick="btnTabPane_Click">Assign School Fees</asp:LinkButton></li>
                </ul>
            </div>

            <div class="container" style="margin-top: 30px;">
                <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
                    <asp:View ID="ListFeesView" runat="server">
                        <uc:ListFeesUserControl ID="ListFeesUserControl" runat="server" />
                    </asp:View>
                    <asp:View ID="SaveFeeView" runat="server">
                        <uc:SaveFeeUserControl ID="SaveFeeUserControl" runat="server" />
                    </asp:View>
                    <asp:View ID="ApproveFeesView" runat="server">
                        <uc:ApproveFeesUserControl ID="ApproveFeesUserControl" runat="server" />
                    </asp:View>
                     <asp:View ID="AssignFeesView" runat="server">
                        <uc:AssignFeesUserControl ID="AssignFeesUserControl" runat="server" />
                    </asp:View>
                </asp:MultiView>
            </div>
            <!-------------------------------------------------------- /.content ----------------------------------------->
           
        </aside>
    </div>

</asp:Content>
