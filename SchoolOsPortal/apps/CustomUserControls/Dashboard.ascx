<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Dashboard.ascx.cs" Inherits="CustomUserControls_Dashboard" %>

<aside class="right-side" style="padding-left: 20px; padding-top: 50px;">

    <%------------------------------------------ Message Label ----------------------------------------%>
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-10 text-center">
            <div class="alert">
                <img src="ImageHandler.ashx?Id=Default" id="UsersPic" runat="server" class="img-thumbnail" style="width: 400px; height: 300px" /><br />
                <br />
                <strong>Hi
                    <asp:Label ID="lblmsg" runat="server"></asp:Label>, Welcome to FlexiSchools.<br />
                    If it is your First Time Here click<br /> <br /><asp:Button ID="btnFirstTime" runat="server" OnClick="btnFirstTime_Click" Text="First Time SetUp Wizard" CssClass="btn btn-primary" />
                    <br />
                </strong>
            </div>
        </div>
        <div class="col-lg-1"></div>
    </div>

    <hr style="border-color: black;" />
    <div class="container">
        <section class="content">
            <div class="row">
                <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="widget-bg-color-icon card-box">
                        <div class="bg-icon bg-warning pull-left">
                            <i class="fa fa-building text-white"></i>
                        </div>
                        <div class="text-right">
                            <h3 class="text-dark"><b id="widget_count1">
                                <asp:Label ID="lblClassCount" runat="server">8</asp:Label></b></h3>
                            <p>No. of Classes</p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="widget-bg-color-icon card-box border_success">
                        <div class="bg-icon pull-left">
                            <i class="fa fa-user text-success"></i>
                        </div>
                        <div class="text-right">
                            <h3 class="text-success"><b id="widget_count3">
                                <asp:Label ID="lblTeacherCount" runat="server">45</asp:Label></b></h3>
                            <p>No. of Teachers</p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="widget-bg-color-icon card-box">
                        <div class="bg-icon bg-icon-info pull-left">
                            <i style="color: #76a;" class="fa fa-users"></i>
                        </div>
                        <div class="text-right">
                            <h3 class="text-dark"><b id="widget_count2">
                                <asp:Label ID="lblStudentCount" runat="server">1698</asp:Label></b></h3>
                            <p class="text-primary">No. of Students</p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-6 col-lg-3">
                    <div class="widget-bg-color-icon card-box border_danger">
                        <div class="text-center">
                            <h3 class="text-danger"><b id="widget_count4">
                                <asp:Label ID="lblTranAmount" runat="server">110,000,000</asp:Label></b></h3>
                            <p>Total Fees Paid<span class="pull-right">(UGX)</span></p>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>


            <!-- /#right -->
        </section>

    </div>
    <hr style="border-color: black;" />
</aside>
