<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="AddOrEditContract.aspx.cs" Inherits="AddOrEditContract" %>

<%@ Register TagPrefix="uc" TagName="MyUserControl" Src="~/SaveContract.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc:MyUserControl id="MyUserControl" runat="server" />
</asp:Content>
