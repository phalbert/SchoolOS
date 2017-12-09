<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AddOrEditSystemUser.aspx.cs" Inherits="AddOrEditSystemUser" %>

<%@ Register TagPrefix="uc" TagName="MyUserControl" Src="~/SaveSystemUser.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc:MyUserControl id="MyUserControl" runat="server" />
</asp:Content>
