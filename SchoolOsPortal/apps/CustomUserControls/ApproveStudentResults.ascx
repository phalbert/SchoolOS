﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ApproveStudentResults.ascx.cs" Inherits="CustomUserControls_ApproveStudentResults" %>
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
            <div class="col-lg-1"></div>
            <div class="col-lg-3">
                <label>
                    School
                </label>
                <asp:DropDownList ID="ddSchools" runat="server" CssClass="form-control">
                    <asp:ListItem>True</asp:ListItem>
                    <asp:ListItem>False</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-lg-3">
                <label>
                    Student Name/Student Id
                </label>
                <asp:TextBox ID="txtStudentId" runat="server" CssClass="form-control" placeholder="Enter text" />
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
                <hr />
                <div class="row text-center">
                    <asp:Button ID="btnApprove" runat="server" Text="Aprove" CssClass="btn btn-primary btn-lg"
                        OnClick="btnApprove_Click" />
                    <asp:Button ID="btnReject" runat="server" Text="Reject" CssClass="btn btn-danger btn-lg"
                        OnClick="btnReject_Click" />
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
                                <asp:TemplateField HeaderText="Select">
                                     <HeaderTemplate>
                                        <asp:CheckBox ID="chkboxSelectAll" Text=" Select All" runat="server" AutoPostBack="true" OnCheckedChanged="dataGridResults_SelectedIndexChanged" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="CheckBox" runat="server" CommandName="EditEntity" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
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
    <asp:View ID="View2" runat="server">
    </asp:View>
</asp:MultiView>