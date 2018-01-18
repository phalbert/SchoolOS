<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ManageStreams.ascx.cs" Inherits="CustomUserControls_ManageStreams" %>

<%@ Register TagPrefix="uc" TagName="ListStreamsUserControl" Src="~/CustomUserControls/ListStreams.ascx" %>
<%@ Register TagPrefix="uc" TagName="SaveStreamUserControl" Src="~/CustomUserControls/SaveStream.ascx" %>



<!------------------------------------------------------- Main content --------------------------------------->
<div class="row">
    <ul class="nav nav-tabs" style="padding-top: 50px;">
        <li id="ListClassStreamLink" runat="server" class="active">
            <asp:LinkButton ID="ListClassStreamLinkButton" runat="server" OnClick="btnTabPane_Click">View Class Streams</asp:LinkButton></li>
        <li id="SaveStreamLink" runat="server">
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

