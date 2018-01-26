<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PrintStudentReport.ascx.cs" Inherits="CustomUserControls_PrintStudentReport" %>

<style>
.report-card{max-width: 595px;max-height: 842px;margin:20px;}
.student-image{float:right;}
.school-badge{float: left;}
.table-bordered{border: 1px solid #000;}
.table-bordered>tbody>tr>td{border: 1px solid #000;padding-left: 10px}
.table-bordered>thead>tr>th{border: 1px solid #000;}
.details{margin:20px;}
.analysis{margin-bottom:20px;}
.motto{text-align: center;padding-bottom: 20px;}
@media screen {
  #printSection {
      display: none;
  }
}
@media print {
  body * {
    visibility:hidden;
  }
  #printSection, #printSection * {
    visibility:visible;
    max-width: 1280px!important;
    max-height:1800px!important;
  }
  #printSection {
    position:absolute;
    left:0;
    top:0;
  }
}
@page { size: auto;  margin: 0mm; }
</style>

<div class="wrapper row-offcanvas row-offcanvas-left">

<aside class="right-side">

<section class="content">
	<div id="printable-area" class="report-card">
		<div class="row report-header">
			<div class="col-md-4 school-badge">
				<img Id="SchoolLogo" runat="server" src="img/sample-badge.png" width="150" height="180" />
			</div>

			<div class="col-md-4 school-info">
				<h3 style="text-transform: uppercase;text-align: center;margin-top:0px;"><asp:Label runat="server" ID="lblSchoolName">DEMO SECONDARY SCHOOL</asp:Label></h3>
				<div class="row motto">
			<div class="col-md-12">
				<i><strong><p style="font-size:15px;"><asp:Label runat="server" ID="lblSchoolMoto">Education brings prosperity."</asp:Label></p></strong></i>
			</div>
		</div>

				<p style="text-align: center;"><asp:Label runat="server" ID="lblBoxOffice">P.O Box 2312, Mukono</asp:Label><br><asp:Label runat="server" ID="lblContact">+256772000931, infodemo@gmail.com</asp:Label></p>
			</div>

			<div class="col-md-4 student-image">
				<img runat="server" id="StudentsPic" src="img/sample-student.jpg" width="150" height="180" />
			</div>
		</div>
		<h3 align="center">END OF TERM REPORT II 2018</h3>

		<div class="row details">
        	<center>
        	<div class="col-md-6">
        		<b>STUDENT</b>:<asp:Label runat="server" ID="lblStudentName"> COLLIN RUKUNDO</asp:Label>
        	</div>
        	<div class="col-md-6">
        		<b>CLASS/STREAM</b>: <asp:Label runat="server" ID="lblStream">CLASS ONE WEST</asp:Label>
        	</div>
        	<div class="col-md-6">
        		<b>CLASS POSITION</b>: <asp:Label runat="server" ID="lblPostion"> 78/234</asp:Label>
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
                
	            
	            <tr>
	            	<td>204</td>
	            	<td>LITERATURE IN ENG</td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            </tr>
	            <tr>
	            	<td>224</td>
	            	<td>HISTORY</td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            </tr>
	            <tr>
	            	<td>241</td>
	            	<td>GEOGRAPHY</td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            </tr>
	            <tr>
	            	<td>273</td>
	            	<td>KISWAHILI</td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            </tr>
	            <tr>
	            	<td>335</td>
	            	<td>MATHEMATICS</td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            </tr>
	            <tr>
	            	<td>336</td>
	            	<td>AGRICULTURE</td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            </tr>
	            <tr>
	            	<td>456</td>
	            	<td>PHYSICS</td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            </tr>
	            <tr>
	            	<td>527</td>
	            	<td>CHEMISTRY</td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            </tr>
	            <tr>
	            	<td>535</td>
	            	<td>BIOLOGY</td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            </tr>
	            <tr>
	            	<td>610</td>
	            	<td>FINE ART</td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            </tr>
	            <tr>
	            	<td>800</td>
	            	<td>COMMERCE</td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            </tr>
	            <tr>
	            	<td>840</td>
	            	<td>COMPUTER STUDIES</td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            </tr>
	            <tr>
	            	<td>845</td>
	            	<td>ENTREPRENEURSHIP</td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            	<td></td>
	            </tr>
	            
	            </tbody>
	            </table>
        </div>

        <div class="row analysis">
        	<center>
        	<div class="col-md-6">
        		<b>TOTAL MARKS</b>: <span style="font-size:16px">{{total_mark}}</span>
        	</div>
        	<div class="col-md-6">
        		<b>AVERAGE</b>: <span style="font-size:16px">{{average}}</span>
        	</div>
        	<div class="col-md-6">
        		<b>AGG in 8</b>: <span style="font-size:16px">{{aggregate}}</span>
        	</div>
        	<div class="col-md-6">
        		<b>GRADE</b>: <span style="font-size:16px">{{grade}}</span>
        	</div>
        	</center>
        </div>

        <div class="row grading">
        	<table class="table table-bordered table-responsive">
        		<tr>
        			<th>D1</th>
        			<th>D2</th>
        			<th>C3</th>
        			<th>C4</th>
        			<th>C5</th>
        			<th>C6</th>
        			<th>P7</th>
        			<th>P8</th>
        			<th>F9</th>
        		</tr>

        		<tr>
        			<td>80-100</td>
        			<td>75-79</td>
        			<td>70-74</td>
        			<td>65-69</td>
        			<td>60-64</td>
        			<td>50-59</td>
        			<td>45-49</td>
        			<td>35-44</td>
        			<td>0-34</td>	
        		</tr>


        	</table>

        </div>

        <div class="row remarks">
        	<div class="col-md-12">
        		<strong><p>Class teacher's remarks</strong>:<hr width="595px" align="left"></p>
			</div>

        </div>

	</div>
		<button id="btnPrint" class="btn btn-lg btn-success">Print</button>

	</section>
</aside>

</div>

<script type="text/javascript">
    
document.getElementById("btnPrint").onclick = function () {
    printElement(document.getElementById("printable-area"));
}

function printElement(elem) {
    var domClone = elem.cloneNode(true);
    
    var $printSection = document.getElementById("printSection");
    
    if (!$printSection) {
        var $printSection = document.createElement("div");
        $printSection.id = "printSection";
        document.body.appendChild($printSection);
    }
    
    $printSection.innerHTML = "";
    $printSection.appendChild(domClone);
    window.print();
}

</script>