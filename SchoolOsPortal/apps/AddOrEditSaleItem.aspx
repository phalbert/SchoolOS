<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AddOrEditSaleItem.aspx.cs" Inherits="AddOrEditSaleItem" %>

<%@ Register TagPrefix="uc" TagName="MyUserControl" Src="~/SaveSaleItem.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc:MyUserControl id="MyUserControl" runat="server" />
</asp:Content>
