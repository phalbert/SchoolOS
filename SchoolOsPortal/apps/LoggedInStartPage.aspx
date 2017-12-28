<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="LoggedInStartPage.aspx.cs" Inherits="Admin" Title="START PAGE" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  
    <style>
        .daterangepicker.opensleft:after {
            display: none;
        }

        .date-picker-wrapper {
            z-index: 2;
        }

        .form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control {
            background-color: #fff;
        }

        .daterangepicker.opensright:after {
            content: none;
        }
    </style>

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <!---------------------------------- Left side column. contains the logo and sidebar ---------------------------------------->

        <aside class="right-side" style="padding-left: 20px; padding-top: 150px;">

            <%------------------------------------------ Message Label ----------------------------------------%>
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-10 text-center">
                    <div class="alert">
                        <img src="ImageHandler.ashx?Id=Default" id="UsersPic" runat="server" class="img-circle img-thumbnail" style="width:250px;height:250px" /><br /><br />
                        <strong>
                            Hi <asp:Label ID="lblmsg" runat="server"></asp:Label>, Welcome to FlexiSchools.<br />
                            Use the Links on the Left to navigate to different pages which will help you manage your school
                        </strong>
                    </div>
                </div>
                <div class="col-lg-1"></div>
            </div>

            <hr style="border-color:black;"/>
            <div class="container">
                 <section class="content">
                    <div class="row">
                        <div class="col-sm-6 col-md-6 col-lg-3">
                            <div class="widget-bg-color-icon card-box">
                                <div class="bg-icon bg-warning pull-left">
                                    <i class="fa fa-building text-white"></i>
                                </div>
                                <div class="text-right">
                                    <h3 class="text-dark"><b id="widget_count1">8</b></h3>
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
                                    <h3 class="text-success"><b id="widget_count3">45</b></h3>
                                    <p>No. of Teachers</p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-3">
                            <div class="widget-bg-color-icon card-box">
                                <div class="bg-icon bg-icon-info pull-left">
                                    <i style="color:#76a;" class="fa fa-users"></i>
                                </div>
                                <div class="text-right">
                                    <h3 class="text-dark"><b id="widget_count2">1698</b></h3>
                                    <p class="text-primary">No. of Students</p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="col-sm-6 col-md-6 col-lg-3">
                            <div class="widget-bg-color-icon card-box border_danger">
                                <div class="text-center">
                                    <h3 class="text-danger"><b id="widget_count4">110,000,000</b></h3>
                                    <p>Total Fees Paid<span class="pull-right">(UGX)</span></p>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                    

                    <!-- /#right -->
                </section>

            </div>
            <hr style="border-color:black;"/>
        </aside>
    </div>

</asp:Content>

