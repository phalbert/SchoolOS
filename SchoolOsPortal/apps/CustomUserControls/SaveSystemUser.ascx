﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SaveSystemUser.ascx.cs" Inherits="SaveSystemUser" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>



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

<asp:MultiView ID="MultiView1" ActiveViewIndex="0" runat="server">
    <asp:View ID="CaptureDetailsView" runat="server">

        <div class="container">

            <%--------------------------------------- Form  ------------------------------------------%>
            <div class="col-lg-2"></div>

            <div class="col-lg-8">

                <div class="panel panel-success">

                    <div class="panel-heading text-center">
                        SUPPLY SYSTEM USER DETAILS USING THE FORM BELOW
                    </div>

                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <label>User Pic</label><br />
                                <asp:ImageButton OnClick="UserPic_Click" ImageUrl="../ImageHandler.ashx?Id=Default" width="150" height="150" runat="server" id="UserPic" class="img-thumbnail" />

                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-6">
                                <label>School Code</label>
                                <asp:DropDownList ID="ddSchools" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="TRUE">YES</asp:ListItem>
                                    <asp:ListItem Value="FALSE">NO</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-lg-6">
                                <label>UserType</label>
                                <asp:DropDownList ID="ddUserTypes" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="TRUE">YES</asp:ListItem>
                                    <asp:ListItem Value="FALSE">NO</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-6">
                                <label>Full Name</label>
                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter text" />
                                <p class="help-block">The Name of the Company</p>
                            </div>
                            <div class="col-lg-6">
                                <label>Phone</label>
                                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter text" />
                                <p class="help-block">Brief Summary of what Contract Covers</p>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-6">
                                <label>Email</label>
                                <asp:TextBox ID="txtEMail" runat="server" CssClass="form-control" placeholder="Enter text" />
                                <p class="help-block">The Name of the Company</p>
                            </div>
                            <div class="col-lg-6">
                                <label>Is Active</label>
                                <asp:DropDownList ID="ddIsActive" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="TRUE">YES</asp:ListItem>
                                    <asp:ListItem Value="FALSE">NO</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-6">
                                <label>UserId</label>
                                <asp:TextBox ID="txtUserId" runat="server" CssClass="form-control" placeholder="Enter text" />
                            </div>
                        </div>
                    </div>

                    <div class="panel-footer">
                        <div class="text-center">
                            <asp:Button ID="btnSubmit" runat="server" Text="Save" Width="200px" CssClass="btn btn-success btn-lg" OnClick="btnSubmit_Click" />
                            <asp:Button ID="btnEdit" runat="server" Text="Save" Width="200px" CssClass="btn btn-success btn-lg" OnClick="btnEdit_Click" />
                        </div>
                    </div>

                </div>
            </div>

            <div class="col-lg-2"></div>
        </div>
    </asp:View>

    <%------------------------------------------------------------ Upload View ------------------------------- --%>
    <asp:View ID="UploadPicView" runat="server">
        <div class="container">

            <%------------------------------------------ Message Label ----------------------------------------%>
            <div class="text-center">
                <div class="row" style="padding-top: 70px;">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-8">
                        <div class="row alert alert-info">
                            Pick an Image to Upload as Profile Pic
                        </div>
                    </div>
                    <div class="col-lg-2"></div>
                </div>
            </div>
            <hr />
            <div class="row text-center">
                <div class="col-lg-4"></div>
                <div class="col-lg-4">
                    <label>
                        Select Profile Picture File
                    </label>
                    <asp:FileUpload ID="fuProfilePic" runat="server" CssClass="form-control" />
                </div>
                <div class="col-lg-4"></div>
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