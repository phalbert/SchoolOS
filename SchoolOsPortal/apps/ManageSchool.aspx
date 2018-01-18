<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ManageSchool.aspx.cs" Inherits="ManageSchool" %>

<%@ Register TagPrefix="uc" TagName="ManageSchoolUserControl" Src="~/CustomUserControls/ManageSchool.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!---------------------------------- Left side column. contains the logo and sidebar ---------------------------------------->

        <aside class="right-side" style="padding-left: 20px;">
            <uc:ManageSchoolUserControl ID="ManageSchoolUserControl" runat="server" />
        </aside>
    </div>
</asp:Content>
