<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="AddOrEditPaymentVoucher.aspx.cs" Inherits="SavePaymentVoucher" %>

<%@ Register TagPrefix="uc" TagName="MyUserControl" Src="~/SavePaymentVoucher.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc:MyUserControl id="MyUserControl" runat="server" />
</asp:Content>