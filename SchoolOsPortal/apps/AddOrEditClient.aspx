<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="AddOrEditClient.aspx.cs" Inherits="AddOrEditClient" %>

<%@ Register TagPrefix="uc" TagName="SaveClient" Src="~/SaveClient.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc:SaveClient id="SaveClient" runat="server" />
</asp:Content>
