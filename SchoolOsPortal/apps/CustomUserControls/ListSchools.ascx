<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ListSchools.ascx.cs" Inherits="ListSchools" %>



<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="uc" TagName="SaveSchoolsUserControl" Src="~/CustomUserControls/SaveSchool.ascx" %>


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
            <div class="col-lg-1"></div>
            <div class="col-lg-3">
                <label>
                    SchoolCode/School Name
                </label>
                <asp:TextBox ID="txtSchoolName" runat="server" CssClass="form-control" placeholder="Enter text" />
            </div>
            <div class="col-lg-3">
                <label>
                    District
                </label>
                <asp:TextBox ID="txtDistrict" runat="server" CssClass="form-control" placeholder="Enter text" />
            </div>
            <div class="col-lg-3" style="padding-top: 15px;">
                <asp:Button ID="btnSubmit" runat="server" Text="Search DB" CssClass="btn btn-success btn-lg"
                    OnClick="btnSubmit_Click" />
            </div>
            <div class="col-lg-1"></div>
        </div>

        <hr />
        <%------------------------------------------- Search Results  -----------------------------------%>
        <asp:MultiView runat="server" ID="Multiview2">
            <asp:View runat="server" ID="resultView">
                <div class="row text-center">
                    <div class="col-md-4"></div>
                    <div class="col-md-4 form-inline">
                        <asp:DropDownList  ID="ddExportType" runat="server" CssClass="form-control">
                            <asp:ListItem>EXCEL</asp:ListItem>
                            <asp:ListItem>WORD</asp:ListItem>
                        </asp:DropDownList>
                    
                        <asp:Button ID="btnExport" runat="server" Text="Export" CssClass="btn btn-primary btn-md"
                            OnClick="btnExport_Click" />
                    </div>
                    <div class="col-md-4"></div>
                </div>
                <hr />
                <div class="row">
                    <div class="table-responsive">
                        <asp:GridView runat="server" Width="100%" CssClass="table table-bordered table-hover"
                            ID="dataGridResults" OnRowCommand="dataGridResults_RowCommand">
                            <AlternatingRowStyle BackColor="#BFE4FF" />
                            <HeaderStyle BackColor="#115E9B" Font-Bold="false" ForeColor="white" Font-Italic="False"
                                Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Height="30px" />
                            <Columns>
                                <asp:TemplateField HeaderText="Details">
                                    <ItemTemplate>
                                        <asp:Button ID="btnedit" runat="server" Text="Edit" CommandName="EditEntity" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </asp:View>
            <asp:View runat="server" ID="EmptyView">
            </asp:View>
            
        </asp:MultiView>

        <!------------------------------------------------- View2 -------------------------------------------------->
    </asp:View>
    <asp:View ID="EditSchoolView" runat="server">
        <uc:SaveSchoolsUserControl ID="SaveSchoolsUserControl" runat="server" />
    </asp:View>
</asp:MultiView>
