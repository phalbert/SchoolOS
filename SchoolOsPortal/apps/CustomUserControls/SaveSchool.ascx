<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SaveSchool.ascx.cs" Inherits="SaveSchool" %>

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
                        SUPPLY THE SCHOOL DETAILS USING FORM BELOW
                    </div>

                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-6">
                                <label>School Logo</label><br />
                                <asp:ImageButton OnClick="SchoolLogo_Click" ImageUrl="../ImageHandler.ashx?Id=Default" Width="150" Height="150" runat="server" ID="SchoolLogo" CssClass="img-thumbnail" />
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-lg-6">
                                <label>Name of the School</label>
                                <asp:TextBox ID="txtSchoolName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-6">

                                <label>School Code</label>
                                <asp:TextBox ID="txtSchoolCode" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                <label>UNEB Centre Number <small>If applicable</small></label>
                                <asp:TextBox ID="txtUnebNumber" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-6">
                                <label>Schools Bank</label>
                                <asp:DropDownList ID="ddBanks" runat="server" CssClass="form-control">
                                    <asp:ListItem>True</asp:ListItem>
                                    <asp:ListItem>False</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-lg-6">
                                <label>Account Name</label>
                                <asp:TextBox ID="txtAccountName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-6">
                                <label>Account Number</label>
                                <asp:TextBox ID="txtAccountNumber" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                <label>Email</label>
                                <asp:TextBox ID="txtSchoolEmail" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-6">
                                <label>Plot No.</label>
                                <asp:TextBox ID="txtPlotNumber" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                <label>Street / Road name</label>
                                <asp:TextBox ID="txtRoadName" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-6">
                                <label>Divison / Sub County</label>
                                <asp:TextBox ID="txtSubCounty" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                <label>District</label>
                                <asp:TextBox ID="txtDistrict" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-6">
                                <label>PostOffice Box Number</label>
                                <asp:TextBox ID="txtPostOfficeNumber" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                <label>Office Phone</label>
                                <asp:TextBox ID="txtOfficePhone" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <br />

                        <div class="row">
                            <div class="col-lg-6">
                                <div class="col-lg-6">
                                    <label>
                                        School Type
                                                <small>(check what applies)</small>
                                    </label>
                                    <div data-row-span="12">
                                        <div data-field-span="2">
                                            <asp:CheckBox ID="chkDay" runat="server" />&nbsp;<label for="day">
                                                Day</label>
                                        </div>
                                        <div data-field-span="2">
                                            <asp:CheckBox ID="chkBoarding" runat="server" />&nbsp;<label for="boarding"> Boarding</label>
                                        </div>
                                        <div data-field-span="2">
                                            <asp:CheckBox ID="chkEvening" runat="server" />&nbsp;<label for="evening"> Evening</label>
                                        </div>
                                        <div data-field-span="2">
                                            <asp:CheckBox ID="chkSingle" runat="server" />&nbsp;<label for="single"> Single</label>
                                        </div>
                                        <div data-field-span="2">
                                            <asp:CheckBox ID="chkMixed" runat="server" />&nbsp;<label for="mixed"> Mixed</label>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <label>
                                    School Category
                               
                                    <small>(check what applies)</small>
                                </label>
                                <div data-row-span="12">
                                    <div data-field-span="2">
                                        <asp:RadioButton ID="chkNusery" GroupName="SchoolTypeGp" runat="server" />&nbsp;<label for="chkNusery">
                                            Nursery</label>
                                    </div>
                                    <div data-field-span="2">
                                        <asp:RadioButton ID="chkPrimary" GroupName="SchoolTypeGp" runat="server" />&nbsp;<label for="primary"> Primary</label>
                                    </div>
                                    <div data-field-span="2">
                                        <asp:RadioButton ID="chkSecondary" GroupName="SchoolTypeGp" runat="server" />&nbsp;<label for="secondary"> Secondary</label>
                                    </div>
                                    <div data-field-span="2">
                                        <asp:RadioButton ID="chkTertiary" GroupName="SchoolTypeGp" runat="server" />&nbsp;<label for="tertiary"> Tertiary</label>
                                    </div>

                                </div>
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
                    <asp:FileUpload ID="fuSchoolLogo" runat="server" CssClass="form-control" />
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