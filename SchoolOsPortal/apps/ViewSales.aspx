<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="ViewSales.aspx.cs" Inherits="ViewSales" %>

<%@ Register TagPrefix="uc" TagName="ListSales" Src="~/ListSales.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="margin-top:30px;">
        <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
            <asp:View ID="ListSalesView" runat="server">
                <uc:ListSales ID="ListSales" runat="server" />
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
