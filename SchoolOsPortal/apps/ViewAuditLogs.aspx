<%@ Page Language="C#" MasterPageFile="~/Main.master" Title="VIEW AUDIT TRAIL" AutoEventWireup="true" CodeFile="ViewAuditLogs.aspx.cs" Inherits="ViewAuditLogs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <div class="wrapper row-offcanvas row-offcanvas-left" style="padding-top:30px">
                <!---------------------------------- Left side column. contains the logo and sidebar ---------------------------------------->

                <aside class="right-side" style="padding-left: 40px;">
                    <%--------------------------------- Message Label ----------------------------------%>
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

                    <div class="row">
                        <div class="col-sm-3">
                            <label>School</label>
                            <asp:DropDownList ID="ddBank" runat="server" CssClass="form-control">
                                <asp:ListItem>True</asp:ListItem>
                                <asp:ListItem>False</asp:ListItem>
                            </asp:DropDownList>
                            <p class="help-block">The bank to which the User Belongs</p>
                        </div>
                        <div class="col-md-3">
                            <label>User Id</label>
                            <asp:TextBox ID="txtUserId" runat="server" CssClass="form-control" placeholder="Enter text" />
                            <p class="help-block">The Users Id</p>
                        </div>
                        <div class="col-sm-3">
                            <label>Action</label>
                            <asp:DropDownList ID="ddAction" runat="server" CssClass="form-control">
                                <asp:ListItem>All</asp:ListItem>
                                <asp:ListItem>Create</asp:ListItem>
                                <asp:ListItem>Update</asp:ListItem>
                                <asp:ListItem>Delete</asp:ListItem>
                                <asp:ListItem>Login</asp:ListItem>
                                <asp:ListItem>LogOut</asp:ListItem>
                            </asp:DropDownList>
                            <p class="help-block">The Action carried out by the user. Can be empty</p>
                        </div>
                        <div class="col-sm-3"></div>
                    </div>

                    <div class="row">
                        <div class="text-center">
                            <asp:Button ID="btnSubmit" runat="server" Text="Search" Width="200px" CssClass="btn btn-success btn-lg" OnClick="btnSubmit_Click" />
                        </div>
                    </div>
                    <hr />
                    <asp:MultiView runat="server" ID="Multiview2">
                        <asp:View runat="server" ID="resultView">
                            <div class="row">
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2">
                                    <asp:RadioButton ID="rdPdf" runat="server" Font-Bold="True" GroupName="FileFormat"
                                        Text=" PDF" />
                                </div>
                                <div class="col-lg-2">
                                    <asp:RadioButton ID="rdExcel" runat="server" Font-Bold="True" GroupName="FileFormat"
                                        Text=" EXCEL" />
                                </div>
                                <div class="col-lg-2">
                                    <asp:Button ID="btnConvert" runat="server" Font-Size="9pt" Height="23px" OnClick="btnConvert_Click"
                                        CssClass="btn-primary" Text="Convert" Width="85px" />
                                </div>
                                <div class="col-lg-2"></div>
                                <div class="col-lg-2"></div>
                            </div>
                            <hr />
                            <div class="row">
                                <div class="table-responsive">
                                    <asp:GridView runat="server" Width="100%" CssClass="table table-bordered table-hover" ID="dataGridResults">
                                        <AlternatingRowStyle BackColor="#BFE4FF" />
                                        <HeaderStyle BackColor="#115E9B" Font-Bold="false" ForeColor="white" Font-Italic="False"
                                            Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Height="30px" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </asp:View>
                        <asp:View runat="server" ID="EmptyView">
                        </asp:View>
                        <asp:View runat="server" ID="AddSignatoryView">
                            <div class="row">
                                <div class="table-responsive">
                                    <asp:GridView runat="server" Width="100%" CssClass="table table-bordered table-hover" ID="dataGridResults2" AllowPaging="true"
                                        OnPageIndexChanging="OnPageIndexChanging" PageSize="15">
                                        <AlternatingRowStyle BackColor="#BFE4FF" />
                                        <HeaderStyle BackColor="#0375b7" Font-Bold="false" ForeColor="white" Font-Italic="False"
                                            Font-Overline="False" Font-Strikeout="False" Font-Underline="False" Height="30px" />
                                        <PagerStyle CssClass="cssPager" BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Center" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </aside>
            </div>
        </asp:View>
        <asp:View ID="View2" runat="server">
        </asp:View>
    </asp:MultiView>
</asp:Content>
