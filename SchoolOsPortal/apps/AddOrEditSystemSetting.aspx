<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="AddOrEditSystemSetting.aspx.cs" Inherits="AddOrEditSystemSetting" %>

<%@ Register TagPrefix="uc" TagName="SaveSystemSettingUserControl" Src="~/SaveSystemSetting.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <uc:SaveSystemSettingUserControl id="SaveSystemSettingUserControl" runat="server" />
</asp:Content>