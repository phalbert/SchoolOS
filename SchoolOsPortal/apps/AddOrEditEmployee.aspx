<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="AddOrEditEmployee.aspx.cs" Inherits="AddOrEditEmployee" %>

<%@ Register TagPrefix="uc" TagName="SaveEmployee" Src="~/SaveEmployeeDetails.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc:SaveEmployee id="SaveEmployee" runat="server" />
</asp:Content>

