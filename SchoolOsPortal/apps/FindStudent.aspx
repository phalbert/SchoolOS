<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FindStudent.aspx.cs" Inherits="FindStudent" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html>

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">

    <title>Student Search</title>
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

    <link type="text/css" rel="stylesheet" href="css/PutCustomCssHere.css" />
     <link href="css/sumoselect.min.css" rel="stylesheet" />
    <link href="css/A.login.css.pagespeed.cf.uxB68C_gDO.css" rel="stylesheet">
    <!--end page level css-->
    <script type='text/javascript' src='scripts/fg_captcha_validator.js'></script>
</head>

<body id="sign-in">
    <form runat="server">
        <div class="container">
            <%-------------------------------------------- Message Label ----------------------------------%>
            <div class="row">
                <div class="text-center">
                    <div class="alert alert-success">
                        <strong>
                            <asp:Label ID="lblmsg" runat="server">SUPPLY THE SCHOOL, STUDENT NAME AND DATE OF BIRTH TO FIND STUDENT DETAILS</asp:Label>

                        </strong>
                    </div>
                </div>
            </div>


            <!---------------------------------------------- Search Options --------------------------------->
            <div class="row" style="padding-top: 50px">
                <div class="row alert alert-info">
                    <div class="col-lg-2" style="padding-top: 25px">
                         <asp:Button ID="btnCancel" runat="server" Text="Go Back Home" CssClass="btn btn-danger btn-md"
                            OnClick="btnCancel_Click" />
                    </div>
                    <div class="col-lg-3">
                        <label>
                            School
                        </label><br />
                        <asp:DropDownList ID="ddSchools" runat="server" CssClass="form-control DropDownSearchBox">
                        </asp:DropDownList>
                    </div>
                    <div class="col-lg-3">
                        <label>
                            Student Name
                        </label>
                        <asp:TextBox ID="txtName" runat="server" required="true" CssClass="form-control" placeholder="Enter text" />
                    </div>
                    <div class="col-lg-2">
                        <label>
                            Date of Birth
                        </label>
                        <asp:TextBox ID="txtDOB" runat="server" required="true" CssClass="form-control" placeholder="Enter text" />
                    </div>
                    <div class="col-lg-2" style="padding-top: 25px">
                        <asp:Button ID="btnSubmit" runat="server" Text="Get Student Details" CssClass="btn btn-success btn-md"
                            OnClick="btnSubmit_Click" />
                    </div>
                </div>
                <hr />
                <%------------------------------------------- Search Results  -----------------------------------%>
                <asp:MultiView runat="server" ID="Multiview2" ActiveViewIndex="1">
                    <asp:View runat="server" ID="resultView">
                        <div class="row">
                            <div class="table-responsive">
                                <asp:GridView runat="server" Width="100%" BackColor="WhiteSmoke" RowStyle-ForeColor="Green" CssClass="table table-bordered table-hover"
                                    ID="dataGridResults">

                                </asp:GridView>
                            </div>
                        </div>
                        <hr />
                    </asp:View>
                    <asp:View runat="server" ID="EmptyView">
                    </asp:View>
                </asp:MultiView>

            </div>

            <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" runat="Server" EnableScriptGlobalization="true"
                EnableScriptLocalization="true">
            </ajaxToolkit:ToolkitScriptManager>
            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" CssClass="cal_Theme1"
                Format="yyyy-MM-dd" PopupPosition="BottomRight" TargetControlID="txtDOB">
            </ajaxToolkit:CalendarExtender>

            <!-- global js -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
            <script src="https://cdn.jsdelivr.net/bootstrap/3.3.7/js/bootstrap.min.js"></script>

            <!-- page level js -->
            <script type="text/javascript" src="scripts/vendors/iCheck/js/icheck.js.pagespeed.jm.mc8O_8_6ZX.js"></script>
            <script src="scripts/vendors/bootstrapvalidator/js/bootstrapValidator.min.js.pagespeed.jm.6svL6oFoHD.js" type="text/javascript"></script>
            <script src="scripts/jquery.sumoselect.min.js"></script>
             <script type="text/javascript">
                $(document).ready(function () {
                    $('.DropDownSearchBox').SumoSelect({
                        search: true,
                        searchText: 'Type to Search'
                    });
                });
            </script>
        </div>
    </form>
</body>

</html>
