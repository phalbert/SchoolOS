<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="LoggedInStartPage.aspx.cs" Inherits="Admin" Title="START PAGE" %>

<%@ Register TagPrefix="uc" TagName="DashboardUserControl" Src="~/CustomUserControls/Dashboard.ascx" %>
<%@ Register TagPrefix="uc" TagName="StudentProfileUserControl" Src="~/CustomUserControls/ListStudentProfile.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!---------------------------------- Left side column. contains the logo and sidebar ---------------------------------------->

        <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
            <asp:View ID="DashboardView" runat="server">
                <uc:DashboardUserControl id="DashboardUserControl" runat="server" />
            </asp:View>
            <asp:View ID="StudentProfileVew" runat="server">
                <uc:StudentProfileUserControl id="StudentProfileUserControl" runat="server" />
            </asp:View>
        </asp:MultiView>
    </div>

</asp:Content>

