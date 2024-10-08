<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fiche.Master" CodeBehind="Fiche_specialite.aspx.vb" Inherits="app_gest_ecole.Fiche_specialite" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:TextBox ID="txtId" class="form-control form-control-user" aria-describedby="emailHelp"
            runat="server" Visible="false"></asp:TextBox>
    <div class="row text-left" style="padding-left: 70px">
        <h2 style="color: #1A3B86; display: inline; text-decoration: underline; text-align: center" class="text-left">MODIFIER</h2>
        &nbsp;
        <h2 style="color: #D32A27; display: inline; text-align: left">UNE NOUVELLE SPÉCIALITÉ</h2>
        <br />
        <br />
        <br />
    </div>


    <div class="row text-left" >
        <div class="col-md-12">
            <div class="card" style="box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); padding: 20px;">
                <h6 style="color: #1A3B86; display: inline; text-align: center; font-weight: bold; padding-bottom: 30px">MODIFIER UNE SPÉCIALITÉ</h6>
                <div class="form-group">
                    <asp:TextBox ID="txtNvlSpec" class="form-control form-control-user" aria-describedby="emailHelp"
                        placeholder="Nom De La Spécialité" runat="server"></asp:TextBox>
                </div>
                <div class="row text-left" >
                    <asp:LinkButton ID="btnSave" Text="MODIFIER" class="d-none d-sm-inline-blockbtn-primary shadow-sm" Style="background-color: #1A3B86; width: 350px; border-radius: 10px" runat="server">LinkButton</asp:LinkButton>
                </div>
            </div>
        </div>

    </div>

    <br />


    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
        <br />
    <br />
    <br />
    

</asp:Content>