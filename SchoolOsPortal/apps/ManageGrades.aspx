<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ManageGrades.aspx.cs" Inherits="ManageGrades" %>

<%@ Register TagPrefix="uc" TagName="ListClassesUserControl" Src="~/CustomUserControls/ListGrades.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveClassUserControl" Src="~/CustomUserControls/SaveGrades.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!---------------------------------- Left side column. contains the logo and sidebar ---------------------------------------->

        <aside class="right-side" style="padding-left: 20px;">

            <!------------------------------------------------------- Main content --------------------------------------->
            <div class="row">
                <ul class="nav nav-tabs" style="padding-top: 50px;">
                    <li id="ListClassesLink" runat="server" class="active">
                        <asp:LinkButton ID="ListClassesLinkButton" runat="server" OnClick="btnTabPane_Click">View Classes</asp:LinkButton></li>
                    <li id="SaveClassLink" runat="server">
                        <asp:LinkButton ID="SaveClassLinkButton" runat="server" OnClick="btnTabPane_Click">Save Class</asp:LinkButton></li>
                </ul>
            </div>

            <div class="container" style="margin-top: 30px;">
                <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
                    <asp:View ID="ListClassesUserView" runat="server">
                        <uc:ListClassesUserControl ID="ListClassesUserControl" runat="server" />
                    </asp:View>
                    <asp:View ID="SaveClassView" runat="server">
                        <uc:SaveClassUserControl ID="SaveClassUserControl" runat="server" />
                    </asp:View>
                </asp:MultiView>
            </div>
            <!-------------------------------------------------------- /.content ----------------------------------------->

        </aside>
    </div>

</asp:Content>
