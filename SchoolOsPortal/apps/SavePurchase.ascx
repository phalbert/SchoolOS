<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SavePurchase.ascx.cs" Inherits="SavePurchase" %>

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
                                    SUPPLY PURCHASE DETAILS USING THE FORM BELOW
                                </div>

                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>Company Name</label>
                                            <asp:DropDownList ID="ddCompanies" runat="server" CssClass="form-control">
                                                <asp:ListItem>False</asp:ListItem>
                                                <asp:ListItem>True</asp:ListItem>
                                            </asp:DropDownList>
                                            <p class="help-block">The Name of the Company</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>Currency</label>
                                            <asp:DropDownList ID="ddCurrencies" runat="server" CssClass="form-control">
                                                <asp:ListItem>False</asp:ListItem>
                                                <asp:ListItem>True</asp:ListItem>
                                            </asp:DropDownList>
                                            <p class="help-block">The Currency of this Purchase Amounts</p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>Supplier</label>
                                            <asp:DropDownList ID="ddSuppliers" runat="server" CssClass="form-control">
                                                <asp:ListItem>False</asp:ListItem>
                                                <asp:ListItem>True</asp:ListItem>
                                            </asp:DropDownList>
                                            <p class="help-block">The Name of the Supplier</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>Invoice Number</label>
                                            <asp:DropDownList ID="ddInvoices" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddInvoices_SelectedIndexChanged">
                                                <asp:ListItem>False</asp:ListItem>
                                                <asp:ListItem>True</asp:ListItem>
                                            </asp:DropDownList>
                                            <p class="help-block">The ID of the Invoice Sent by the Supplier</p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>Invoice Amount</label>
                                            <asp:TextBox ID="txtInvoiceAmount" Text="0.00" runat="server" CssClass="form-control" placeholder="Enter text" onkeyup="javascript:this.value=Comma(this.value);" />
                                            <p class="help-block">The total of the invoice(with out taxes)</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>Tax Amount</label>
                                            <asp:TextBox ID="txtTaxAmount" Text="0.00" runat="server" CssClass="form-control" placeholder="Enter text" onkeyup="javascript:this.value=Comma(this.value);" />
                                            <p class="help-block">The Tax on the Invoice</p>
                                        </div>
                                    </div>

                                    <div class="row">

                                        <div class="col-lg-6">
                                            <label>Any Other Tax</label>
                                            <asp:TextBox ID="txtAnyOtherTax" Text="0.00" runat="server" CssClass="form-control" placeholder="Enter text" onkeyup="javascript:this.value=Comma(this.value);" />
                                            <p class="help-block">Any other additional Tax</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>Discount Amount</label>
                                            <asp:TextBox ID="txtDiscountAmount" Text="0.00" runat="server" CssClass="form-control" placeholder="Enter text" onkeyup="javascript:this.value=Comma(this.value);" />
                                            <p class="help-block">Total Discount amount offered by the Supplier</p>
                                        </div>
                                    </div>

                                    <div class="row">

                                        <div class="col-lg-6">
                                            <label>Total Invoice Amount</label>
                                            <asp:TextBox ID="txtToTalInvoiceAmount" runat="server" CssClass="form-control" Text="0.00" onkeyup="javascript:this.value=Comma(this.value);" />
                                            <p class="help-block">Total Invoice Amount = (Invoice Amnt+Tax Amnt+AnyOtherTax)-Discount Amnt</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>Invoice Date</label>
                                            <asp:TextBox ID="txtInvoiceDate" runat="server" CssClass="form-control" placeholder="Enter text" />
                                            <p class="help-block">The Date on the Invoice sent by The Supplier</p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>Is Paid</label>
                                            <asp:DropDownList ID="ddIsPaid" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="FALSE">NO</asp:ListItem>
                                                <asp:ListItem Value="TRUE">YES</asp:ListItem>
                                            </asp:DropDownList>
                                            <p class="help-block">Is the Purchase Paid for</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>Purchase ID</label>
                                            <asp:TextBox ID="txtPurchaseID" runat="server" CssClass="form-control" placeholder="Enter text" />
                                            <p class="help-block">ID for this purchase</p>
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
                </div>
            </div>
        </div>

        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" CssClass="cal_Theme1"
            Format="yyyy-MM-dd" PopupPosition="BottomRight" TargetControlID="txtInvoiceDate">
        </ajaxToolkit:CalendarExtender>
    </asp:View>

    <%------------------------------------------------------------ Confirm View ------------------------------- --%>
    <asp:View ID="ConfirmView" runat="server">
        <div class="container">
            <div class="text-center">
                <div class="row" style="padding-top: 70px;">
                    <div class="col-lg-2"></div>
                    <div class="col-lg-8">
                        <div class="alert alert-info">
                            This Company Already Exists! Are you sure you want to Update it.
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
