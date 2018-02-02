<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintStudentsReport.aspx.cs" Inherits="PrintStudentsReport" %>

<%@ Reference Control="~/CustomUserControls/PrintStudentReport.ascx" %>
<%@ Register TagPrefix="uc" TagName="ChangePasswordUserControl" Src="~/CustomUserControls/PrintStudentReport.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
         <%-------------------------------------------- Message Label ----------------------------------%>
        <div class="row">
            <div class="text-center">
                <% 
                    string IsError = Session["IsError"] as string;
                    if (IsError == null)
                    {
                        Response.Write("<div>");

                    }
                    else if (IsError == "True")
                    {
                        Response.Write("<div class=\"alert alert-danger\">");

                    }
                    else
                    {
                        Response.Write("<div class=\"alert alert-success\">");
                    }
                %>
                <strong>
                    <asp:Label ID="lblmsg" runat="server"></asp:Label></strong>
                <%Response.Write("</div>"); %>
            </div>
        </div>

        <div id="controlsDiv" runat="server">
             <uc:ChangePasswordUserControl ID="ChangePasswordUserControl" runat="server" />
        </div>
    </form>
    <!-- global js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <script type="text/javascript" src="scripts/vendors/iCheck/js/icheck.js.pagespeed.jm.mc8O_8_6ZX.js"></script>
    <script src="scripts/vendors/bootstrapvalidator/js/bootstrapValidator.min.js.pagespeed.jm.6svL6oFoHD.js" type="text/javascript"></script>

</body>
</html>
