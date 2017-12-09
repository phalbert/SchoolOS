<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ViewContracts.aspx.cs" Inherits="ViewContracts" %>

<%@ Register TagPrefix="uc" TagName="ListContracts" Src="~/ListContracts.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="margin-top:30px;">
        <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
            <asp:View ID="ListContractsView" runat="server">
                <uc:ListContracts ID="ListContractsUserControl" runat="server" />
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>