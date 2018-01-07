<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="ManageSchool.aspx.cs" Inherits="ManageSchool" %>

<%@ Register TagPrefix="uc" TagName="ListSchoolsUserControl" Src="~/CustomUserControls/ListSchools.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveSchoolsUserControl" Src="~/CustomUserControls/SaveSchool.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        .daterangepicker.opensleft:after {
            display: none;
        }

        .date-picker-wrapper {
            z-index: 2;
        }

        .form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control {
            background-color: #fff;
        }

        .daterangepicker.opensright:after {
            content: none;
        }
    </style>

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!---------------------------------- Left side column. contains the logo and sidebar ---------------------------------------->

        <aside class="right-side" style="padding-left:20px;">
           
            <!------------------------------------------------------- Main content --------------------------------------->
            <div class="row">
                <ul class="nav nav-tabs" style="padding-top: 50px;">
                    <li id="ListSchoolsLink" runat="server" class="active">
                        <asp:LinkButton ID="ListSchoolsLinkButton" runat="server" OnClick="btnTabPane_Click">View School Details</asp:LinkButton></li>
                   
                </ul>
            </div>

            <div class="container" style="margin-top: 30px;">
                <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
                    <asp:View ID="ListSchoolsView" runat="server">
                        <uc:ListSchoolsUserControl ID="ListSchoolsUserControl" runat="server" />
                    </asp:View>
                </asp:MultiView>
            </div>
            <!-------------------------------------------------------- /.content ----------------------------------------->
           
        </aside>
    </div>

</asp:Content>
