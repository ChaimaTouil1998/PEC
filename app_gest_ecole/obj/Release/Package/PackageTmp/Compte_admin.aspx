<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin.Master" CodeBehind="Compte_admin.aspx.vb" Inherits="app_gest_ecole.Compte_admin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="row text-left" style="padding-left: 70px">
        <asp:TextBox ID="txtId" class="form-control form-control-user" aria-describedby="emailHelp"
            runat="server" Visible="false"></asp:TextBox>
        <h2 style="color: #D32A27; display: inline; text-decoration: underline; text-align: center" class="text-left">CRÉER</h2>
        &nbsp;
        <h2 style="color: #1A3B86; display: inline; text-align: left">UN COMPTE DIRECTEUR PÉDAGOGIQUE</h2>
        <br />
        <br />
        <br />
    </div>

    <div class="row text-left" style="padding-left: 70px">

        <div class="col">
            <div class="form-group">
                <label for="txtPrenom" style="color:black">Prénom:</label>
                <asp:TextBox ID="txtPrenom" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Prénom" runat="server"  style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNom" style="color:black">Nom:</label>
                <asp:TextBox ID="txtNom" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom" runat="server"  style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>

    </div>
    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="txtEmail" style="color:black">Email:</label>
                <asp:TextBox ID="txtEmail" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Email" runat="server"  style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNumPass" style="color:black">N° Passeport:</label>
                <asp:TextBox ID="txtNumPass" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="N° Passeport" runat="server"  style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
    </div>
     <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <asp:Label Text="Image (Format: JPEG,JPG,PNG)" ID="Label4" runat="server" ForeColor="Black"></asp:Label>
                <asp:FileUpload CssClass="form-control" ID="Fichier" runat="server"  style="border-color: #1A3B86"/>
                <asp:TextBox ID="txtChemin" class="form-control form-control-user" runat="server"  style="border-color: #1A3B86" Visible="false"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="row text-left" style="padding-left: 70px">
        <asp:LinkButton ID="btnSave" Text="Ajouter" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" Style="background-color: #1A3B86; width: 350px; border-radius: 10px" runat="server"></asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="btnUndo" Text="Retour" class="d-none d-sm-inline-block btn btn-sm  shadow-sm" Style="background-color: #D32A27; width: 350px; border-radius: 10px; color:white"  runat="server"></asp:LinkButton>
    </div>
    <br /><br /><br /><br /><br /><br /><br /><br /><br />

</asp:Content>
