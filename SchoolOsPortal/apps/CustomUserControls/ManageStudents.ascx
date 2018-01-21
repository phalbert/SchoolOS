﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageStudents.ascx.cs" Inherits="CustomUserControls_ManageStudents" %>
<%@ Register TagPrefix="uc" TagName="SaveStudentsUserControl" Src="~/CustomUserControls/SaveStudent.ascx" %>
<%@ Register TagPrefix="uc" TagName="AdmitStudentsUserControl" Src="~/CustomUserControls/ApproveStudents.ascx" %>
<%@ Register TagPrefix="uc" TagName="ListStudentsUserControl" Src="~/CustomUserControls/ListStudents.ascx" %>
<%@ Register TagPrefix="uc" TagName="BulkStudentUploadUserControl" Src="~/CustomUserControls/BulkStudentUpload.ascx" %>
<%@ Register TagPrefix="uc" TagName="PromoteStudentsUserControl" Src="~/CustomUserControls/PromoteStudents.ascx" %>
<%@ Register TagPrefix="uc" TagName="ListAlumniUserControl" Src="~/CustomUserControls/ListSchoolAlumni.ascx" %>



<!------------------------------------------------------- Main content --------------------------------------->
<div class="row">
    <ul class="nav nav-tabs" style="padding-top: 50px;">
        <li id="ListStudentsLink" runat="server" class="active">
            <asp:LinkButton ID="ListStudentsLinkButton" runat="server" OnClick="btnTabPane_Click">View Students</asp:LinkButton></li>
        <li id="SaveStudentsLink" runat="server">
            <asp:LinkButton ID="SaveStudentsLinkButton" runat="server" OnClick="btnTabPane_Click">Save Student</asp:LinkButton></li>
        <li id="AdmitStudentsLink" runat="server">
            <asp:LinkButton ID="AdmitStudentsLinkButton" runat="server" OnClick="btnTabPane_Click">Admit Students</asp:LinkButton></li>
        <li id="PromoteStudentsLink" runat="server">
            <asp:LinkButton ID="PromoteStudentsLinkButton" runat="server" OnClick="btnTabPane_Click">Promote/Demote Students</asp:LinkButton></li>
        <li id="BulkStudentUploadLink" runat="server">
            <asp:LinkButton ID="BulkStudentUploadLinkButton" runat="server" OnClick="btnTabPane_Click">Students Bulk Upload</asp:LinkButton></li>
        <li id="ListAlumniUserLink" runat="server">
            <asp:LinkButton ID="ListAlumniUserLinkButton" runat="server" OnClick="btnTabPane_Click">Alumni</asp:LinkButton></li>
    </ul>
</div>

<div class="container" style="margin-top: 30px;">
    <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
        <asp:View ID="ListStudentsView" runat="server">
            <uc:ListStudentsUserControl ID="ListStudentsUserControl" runat="server" />
        </asp:View>
        <asp:View ID="SaveStudentsView" runat="server">
            <uc:SaveStudentsUserControl ID="SaveStudentsUserControl" runat="server" />
        </asp:View>
        <asp:View ID="AdmitStudentsView" runat="server">
            <uc:AdmitStudentsUserControl ID="AdmitStudentsUserControl" runat="server" />
        </asp:View>
        <asp:View ID="PromoteStudentsView" runat="server">
            <uc:PromoteStudentsUserControl ID="PromoteStudentsUserControl" runat="server" />
        </asp:View>
        <asp:View ID="BulkStudentUploadView" runat="server">
            <uc:BulkStudentUploadUserControl ID="BulkStudentUploadUserControl" runat="server" />
        </asp:View>
        <asp:View ID="ListAlumniUserView" runat="server">
            <uc:ListAlumniUserControl ID="ListAlumniUserControl" runat="server" />
        </asp:View>
    </asp:MultiView>
</div>
<!-------------------------------------------------------- /.content ----------------------------------------->