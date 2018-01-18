<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageSubjects.ascx.cs" Inherits="CustomUserControls_ManageSubjects" %>

<%@ Register TagPrefix="uc" TagName="ListSubjectsUserControl" Src="~/CustomUserControls/ListSubjects.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveSubjectUserControl" Src="~/CustomUserControls/SaveSubject.ascx" %>



<!------------------------------------------------------- Main content --------------------------------------->
<div class="row">
    <ul class="nav nav-tabs" style="padding-top: 50px;">
        <li id="ListSubjectsLink" runat="server" class="active">
            <asp:LinkButton ID="ListSubjectsLinkButton" runat="server" OnClick="btnTabPane_Click">View Subjects</asp:LinkButton></li>
        <li id="SaveSubjectLink" runat="server">
            <asp:LinkButton ID="SaveSubjectLinkButton" runat="server" OnClick="btnTabPane_Click">Save Subject</asp:LinkButton></li>
    </ul>
</div>

<div class="container" style="margin-top: 30px;">
    <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
        <asp:View ID="ListSubjectsView" runat="server">
            <uc:ListSubjectsUserControl ID="ListSubjectsUserControl" runat="server" />
        </asp:View>
        <asp:View ID="SaveSubjectView" runat="server">
            <uc:SaveSubjectUserControl ID="SaveSubjectUserControl" runat="server" />
        </asp:View>
    </asp:MultiView>
</div>
<!-------------------------------------------------------- /.content ----------------------------------------->


