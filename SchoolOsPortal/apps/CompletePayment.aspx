<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="CompletePayment.aspx.cs" Inherits="CompletePayment" %>

<%@ Register TagPrefix="uc" TagName="ListPaymentVoucher" Src="~/ListPaymentVouchers.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveReciept" Src="~/SaveReciept.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <ul class="nav nav-tabs" style="padding-top: 50px;">
            <li id="ListPaymentVouchersLink" runat="server" class="active">
                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="btnTabPane_Click">Search for Payment Voucher</asp:LinkButton></li>
            <li id="SaveRecieptDetailslink" runat="server" class="active">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="btnTabPane_Click">Save Reciept Details</asp:LinkButton></li>
        </ul>
    </div>

    <div class="container" style="margin-top:30px;">
        <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
            <asp:View ID="ListPaymentVouchersView" runat="server">
                <uc:ListPaymentVoucher ID="ListPaymentVoucherUserControl" runat="server" />
            </asp:View>
            <asp:View ID="SaveRecieptView" runat="server">
                <uc:SaveReciept ID="SaveRecieptUserControl" runat="server" />
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>