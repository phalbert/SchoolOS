<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="MakeASale.aspx.cs" Inherits="MakeASale" %>

<%@ Register TagPrefix="uc" TagName="ListClientsControl" Src="~/ListClients.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveSaleItemsControl" Src="~/SaveSaleItem.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveSaleControl" Src="~/SaveSale.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveInvoiceControl" Src="~/SaveInvoice.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="row">
        <ul class="nav nav-tabs" style="padding-top: 50px;">
            <li id="ListClientsLink" runat="server" class="active">
                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="btnTabPane_Click">Search For Client</asp:LinkButton></li>
            <li id="SaveSaleItemsLink" runat="server" class="active">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="btnTabPane_Click">Save Sale Items Details</asp:LinkButton></li>
            <li id="SaveSaleLink" runat="server">
                <asp:LinkButton ID="LinkButton2" runat="server" OnClick="btnTabPane_Click">Save Sale Details</asp:LinkButton></li>
             <li id="SaveInvoiceLink" runat="server">
                <asp:LinkButton ID="LinkButton4" runat="server" OnClick="btnTabPane_Click">Save Invoice Details</asp:LinkButton></li>
        </ul>
    </div>

    <div class="container" style="margin-top:30px;">
        <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
            <asp:View ID="ListClientsView" runat="server">
                <uc:ListClientsControl ID="ListClientsControl" runat="server" />
            </asp:View>
            <asp:View ID="SaveSaleItemsView" runat="server">
                <uc:SaveSaleItemsControl ID="SaveSaleItemsControl" runat="server" />
            </asp:View>
            <asp:View ID="SaveSaleView" runat="server">
                <uc:SaveSaleControl ID="SaveSaleControl" runat="server" />
            </asp:View>
            <asp:View ID="SaveInvoiceView" runat="server">
                <uc:SaveInvoiceControl ID="SaveInvoiceControl" runat="server" />
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>