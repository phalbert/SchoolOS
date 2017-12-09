<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="MakePayment.aspx.cs" Inherits="MakePayment" %>

<%@ Register TagPrefix="uc" TagName="SavePurchaseControl" Src="~/SavePurchase.ascx" %>
<%@ Register TagPrefix="uc" TagName="SavePaymentVoucher" Src="~/SavePaymentVoucher.ascx" %>
<%@ Register TagPrefix="uc" TagName="ListSuppliers" Src="~/ListSuppliers.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveInvoiceUserControl" Src="~/SaveInvoice.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <ul class="nav nav-tabs" style="padding-top: 50px;">
            <li id="ListSuppliersLink" runat="server" class="active">
                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="btnTabPane_Click">Search For Supplier</asp:LinkButton></li>
            <li id="SaveInvoiceLink" runat="server">
                <asp:LinkButton ID="LinkButton4" runat="server" OnClick="btnTabPane_Click">Enter Supplier Invoice Details</asp:LinkButton></li>
            <li id="SavePurchaseLink" runat="server">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="btnTabPane_Click">Save Purchase Details</asp:LinkButton></li>
            <li id="SavePaymentVoucherLink" runat="server">
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="btnTabPane_Click">Save Payment Voucher Details</asp:LinkButton></li>
        </ul>
    </div>

    <div class="container" style="margin-top: 30px;">
        <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
            <asp:View ID="ListSuppliersView" runat="server">
                <uc:ListSuppliers ID="ListSuppliers" runat="server" />
            </asp:View>
            <asp:View ID="SaveInvoiceView" runat="server">
                <uc:SaveInvoiceUserControl ID="SaveInvoiceUserControl" runat="server" />
            </asp:View>
            <asp:View ID="SavePurchaseView" runat="server">
                <uc:SavePurchaseControl ID="SavePurchase" runat="server" />
            </asp:View>
            <asp:View ID="SavePaymentVoucherView" runat="server">
                <uc:SavePaymentVoucher ID="SavePaymentVoucher" runat="server" />
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
