<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="AddOrEditSupplier.aspx.cs" Inherits="AddOrEditSupplier" %>

<%@ Register TagPrefix="uc" TagName="MyUserControl" Src="~/SaveSupplier.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc:MyUserControl id="MyUserControl" runat="server" />
</asp:Content>

