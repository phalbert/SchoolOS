<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="ManageStudentFees.aspx.cs" Inherits="ManageStudentFees" %>

<%@ Register TagPrefix="uc" TagName="ManageStudentPaymentsUserControl" Src="~/CustomUserControls/ManageStudentPayments.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!---------------------------------- Left side column. contains the logo and sidebar ---------------------------------------->

        <aside class="right-side" style="padding-left: 20px;">
            <uc:ManageStudentPaymentsUserControl ID="ManageStudentPaymentsUserControl" runat="server" />
        </aside>
    </div>
</asp:Content>
