<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Dashboard.ascx.cs" Inherits="CustomUserControls_Dashboard" %>

<aside class="right-side" style="padding-left: 20px; padding-top: 50px;">

    <section class="content">
        <div style="padding: 10px;" class="row">
            <div class="col-md-4" style="padding-top: 20px;">
                <img src="ImageHandler.ashx?Id=Default" id="UsersPic" runat="server" class="img-thumbnail" style="width: 400px; height: 350px;" /><br />
            </div>
            <div class="col-md-8">
                <h2 style="padding-left: 30px; text-transform: uppercase; line-height: 30px;"><asp:Label ID="lblSchoolName" runat="server">DEMO SECONDARY SCHOOL</asp:Label></h2>
                <blockquote><i><asp:Label ID="lblMoto" runat="server">"Education brings prosperity"</asp:Label></i></blockquote>
                <div style="margin: 30px;" class="panel">
                    <div class="panel-heading">
                        <div class="panel-title">
                            <b>Information</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnFirstTime" runat="server" OnClick="btnFirstTime_Click" Text="First Time SetUp Wizard" CssClass="btn btn-primary" />
                        </div>
                    </div>
                    <div class="panel-body">
                        <p style="font-size: 15px; line-height: 10px; margin-top: 10px; margin-bottom: 10px;"><b>UNEB Centre No:</b> <asp:Label ID="lblUnebNumber" runat="server"></asp:Label></p>
                        <p style="font-size: 15px; line-height: 10px; margin-top: 10px; margin-bottom: 10px;"><b>Plot No:</b> <asp:Label ID="lblPlotNumber" runat="server"></asp:Label></p>
                        <p style="font-size: 15px; line-height: 10px; margin-top: 10px; margin-bottom: 10px;"><b>Street/Road:</b> <asp:Label ID="lblRoad" runat="server"></asp:Label></p>
                        <p style="font-size: 15px; line-height: 10px; margin-top: 10px; margin-bottom: 10px;"><b>District:</b> <asp:Label ID="lblDistrict" runat="server"></asp:Label></p>
                        <p style="font-size: 15px; line-height: 10px; margin-top: 10px; margin-bottom: 10px;"><b>Box No:</b> <asp:Label ID="lblBoxNumber" runat="server"></asp:Label></p>
                        <p style="font-size: 15px; line-height: 10px; margin-top: 10px; margin-bottom: 10px;"><b>Email:</b> <asp:Label ID="lblEmail" runat="server"></asp:Label></p>
                        <p style="font-size: 15px; line-height: 10px; margin-top: 10px; margin-bottom: 10px;"><b>Phone Number:</b> <asp:Label ID="lblPhoneNumber" runat="server"></asp:Label></p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%------------------------------------------ Message Label ----------------------------------------%>

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
