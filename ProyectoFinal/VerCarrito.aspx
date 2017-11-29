<%@ Page Language=”C#” AutoEventWireup=”true” CodeBehind=”VerCarrito.aspx.cs” Inherits=”CarroDeComprasEjemplo.VerCarrito” %>
<!DOCTYPE html PUBLIC “-//W3C//DTD XHTML 1.0 Transitional//EN” “http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd”&gt;
<html xmlns=”http://www.w3.org/1999/xhtml”&gt;
<head runat=”server”>
    <title></title>
</head>
<body>
    <form id=”form1″ runat=”server”>
    <div style=”background-color: #FFF; padding: 15px; margin: 0 auto; width: 600px;”>
        <h1>
            Carrito de Compras</h1>
        <a href=”CatalogoProductos.aspx”>Seguir Comprando</a>
        <br />
        <br />
        <asp:GridView runat=”server” ID=”gvCaritoCompras” AutoGenerateColumns=”false” EmptyDataText=”No hay nada en su carrito de compras.”
            GridLines=”None” Width=”100%” CellPadding=”5″ ShowFooter=”true” DataKeyNames=”IdProducto”
            OnRowCommand=”gvCaritoCompras_RowCommand” OnRowDataBound=”gvCaritoCompras_RowDataBound”>
            <HeaderStyle HorizontalAlign=”Left” BackColor=”BlueViolet” ForeColor=”AliceBlue” />
            <FooterStyle HorizontalAlign=”Right” BackColor=”Chocolate” ForeColor=”Aqua” />
            <AlternatingRowStyle BackColor=”Azure” />
            <Columns>
                <asp:BoundField DataField=”Descripcion” HeaderText=”Descripcion” />
                <asp:TemplateField HeaderText=”Cantidad”>
                    <ItemTemplate>
                        <asp:TextBox runat=”server” ID=”txtCantidad” Columns=”5″ Text=’<%# Eval(“Cantidad”) %>‘></asp:TextBox><br />
                        <asp:LinkButton runat=”server” ID=”btnEliminar” Text=”Eliminar” CommandName=”Eliminar”
                            CommandArgument=’<%# Eval(“IdProducto”) %>‘ Style=”font-size: 12px;”></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField=”PrecioUnitario” HeaderText=”Precio” ItemStyle-HorizontalAlign=”Right”
                    HeaderStyle-HorizontalAlign=”Right” DataFormatString=”{0:C}” />
                <asp:BoundField DataField=”Total” HeaderText=”Total” ItemStyle-HorizontalAlign=”Right”
                    HeaderStyle-HorizontalAlign=”Right” DataFormatString=”{0:C}” />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button runat=”server” ID=”btActulizar” Text=”Actualizar el Carrito”
            onclick=”btActulizar_Click”/>
    </div>
    </form>
</body>
</html>