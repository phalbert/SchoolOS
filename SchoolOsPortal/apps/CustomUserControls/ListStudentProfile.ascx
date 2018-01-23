<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ListStudentProfile.ascx.cs" Inherits="CustomUserControls_ListStudentProfile" %>

<aside class="right-side">
    <!-- Content Header (Page header) -->
    
    <!-------------------------------- Main content ----------------------------------------->
    <section class="content" style="padding-left: 20px; padding-top: 50px;">
        <div class="row">
            <div class="panel ">
                <div class="panel-body">
                    <div class="col-md-4">

                        <div class="profile_user">
                            <img id="ProfilePic" runat="server" class="img img-thumbnail" src="../ImageHandler.ashx?Id=Default" style="width:250px;height:250px;" />
                            <h3 class="user_name_max">
                                <asp:Label ID="lblStudentName" runat="server">Collin Rukundo</asp:Label></h3>
                            <p>Student Number: <span style="font-weight: 700;">
                                <asp:Label ID="lblStudentNumber" runat="server">SC0345/17</asp:Label></span></p>
                            <a href="../ManageStudentUserProfile.aspx"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#generate">Manage Your Profile</button></a>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <!----------------- Nav tabs --------------------->
                                <ul class="nav nav-tabs nav-custom">
                                    <li class="active">
                                        <a href="#about" data-toggle="tab">
                                            <strong>About</strong>
                                        </a>
                                    </li>

                                </ul>
                                <!-- Tab panes -->
                                <div class="tab-content nopadding noborder">
                                    <div id="about" class="tab-pane fadeInRight fade in active">
                                        <br />
                                        <br />
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="panel panel-widget panel-default">
                                                    <div class="panel-heading">
                                                        <span class="panel-title"><i class="icon-chart icons"></i>Student Info<i class="icon-settings icons pull-right"></i></span>
                                                    </div>
                                                    <div class="panel-body">
                                                        <p>
                                                            Gender: <span style="font-weight: 700;">
                                                                <asp:Label ID="lblGender" runat="server">Male</asp:Label></span>
                                                        </p>
                                                        <p>
                                                            Nationality: <span style="font-weight: 700;">
                                                                <asp:Label ID="lblNationality" runat="server">Ugandan</asp:Label></span>
                                                        </p>
                                                        <p>
                                                            Date Of Birth: <span style="font-weight: 700;">
                                                                <asp:Label ID="lblDateOfBirth" runat="server">SC0345/17</asp:Label></span>
                                                        </p>
                                                        <p>
                                                            Flexi-Schools StudentNumber: <span style="font-weight: 700;">
                                                                <asp:Label ID="lblPegPayStudentNumber" runat="server">Catholic</asp:Label></span>
                                                        </p>
                                                        <p>
                                                            Class: <span style="font-weight: 700;">
                                                                <asp:Label ID="lblClass" runat="server">Senior Three</asp:Label></span>
                                                        </p>
                                                        <p>
                                                            Stream: <span style="font-weight: 700;">
                                                                <asp:Label ID="lblStream" runat="server">West</asp:Label></span>
                                                        </p>
                                                        <p>Status: <span class="label label-success">Active</span></p>
                                                        <p>
                                                            Current School: <span style="font-weight: 700;">
                                                                <asp:Label ID="lblSchool" runat="server">Namilyango College</asp:Label></span>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="panel panel-widget panel-default">
                                                    <div class="panel-heading">
                                                        <span class="panel-title"><i class="icon-chart icons"></i>Parent Info<i class="icon-settings icons pull-right"></i></span>
                                                    </div>
                                                    <div class="panel-body">
                                                        <p>
                                                            Name: <span style="font-weight: 700;">
                                                                <asp:Label ID="lblParentsName1" runat="server">Micheal Mwesigye</asp:Label></span>
                                                        </p>
                                                        <p>
                                                            Phone: <span style="font-weight: 700;">
                                                                <asp:Label ID="lblParentsPhone1" runat="server">+256 775 432091</asp:Label></span>
                                                        </p>

                                                    </div>
                                                </div>
                                                <div class="panel panel-widget panel-default">
                                                    <div class="panel-heading">
                                                        <span class="panel-title"><i class="icon-chart icons"></i>Parent Info<i class="icon-settings icons pull-right"></i></span>
                                                    </div>
                                                    <div class="panel-body">
                                                        <p>
                                                            Name: <span style="font-weight: 700;">
                                                                <asp:Label ID="lblParentsName2" runat="server">Micheal Mwesigye</asp:Label></span>
                                                        </p>
                                                        <p>
                                                            Phone: <span style="font-weight: 700;">
                                                                <asp:Label ID="lblParentsPhone2" runat="server">+256 775 432091</asp:Label></span>
                                                        </p>

                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                              
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</aside>
