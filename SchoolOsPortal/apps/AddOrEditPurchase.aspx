<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AddOrEditPurchase.aspx.cs" Inherits="AddOrEditPurchase" %>

<%@ Register TagPrefix="uc" TagName="MyUserControl" Src="~/SaveReciept.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc:MyUserControl id="MyUserControl" runat="server" />
</asp:Content>