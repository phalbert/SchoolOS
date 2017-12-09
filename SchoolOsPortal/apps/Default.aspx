<%@ Page Language="C#" AutoEventWireup="true"
    CodeFile="Default.aspx.cs"
    Inherits="_Default"
    EnableEventValidation="false"
    Culture="auto"
    UICulture="auto" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>PEGPAY - MANAGEMENT SYSTEM</title>

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />


    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />

    <!-- Custom CSS -->
    <link href="css/PutCustomCssHere.css" rel="stylesheet" />

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet" />

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />



</head>
<body style="margin-top: 25px; color: black;">
    <div class="container">
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-sm-5">
                <div class="page-header">

                    <div class="text-center" style="font-size: large;">

                        <h4>
                            <a href="#">
                                <b>
                                    <asp:Label ID="lblmsg" runat="server" Style="color:#449D44;">
                            PEGASUS BUSSINESS MANAGEMENT SYSTEM
                                    </asp:Label>
                                </b>
                            </a>
                        </h4>

                    </div>

                </div>

            </div>
            <div class="col-lg-4"></div>
        </div>

        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-sm-5">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <div id="loginbox" style="margin-top: 50px;" class="mainbox">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="panel-title">
                                        <div class="text-center">Sign Into Your Account</div>
                                    </div>
                                </div>

                                <div style="padding-top: 30px;" class="panel-body">

                                    <div style="display: none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                                    <form id="loginform" runat="server" class="form-horizontal" role="form">


                                        <div class="text-center" style="margin-bottom: 25px">
                                            <img id="logoImage" class="img-responsive img-thumbnail" runat="server" height="150" width="150" src="Images/PegasusNewLogo.png" style="border-color: #DDDDDD;border-style:solid;border-width:1px;" />
                                        </div>

                                        <div style="margin-bottom: 25px" class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                            <asp:TextBox ID="txtEmail" runat="server" TextMode="SingleLine" CssClass="form-control" Text="" placeholder="username or email"></asp:TextBox>

                                        </div>

                                        <div style="margin-bottom: 25px" class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" Text="" placeholder="Password"></asp:TextBox>

                                        </div>

                                        <div style="margin-top: 10px" class="form-group">
                                            <!-- Button -->
                                            <div class="row">
                                                <div class="col-sm-3 controls"></div>
                                                <div class="col-sm-6 controls">
                                                    <div class="text-center">
                                                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success btn-block" Text="Sign In" OnClick="btnLogin_Click" />
                                                    </div>
                                                </div>
                                                <div class="col-sm-3 controls"></div>
                                            </div>

                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <div id="Div1" style="margin-top: 50px;" class="mainbox">
                            <div class="panel panel-primary">
                                <div class="panel-heading">
                                    <div class="panel-title">
                                        <div class="text-center">Change Your Password</div>
                                    </div>
                                </div>

                                <div style="padding-top: 30px;" class="panel-body">

                                    <div style="display: none" id="Div2" class="alert alert-danger col-sm-12"></div>

                                    <form id="Form1" runat="server" class="form-horizontal" role="form">


                                        <div class="text-center" style="margin-bottom: 25px">
                                            <img id="Img1" runat="server" height="50" width="50" src="Images/PEGASUS/Billing.jpg" alt="" />
                                        </div>

                                        <div style="margin-bottom: 25px" class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                            <asp:TextBox ID="txtnewpassword" runat="server" TextMode="Password" CssClass="form-control" Text="" placeholder="New Password"></asp:TextBox>

                                        </div>

                                        <div style="margin-bottom: 25px" class="input-group">
                                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                            <asp:TextBox ID="txtConfirmnewpassword" runat="server" TextMode="Password" CssClass="form-control" Text="" placeholder="Confirm New Password"></asp:TextBox>

                                        </div>

                                        <div style="margin-top: 10px" class="form-group">
                                            <!-- Button -->
                                            <div class="row">
                                                <div class="col-sm-3 controls"></div>
                                                <div class="col-sm-6 controls">
                                                    <div class="text-center">
                                                        <asp:Button ID="btnChangePassword" runat="server" CssClass="btn btn-success btn-block" Text="Change Password" OnClick="btnChangenewPassword_Click" />
                                                    </div>
                                                </div>
                                                <div class="col-sm-3 controls"></div>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </asp:View>
                </asp:MultiView>
            </div>

            <div class="col-lg-4"></div>
        </div>
    </div>
    <script type="text/javascript">
        function DisableButtons() {
            var inputs = document.getElementsByTagName("INPUT");
            for (var i in inputs) {
                if (inputs[i].type == "button" || inputs[i].type == "submit") {
                    inputs[i].disabled = true;
                }
            }
        }
        window.onbeforeunload = DisableButtons;
    </script>
</body>

</html>
