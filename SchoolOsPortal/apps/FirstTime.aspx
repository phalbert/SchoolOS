<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="FirstTime.aspx.cs" Inherits="FirstTime" %>

<%@ Register TagPrefix="uc" TagName="ManageSchoolUserControl" Src="~/CustomUserControls/ManageSchool.ascx" %>
<%@ Register TagPrefix="uc" TagName="ManageStreamsUserControl" Src="~/CustomUserControls/ManageStreams.ascx" %>
<%@ Register TagPrefix="uc" TagName="ManageSubjectsUserControl" Src="~/CustomUserControls/ManageSubjects.ascx" %>
<%@ Register TagPrefix="uc" TagName="ManageStudentsUserControl" Src="~/CustomUserControls/ManageStudents.ascx" %>
<%@ Register TagPrefix="uc" TagName="ManageStaffUserControl" Src="~/CustomUserControls/ManageStaff.ascx" %>
<%@ Register TagPrefix="uc" TagName="ManageSchoolFeesUserControl" Src="~/CustomUserControls/ManageSchoolFees.ascx" %>
<%@ Register TagPrefix="uc" TagName="ManageStudentPaymentsUserControl" Src="~/CustomUserControls/ManageStudentPayments.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!---------------------------------- Left side column. contains the logo and sidebar ---------------------------------------->

        <aside class="right-side" style="padding-left: 20px;">
            <!------------------------------------------------------- Main content --------------------------------------->
            <div class="row">
                <ul class="nav nav nav-pills" style="padding-top: 50px;">
                    <li id="ManageSchoolLink" runat="server" class="active">
                        <asp:LinkButton ID="ManageSchoolLinkButton" runat="server" OnClick="btnTabPane_Click">Edit School Details</asp:LinkButton></li>
                    <li id="ManageStreamsLink" runat="server" class="active">
                        <asp:LinkButton ID="ManageStreamsLinkButton" runat="server" OnClick="btnTabPane_Click">Create Class Streams</asp:LinkButton></li>
                    <li id="ManageSubjectsLink" runat="server" class="active">
                        <asp:LinkButton ID="ManageSubjectsLinkButton" runat="server" OnClick="btnTabPane_Click">Create Subjects</asp:LinkButton></li>
                    <li id="ManageStudentsLink" runat="server" class="active">
                        <asp:LinkButton ID="ManageStudentsLinkButton" runat="server" OnClick="btnTabPane_Click">Create Students</asp:LinkButton></li>
                    <li id="ManageStaffLink" runat="server" class="active">
                        <asp:LinkButton ID="ManageStaffLinkButton" runat="server" OnClick="btnTabPane_Click">Create Teachers</asp:LinkButton></li>
                    <li id="ManageSchoolFeesLink" runat="server" class="active">
                        <asp:LinkButton ID="ManageSchoolFeesLinkButton" runat="server" OnClick="btnTabPane_Click">Add School Fees</asp:LinkButton></li>
                    <li id="ManageStudentPaymentsLink" runat="server" class="active">
                        <asp:LinkButton ID="ManageStudentPaymentsLinkButton" runat="server" OnClick="btnTabPane_Click">Assign Fees to Students</asp:LinkButton></li>
                </ul>
            </div>

            <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
                <asp:View ID="ManageSchoolView" runat="server">
                    <uc:ManageSchoolUserControl ID="ManageSchoolUserControl" runat="server" />
                </asp:View>
                <asp:View ID="ManageStreamsView" runat="server">
                    <uc:ManageStreamsUserControl ID="ManageStreamsUserControl" runat="server" />
                </asp:View>
                <asp:View ID="ManageSubjectsView" runat="server">
                    <uc:ManageSubjectsUserControl ID="ManageSubjectsUserControl" runat="server" />

                </asp:View>
                <asp:View ID="ManageStudentsView" runat="server">
                    <uc:ManageStudentsUserControl ID="ManageStudentsUserControl" runat="server" />
                </asp:View>
                <asp:View ID="ManageStaffView" runat="server">
                    <uc:ManageStaffUserControl ID="ManageStaffUserControl" runat="server" />
                </asp:View>
                <asp:View ID="ManageSchoolFeesView" runat="server">
                    <uc:ManageSchoolFeesUserControl ID="ManageSchoolFeesUserControl" runat="server" />
                </asp:View>
                <asp:View ID="ManageStudentPaymentsView" runat="server">
                    <uc:ManageStudentPaymentsUserControl ID="ManageStudentPaymentsUserControl" runat="server" />
                </asp:View>
            </asp:MultiView>
        </aside>
    </div>
</asp:Content>

