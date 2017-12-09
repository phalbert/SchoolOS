<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PrintReciept.aspx.cs" Inherits="PrintReciept" %>

<%@ Import Namespace="InterLinkClass.PegasusManagementApi" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<!DOCTYPE html>
<html lang="en">

<head id="Head1" runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>PRINT RECIEPT</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <%--<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet" integrity="sha256-7s5uDGW3AHqw6xtJmNNtr+OBRJUlgkNJEo78P4b0yRw= sha512-nNo+yCHEyn0smMxSswnf/OnX6/KwJuZTlNZBjauKhTK0c+zT+q5JOCx0UFhXQ6rJR9jg6Es8gPuD2uZcYDLqSw==" crossorigin="anonymous">--%>

    <!-- Custom CSS -->
    <link href="css/PutCustomCssHere.css" rel="stylesheet" />

    <!-- Morris Charts CSS -->
    <link href="css/plugins/morris.css" rel="stylesheet" />

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .container12 {
            width: 320px;
            height: 240px;
            border: 1px solid #d3d3d3;
        }

            .container12 video {
                width: 100%;
                height: 100%;
            }

            .container12 .photoArea {
                border: 2px dashed white;
                width: 140px;
                height: 190px;
                relati e;
                margi: 0 a c n fl;
            }

        .controls {
            clear: both;
        }

        @media print {
            a {
                display: none;
            }
        }

        @page {
            size: auto; /* auto is the initial value */
            margin: 0mm; /* this affects the margin in the printer settings */
        }

        html {
            background-color: #FFFFFF;
            margin: 0px; /* this affects the margin on the HTML before sending to printer */
        }

        body {
            margin: 10mm 15mm 10mm 15mm; /* margin you want for the content */
        }
    </style>
    <script type="text/javascript">
        function printDocument() {
            document.getElementById('Button3').style.visibility = 'hidden';
            document.getElementById('Button4').style.visibility = 'hidden';
            document.getElementById('MsgDiv').style.visibility = 'hidden';
            window.print();
            document.getElementById('Button3').style.visibility = 'visible';
            document.getElementById('Button4').style.visibility = 'visible';
        }


    </script>
</head>

<body style="font-size: 12px;">
    <form runat="server">
        <div class="container" style="padding: 10px;">

            <%-- Print Button --%>
            <div class="row" style="padding: 10px;">
                <div class="text-center">
                    <input id="Button3" accesskey="P" class="btn btn-success" onclick="printDocument()"
                        value="Print Statement" />
                    <a href="LoggedInStartPage.aspx">
                        <input id="Button4" accesskey="P" class="btn btn-primary"
                            value="Return" /></a>
                </div>
            </div>

            <%-- Message Label --%>
            <div class="row" id="MsgDiv">
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
            <%-- title section --%>
            <div class="row" style="padding: 15px; border: 1px solid gray; border-top: none;">
                <div class="text-center">
                    <h4>
                        <asp:Label ID="lblHeading" runat="server"></asp:Label></h4>
                </div>
            </div>

            <%-- data set section --%>
            <div class="row" style="padding: 15px; border: 1px solid gray; border-top: none;">
                <div class="table-responsive">
                    <div class="container">
                        <div class="row">
                            <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
                                <div class="row">
                                    <div class="col-xs-6 col-sm-6 col-md-6">
                                        CompanyName: <strong>
                                            <asp:Label ID="lblCompanyName" runat="server">
                                Gringotts Bank
                                            </asp:Label></strong>
                                        <br />
                                    </div>
                                    <div class="row">
                                        <div class="text-center">
                                            <h1>Payment Receipt</h1>
                                        </div>
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Details</th>
                                                    <th class="text-center">Value</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="col-md-9"><em>Client Name </em></td>
                                                    <td class="col-md-1" style="text-align: center">
                                                        <asp:Label ID="lblClientName" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-9"><em>Reciept Number</em></td>
                                                    <td class="col-md-3" style="text-align: center">
                                                        <asp:Label ID="lblRecieptNumber" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-9"><em>Invoice Number</em></td>
                                                    <td class="col-md-3" style="text-align: center">
                                                        <asp:Label ID="lblInvoiceNumber" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-9"><em>Payment Type</em></td>
                                                    <td class="col-md-3" style="text-align: center">
                                                        <asp:Label ID="lblPaymentType" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-9"><em>Bank Name</em></td>
                                                    <td class="col-md-3" style="text-align: center">
                                                        <asp:Label ID="lblBankName" runat="server"></asp:Label></td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-9"><em>Bank Account Name</em></td>
                                                    <td class="col-md-3" style="text-align: center">
                                                        <asp:Label ID="lblBankAccountName" runat="server"></asp:Label></td>

                                                </tr>

                                                <tr>
                                                    <td class="col-md-9"><em>Bank Account Number</em></td>
                                                    <td class="col-md-1" style="text-align: center">
                                                        <asp:Label ID="lblBankAccountNumber" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-9"><em>Cheque Number</em></td>
                                                    <td class="col-md-1" style="text-align: center">
                                                        <asp:Label ID="lblChequeNumber" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-9"><em>Payment Date </em></td>
                                                    <td class="col-md-1" style="text-align: center">
                                                        <asp:Label ID="lblPaymentDate" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-9"><em>Amount </em></td>
                                                    <td class="col-md-1" style="text-align: center">
                                                        <asp:Label ID="lblAmount" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-9"><em>Currency </em></td>
                                                    <td class="col-md-1" style="text-align: center">
                                                        <asp:Label ID="lblCurrency" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="col-md-9"><em>Reciept Category </em></td>
                                                    <td class="col-md-1" style="text-align: center">
                                                        <asp:Label ID="lblRecieptCategory" runat="server"></asp:Label>
                                                    </td>
                                                </tr>

                                            </tbody>
                                        </table>
                                        <div class="row">
                                            <div class="col-lg-2"></div>
                                            <div class="col-lg-8">
                                                &nbsp;
                                            </div>
                                            <div class="col-lg-2"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
