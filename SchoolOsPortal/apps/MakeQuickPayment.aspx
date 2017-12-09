<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="MakeQuickPayment.aspx.cs" Inherits="MakeQuickPayment" %>

<%@ Register TagPrefix="uc" TagName="SaveQuickPurchase" Src="~/SaveQuickPurchase.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc:SaveQuickPurchase id="SaveQuickPurchase" runat="server" />
</asp:Content>
