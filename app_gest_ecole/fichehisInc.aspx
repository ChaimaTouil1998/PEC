<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fiche.Master" CodeBehind="fichehisInc.aspx.vb" Inherits="app_gest_ecole.fichehisInc" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="row text-left" style="padding-left: 70px">
        <h2 style="color: #D32A27; display: inline; text-decoration: underline; text-align: center" class="text-left">CONSULTER</h2>
        <h2 style="color: #1A3B86; display: inline; text-align: left">&nbsp; Incidents pour chaque Elève</h2>
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
       </div>
        <div class="row text-left" style="padding-left: 70px">

        <div class="col">

            <div class="form-group">
                <label for="DropDownList1" style="color:black">Classe Actuelle:</label>&nbsp;<br />
                <asp:DropDownList ID="DropDownList1" class="form-control dropdown-toggle" type="button" ReadOnly="true"  runat="server" Style="border-color: #1A3B86" DataSourceID="sqlClasse" DataTextField="Libelle" DataValueField="Code" AppendDataBoundItems="true">
                   
                    <asp:ListItem Value="-1">Classe Actuelle</asp:ListItem>

                </asp:DropDownList>
                                <asp:SqlDataSource ID="sqlClasse" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT [Code], [Libelle] FROM [Classes]"></asp:SqlDataSource>

            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtDat" style="color:black">Date de naissance:</label>
                <asp:TextBox ID="txtDat" class="form-control form-control-user" aria-describedby="emailHelp"
                     runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>

            </div>
        </div>
        </div>
        <div class="row text-left" style="padding-left: 70px">

        <div class="col">
            <div class="form-group">
                <label for="desc" style="color:black">description de l'incident:</label>
                <asp:TextBox ID="desc" TextMode="MultiLine" class="form-control form-control-user" aria-describedby="emailHelp"
                    runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>

            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtDateInc" style="color:black">Date de l'incident:</label>
                <asp:TextBox ID="txtDateInc" class="form-control form-control-user" aria-describedby="emailHelp"
                   runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>

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
