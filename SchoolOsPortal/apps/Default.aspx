<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

    <title>School Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="Images/favicon.ico.png" />
    <link href="css/pegpay-login.css" rel="stylesheet" />
    <script src='https://www.google.com/recaptcha/api.js'></script>

    <style>
        @import url("scripts/vendors/iCheck/css/minimal/_all.css");
        @import url("scripts/vendors/iCheck/css/square/_all.css");
        @import url("scripts/vendors/iCheck/css/flat/_all.css");
        @import url("scripts/vendors/iCheck/css/line/_all.css");
        @import url("scripts/vendors/iCheck/css/polaris/polaris.css");
        @import url("scripts/vendors/iCheck/css/futurico/futurico.css");

        .bv-form .help-block {
            margin-bottom: 0;
        }

        .bv-form .tooltip-inner {
            text-align: left;
        }

        .nav-tabs li.bv-tab-success > a {
            color: #3c763d;
        }

        .nav-tabs li.bv-tab-error > a {
            color: #a94442;
        }

        .bv-form .bv-icon-no-label {
            top: 0;
        }

        .bv-form .bv-icon-input-group {
            top: 0;
            z-index: 100;
        }
    </style>

    <style type="text/css">
        .short_explanation {
            font-family: Arial, sans-serif;
            font-size: 0.8em;
            color: #333;
        }

        .error {
            font-family: Verdana, Arial, sans-serif;
            font-size: 0.7em;
            color: #900;
            background-color: #ffff00;
        }
    </style>

    <link href="css/A.login.css.pagespeed.cf.uxB68C_gDO.css" rel="stylesheet">
    <!--end page level css-->
    <script type='text/javascript' src='scripts/fg_captcha_validator.js'></script>
</head>

<body id="sign-in">
    <form runat="server">
        <div class="container">
            <div class="row">
                <%-------------------------------------------- Message Label ----------------------------------%>
                <div data-row-span="4" style="padding-top:50px" >
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
                            <asp:Label ID="lblmsg" runat="server">Loading...</asp:Label>
                        </strong>
                        <%Response.Write("</div>"); %>
                    </div>
                </div>
                <br />
                <div class="row text-center">
                    <asp:Button ID="btnHome" runat="server" CssClass="btn btn-danger" Text="Go Back Home" OnClick="btnHome_Click" />
                     <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-success" Text="Go to Login" OnClick="btnLogin_Click" />
                </div>
                <hr />
                <%-------------------------------------------- Login Form ----------------------------------%>
            </div>
        </div>
        <!-- global js -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <!-- end of global js -->
        <!-- page level js -->
        <script type="text/javascript" src="scripts/vendors/iCheck/js/icheck.js.pagespeed.jm.mc8O_8_6ZX.js"></script>
        <script src="scripts/vendors/bootstrapvalidator/js/bootstrapValidator.min.js.pagespeed.jm.6svL6oFoHD.js" type="text/javascript"></script>
    </form>
</body>

</html>

