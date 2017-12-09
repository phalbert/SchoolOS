<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SaveInvoice.ascx.cs" Inherits="SaveInvoice" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:MultiView ID="MultiView1" ActiveViewIndex="0" runat="server">
    <asp:View ID="CaptureDetailsView" runat="server">
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <%------------------------------------------ Message Label ----------------------------------------%>
                    <div class="row">
                        <div class="col-lg-1">
                        </div>
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
                        <div class="col-lg-1">
                        </div>
                    </div>
                    <div class="container">
                        <%--------------------------------------- Form  ------------------------------------------%>
                        <div class="col-lg-2">
                        </div>
                        <div class="col-lg-8">
                            <div class="panel panel-success">
                                <div class="panel-heading text-center">
                                    SUPPLY THE INVOICE DETAILS USING THE FORM BELOW
                                </div>
                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>
                                                Company Name</label>
                                            <asp:DropDownList ID="ddCompanies" runat="server" CssClass="form-control">
                                                <asp:ListItem>False</asp:ListItem>
                                                <asp:ListItem>True</asp:ListItem>
                                            </asp:DropDownList>
                                            <p class="help-block">
                                                The Name of the Company</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>
                                                Client/Supplier Name</label>
                                            <asp:DropDownList ID="ddClientName" runat="server" CssClass="form-control" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddClientName_SelectedIndexChanged">
                                                <asp:ListItem>False</asp:ListItem>
                                                <asp:ListItem>True</asp:ListItem>
                                            </asp:DropDownList>
                                            <p class="help-block">
                                                The Name of the Client</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>
                                                Invoice Number</label>
                                            <asp:TextBox ID="txtInvoiceNumber" runat="server" CssClass="form-control" placeholder="Enter text" />
                                            <p class="help-block">
                                                The Name of the Client</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>
                                                Invoice Date</label>
                                            <asp:TextBox ID="txtxInvoiceDate" Style="z-index: 10000;" runat="server" CssClass="form-control"
                                                placeholder="Enter text" />
                                            <p class="help-block">
                                                The Date Associated with this Invoice</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>
                                                Invoice Amount</label>
                                            <asp:TextBox ID="txtInvoiceAmount" Text="0.0" runat="server" CssClass="form-control invoice-amount"
                                                placeholder="Enter text" onkeyup="javascript:this.value=Comma(this.value);" onchange="CalculateTotalInvoiceAmount();" />
                                            <p class="help-block">
                                                The Location of this client</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>
                                                Tax Amount</label>
                                            <asp:TextBox ID="txtTaxAmount" Text="0.0" runat="server" CssClass="form-control tax"
                                                placeholder="Enter text" onkeyup="javascript:this.value=Comma(this.value);" onchange="CalculateTotalInvoiceAmount();" />
                                            <p class="help-block">
                                                The Tax Amount to Be Applied</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>
                                                Any Other Tax</label>
                                            <asp:TextBox ID="txtAnyotherTax" Text="0.0" runat="server" CssClass="form-control any-other-tax"
                                                placeholder="Enter text" onkeyup="javascript:this.value=Comma(this.value);" onchange="CalculateTotalInvoiceAmount();" />
                                            <p class="help-block">
                                                Any other tax to Apply</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>
                                                Discount Amount</label>
                                            <asp:TextBox ID="txtDiscountAmount" Text="0.0" runat="server" CssClass="form-control discount"
                                                placeholder="Enter text" onkeyup="javascript:this.value=Comma(this.value);" onchange="CalculateTotalInvoiceAmount();" />
                                            <p class="help-block">
                                                Any Discounts given</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>
                                                Total Invoice Amount</label>
                                            <asp:TextBox ID="txtTotalInvoiceAmount" Text="0.0" runat="server" CssClass="form-control total-invoice-amount"
                                                placeholder="Enter text" onkeyup="javascript:this.value=Comma(this.value);" />
                                            <p class="help-block">
                                                (InvoiceAmount + Taxes) - (Discounts)</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>
                                                Currency</label>
                                            <asp:DropDownList ID="ddCurrencies" runat="server" CssClass="form-control">
                                                <asp:ListItem>False</asp:ListItem>
                                                <asp:ListItem>True</asp:ListItem>
                                            </asp:DropDownList>
                                            <p class="help-block">
                                                The Currency</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>
                                                Invoice Category</label>
                                            <asp:DropDownList ID="ddInvoiceType" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="SUPPLIER_INVOICE">Suppliers Invoice</asp:ListItem>
                                                <asp:ListItem Value="CLIENT_INVOICE">Clients Invoice</asp:ListItem>
                                            </asp:DropDownList>
                                            <p class="help-block">
                                                The Category to which this invoice Belongs</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>
                                                Is Paid</label>
                                            <asp:DropDownList ID="ddIsPaid" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="FALSE">NO</asp:ListItem>
                                                <asp:ListItem Value="TRUE">YES</asp:ListItem>
                                            </asp:DropDownList>
                                            <p class="help-block">
                                                Is Invoice Already Paid</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>
                                                Correlation ID</label>
                                            <asp:TextBox ID="txtCorrelationID" Text="0.00" runat="server" CssClass="form-control"
                                                placeholder="Enter text" onkeyup="javascript:this.value=Comma(this.value);" />
                                            <p class="help-block">
                                                The Email address of this client</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>
                                                Brief Desc of Invoice Items/Reason</label>
                                            <asp:TextBox TextMode="MultiLine" Columns="50" Rows="5" ID="txtReason" runat="server"
                                                CssClass="form-control" placeholder="Enter text" />
                                            <p class="help-block">
                                                The Name of clients contact</p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>
                                                Image Of Invoice</label>
                                            <asp:FileUpload ID="fuInvoiceImage" runat="server" CssClass="form-control" />
                                            <p class="help-block">
                                                Scanned Image of Invoice</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <div class="text-center">
                                        <asp:Button ID="btnSubmit" runat="server" Text="Save" Width="200px" CssClass="btn btn-success btn-lg"
                                            OnClick="btnSubmit_Click" />
                                        <asp:Button ID="btnEdit" runat="server" Text="Save" Width="200px" CssClass="btn btn-success btn-lg"
                                            OnClick="btnEdit_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-2">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" CssClass="cal_Theme1"
            Format="yyyy-MM-dd" PopupPosition="BottomRight" TargetControlID="txtxInvoiceDate">
        </ajaxToolkit:CalendarExtender>
        <script type="text/javascript">
            function CalculateTotalInvoiceAmount() {
                try {
                    var invoiceAmount = $(".invoice-amount").val();
                    //alert("InvoiceAmount: "+invoiceAmount);
                    var tax = $(".tax").val();
                    //alert("Tax: " + tax);
                    var anyotherTax = $(".any-other-tax").val();
                    //alert("AnyOtherTax: " + anyotherTax);
                    var discount = $(".discount").val();
                    //alert("discount: " + discount);
                    var result = (removeCommas(invoiceAmount) + removeCommas(tax) + removeCommas(anyotherTax)) - discount;
                    //alert("Result: " + result);
                    $(".total-invoice-amount").val(Comma(result));
                }
                catch (err) {
                    alert("EXCEPTION rasied: ");
                }
            }

            function removeCommas(str) {
                while (str.search(",") >= 0) {
                    str = (str + "").replace(',', '');
                }
                return parseInt(str);
            };
        </script>
    </asp:View>
    <%------------------------------------------------------------ Confirm View ------------------------------- --%>
    <asp:View ID="ConfirmView" runat="server">
        <div class="container">
            <div class="text-center">
                <div class="row" style="padding-top: 70px;">
                    <div class="col-lg-2">
                    </div>
                    <div class="col-lg-8">
                        <div class="alert alert-info">
                            This Company Already Exists! Are you sure you want to Update it.
                        </div>
                    </div>
                    <div class="col-lg-2">
                    </div>
                </div>
                <hr />
                <div class="row">
                    <asp:Button ID="btnConfirm" runat="server" CssClass="btn btn-success" Text="Confirm Operation"
                        OnClick="btnConfirm_Click" />
                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-danger" Text="Cancel Operation"
                        OnClick="btnCancel_Click" />
                </div>
            </div>
            <hr />
        </div>
    </asp:View>
</asp:MultiView>