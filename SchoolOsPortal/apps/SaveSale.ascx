<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SaveSale.ascx.cs" Inherits="SaveSale" %>

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
                                    SUPPLY SALE DETAILS USING FORM BELOW
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
                                            <label>Sale ID</label>
                                            <asp:TextBox ID="txtSaleID" runat="server" CssClass="form-control" placeholder="Enter text" />
                                            <p class="help-block">The ID for this Sale</p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>Client Name</label>
                                            <asp:DropDownList ID="ddClients" runat="server" CssClass="form-control">
                                                <asp:ListItem>False</asp:ListItem>
                                                <asp:ListItem>True</asp:ListItem>
                                            </asp:DropDownList>
                                            <p class="help-block">The Name of the Client</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>Total Subtotal Amount</label>
                                            <asp:TextBox ID="txtTotalSubtotalAmount" runat="server" CssClass="form-control total-subtotal" placeholder="Enter text" />
                                            <p class="help-block">The Total of all the Sale Items with Same SaleID</p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>Any Other Tax</label>
                                            <asp:TextBox ID="txtAnyOtherTax" Text="0.00" runat="server" CssClass="form-control any-other-tax" placeholder="Enter text" onkeyup="javascript:this.value=Comma(this.value);" />
                                            <p class="help-block">Any Other Tax Applicable to this Sale</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>Discount Amount</label>
                                            <asp:TextBox ID="txtDiscountAmount" runat="server" Text="0.00" CssClass="form-control discount-amount" placeholder="Enter text" onkeyup="javascript:this.value=Comma(this.value);"/>
                                            <p class="help-block">Any discount Amount applicable</p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>Currency</label>
                                            <asp:DropDownList ID="ddCurrencies" runat="server" CssClass="form-control">
                                                <asp:ListItem>False</asp:ListItem>
                                                <asp:ListItem>True</asp:ListItem>
                                            </asp:DropDownList>
                                            <p class="help-block">The currency of the Amounts</p>
                                        </div>
                                    </div>

                                    <div class="row" id="TotalsDiv" runat="server">
                                        <div class="col-lg-6">
                                            <label>Tax Amount</label>
                                            <asp:TextBox ID="txtTaxAmount" runat="server" CssClass="form-control tax-amount" Text="0.00" placeholder="Enter text" onkeyup="javascript:this.value=Comma(this.value);" />
                                            <p class="help-block">VAT % (<asp:Label ID="lblVAT" runat="server" Text="0"></asp:Label>% of Total Subtotal)</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>Total Sale Amount</label>
                                            <asp:TextBox ID="txtTotalSaleAmount" runat="server" CssClass="form-control total-sale-amount" placeholder="Value Auto Calculated" onkeyup="javascript:this.value=Comma(this.value);" />
                                            <p class="help-block">((Total Subtotal+Taxes)-Discounts)This Value will be Auto Calculated on Save</p>
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
            </div>
        </div>

          <script type="text/javascript">
            function CalculateSubtotal() {
                try {
                    var qty = $(".qty").val();
                    var unitPrice = $(".unit-price").val();
                    var result = removeCommas(qty) * removeCommas(unitPrice);
                    $(".subtotal").val(Comma(result));
                }
                catch (err) {
                    alert("EXCEPTION rasied: ");
                }
            }

            function removeCommas(str) {
                while (str.search(",") >= 0) {
                    str = (str + "").replace(',', '');
                }
                return str;
            };
        </script>
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
