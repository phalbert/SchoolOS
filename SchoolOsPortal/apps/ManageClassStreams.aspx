<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Main.master" CodeFile="ManageClassStreams.aspx.cs" Inherits="ManageClassStreams" %>

<%@ Register TagPrefix="uc" TagName="ListStreamsUserControl" Src="~/ListClasses.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveStreamUserControl" Src="~/SaveClass.ascx" %>

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
                    <li id="ListClassStreamLink" runat="server" class="active">
                        <asp:LinkButton ID="ListClassStreamLinkButton" runat="server" OnClick="btnTabPane_Click">View Class Streams</asp:LinkButton></li>
                    <li id="SaveStreamLink" runat="server" >
                        <asp:LinkButton ID="SaveStreamLinkButton" runat="server" OnClick="btnTabPane_Click">Save Class Stream</asp:LinkButton></li>
                </ul>
            </div>

            <div class="container" style="margin-top: 30px;">
                <asp:MultiView ActiveViewIndex="0" ID="MultiView" runat="server">
                    <asp:View ID="ListStreamsUserView" runat="server">
                        <uc:ListStreamsUserControl ID="ListStreamsUserControl" runat="server" />
                    </asp:View>
                    <asp:View ID="SaveStreamView" runat="server">
                        <uc:SaveStreamUserControl ID="SaveStreamUserControl" runat="server" />
                    </asp:View>
                </asp:MultiView>
            </div>
            <!-------------------------------------------------------- /.content ----------------------------------------->
           
        </aside>
    </div>
</asp:Content>
