﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintStudentId.aspx.cs" Inherits="PrintStudentId" %>

<%@ Reference Control="~/CustomUserControls/GenerateStudentId.ascx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
</head>
<body>
    <form id="form1" runat="server">
        <%------------------------------------------ Message Label ----------------------------------------%>
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10 text-center">
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
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>
                </strong>
                <%Response.Write("</div>"); %>
            </div>
            <div class="col-lg-1"></div>
        </div>
        <br />
        <div class="row text-center">
            <asp:Button ID="btnHome" runat="server" CssClass="btn btn-primary" Text="Go Back" OnClick="btnHome_Click" />
            <asp:Button ID="btnPrint" runat="server" CssClass="btn btn-success" Text="Print Id" />
        </div>
        <br />
        <div id="controlsDiv" runat="server">
            <asp:PlaceHolder ID="placeholde1" runat="server" />
        </div>
    </form>
    <!-- global js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- end of global js -->
    <!-- page level js -->
    <script type="text/javascript" src="scripts/vendors/iCheck/js/icheck.js.pagespeed.jm.mc8O_8_6ZX.js"></script>
    <script src="scripts/vendors/bootstrapvalidator/js/bootstrapValidator.min.js.pagespeed.jm.6svL6oFoHD.js" type="text/javascript"></script>

</body>
</html>