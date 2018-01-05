<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SaveStaffMembers.ascx.cs" Inherits="CustomUserControls_SaveStaffMembers" %>

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
                                    SUPPLY THE STAFF MEMBER DETAILS USING FORM BELOW
                                </div>

                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>Staff Pic</label><br />
                                            <asp:ImageButton OnClick="ProfilePic_Click" ImageUrl="~/ImageHandler.ashx?Id=Default" Width="150" Height="150" runat="server" ID="StudentPic" class="img-thumbnail" />

                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>School</label>
                                            <asp:DropDownList ID="ddSchools" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddSchools_SelectedIndexChanged" CssClass="form-control">
                                                <asp:ListItem>True</asp:ListItem>
                                                <asp:ListItem>False</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>Full Name</label>
                                            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter text" />

                                        </div>
                                        <div class="col-lg-6">
                                            <label>Gender</label>
                                            <asp:DropDownList ID="ddGender" runat="server" CssClass="form-control">
                                                <asp:ListItem>Male</asp:ListItem>
                                                <asp:ListItem>Female</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>Email</label>
                                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter text" />

                                        </div>
                                        <div class="col-lg-6">
                                            <label>Phone Number</label>
                                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Enter text" />

                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>Staff Type</label>
                                            <asp:DropDownList ID="ddStaffType" runat="server" CssClass="form-control">
                                                <asp:ListItem>True</asp:ListItem>
                                                <asp:ListItem>False</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>ID Number</label>
                                            <asp:TextBox ID="txtIDNumber" runat="server" CssClass="form-control" placeholder="Enter text" />

                                        </div>
                                    </div>
                                    <br />

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
                </div>
            </div>
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
                    <asp:FileUpload ID="fuStudentPic" runat="server" CssClass="form-control" />
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
