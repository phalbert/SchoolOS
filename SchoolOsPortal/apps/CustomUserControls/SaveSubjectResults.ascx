<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SaveSubjectResults.ascx.cs" Inherits="CustomUserControls_SaveSubjectResults" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:MultiView ID="MultiView1" ActiveViewIndex="0" runat="server">
    <asp:View ID="SearchView" runat="server">
        <%-------------------------------------------- Message Label ----------------------------------%>
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

        <!---------------------------------------------- Search Options --------------------------------->
        <div class="row">
            <div class="col-lg-2">
                <label>
                    School
                </label>
                <asp:DropDownList ID="ddSchools" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <div class="col-lg-2">
                <label>
                    Semester
                </label>
                <asp:DropDownList ID="ddSemesters" AutoPostBack="true" OnSelectedIndexChanged="ddSemester_SelectedIndexChanged" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <%-- exam,teacher,subject,class --%>
            <div class="col-lg-2">
                <label>
                    Exam
                </label>
                <asp:DropDownList ID="ddExams" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <div class="col-lg-2">
                <label>
                    Teacher
                </label>
                <asp:DropDownList ID="ddTeachers" AutoPostBack="true" OnSelectedIndexChanged="ddTeacher_SelectedIndexChanged" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <div class="col-lg-2">
                <label>
                    Class
                </label>
                <asp:DropDownList ID="ddClasses" AutoPostBack="true" OnSelectedIndexChanged="ddClasses_SelectedIndexChanged" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>
            <div class="col-lg-2">
                <label>
                    Subject
                </label>
                <asp:DropDownList ID="ddSubjects" runat="server" CssClass="form-control">
                </asp:DropDownList>
            </div>


        </div>
        <hr />
        <div class="row text-center">
            <asp:Button ID="btnSubmit" runat="server" Text="Search DB" CssClass="btn btn-success btn-lg"
                OnClick="btnSubmit_Click" formnovalidate/>
        </div>

        <hr />
        <%------------------------------------------- Search Results  -----------------------------------%>
        <asp:MultiView runat="server" ID="Multiview2">
            <asp:View runat="server" ID="resultView">

                <div class="row">
                    <div class="table-responsive">
                        <asp:GridView runat="server" OnRowCreated="GridView1_RowCreated" Width="100%" CssClass="table table-bordered table-hover"
                            ID="dataGridResults" OnRowCommand="dataGridResults_RowCommand" >
                            <AlternatingRowStyle BackColor="#BFE4FF" />
                            <HeaderStyle BackColor="#115E9B" Font-Bold="false" ForeColor="white" Font-Italic="False"
                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Height="30px" />
                            <Columns>
                                <asp:TemplateField HeaderText="Mark">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtMark" required="true" runat="server" CommandName="SaveMark" Text='<%# Eval("Mark") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <Columns>
                                <asp:TemplateField HeaderText="Comments">
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtComments"  runat="server" CommandName="SaveMark" Text='<%# Eval("Comments") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                <hr />
                <div class="row text-center">
                    <asp:Button ID="btnSaveMarks" runat="server" Text="Save Marks" CssClass="btn btn-primary btn-lg"
                        OnClick="btnSaveMarks_Click" />
                </div>
                <hr />
            </asp:View>
            <asp:View runat="server" ID="EmptyView">
            </asp:View>
        </asp:MultiView>

        <!------------------------------------------------- View2 -------------------------------------------------->
    </asp:View>
    <asp:View ID="View2" runat="server">
    </asp:View>
</asp:MultiView>