<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PrintStudentReport.ascx.cs" Inherits="CustomUserControls_PrintStudentReport" %>

<style>
    .report-card {
        max-width: 595px;
        max-height: 842px;
        margin: 20px;
    }

    .student-image {
        float: right;
    }

    .school-badge {
        float: left;
    }

    .table-bordered {
        border: 1px solid #000;
    }

        .table-bordered > tbody > tr > td {
            border: 1px solid #000;
            padding-left: 10px;
        }

        .table-bordered > thead > tr > th {
            border: 1px solid #000;
        }

    .details {
        margin: 20px;
    }

    .analysis {
        margin-bottom: 20px;
    }

    .motto {
        text-align: center;
        padding-bottom: 20px;
    }

    @media screen {
        #printSection {
            display: none;
        }
    }



    @page {
        size: auto;
        margin: 0mm;
    }
</style>


<div class="row">
    <div class="col-lg-1"></div>
    <div class="col-lg-10">

        <div class="row text-center" style="padding-top:5px">
            <input id="Button3" accesskey="P" class="btn btn-success" onclick="printDocument();"
                value="Print Report" />
            <a href="LoggedInStartPage.aspx">
                <input id="Button4" accesskey="P" class="btn btn-primary"
                    value="Return Home" />
            </a>
        </div>
        <br />

        <div id="printable-area" class="report-card" style="border: 2px solid black; padding: 10px; height: 2000px">

            <div class="row report-header">
                <div class="col-xs-4 school-badge">
                    <img id="SchoolLogo" runat="server" src="img/sample-badge.png" width="150" height="180" />
                </div>

                <div class="col-xs-3 school-info">
                    <h3 style="text-transform: uppercase; text-align: center; margin-top: 0px;">
                        <asp:Label runat="server" ID="lblSchoolName">DEMO SECONDARY SCHOOL</asp:Label></h3>
                    <div class="row motto">
                        <div class="col-md-12">
                            <i><strong>
                                <p style="font-size: 15px;">
                                    <asp:Label runat="server" ID="lblSchoolMoto">Education brings prosperity."</asp:Label>
                                </p>
                            </strong></i>
                        </div>
                    </div>

                    <p style="text-align: center;">
                        <asp:Label runat="server" ID="lblBoxOffice">P.O Box 2312, Mukono</asp:Label><br>
                        <asp:Label runat="server" ID="lblContact">+256772000931, infodemo@gmail.com</asp:Label>
                    </p>
                </div>

                <div class="col-xs-4 student-image">
                    <img runat="server" id="StudentsPic" src="img/sample-student.jpg" width="150" height="180" />
                </div>
            </div>
            <h3 align="center">END OF TERM REPORT FOR 
                    <asp:Label runat="server" ID="lblTermName">TERM II</asp:Label></h3>

            <div class="row details">
                <center>
        	<div class="col-md-6">
        		<b>STUDENT</b>:<asp:Label runat="server" ID="lblStudentName"> COLLIN RUKUNDO</asp:Label>
        	</div>
        	<div class="col-md-6">
        		<b>CLASS / STREAM</b>: <asp:Label runat="server" ID="lblStream">CLASS ONE WEST</asp:Label>
        	</div>
        	
        	</center>
            </div>
            <div class="row details">
                <center>
                <div class="col-md-6">
        		<b>CLASS POSITION</b>: <asp:Label runat="server" ID="lblPosition"> 4/189</asp:Label>
        	</div>
        	<div class="col-md-6">
        		<b>DATE</b>:<asp:Label runat="server" ID="lblDate"> COLLIN RUKUNDO</asp:Label>
        	</div>
        	</center>
            </div>

            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>CODE</th>
                            <th>SUBJECT</th>
                            <th>BOT</th>
                            <th>MT</th>
                            <th>EOT</th>
                            <th>AVG</th>
                            <th>GRADE</th>
                            <th colspan="2">COMMENT</th>
                        </tr>
                    </thead>
                    <tbody runat="server" id="resultsTable">
                    </tbody>
                </table>
            </div>

            <div class="row analysis">
                <center>
        	<div class="col-md-6">
        		<b>AVERAGE</b>: <span style="font-size:16px">:<asp:Label runat="server" ID="lblAverage">{{average}}</asp:Label></span>
        	</div>
        	<div class="col-md-6">
        		<b>Aggregate</b>: <span style="font-size:16px">:<asp:Label runat="server" ID="lblAggregate">{{aggregate}}</asp:Label></span>
        	</div>
        	</center>
            </div>

            <div class="row text-center" style="padding-left: 20px">
                <asp:GridView runat="server" Width="95%" CssClass="table table-bordered table-responsive"
                    ID="dataGridResults">
                </asp:GridView>

            </div>

            <div class="row remarks">
                <div class="col-md-3">

                    <p>
                        <strong>Class teacher's remarks:
                        </strong>
                    </p>
                </div>
                <div class="col-md-8">
                    <hr style="border-color: black">
                </div>
            </div>

            <div class="row remarks">
                <div class="col-md-3">
                    <p>
                        <strong>Header teacher's Signature:
                        </strong>
                    </p>
                </div>
                <div class="col-md-8">
                    <hr style="border-color: black">
                </div>
            </div>

        </div>
    </div>
    <div class="col-lg-1"></div>
</div>


<script type="text/javascript">
    function printDocument() {
        document.getElementById('Button3').style.visibility = 'hidden';
        document.getElementById('Button4').style.visibility = 'hidden';
        window.print();
        document.getElementById('Button3').style.visibility = 'visible';
        document.getElementById('Button4').style.visibility = 'visible';
    }
</script>
