<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="AddOrEditInvoice.aspx.cs" Inherits="AddOrEditInvoice" %>

<%@ Register TagPrefix="uc" TagName="MyUserControl" Src="~/SaveInvoice.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc:MyUserControl id="MyUserControl" runat="server" />
</asp:Content>
