<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="AddOrEditReciept.aspx.cs" Inherits="AddOrEditReciept" %>

<%@ Register TagPrefix="uc" TagName="MyUserControl" Src="~/SaveReciept.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc:MyUserControl id="MyUserControl" runat="server" />
</asp:Content>
