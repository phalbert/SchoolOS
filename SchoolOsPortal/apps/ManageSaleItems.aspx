<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ManageSaleItems.aspx.cs"
    Inherits="ManageSaleItems" %>

<%@ Register TagPrefix="uc" TagName="ListSaleItemsUserControl" Src="~/ListSaleItems.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveSaleItemUserControl" Src="~/SaveSaleItem.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="margin-top: 30px;">
        <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
            <asp:View ID="ListSaleItemsView" runat="server">
                <uc:ListSaleItemsUserControl ID="ListSaleItemsUserControl" runat="server" />
            </asp:View>
            <asp:View ID="SaveSaleIteView" runat="server">
                <uc:SaveSaleItemUserControl ID="SaveSaleItemUserControl" runat="server" />
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
