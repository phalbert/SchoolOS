<%@ Control Language="C#" AutoEventWireup="true" CodeFile="BulkStudentUpload.ascx.cs" Inherits="BulkStudentUpload" %>

<asp:MultiView ID="MultiView1" ActiveViewIndex="0" runat="server">

    <%------------------------------------------------------------ Confirm View ------------------------------- --%>
    <asp:View ID="ConfirmView" runat="server">
        <div class="container">

            <%------------------------------------------ Message Label ----------------------------------------%>
            <div class="row">
                <div class="col-lg-1"></div>
                <div class="col-lg-10 text-center">
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
                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </strong>
                    <%Response.Write("</div>"); %>
                </div>
                <div class="col-lg-1"></div>
            </div>
            <div class="text-center">
                <div class="row" style="padding-top: 70px;">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-8">
                        <div class="row alert alert-info">
                            Pick a CSV File with columns
                           
                            STUDENT NAME, STUDENT NUMBER (Optional - will be auto generated if not supplied)<br />
                            To download An example file, click <a href="../StudentsFileSample.csv">here</a><br />
                        </div>
                    </div>
                    <div class="col-lg-2"></div>
                </div>
            </div>
            <hr />
            <div class="row text-center">
                <div class="col-lg-4">
                    <label>
                        School
                    </label>
                    <asp:DropDownList ID="ddSchools" runat="server" CssClass="form-control">
                        <asp:ListItem>True</asp:ListItem>
                        <asp:ListItem>False</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-lg-4">
                     <label>
                        Class
                    </label>
                    <asp:DropDownList ID="ddClasses" runat="server" CssClass="form-control">
                        <asp:ListItem>True</asp:ListItem>
                        <asp:ListItem>False</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="col-lg-4">
                    <label>
                        CSV File
                    </label>
                    <asp:FileUpload ID="fuStudentsFile" runat="server" CssClass="form-control" />
                </div>
            </div>
            <hr />
            <div class="row text-center">
                <asp:Button ID="btnConfirm" runat="server" CssClass="btn btn-success" Text="Confirm Operation" OnClick="btnConfirm_Click" />
                <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger" Text="Cancel Operation" OnClick="btnCancel_Click" />
            </div>
        </div>
        <hr />
    </asp:View>
</asp:MultiView>
