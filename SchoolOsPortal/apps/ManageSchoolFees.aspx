<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="ManageSchoolFees.aspx.cs" Inherits="ManageSchoolFees" %>

<%@ Register TagPrefix="uc" TagName="ManageSchoolFeesUserControl" Src="~/CustomUserControls/ManageSchoolFees.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!---------------------------------- Left side column. contains the logo and sidebar ---------------------------------------->

        <aside class="right-side" style="padding-left: 20px;">
            <uc:ManageSchoolFeesUserControl ID="ManageSchoolFeesUserControl" runat="server" />
        </aside>
    </div>
</asp:Content>
