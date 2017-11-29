<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ClientForm.aspx.cs" Inherits="ProyectoFinal.ClientForm" %>

<%@ Register Assembly="GMaps" Namespace="Subgurim.Controles" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <div>
    <div class="jumbotron text-center">
        <h3>Registro Clientes</h3>
    </div>
    <%--CEDULA--%>
    <div class="form-group">
        <asp:Label Text="Cédula" runat="server" class="control-label col-md-2"></asp:Label>
        <div class="col-md-10">
            <asp:TextBox ID="txtId" class="form-control" runat="server"></asp:TextBox>
        </div>
    </div>
    <%--NOMBRE--%>
    <div class="form-group">
        <asp:Label Text="Nombre Completo" runat="server" class="control-label col-md-2"></asp:Label>
        <div class="col-md-10">
            <asp:TextBox ID="txtNombreCompleto" class="form-control" runat="server"></asp:TextBox>
        </div>
    </div>
    <%--EMAIL--%>
    <div class="form-group">
        <asp:Label Text="Email" runat="server" class="control-label col-md-2"></asp:Label>
        <div class="col-md-10">
            <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
        </div>
    </div>
    <%--TELEFONO--%>
    <div class="form-group">
        <asp:Label Text="Teléfono" runat="server" class="control-label col-md-2"></asp:Label>
        <div class="col-md-10">
            <asp:TextBox ID="txtPhone" class="form-control" runat="server"></asp:TextBox>
        </div>
    </div>
    <%--PASSWORD--%>
    <div class="form-group">
        <asp:Label Text="Password" runat="server" class="control-label col-md-2"></asp:Label>
        <div class="col-md-10">
            <asp:TextBox ID="txtPassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
        </div>
    </div>
    <%--CONFIRMAR PASSWORD--%>
    <div class="form-group">
        <asp:Label Text="Confirmar Password" runat="server" class="control-label col-md-2"></asp:Label>
        <div class="col-md-10">
            <asp:TextBox ID="txtConPassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
        </div>
    </div>
    <%--DIRECCION--%>
    <div class="form-group">
        <asp:Label Text="Dirección" runat="server" class="control-label col-md-2"></asp:Label>
        <div class="col-md-10">
            <textarea id="txtAddress" runat="server" cols="50" rows="3"></textarea>
        </div>
    </div>
    <%--MAPA--%>
    <div class="form-group">
        <div class="col-md-10">
            <cc1:GMap ID="GMap1" enableServerEvents="True" OnServerEvent="GMap1_ServerEvent" runat="server" />
        </div>
    </div>

    <%--  --%>

    <%--FORMA DE PAGO--%>
    <%--<div class="form-group">
                    <asp:Label Text="Forma De Pago" runat="server" class="control-label col-md-2"></asp:Label>
                    <div class="col-md-10" style="margin-top:7px;">
                        <asp:DropDownList ID="cdxPayMethod" runat="server">
                            <asp:ListItem Value="E">Efectivo</asp:ListItem>
                            <asp:ListItem Value="T">Tarjeta</asp:ListItem>
                            <asp:ListItem Value="C">Cheque</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>--%>
    <%--BOTONES--%>
    <div class="form-group">

        <div class="col-md-offset-2 col-md-10" style="margin-top: 7px;">
            <asp:Button ID="btnBuscar" runat="server" OnClick="btnBuscar_Click" class="btn btn-primary" Text="Buscar" />
            <asp:Button ID="btnAgregar" runat="server" OnClick="btnAgregar_Click" class="btn btn-primary" Text="Agregar" ValidationGroup="vg" />
        </div>
    </div>
 </div>
</asp:Content>
