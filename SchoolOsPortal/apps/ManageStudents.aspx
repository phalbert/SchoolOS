<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="ManageStudents.aspx.cs" Inherits="ManageStudents" %>

<%@ Register TagPrefix="uc" TagName="ManageStudentsUserControl" Src="~/CustomUserControls/ManageStudents.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!---------------------------------- Left side column. contains the logo and sidebar ---------------------------------------->

        <aside class="right-side" style="padding-left: 20px;">
            <uc:ManageStudentsUserControl ID="ManageStudentsUserControl" runat="server" />
        </aside>
    </div>
</asp:Content>
