<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="ManageSubjectResults.aspx.cs" Inherits="ManageSubjectResults" %>

<%@ Register TagPrefix="uc" TagName="ListClassesUserControl" Src="~/CustomUserControls/ListSubjectResults.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveClassUserControl" Src="~/CustomUserControls/SaveStudentResults.ascx" %>
<%@ Register TagPrefix="uc" TagName="ListStudentsUserControl" Src="~/CustomUserControls/ListStudents.ascx" %>
<%@ Register TagPrefix="uc" TagName="BulkSubjectResultsUploadUserControl" Src="~/CustomUserControls/CommingSoon.ascx" %>

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
                    <li id="ListStudentsLink" runat="server" class="active">
                        <asp:LinkButton ID="ListStudentsLinkButton" runat="server" OnClick="btnTabPane_Click">View Students</asp:LinkButton></li>
                    <li id="ListClassesLink" runat="server" class="active">
                        <asp:LinkButton ID="ListClassesLinkButton" runat="server" OnClick="btnTabPane_Click">View Results</asp:LinkButton></li>
                    <li id="SaveClassLink" runat="server" >
                        <asp:LinkButton ID="SaveClassLinkButton" runat="server" OnClick="btnTabPane_Click">Save Result</asp:LinkButton></li>
                    <li id="BulkSubjectResultsUploadLink" runat="server" >
                        <asp:LinkButton ID="BulkSubjectResultsUploadLinkButton" runat="server" OnClick="btnTabPane_Click">Bulk Subject Result Upload</asp:LinkButton></li>
                </ul>
            </div>

            <div class="container" style="margin-top: 30px;">
                <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
                    <asp:View ID="ListStudentsView" runat="server">
                        <uc:ListStudentsUserControl ID="ListStudentsUserControl" runat="server" />
                    </asp:View>
                    <asp:View ID="ListClassesUserView" runat="server">
                        <uc:ListClassesUserControl ID="ListClassesUserControl" runat="server" />
                    </asp:View>
                    <asp:View ID="SaveClassView" runat="server">
                        <uc:SaveClassUserControl ID="SaveClassUserControl" runat="server" />
                    </asp:View>
                    <asp:View ID="BulkSubjectResultsUploadView" runat="server">
                        <uc:BulkSubjectResultsUploadUserControl ID="BulkSubjectResultsUploadUserControl" runat="server" />
                    </asp:View>
                </asp:MultiView>
            </div>
            <!-------------------------------------------------------- /.content ----------------------------------------->
           
        </aside>
    </div>

</asp:Content>
