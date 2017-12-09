<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="ViewPurchases.aspx.cs" Inherits="ViewPurchases" %>

<%@ Register TagPrefix="uc" TagName="ListPurchases" Src="~/ListPurchases.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="margin-top:30px;">
        <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
            <asp:View ID="ListPurchasesView" runat="server">
                <uc:ListPurchases ID="ListPurchases" runat="server" />
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>