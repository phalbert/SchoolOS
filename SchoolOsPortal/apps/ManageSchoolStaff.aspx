<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="ManageSchoolStaff.aspx.cs" Inherits="ManageSchoolStaff" %>


<%@ Register TagPrefix="uc" TagName="ManageStaffUserControl" Src="~/CustomUserControls/ManageStaff.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!---------------------------------- Left side column. contains the logo and sidebar ---------------------------------------->

        <aside class="right-side" style="padding-left: 20px;">
            <uc:ManageStaffUserControl ID="ManageStaffUserControl" runat="server" />
        </aside>
    </div>
</asp:Content>
