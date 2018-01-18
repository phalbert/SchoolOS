<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="ManageClassStreams.aspx.cs" Inherits="ManageClassStreams" %>

<%@ Register TagPrefix="uc" TagName="ManageStreamsUserControl" Src="~/CustomUserControls/ManageStreams.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveStreamUserControl" Src="~/CustomUserControls/SaveStream.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <uc:ManageStreamsUserControl ID="ManageStreamsUserControl" runat="server" />
</asp:Content>
