<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageStaff.ascx.cs" Inherits="CustomUserControls_ManageStaff" %>

<%@ Register TagPrefix="uc" TagName="ListStaffMembersUserControl" Src="~/CustomUserControls/ListStaffMembers.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveStaffMembersUserControl" Src="~/CustomUserControls/SaveStaffMembers.ascx" %>
<%@ Register TagPrefix="uc" TagName="ApproveStaffMembersUserControl" Src="~/CustomUserControls/ApproveStaffMembers.ascx" %>



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

