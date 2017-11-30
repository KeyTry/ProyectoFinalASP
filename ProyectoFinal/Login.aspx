<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoFinal.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="form-horizontal" style="margin-top:24px">
        <div class="jumbotron-text-center">
            <h3>Inciar Sesión</h3>
        </div>

        <div class="form-group">
            <asp:Label ID="LabelEmail" runat="server" Text="Email: " class="control-label col-md-2"></asp:Label>
            
            <div class="col-md-10">
                <asp:TextBox ID="txtEmail" class="form-control" TextMode="Email" runat="server"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Password: " class="control-label col-md-2"></asp:Label>
            
            <div class="col-md-10">
                <asp:TextBox ID="txtPassword" runat="server" class="form-control" TextMode="Password"></asp:TextBox>
            </div>
        </div>

        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Recordar" class="control-label col-md-2"></asp:Label>
            <div class="col-md-10">
                <asp:CheckBox ID="chkRecordar" runat="server" class="checkbox"/>
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button ID="btnIniciar" class="btn btn-primary" runat="server" Text="Iniciar Sesión" OnClick="btnIniciar_Click" />
            </div>
        </div>
    </div>
</asp:Content>
