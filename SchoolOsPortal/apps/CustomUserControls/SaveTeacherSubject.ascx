﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SaveTeacherSubject.ascx.cs" Inherits="CustomUserControls_SaveTeacherSubject" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:MultiView ID="MultiView1" ActiveViewIndex="0" runat="server">
    <asp:View ID="CaptureDetailsView" runat="server">
        <div id="page-wrapper">

            <div class="container-fluid">

                <div class="row">

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

                    <div class="container">

                        <%--------------------------------------- Form  ------------------------------------------%>

                        <div class="col-lg-2"></div>

                        <div class="col-lg-8">

                            <div class="panel panel-success">

                                <div class="panel-heading text-center">
                                    SUPPLY THE SCHOOL FEE DETAILS USING FORM BELOW
                                </div>

                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>School</label>
                                            <asp:DropDownList ID="ddSchools" runat="server" CssClass="form-control">
                                                <asp:ListItem>True</asp:ListItem>
                                                <asp:ListItem>False</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>Teacher</label>
                                            <asp:DropDownList ID="ddTeachers" runat="server" CssClass="form-control">
                                                <asp:ListItem>True</asp:ListItem>
                                                <asp:ListItem>False</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>Term</label>
                                            <asp:DropDownList ID="ddTerm" runat="server" CssClass="form-control">
                                                <asp:ListItem>True</asp:ListItem>
                                                <asp:ListItem>False</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>Class</label>
                                            <asp:DropDownList ID="ddClass" AutoPostBack="true" OnSelectedIndexChanged="ddClass_SelectedIndexChanged" runat="server" CssClass="form-control">
                                                <asp:ListItem>True</asp:ListItem>
                                                <asp:ListItem>False</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>Stream</label>
                                            <asp:DropDownList ID="ddStream" runat="server" CssClass="form-control">
                                                <asp:ListItem>True</asp:ListItem>
                                                <asp:ListItem>False</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>Subject</label>
                                            <asp:DropDownList ID="ddSubjects" AutoPostBack="true" OnSelectedIndexChanged="ddClass_SelectedIndexChanged" runat="server" CssClass="form-control">
                                                <asp:ListItem>True</asp:ListItem>
                                                <asp:ListItem>False</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <br />
                                </div>


                                <div class="panel-footer">
                                    <div class="text-center">
                                        <asp:Button ID="btnSubmit" runat="server" Text="Save" Width="200px" CssClass="btn btn-success btn-lg" OnClick="btnSubmit_Click" />

                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="col-lg-2"></div>
                    </div>
                </div>
            </div>
        </div>
    </asp:View>

    <%------------------------------------------------------------ Confirm View ------------------------------- --%>
    <asp:View ID="ConfirmView" runat="server">
        <div class="container">
            <div class="text-center">
                <div class="row" style="padding-top: 70px;">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-8">
                        <div class="alert alert-info">
                            This School Already Exists! Are you sure you want to Update it.
                        </div>
                    </div>
                    <div class="col-lg-2"></div>
                </div>
                <hr />
                <div class="row">
                    <asp:Button ID="btnConfirm" runat="server" CssClass="btn btn-success" Text="Confirm Operation" OnClick="btnConfirm_Click" />
                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger" Text="Cancel Operation" OnClick="btnCancel_Click" />
                </div>
            </div>
            <hr />
        </div>
    </asp:View>
</asp:MultiView>
