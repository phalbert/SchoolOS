<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

    <title>Forgot Password | PegPay</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="img/favicon.ico.png" />
    <!-- Bootstrap -->
    <!-- global level css -->
    <link href="css/pegpay-forgot.css" rel="stylesheet" type="text/css" />

    <!-- end of global css-->
    <!-- page level styles-->

    <link href="css/A.forgot_password.css.pagespeed.cf.n9D0-Ngn7D.css" rel="stylesheet">
    <!-- end of page level styles-->
</head>

<body>
    <form runat="server">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3 col-xs-10 col-xs-offset-1 box animated fadeInUp">
                    <div class="text-center">
                        <img src="Images/pegasus.png" width="200" height="auto" alt="Clear logo">
                    </div>
                    <h3 class="text-center">
                        Forgot Password
                    </h3>
                    <p class="text-center enter_email">
                       <asp:Label runat="server" Text="Enter your User ID" ID="lblmsg"></asp:Label>
                    </p>

                    <div class="form-group">
                        <asp:TextBox runat="server" class="form-control email" ID="txtUserID" placeholder="Username" />
                    </div>
                    <div class="form-group text-center">
                        <asp:Button runat="server" OnClick="btnReset_Click" ID="btnReset" Text="Retrieve Password" class="btn submit-btn"></asp:Button>
                    </div>
                    <br />
                    <p style="text-align: center"><a style="text-decoration: underline; cursor: pointer; color: #ffffff" href="Login.aspx"><i class="fa fa-arrow-left"></i>&nbsp;Return to Login</a></p>
                </div>
            </div>
        </div>
        <!-- global vendor js-->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- end of global vendor js-->
        <!-- page level js -->
        <script src="scripts/vendors/bootstrapvalidator/js/bootstrapValidator.min.js.pagespeed.jm.6svL6oFoHD.js" type="text/javascript"></script>
        <script type="text/javascript">//<![CDATA[
            'use strict'; $(document).ready(function () { $(window).on('load', function () { $('.preloader img').fadeOut(); $('.preloader').fadeOut(); }); $("#forgot_password").bootstrapValidator({ fields: { email: { validators: { notEmpty: { message: 'The email address is required' }, emailAddress: { message: 'The input is not a valid email address' } } } } }); var input_field = $("input[name=email]"); $('button[type="submit"]').on('click', function (e) { e.preventDefault(); if (input_field.val() != "") { $(".enter_email").addClass("hidden"); $(".check_email").removeClass("hidden"); $('#email, .signup-signin').addClass('hidden'); $('.submit-btn').addClass('animated fadeInUp'); $('button[type="submit"]').html("Reset Password").removeClass("btn-primary btn-block").addClass("btn-success").on('click', function () { window.location.href = 'reset_password.php'; }); } else { var error_msg = "<p>Sorry, Enter Your Registered email</p>"; $(".enter_email").addClass("err-text animated fadeInUp").html(error_msg); } }); $("#email").on('keypress focus', function () { var element = 'Enter your Registered email'; $(".enter_email").removeClass("text-danger animated fadeInUp").html(element); }); });
            //]]></script>
        <!-- end of page level js -->
    </form>
</body>

</html>
