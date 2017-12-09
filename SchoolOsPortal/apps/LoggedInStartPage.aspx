<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="LoggedInStartPage.aspx.cs" Inherits="Admin" Title="START PAGE" %>

<%@ Import Namespace="InterLinkClass.PegasusManagementApi" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <hr />
    <div class="row" style="padding-top: 10px">
        <div class="col-md-5">
            <a href="LoggedInStartPage.aspx">
                <img class="img-responsive img-thumbnail" style="height: 300px; border: none; border-color: #DDDDDD;border-style:solid;border-width:1px;"
                    src="Images\PegasusNewLogo.png" alt="">
            </a>
        </div>
        <div class="col-md-7">
            <h3>Hi
                <asp:Label runat="server" ID="lblUsername">Username</asp:Label></h3>
            <h4>Nice to See you </h4>
            <p>Welcome to the Inhouse Pegasus Management System.</p>
            <p>For a quick Start, Use the links on your left to Navigate</p>
        </div>
    </div>
    <hr />
    <!-- Page Content -->
    <div class="container">

        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="NormalView" runat="server">
                <div class="row">
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4><i class="fa fa-fw fa-check"></i>Welcome to Modern Banking</h4>
                            </div>
                            <div class="panel-body">
                                <p>
                                    Tired of purchasing Expensive Accounting Platforms for your Company that never meet your Bussiness needs.
                        PegPay Inhouse is your Solution. PegPay Inhouse is custom mad Cloud Based Core Banking platform that your Bank,SACCO can Use to meet customer needs.
                        Savings,Loans,Interest,Investments all done in the cloud. Contact Pegasus to know more.
                                </p>
                                <a href="#" class="btn btn-default">Learn More</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4><i class="fa fa-fw fa-gift"></i>Everything Done in The Cloud</h4>
                            </div>
                            <div class="panel-body">
                                <p>
                                    Lets handle all your needs. We do the heavy lifting, you do bussiness to serve your customer. 
                        Https, 128 bit encryption provides Enhanced Security along with comprehensive Security logs like Audit trail,Approving Customers and Accounts etc
                        We worry so you dont.
                                </p>
                                <a href="#" class="btn btn-default">Learn More</a>
                            </div>
                        </div>
                    </div>

                </div>
            </asp:View>

            <asp:View ID="CustomersView" runat="server">
                <%-- Message Label --%>
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

                <div class="text-center" style="visibility:hidden">
                    <!-- /.row -->
                    <div class="row">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-3">
                            <label>Bank</label>
                            <asp:DropDownList ID="ddBank" runat="server" CssClass="form-control">
                                <asp:ListItem>True</asp:ListItem>
                                <asp:ListItem>False</asp:ListItem>
                            </asp:DropDownList>
                            <p class="help-block">The bank to which the Account Belongs</p>
                        </div>
                        <div class="col-md-3">
                            <label>Merchant Account</label>
                            <asp:DropDownList ID="ddAccountNumbers" runat="server" CssClass="form-control">
                                <asp:ListItem>True</asp:ListItem>
                                <asp:ListItem>False</asp:ListItem>
                            </asp:DropDownList><p class="help-block">The Account Number</p>
                        </div>
                        <div class="col-sm-3">
                            <br />
                            <asp:Button ID="btnSearch" runat="server" Text="Search" Width="200px" CssClass="btn btn-success btn-lg" OnClick="btnSearch_Click" />
                        </div>
                        <div class="col-sm-1"></div>
                    </div>
                </div>
                <hr />
                <asp:MultiView runat="server" ID="Multiview2">
                    <asp:View runat="server" ID="resultView">
                        <div class="panel panel-info">
                            
<div class="row">
                    <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
                        <div class="row">
                            <div class="col-xs-6 col-sm-6 col-md-6">
                                <address>
                                    BankName: <strong>
                                        <asp:Label ID="lblBankName" runat="server">
                                Gringotts Bank
                                        </asp:Label></strong>
                                    <br />
                                    Branch: 
                        <asp:Label ID="lblBranch" runat="server">
                        2135 Sunset Blvd
                        </asp:Label>
                                    <br />
                                    Loaction:
                                    <asp:Label ID="lblLocation" runat="server">
                        Los Angeles, CA 90026</asp:Label>
                                    <br />
                                    <br />
                                    <abbr title="Customer Service">Customer Service Rep.ID:
                                    <asp:Label ID="lblUserId" runat="server"></asp:Label>
                                </address>
                            </div>
                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                <p>
                                    <asp:Label ID="lblDate" runat="server">
                        <em>Date: </em></asp:Label>
                                </p>
                                <p>
                                    <em>Customer ID #:
                                        <asp:Label ID="lblCustomerIDs" runat="server"></asp:Label></em>
                                </p>
                            </div>
                        </div>
                        <div class="row">
                            <div class="text-center">
                                <h1>Account Details</h1>
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
                                        <td class="col-md-9"><em>Merchant Name</em></td>
                                        <td class="col-md-3" style="text-align: center">
                                            <asp:Label ID="lblAccTitle" runat="server"></asp:Label></td>
                                    </tr>
                                     <tr>
                                        <td class="col-md-9"><em>Merchant Type</em></td>
                                        <td class="col-md-3" style="text-align: center">
                                            <asp:Label ID="lblAccType" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="col-md-9"><em>Account Number</em></td>
                                        <td class="col-md-3" style="text-align: center">
                                            <asp:Label ID="lblBankNumber" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="col-md-9"><em>Merchant Code</em></td>
                                        <td class="col-md-3" style="text-align: center">
                                            <asp:Label ID="lblAccountNumber" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td class="col-md-9"><em>Customer ID Number</em></td>
                                        <td class="col-md-3" style="text-align: center">
                                            <asp:Label ID="lblOwnerNames" runat="server"></asp:Label></td>

                                    </tr>

                                    <tr>
                                        <td class="col-md-9"><em>Liquidation with bank</em></td>
                                        <td class="col-md-1" style="text-align: center">
                                            <asp:Label ID="lblliqType" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col-md-9"><em>Referencing required</em></td>
                                        <td class="col-md-1" style="text-align: center">
                                            <asp:Label ID="lblrefrequired" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col-md-9"><em>Opened On </em></td>
                                        <td class="col-md-1" style="text-align: center">
                                            <asp:Label ID="lblCreatedOn" runat="server"></asp:Label>
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
                            <div class="panel-footer">
                                <div class="row">
                                    <div class="col-lg-4"></div>
                                    <div class="col-lg-4">
                                        <asp:Button ID="btnSetAsMainAccount" runat="server" Text="Set This as Your Main Account" CssClass="btn btn-success btn-block" OnClick="btnSetAsMainAccount_Click" />
                                    </div>
                                    <div class="col-lg-4"></div>
                                </div>
                            </div>
                        </div>
                    </asp:View>
                </asp:MultiView>
            </asp:View>

        </asp:MultiView>
        <!-- /.row -->
    </div>
    <!-- /.container -->





</asp:Content>

