<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="AddOrEditDepartment.aspx.cs" Inherits="AddOrEditDepartment" %>

<%@ Register TagPrefix="uc" TagName="SaveDept" Src="~/SaveDepartment.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc:SaveDept id="SaveDept" runat="server" />
</asp:Content>