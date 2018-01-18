<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageSchool.ascx.cs" Inherits="ManageSchool" %>

<%@ Register TagPrefix="uc" TagName="ListSchoolsUserControl" Src="~/CustomUserControls/ListSchools.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveSchoolsUserControl" Src="~/CustomUserControls/SaveSchool.ascx" %>



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


