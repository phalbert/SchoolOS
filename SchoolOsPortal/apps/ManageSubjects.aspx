<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="ManageSubjects.aspx.cs" Inherits="ManageSubjects" %>

<%@ Register TagPrefix="uc" TagName="ManageSubjectsUserControl" Src="~/CustomUserControls/ManageSubjects.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!---------------------------------- Left side column. contains the logo and sidebar ---------------------------------------->

        <aside class="right-side" style="padding-left: 20px;">
            <uc:ManageSubjectsUserControl ID="ManageSubjectsUserControl" runat="server" />
        </aside>
    </div>
</asp:Content>

