<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fiche.Master" CodeBehind="fichehisAbsEns_super.aspx.vb" Inherits="app_gest_ecole.fichehisAbsEns_super" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="row text-left" style="padding-left: 70px">
        <h2 style="color: #D32A27; display: inline; text-decoration: underline; text-align: center" class="text-left">CONSULTER</h2>
        <h2 style="color: #1A3B86; display: inline; text-align: left">&nbsp; Ecart Disciplinaire pour chaque Enseignant</h2>
        <br />
        <br />
        <br />
    </div>


    <div class="row text-left" style="padding-left: 70px">
        <asp:TextBox ID="txtId" class="form-control form-control-user" aria-describedby="emailHelp"
            runat="server" Visible="false"></asp:TextBox>
        <div class="col">
            <div class="form-group">
                                    <label for="txtPrenom" style="color:black">Prénom:</label>
                <asp:TextBox ID="txtPrenom" class="form-control form-control-user" aria-describedby="emailHelp"
                    runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                                    <label for="txtNom" style="color:black">Nom:</label>
                <asp:TextBox ID="txtNom" class="form-control form-control-user" aria-describedby="emailHelp"
                    runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
       
        <div class="col">

            <div class="form-group">
                <label for="DropDownList1" style="color:black">Spécialité:</label>&nbsp;<br />
                <asp:DropDownList ID="DropDownList1" class="form-control dropdown-toggle" type="button" ReadOnly="true" Enabled="false" runat="server" Style="border-color: #1A3B86" DataSourceID="sqlClasse" DataTextField="Libelle" DataValueField="Code" AppendDataBoundItems="true">
                   
                    <asp:ListItem Value="-1">Spécialité</asp:ListItem>

                </asp:DropDownList>
                                <asp:SqlDataSource ID="sqlClasse" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT [Code], [Libelle] FROM [Specialite]"></asp:SqlDataSource>

            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtDat" style="color:black">Date de naissance:</label>
                <asp:TextBox ID="txtDat" class="form-control form-control-user" aria-describedby="emailHelp"
                    runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>

            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="abs" style="color:black">Nombre d'absence en heure:</label>
                <asp:TextBox ID="abs" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nombre d'absence en heure" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>

            </div>
        </div>
    </div>

    
    
    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
                    <asp:LinkButton ID="btnImprim" Text="Imprimer" class="d-none d-sm-inline-block btn btn-primary shadow-sm" Style="background-color: #1A3B86; width: 350px; border-radius: 10px" runat="server"></asp:LinkButton>
        </div>
         <div class="col">
                    <asp:LinkButton ID="btnEmail" Text="Email" class="d-none d-sm-inline-block btn shadow-sm" Style="background-color: green; width: 350px; border-radius: 10px; color: white" runat="server"></asp:LinkButton>
        </div>
                <div class="col">
                            <asp:LinkButton ID="btnUndo" Text="Retour" class="d-none d-sm-inline-block btn shadow-sm " Style="background-color: #D32A27; width: 350px; border-radius: 10px; color: white" runat="server"></asp:LinkButton>

                    </div>
    </div>
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
</asp:Content>
