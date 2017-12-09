<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="ManageInvoices.aspx.cs" Inherits="ManageInvoices" %>

<%@ Register TagPrefix="uc" TagName="ListInvoicesUserControl" Src="~/ListInvoices.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="margin-top: 30px;">
        <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
            <asp:View ID="ListInvoicesView" runat="server">
                <uc:ListInvoicesUserControl ID="ListInvoicesUserControl" runat="server" />
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>
