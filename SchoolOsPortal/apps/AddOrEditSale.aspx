<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AddOrEditSale.aspx.cs" Inherits="AddOrEditSale" %>

<%@ Register TagPrefix="uc" TagName="MyUserControl" Src="~/SaveSale.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc:MyUserControl id="MyUserControl" runat="server" />
</asp:Content>
