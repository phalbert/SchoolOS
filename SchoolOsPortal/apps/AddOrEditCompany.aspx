<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="AddOrEditCompany.aspx.cs" Inherits="AddOrEditCompany" %>

<%@ Register TagPrefix="uc" TagName="MyUserControl" Src="~/SaveCompany.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc:MyUserControl id="MyUserControl" runat="server" />
</asp:Content>
