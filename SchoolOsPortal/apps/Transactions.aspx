<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="Transactions.aspx.cs" Inherits="Transactions" %>

<%@ Register TagPrefix="uc" TagName="ListGeneralLedgerUserControl" Src="~/ListGeneralLedger.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container" style="margin-top:30px;">
        <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
            <asp:View ID="ListGeneralLedgerView" runat="server">
                <uc:ListGeneralLedgerUserControl ID="ListGeneralLedgerUserControl" runat="server" />
            </asp:View>
        </asp:MultiView>
    </div>
</asp:Content>