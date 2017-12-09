<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ManagePurchases.aspx.cs" Inherits="ManagePurchases" %>

<%@ Register TagPrefix="uc" TagName="ListPurchasesUserControl" Src="~/ListPurchases.ascx" %>
<%@ Register TagPrefix="uc" TagName="SavePaymentVoucherUserControl" Src="~/SavePaymentVoucher.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container" style="margin-top: 30px;">
        <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
            <asp:View ID="ListPurchasesView" runat="server">
                <uc:ListPurchasesUserControl ID="ListPurchasesUserControl" runat="server" />
            </asp:View>
            <asp:View ID="SavePaymentVoucherView" runat="server">
                <uc:SavePaymentVoucherUserControl ID="SavePaymentVoucherUserControl" runat="server" />
            </asp:View>
        </asp:MultiView>
    </div>

</asp:Content>
