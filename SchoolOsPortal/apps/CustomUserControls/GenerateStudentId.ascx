<%@ Control Language="C#" ClassName="CustomUserControls_GenerateStudentId" AutoEventWireup="true" CodeFile="GenerateStudentId.ascx.cs" Inherits="CustomUserControls_GenerateStudentId" %>

<div class="modal-dialog">
    <div class="modal-content">
        <div class="modal-header">
            <h4 class="modal-title">
                <asp:Label runat="server" ID="lblSchoolName">Kings College Buddo Sec School</asp:Label> Student's ID Card</h4>
        </div>
        <div id="printID" class="modal-body">
            <div class="row">
                <div class="col-xs-4">
                    <img id="StudentPic" runat="server" style="width:200px;height:210px" class="img img-thumbnail" src="http://placehold.it/200x260/?text=Student+avatar" alt="student avatar" />
                </div>
                <div class="col-xs-4">
                    <p style="font-weight: 700;">
                        <asp:Label runat="server" ID="lblStudentName">Collin Rukundo</asp:Label>
                    </p>
                    <p>
                        SchoolCode: <span style="font-weight: 700;">
                            <asp:Label runat="server" ID="lblSchoolCode">SC0345/17</asp:Label></span>
                    </p>
                    <p>
                        ID: <span style="font-weight: 700;">
                            <asp:Label runat="server" ID="lblStudentId">SC0345/17</asp:Label></span>
                    </p>
                    <p>
                        Flexi-ID: <span style="font-weight: 700;">
                            <asp:Label runat="server" ID="lblPegPayStudentId">SC0345/17</asp:Label></span>
                    </p>
                    <p>Issued:&nbsp;<span style="font-weight: 700;"><%=DateTime.Now.ToString("dd/MM/yyyy") %></span></p>
                    <p>Expires:&nbsp;<span style="font-weight: 700;"><%=DateTime.Now.AddYears(10).ToString("dd/MM/yyyy") %></span></p>
                    <p style="display: inline-block; padding-top: 10px">Students Signature:</p>
                </div>
                <div class="col-xs-4">
                    <img id="SchoolLogoPic" runat="server" style="width:200px;height:150px" class="img-thumbnail img-circle" src="http://placehold.it/150x150/8a272a/ffffff?text=School+Badge" />

                    <img style="display: inline-block; padding-top: 10px;width:160px;height:60px" class="img" src="http://placehold.it/150x50/?text=sign" />
                </div>
            </div>
        </div>
        <div class="modal-footer">
        </div>
    </div>
</div>
