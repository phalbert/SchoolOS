<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ManageSchoolTerms.aspx.cs" Inherits="ManageSchoolTerms" %>

<%@ Register TagPrefix="uc" TagName="ListTermsUserControl" Src="~/CustomUserControls/ListSchoolTerms.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveTermUserControl" Src="~/CustomUserControls/SaveSchoolTerm.ascx" %>

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
                    <li id="ListTermsLink" runat="server" class="active">
                        <asp:LinkButton ID="ListTermsLinkButton" runat="server" OnClick="btnTabPane_Click">View Semesters</asp:LinkButton></li>
                    <li id="SaveTermLink" runat="server" >
                        <asp:LinkButton ID="SaveTermLinkButton" runat="server" OnClick="btnTabPane_Click">Save Semesters</asp:LinkButton></li>
                </ul>
            </div>

            <div class="container" style="margin-top: 30px;">
                <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
                    <asp:View ID="ListTermsView" runat="server">
                        <uc:ListTermsUserControl ID="ListTermsUserControl" runat="server" />
                    </asp:View>
                    <asp:View ID="SaveTermView" runat="server">
                        <uc:SaveTermUserControl ID="SaveTermUserControl" runat="server" />
                    </asp:View>
                </asp:MultiView>
            </div>
            <!-------------------------------------------------------- /.content ----------------------------------------->
           
        </aside>
    </div>

</asp:Content>