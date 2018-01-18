<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageStudentPayments.ascx.cs" Inherits="CustomUserControls_ManageStudentPayments" %>
<%@ Register TagPrefix="uc" TagName="AssignFeesUserControl" Src="~/CustomUserControls/AssignFees.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveStudentCreditUserControl" Src="~/CustomUserControls/SaveStudentCredit.ascx" %>
<%@ Register TagPrefix="uc" TagName="ListStudentFeesUserControl" Src="~/CustomUserControls/ListStudentFees.ascx" %>
<%@ Register TagPrefix="uc" TagName="BulkStudentPaymentsUserControl" Src="~/CustomUserControls/BulkStudentPayments.ascx" %>
<%@ Register TagPrefix="uc" TagName="ApproveStudentFeesUserControl" Src="~/CustomUserControls/ApproveStudentFees.ascx" %>




<!------------------------------------------------------- Main content --------------------------------------->
<div class="row">
    <ul class="nav nav-tabs" style="padding-top: 50px;">
        <li id="ListStudentFeesLink" runat="server">
            <asp:LinkButton ID="ListStudentFeesLinkButton" runat="server" OnClick="btnTabPane_Click">View Assigned Student Fees</asp:LinkButton>
        </li>
        <li id="AssignFeesLink" runat="server">
            <asp:LinkButton ID="AssignFeesLinkButton" runat="server" OnClick="btnTabPane_Click">Assign School Fees</asp:LinkButton>
        </li>
        <li id="SaveStudentCreditLink" runat="server">
            <asp:LinkButton ID="SaveStudentCreditLinkButton" runat="server" OnClick="btnTabPane_Click">Make Student Payment</asp:LinkButton>
        </li>
        <li id="BulkStudentPaymentsLink" runat="server">
            <asp:LinkButton ID="BulkStudentPaymentsLinkBytton" runat="server" OnClick="btnTabPane_Click">Bulk Student Payments</asp:LinkButton>
        </li>
        <li id="ApproveStudentFeesLink" runat="server">
            <asp:LinkButton ID="ApproveStudentFeesLinkButton" runat="server" OnClick="btnTabPane_Click">Approve Assigned Student Fees</asp:LinkButton>
        </li>
    </ul>
</div>

<div class="container" style="margin-top: 30px;">
    <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
        <asp:View ID="AssignFeesView" runat="server">
            <uc:AssignFeesUserControl ID="AssignFeesUserControl" runat="server" />
        </asp:View>
        <asp:View ID="SaveStudentCreditView" runat="server">
            <uc:SaveStudentCreditUserControl ID="SaveStudentCreditUserControl" runat="server" />
        </asp:View>
        <asp:View ID="BulkStudentPaymentsView" runat="server">
            <uc:BulkStudentPaymentsUserControl ID="BulkStudentPaymentsUserControl" runat="server" />
        </asp:View>
        <asp:View ID="ListStudentFeesView" runat="server">
            <uc:ListStudentFeesUserControl ID="ListStudentFeesUserControl" runat="server" />
        </asp:View>
        <asp:View ID="ApproveStudentFeesView" runat="server">
            <uc:ApproveStudentFeesUserControl ID="ApproveStudentFeesUserControl" runat="server" />
        </asp:View>
    </asp:MultiView>
</div>
<!-------------------------------------------------------- /.content ----------------------------------------->


