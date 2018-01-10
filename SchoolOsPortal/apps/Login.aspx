<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<%@ Register Assembly="GoogleReCaptcha" Namespace="GoogleReCaptcha" TagPrefix="cc1" %>
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
    <div class="container">
        <div class="row">
            <%-------------------------------------------- Message Label ----------------------------------%>
            <div data-row-span="4">
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
                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </strong>
                    <%Response.Write("</div>"); %>
                </div>
            </div>

            <%-------------------------------------------- Login Form ----------------------------------%>
            <div class="col-md-4 col-md-offset-4 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 login-form">
                <div class="panel-header">
                    <h2 class="text-center">
                        <img src="Images/pegasus.png" alt="Logo" width="200px" height="auto">
                    </h2>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <form runat="server" id="authentication" method="post" class="login_validator">
                                <div class="form-group">
                                    <label for="email" class="sr-only">School Code</label>
                                    <asp:TextBox runat="server" type="text" class="form-control  form-control-lg" ID="txtUsername" name="code" placeholder="Enter Username"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="sr-only">Password</label>
                                    <asp:TextBox runat="server" TextMode="Password" class="form-control form-control-lg" ID="txtPassword" name="password" placeholder="Password"></asp:TextBox>
                                </div>
                                <div class="form-group text-center">
                                    <cc1:GoogleReCaptcha ID="ctrlGoogleReCaptcha" runat="server" PublicKey="6Leefj0UAAAAAAb8CMhdkGZxmVVhKGxMGkUPqB6z" PrivateKey="6Leefj0UAAAAADCaJQmkGG4FHPoaLA7LvooEBdF5" />
                                </div>
                                <div class="form-group">
                                    <asp:Button runat="server" ID="btnLogin" Text="Sign In" class="btn btn-primary btn-block" OnClick="btnLogin_Click" />
                                </div>
                                <a href="ForgotPassword.aspx" id="forgot" class="forgot">Forgot Password ? </a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- global js -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- end of global js -->
    <!-- page level js -->
    <script type="text/javascript" src="scripts/vendors/iCheck/js/icheck.js.pagespeed.jm.mc8O_8_6ZX.js"></script>
    <script src="scripts/vendors/bootstrapvalidator/js/bootstrapValidator.min.js.pagespeed.jm.6svL6oFoHD.js" type="text/javascript"></script>

</body>

</html>
