<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ListTransactions.ascx.cs" Inherits="CustomUserControls_ListTransactions" %>

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

<div class="row">
    <div class="row">
        <div class="col-lg-2">
            <label>Bank</label>
            <asp:DropDownList ID="ddBank" runat="server" CssClass="form-control" AutoPostBack="true" EnableViewState="true" OnSelectedIndexChanged="ddBank_SelectedIndexChanged">
                <asp:ListItem>True</asp:ListItem>
                <asp:ListItem>False</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-lg-2">
            <label>Teller</label>
            <asp:TextBox ID="txtTeller" runat="server" CssClass="form-control" placeholder="Enter text" />
        </div>
        <div class="col-lg-2">
            <label>Student Number</label>
            <asp:TextBox ID="txtAccount" runat="server" CssClass="form-control" placeholder="Enter text" />
        </div>
        <div class="col-lg-2">
            <label>Student Name</label>
            <asp:TextBox ID="txtCustName" runat="server" CssClass="form-control" placeholder="Enter text" />
        </div>
        <div class="col-lg-2">
            <label>Transaction Category</label>
            <asp:DropDownList ID="ddTranCategory" runat="server" CssClass="form-control">
                <asp:ListItem>True</asp:ListItem>
                <asp:ListItem>False</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-lg-2">
            <label>School Transaction Id</label>
            <asp:TextBox ID="txtBankTranId" runat="server" CssClass="form-control" placeholder="Enter text" />
        </div>
    </div>
    <hr />
    <div class="row">

        <div class="col-lg-2">
            <label>PegPay Id</label>
            <asp:TextBox ID="txtPegPayId" runat="server" CssClass="form-control" placeholder="Enter text" />
        </div>
        <div class="col-lg-2">
            <label>From Date</label>
            <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control" placeholder="Enter text" />
        </div>
        <div class="col-lg-2">
            <label>To Date</label>
            <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control" placeholder="Enter text" />
        </div>
        <div class="col-lg-2">
            <label>Reason</label>
            <asp:TextBox ID="txtReason" runat="server" CssClass="form-control" placeholder="Enter text" />
        </div>
        <div class="col-lg-2">
            <label>Search</label>
            <div class="button-wrapper">
                <asp:Button ID="btnSubmit" Width="130px" Height="40px" runat="server" Text="Search" CssClass="btn btn-success btn-lg" OnClick="btnSubmit_Click" />
            </div>
        </div>
    </div>
</div>
<hr />
<asp:MultiView runat="server" ID="Multiview2">
    <asp:View runat="server" ID="resultView">
        <div class="row text-center">
            <div class="col-md-4"></div>
            <div class="col-md-4 form-inline">
                <asp:DropDownList ID="ddExportType" runat="server" CssClass="form-control">
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
</asp:MultiView>

<%--------------------------------------- Scripts-----------------------------------%>
<ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" CssClass="cal_Theme1"
    Format="yyyy-MM-dd" PopupPosition="BottomRight" TargetControlID="txtFromDate">
</ajaxToolkit:CalendarExtender>
<ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" CssClass="cal_Theme1"
    Format="yyyy-MM-dd" PopupPosition="BottomRight" TargetControlID="txtToDate">
</ajaxToolkit:CalendarExtender>
