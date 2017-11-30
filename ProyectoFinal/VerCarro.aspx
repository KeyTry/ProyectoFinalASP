<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerCarro.aspx.cs" Inherits="ProyectoFinal.VerCarro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="jumbotron text-center">
        <h3>Carrito de compras</h3>
    </div>
    <asp:GridView runat="server" ID="gvCaritoCompras" AutoGenerateColumns="false" EmptyDataText="No hay nada en su carrito de compras."
        GridLines="None" Width="100%" CellPadding="5" ShowFooter="true" DataKeyNames="IdProducto"
        OnRowCommand="gvCaritoCompras_RowCommand" OnRowDataBound="gvCaritoCompras_RowDataBound">
        <HeaderStyle HorizontalAlign="Left" BackColor="BlueViolet" ForeColor="AliceBlue" />
        <FooterStyle HorizontalAlign="Right" BackColor="Chocolate" ForeColor="Aqua" />
        <AlternatingRowStyle BackColor="Azure" />
        <Columns>
            <asp:BoundField DataField="IdProducto" HeaderText="Modelo" />

            <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" />
            <asp:TemplateField HeaderText="Cantidad">
                <ItemTemplate>
                    <asp:TextBox runat="server" ID="txtCantidad" Columns="5" Text='<%# Eval("Cantidad") %>'></asp:TextBox><br />

                    <asp:LinkButton runat="server" ID="btnEliminar" Text="Eliminar" CommandName="Eliminar"
                        CommandArgument='<%# Eval("IdProducto") %>' Style="font-size: 12px;"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="PrecioUnitario" HeaderText="Precio" ItemStyle-HorizontalAlign="Right"
                HeaderStyle-HorizontalAlign="Right" DataFormatString="{0:C}" />
            <asp:BoundField DataField="Total" HeaderText="Total" ItemStyle-HorizontalAlign="Right"
                HeaderStyle-HorizontalAlign="Right" DataFormatString="{0:C}" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:Button runat="server" ID="btActulizar" Text="Actualizar el Carrito"
        OnClick="btActulizar_Click" />

    <asp:Button runat="server" ID="btnPagar" Text="Pagar" OnClick="btnPagar_Click" />


    <div class="form-group">
        <asp:Label Text="Tipo de pago" runat="server" class="control-label col-md-2"></asp:Label>
        <div class="col-md-10" style="margin-top: 7px;">
            <asp:DropDownList ID="cbxTipoPago" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem>Efectivo</asp:ListItem>
                <asp:ListItem>Tarjeta</asp:ListItem>
                <asp:ListItem>Cheque</asp:ListItem>
            </asp:DropDownList>
        </div>
    </div>

    <div class="form-group" id="DatosCheque">
        <asp:Label Text="Banco" runat="server" class="control-label col-md-2"></asp:Label>
        <div class="col-md-10" style="margin-top: 7px;">
            <asp:Label ID="NombreBanco" runat="server" Text="Label"></asp:Label>
        </div>

        <div class="form-group">
            <asp:Label Text="Numero de cheque" runat="server" class="control-label col-md-2"></asp:Label>
            <div class="col-md-10" style="margin-top: 7px;">
                <asp:Label ID="Cheque" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
    </div>


    <div class="form-group">
        <asp:Label Text="Numero de cheque" runat="server" class="control-label col-md-2"></asp:Label>
        <div class="col-md-10" style="margin-top: 7px;">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>
    </div>

</asp:Content>
