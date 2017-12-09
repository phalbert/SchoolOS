<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ManageSales.aspx.cs" Inherits="ManageSales" %>


<%@ Register TagPrefix="uc" TagName="ListSalesUserControl" Src="~/ListSales.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveInvoiceUserControl" Src="~/SaveInvoice.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container" style="margin-top:30px;">
        <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
            <asp:View ID="ListSalesView" runat="server">
                <uc:ListSalesUserControl ID="ListSalesUserControl" runat="server" />
            </asp:View>
            <asp:View ID="SaveInvoiceView" runat="server">
                <uc:SaveInvoiceUserControl ID="SaveInvoiceUserControl" runat="server" />
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>