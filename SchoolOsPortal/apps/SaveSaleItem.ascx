<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SaveSaleItem.ascx.cs" Inherits="SaveSaleItem" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register TagPrefix="uc" TagName="ListSaleItemsUserControl" Src="~/ListSaleItems.ascx" %>

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
                                    SUPPLY SALE ITEM DETAILS USING THE FORM BELOW
                                </div>

                                <div class="panel-body">
                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>Company Code</label>
                                            <asp:DropDownList ID="ddCompanies" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="TRUE">YES</asp:ListItem>
                                                <asp:ListItem Value="FALSE">NO</asp:ListItem>
                                            </asp:DropDownList>
                                            <p class="help-block">The Name of the Company</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>Client Name</label>
                                            <asp:DropDownList ID="ddClients" runat="server" CssClass="form-control">
                                                <asp:ListItem Value="TRUE">YES</asp:ListItem>
                                                <asp:ListItem Value="FALSE">NO</asp:ListItem>
                                            </asp:DropDownList>
                                            <p class="help-block">The Name of the Client</p>
                                        </div>
                                    </div>

                                    <div class="row">

                                        <div class="col-lg-6">
                                            <label>Item Description</label>
                                            <asp:TextBox ID="txtItemDesc" runat="server" CssClass="form-control" placeholder="Enter text" />
                                            <p class="help-block">Brief Summary of what the Item</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>Item Quantity</label>
                                            <asp:TextBox ID="txtItemQty" runat="server" CssClass="form-control qty" placeholder="Enter text" onchange="CalculateSubtotal();"/>
                                            <p class="help-block">Quantity of Items</p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>Unit Price</label>
                                            <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="form-control unit-price" placeholder="Enter text" onkeyup="javascript:this.value=Comma(this.value);" onchange="CalculateSubtotal();" />
                                            <p class="help-block">The price for one of the Items</p>
                                        </div>
                                        <div class="col-lg-6">
                                            <label>SubTotal</label>
                                            <asp:TextBox ID="txtSubTotal" runat="server" CssClass="form-control subtotal" placeholder="Enter text" />
                                            <p class="help-block">(Unit Price * Item Quantity)</p>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-lg-6">
                                            <label>Sale ID</label>
                                            <asp:TextBox ID="txtSaleID" runat="server" CssClass="form-control" placeholder="Enter text" />
                                            <p class="help-block">Unique Identifier for Sale</p>
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
                            Do you want to Add More Sale Items?
                        </div>
                    </div>
                    <div class="col-lg-2"></div>
                </div>
                <hr />
                <div class="row">
                    <asp:Button ID="btnConfirm" runat="server" CssClass="btn btn-success" Text="Yes. Add More Items" OnClick="btnConfirm_Click" />
                    <asp:Button ID="btnDone" runat="server" CssClass="btn btn-danger" Text="No. Check-out" OnClick="btnDone_Click" />
                </div>
            </div>
            <hr />
        </div>
        <div class="container">
            <uc:ListSaleItemsUserControl ID="ListSaleItemsUserControl" runat="server" />
        </div>
    </asp:View>
</asp:MultiView>
