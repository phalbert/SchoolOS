<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/RegisterSchool.aspx.cs" Inherits="RegisterSchool" %>

<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

    <title>School Registration</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="Images/favicon.ico.png" />
    <link type="text/css" href="css/A.app.css.pagespeed.cf.odGN98LG8l.css" rel="stylesheet" />
    <link href="css/pegpay-register.css" type="text/css" rel="stylesheet" />

    <style id="skin">
        .skin-default .sidebar a {
            color: #808b9c;
            -webkit-font-smoothing: antialiased;
        }

        .skin-default .icon-list li a:hover {
            background: #eee;
        }

        @media screen and (min-width:550px) {
            .skin-default .navbar .navbar-right > .nav {
                margin-right: 15px;
            }
        }
    </style>
    <style>
        #complex-form {
            border: 1px solid #aaa;
            background-color: #fff;
            border-radius: 3px;
            padding-top: 20px;
            padding-bottom: 20px;
        }

        .grid-form h3 {
            font-size: 22px;
        }

        .grid-form fieldset legend {
            border-bottom: 2px solid #777;
            color: #666;
            margin-bottom: 0;
            font-size: 16px;
        }

        .grid-form [data-row-span] [data-field-span] label:first-child {
            font-size: small;
            letter-spacing: .5px;
        }

        .grid-form [data-row-span] [data-field-span]:hover, .grid-form [data-row-span] [data-field-span].focus {
            background-color: #f5f5f5;
        }

        .select2-container {
            vertical-align: middle;
            border: 1px solid #ccc;
            border-radius: 2px;
        }

        .select2-container--bootstrap .select2-selection {
            background-color: #ebf1f6;
        }

        .select2-container--bootstrap:hover .select2-selection {
            background-color: #fff;
        }

       .MyTextBoxBg {
            background-color: #e5bc4b;
        }
    </style>
</head>

<body class="skin-default">
    <div class="container">
        <div class="panel-header">
        </div>
        <section class="content">
            <div class="row" id="complex-form">

                <div class="col-lg-12">
                    <form class="grid-form" runat="server">

                        <div class="text-center">
                            <img src="Images/pegasus.png" alt="PegPay name" width="200">
                            <h3>SCHOOL REGISTRATION FORM</h3>
                        </div>

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

                        <fieldset>
                            <legend>School Details
                            </legend>
                            <div data-row-span="4">
                                <div data-field-span="2">
                                    <label>Name of the School</label>
                                    <asp:TextBox ID="txtSchoolName" Style="background-color: #F9FEBD;" required="true" runat="server"></asp:TextBox>
                                </div>
                                <div data-field-span="1">
                                    <label>Prefered School Code</label>
                                    <asp:TextBox ID="txtSchoolCode" Style="background-color: #F9FEBD;" MaxLength="8" required="true" runat="server"></asp:TextBox>
                                </div>
                                <div data-field-span="1">
                                    <label>UNEB Centre Number <small>If applicable</small></label>
                                    <asp:TextBox ID="txtUnebNumber" Style="background-color: #F9FEBD;" runat="server"></asp:TextBox>
                                </div>

                            </div>

                            <div data-row-span="4">
                                <div data-field-span="2">
                                    <label>Schools Bank</label>
                                    <asp:DropDownList ID="ddBanks" Style="background-color: #F9FEBD;" runat="server" CssClass="form-control">
                                        <asp:ListItem>True</asp:ListItem>
                                        <asp:ListItem>False</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div data-field-span="1">
                                    <label>Account Name</label>
                                    <asp:TextBox ID="txtAccountName" Style="background-color: #F9FEBD;" required="true" runat="server"></asp:TextBox>
                                </div>
                                <div data-field-span="1">
                                    <label>Account Number</label>
                                    <asp:TextBox ID="txtAccountNumber" Style="background-color: #F9FEBD;" required="true" runat="server"></asp:TextBox>
                                </div>

                            </div>

                        </fieldset>

                        <br />
                        <br />
                        <fieldset>
                            <legend>School Principal Details
                               
                                <small>(can be Director, Head Teacher or Bursar)</small>
                            </legend>
                            <div data-row-span="4">
                                <div data-field-span="1">
                                    <label>Title</label>
                                    <label>
                                        <asp:RadioButton Style="background-color: #F9FEBD;" GroupName="customer-title[]" ID="rdMr" runat="server" />
                                        Mr.</label>
                                    &nbsp;
                                   
                                    <label>
                                        <asp:RadioButton Style="background-color: #F9FEBD;" GroupName="customer-title[]" ID="rdMrs" runat="server" />
                                        Mrs.</label>
                                    &nbsp;
                                   
                                    <label>
                                        <asp:RadioButton Style="background-color: #F9FEBD;" GroupName="customer-title[]" ID="rdMs" runat="server" />
                                        Ms.</label>
                                </div>
                                <div data-field-span="3">
                                    <label>Full Name</label>
                                    <asp:TextBox ID="txtFullName" Style="background-color: #F9FEBD;" required="true" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div data-row-span="4">
                                <div data-field-span="2" data-field-error="Please enter a valid email address">
                                    <label>E-mail</label>
                                    <asp:TextBox ID="txtPrincipalEmail" Style="background-color: #F9FEBD;" runat="server"></asp:TextBox>
                                </div>
                                <div data-field-span="2">
                                    <label>Mobile No.</label>
                                    <asp:TextBox ID="txtPrincipalPhone" Style="background-color: #F9FEBD;" required="true" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div data-row-span="4">
                                <div data-field-span="2" data-field-error="Please enter prefered username">
                                    <label>UserId (for login)</label>
                                    <asp:TextBox ID="txtUserId" Style="background-color: #F9FEBD;" required="true" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <br>
                            <fieldset>
                                <legend>School Address</legend>
                                <div data-row-span="2">
                                    <div data-field-span="1">
                                        <label>Plot No.</label>
                                        <asp:TextBox ID="txtPlotNumber" Style="background-color: #F9FEBD;" required="true" runat="server"></asp:TextBox>
                                    </div>
                                    <div data-field-span="1">
                                        <label>Street / Road name</label>
                                        <asp:TextBox ID="txtRoadName" Style="background-color: #F9FEBD;" required="true" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div data-row-span="4">
                                    <div data-field-span="2">
                                        <label>Divison / Sub County</label>
                                        <asp:TextBox ID="txtSubCounty" Style="background-color: #F9FEBD;" required="true" runat="server"></asp:TextBox>
                                    </div>
                                    <div data-field-span="2">
                                        <label>District</label>
                                        <asp:TextBox ID="txtDistrict" Style="background-color: #F9FEBD;" required="true" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                                <div data-row-span="4">
                                    <div data-field-span="1">
                                        <label>Box Number</label>
                                        <asp:TextBox ID="txtPostOfficeNumber" Style="background-color: #F9FEBD;" required="true" runat="server"></asp:TextBox>
                                    </div>
                                    <div data-field-span="1">
                                        <label>Office Phone</label>
                                        <asp:TextBox ID="txtOfficePhone" Style="background-color: #F9FEBD;" required="true" runat="server"></asp:TextBox>
                                    </div>
                                    <div data-field-span="1">
                                        <label>Email</label>
                                        <asp:TextBox ID="txtSchoolEmail" Style="background-color: #F9FEBD;" required="true" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </fieldset>
                        </fieldset>
                        <br>
                        <br>
                        <fieldset>
                            <legend>School Type
                               
                                <small>(check what applies)</small>
                            </legend>
                            <div data-row-span="12">
                                <div data-field-span="2">
                                    <asp:CheckBox ID="chkDay"   runat="server" />&nbsp;<label for="day">
                                        Day</label>
                                </div>
                                <div data-field-span="2">
                                    <asp:CheckBox ID="chkBoarding" runat="server" />&nbsp;<label for="boarding"> Boarding</label>
                                </div>
                                <div data-field-span="2">
                                    <asp:CheckBox ID="chkEvening" runat="server" />&nbsp;<label for="evening"> Evening</label>
                                </div>
                                <div data-field-span="2">
                                    <asp:CheckBox ID="chkSingle" runat="server" />&nbsp;<label for="single"> Single</label>
                                </div>
                                <div data-field-span="2">
                                    <asp:CheckBox ID="chkMixed" runat="server" />&nbsp;<label for="mixed"> Mixed</label>
                                </div>

                            </div>
                            <br>
                            <br />
                            <fieldset>
                                <legend>School Category
                               
                                    <small>(check what applies)</small>
                                </legend>
                                <div data-row-span="12">
                                    <div data-field-span="2">
                                        <asp:RadioButton ID="chkNusery" GroupName="SchoolTypeGp" runat="server" />&nbsp;<label for="chkNusery">
                                            Nursery</label>
                                    </div>
                                    <div data-field-span="2">
                                        <asp:RadioButton ID="chkPrimary" GroupName="SchoolTypeGp" runat="server" />&nbsp;<label for="primary"> Primary</label>
                                    </div>
                                    <div data-field-span="2">
                                        <asp:RadioButton ID="chkSecondary" GroupName="SchoolTypeGp" runat="server" />&nbsp;<label for="secondary"> Secondary</label>
                                    </div>
                                    <div data-field-span="2">
                                        <asp:RadioButton ID="chkTertiary" GroupName="SchoolTypeGp" runat="server" />&nbsp;<label for="tertiary"> Tertiary</label>
                                    </div>

                                </div>
                            </fieldset>
                            <br>
                            <br>
                            <fieldset>
                                <legend>Terms And Conditions</legend>
                                <div data-row-span="1">
                                    <div data-field-span="1">
                                        <label></label>
                                        <label>
                                            <asp:CheckBox Style="background-color: #F9FEBD;" ID="chkTerms" required="true" runat="server" />
                                            I/We confirm having read and understood the account
                                        rules of Pegasus Technologies, and hereby agree to be
                                        bound by the terms and conditions and amendments governing this account as issued by Pegasus Technologies from time-to-time.</label>
                                    </div>
                                </div>
                            </fieldset>
                            <br />
                            <br />
                            <div class="row">
                                <div class="col-sm-offset-3 col-sm-9">
                                    <asp:Button runat="server" Text="Submit" ID="btnEdit" class="btn-lg btn-primary" OnClick="btnEdit_Click" />

                                    &nbsp;
                                    <asp:Button runat="server" Text="Submit" ID="btnSubmit" class="btn-lg btn-primary" OnClick="btnSubmit_Click" />

                                    &nbsp;
                                    <asp:Button runat="server" Text="Cancel" ID="btnCancel" class="btn-lg btn-danger" OnClick="btnCancel_Click" formnovalidate="formnovalidate" />

                                    &nbsp;
                                    <asp:Button runat="server" Text="Reset" ID="btnReset" class="btn-lg btn-default bttn_reset" OnClick="btnReset_Click" formnovalidate="formnovalidate" />

                                </div>
                            </div>
                            <br />
                    </form>
                </div>
            </div>
        </section>
    </div>
</body>
<!-- global js -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/g/bootstrap@3.3.7,bootstrap.switch@3.3.2,jquery.nicescroll@3.6.0"></script>
<script src="scripts/js/app.js" type="text/javascript"></script>
<!-- end of global js-->
<!--page level js-->
<script src="scripts/vendors/iCheck/js/icheck.js"></script>
<script src="scripts/vendors/datedropper/datedropper.js"></script>
<script src="scripts/vendors/airdatepicker.js"></script>
<script type="text/javascript" src="scripts/vendors/select2/js/select2.js.pagespeed.jm.Eugd1Y0BmV.js"></script>
<script type="text/javascript">//<![CDATA[
    "use strict"; $(document).ready(function () { $(".dob").dateDropper({ dropPrimaryColor: "#428bca" }); $("#country").select2({ theme: "bootstrap" }); $("#complex-form").find('input').iCheck({ checkboxClass: 'icheckbox_square-blue', radioClass: 'iradio_square-blue', increaseArea: '20%' }); });
    //]]></script>
<!--end of page level js-->


</html>
