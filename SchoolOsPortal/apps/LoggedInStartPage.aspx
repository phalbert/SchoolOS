<%@ Page Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeFile="LoggedInStartPage.aspx.cs" Inherits="Admin" Title="START PAGE" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <link type="text/css" href="css/toolkit-inverse.css" rel="stylesheet" />
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

        <aside class="right-side" style="padding-left: 20px; padding-top: 80px;">

            <%------------------------------------------ Message Label ----------------------------------------%>
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-10 text-center">
                    <div class="alert">
                        <img src="ImageHandler.ashx?Id=Default" id="UsersPic" runat="server" class="img-thumbnail" width="250" height="250" /><br /><br />
                        <strong>
                            Hi <asp:Label ID="lblmsg" runat="server"></asp:Label>, Welcome to FlexiSchools.<br />
                            Use the Links on the Left to navigate to different pages which will help you manage your school
                        </strong>
                    </div>
                </div>
                <div class="col-lg-1"></div>
            </div>

            <div class="container">
                <div class="bkz aav aaj">
                    <h3 class="bla blb">Quick stats</h3>
                </div>

                <div class="dh bmk">
                    <div class="eq fp aaj ahq ano">
                        <div class="bml bks">
                            <div class="abw">
                                <span class="bkn">Page views</span>
                                <h2 class="bkm">1,293
          <small class="bko bkp">5%</small>
                                </h2>
                                <hr class="bkw zo">
                            </div>
                            <canvas id="sparkline1" width="378" height="94" class="bmm"
                                data-chart="spark-line"
                                data-dataset="[[28,68,41,43,96,45,100]]"
                                data-labels="['a','b','c','d','e','f','g']"
                                style="width: 189px; height: 47px;"></canvas>
                        </div>
                    </div>
                    <div class="eq fp aaj ahq ano">
                        <div class="bml bkv">
                            <div class="abw">
                                <span class="bkn">Downloads</span>
                                <h2 class="bkm">758
          <small class="bko bkq">1.3%</small>
                                </h2>
                                <hr class="bkw zo">
                            </div>
                            <canvas id="sparkline1" width="378" height="94" class="bmm"
                                data-chart="spark-line"
                                data-dataset="[[4,34,64,27,96,50,80]]"
                                data-labels="['a', 'b','c','d','e','f','g']"
                                style="width: 189px; height: 47px;"></canvas>
                        </div>
                    </div>
                    <div class="eq fp aaj ahq ano">
                        <div class="bml bkt">
                            <div class="abw">
                                <span class="bkn">Sign-ups</span>
                                <h2 class="bkm">1,293
          <small class="bko bkp">6.75%</small>
                                </h2>
                                <hr class="bkw zo">
                            </div>
                            <canvas id="sparkline1" width="378" height="94" class="bmm"
                                data-chart="spark-line"
                                data-dataset="[[12,38,32,60,36,54,68]]"
                                data-labels="['a', 'b','c','d','e','f','g']"
                                style="width: 189px; height: 47px;"></canvas>
                        </div>
                    </div>
                    <div class="eq fp aaj ahq ano">
                        <div class="bml bku">
                            <div class="abw">
                                <span class="bkn">Downloads</span>
                                <h2 class="bkm">758
          <small class="bko bkq">1.3%</small>
                                </h2>
                                <hr class="bkw zo">
                            </div>
                            <canvas id="sparkline1" width="378" height="94" class="bmm"
                                data-chart="spark-line"
                                data-dataset="[[43,48,52,58,50,95,100]]"
                                data-labels="['a', 'b','c','d','e','f','g']"
                                style="width: 189px; height: 47px;"></canvas>
                        </div>
                    </div>
                </div>

            </div>
        </aside>
    </div>

</asp:Content>

