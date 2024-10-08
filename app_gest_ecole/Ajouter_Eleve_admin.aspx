<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fiche_eleve_admin.Master" CodeBehind="Ajouter_Eleve_admin.aspx.vb" Inherits="app_gest_ecole.Ajouter_Eleve_admin" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="row text-left" style="padding-left: 70px">
        <h2 style="color: #D32A27; display: inline; text-decoration: underline; text-align: center" class="text-left">AJOUTER</h2>
        <h2 style="color: #1A3B86; display: inline; text-align: left">UN ELEVE</h2>
        <br />
        <br />
        <br />
    </div>


    <div class="row text-left" style="padding-left: 70px">
        <asp:TextBox ID="txtId" class="form-control form-control-user" aria-describedby="emailHelp"
            runat="server" Visible="false"></asp:TextBox>
        <div class="col">
            <div class="form-group">
                <label for="txtPrenom" style="color: black">Prénom:</label>
                <asp:TextBox ID="txtPrenom" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Prénom..." runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNom" style="color: black">Nom:</label>
                <asp:TextBox ID="txtNom" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="dpAn" style="color: black; padding-right: 180px">Année Scolaire :</label>
                <asp:DropDownList Style="border-color: #1A3B86" ID="dpAn" CssClass="form-control" runat="server" DataSourceID="sqlan" DataTextField="libelle_an" DataValueField="code">
                </asp:DropDownList>

            </div>
            &nbsp;&nbsp;
             <asp:SqlDataSource ID="sqlan" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>"
                 SelectCommand="SELECT [code], [libelle_an] FROM [annee_scolaire]"></asp:SqlDataSource>

        </div>
        <div class="col">
            <div class="form-group">
                <label for="dpGenre" style="color: black">Genre:</label><br />
                <asp:DropDownList Style="border-color: #1A3B86" ID="dpGenre" CssClass="form-control" runat="server" DataSourceID="sqlGenre" DataTextField="libelle" DataValueField="code">
                    <asp:ListItem Value="-1">Genre</asp:ListItem>

                </asp:DropDownList>
            </div>
            &nbsp;&nbsp;
             <asp:SqlDataSource ID="sqlGenre" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>"
                 SelectCommand="SELECT [code], [libelle] FROM [genre]"></asp:SqlDataSource>

        </div>

    </div>
    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="txtDat" style="color: black">Date de Naissance:</label>
                <asp:TextBox ID="txtDat" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Date de naissance" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtDat_CalendarExtender" Format="dd/MM/yyyy" runat="server" BehaviorID="txtDat_CalendarExtender" TargetControlID="txtDat"></ajaxToolkit:CalendarExtender>

            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtAdresse" style="color: black">Adresse:</label>
                <asp:TextBox ID="txtAdresse" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Adresse" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="dpType" style="color: black">Garde Légale:</label>
                <asp:DropDownList ID="dpType" class="form-control dropdown-toggle" type="button" runat="server" AppendDataBoundItems="true" Style="border-color: #1A3B86">
                    <asp:ListItem Value="-1">Garde Légale</asp:ListItem>
                    <asp:ListItem Value="1">Parents</asp:ListItem>
                    <asp:ListItem Value="2">Mère exclusivement</asp:ListItem>
                    <asp:ListItem Value="3">Père exclusivement</asp:ListItem>
                    <asp:ListItem Value="4">Grands-Parents</asp:ListItem>
                    <asp:ListItem Value="5">Tuteur</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="txtEcole" style="color: black">Ecole Précédente:</label>
                <asp:TextBox ID="txtEcole" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Ecole Précédente" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="dpLangue" style="color: black">Langue :</label><br />
                <asp:DropDownList ID="dpLangue" Style="border-color: #1A3B86" CssClass="form-control" runat="server" DataSourceID="sqlLangue" DataTextField="libelle" DataValueField="code">
                    <asp:ListItem Value="-1">Langue</asp:ListItem>

                </asp:DropDownList>
            </div>
            &nbsp;&nbsp;
             <asp:SqlDataSource ID="sqlLangue" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>"
                 SelectCommand="SELECT [code], [libelle] FROM [langue]"></asp:SqlDataSource>

        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtPrenomMere" style="color: black">Prénom de la mère:</label>
                <asp:TextBox ID="txtPrenomMere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Prénom de la mère" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
    </div>

    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="txtNomMere" style="color: black">Nom de la mère:</label>
                <asp:TextBox ID="txtNomMere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom de la mère" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="adrMere" style="color: black">Adresse De La Mère:</label>
                <asp:TextBox ID="adrMere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Adresse De La Mère" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNumMere" style="color: black">Numéro de téléphone de la mère 1:</label>
                <asp:TextBox ID="txtNumMere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Numéro de la mère 1 " runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>

    </div>



    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="TextBox1" style="color: black">Email de la mère:</label>
                <asp:TextBox ID="TextBox1" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Email de la mère" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtPrenomPere" style="color: black">Prénom Du Père:</label>
                <asp:TextBox ID="txtPrenomPere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Prénom Du Père" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNomPere" style="color: black">Nom Du Père:</label>
                <asp:TextBox ID="txtNomPere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom Du Père" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
    </div>



    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="txtAdrPere" style="color: black">Adresse du Père:</label>
                <asp:TextBox ID="txtAdrPere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Adresse du Père" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNumPere" style="color: black">N° De Téléphone Du Père 1:</label>
                <asp:TextBox ID="txtNumPere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="N° De Téléphone Du Père" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <
        <div class="col">
            <div class="form-group">
                <label for="txtEmailPere" style="color: black">Email Du Père:</label>
                <asp:TextBox ID="txtEmailPere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Email Du Père" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="txtNumPere2" style="color: black">N° De Téléphone Du Père 2:</label>
                <asp:TextBox ID="txtNumPere2" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="N° De Téléphone Du Père 2" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNumMere2" style="color: black">Numéro téléphone de la mère 2:</label>
                <asp:TextBox ID="txtNumMere2" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Numéro de la mère 2 " runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>

        <div class="col">
            <div class="form-group">
                <label for="txtnationnalite" style="color: black">Nationnalité :</label>
                <asp:TextBox ID="txtnationnalite" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nationnalité" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
    </div>


    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="txtPrenomTuteur" style="color: black">Prénom Du Tuteur:</label>
                <asp:TextBox ID="txtPrenomTuteur" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Prénom Du Tuteur" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNomTuteur" style="color: black">Nom Du Tuteur:</label>
                <asp:TextBox ID="txtNomTuteur" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom Du Tuteur" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtAdrTuteur" style="color: black">Adresse Du tuteur:</label>
                <asp:TextBox ID="txtAdrTuteur" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Adresse Du tuteur" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
    </div>


    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="txtNumTuteur" style="color: black">N° De Téléphone Du Tuteur:</label>
                <asp:TextBox ID="txtNumTuteur" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="N° De Téléphone Du Tuteur" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>

        <div class="col">
            <div class="form-group">
                <label for="txtEmailTuteur" style="color: black">Email Du Tuteur:</label>
                <asp:TextBox ID="txtEmailTuteur" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Email Du Tuteur" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNumTelAlter" style="color: black">N° De Téléphone Alternatif:</label>
                <asp:TextBox ID="txtNumTelAlter" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="N° De Téléphone Alternatif" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
    </div>



    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="txtNomMedecin" style="color: black">Nom Du Médecin:</label>
                <asp:TextBox ID="txtNomMedecin" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom Du Médecin" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNumTelMedecin" style="color: black">N° De Téléphone Du Médecin:</label>
                <asp:TextBox ID="txtNumTelMedecin" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="N° De Téléphone Du Médecin" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">

            <div class="form-group">
                <label for="DropDownList1" style="color: black">Classe Actuelle:</label>
                <asp:DropDownList ID="DropDownList1" class="form-control dropdown-toggle" type="button" runat="server" Style="border-color: #1A3B86" DataSourceID="sqlClasse" DataTextField="Libelle" DataValueField="Code" AppendDataBoundItems="true">
                    <asp:ListItem Value="-1">Classe Actuelle</asp:ListItem>

                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlClasse" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT [Code], [Libelle] FROM [Classes]"></asp:SqlDataSource>
            </div>
        </div>


    </div>





    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <asp:Label Text="Transport :    " ID="Label5" runat="server" ForeColor="Black"></asp:Label>

                <asp:RadioButton Text="Oui" ID="ouiTrans" GroupName="Transport"  AutoPostBack="True" runat="server" ForeColor="Black"  OnCheckedChanged="Transport_CheckedChanged" />
                <asp:RadioButton Text="Non" ID="nonTrans" GroupName="Transport" AutoPostBack="True" runat="server" ForeColor="Black"  OnCheckedChanged="Transport_CheckedChanged"/>

            </div>
        </div>


        <div class="col">
            <div class="form-group">
                <asp:Label Text="Garderie :    " ID="Label6" runat="server" ForeColor="Black"></asp:Label>

                <asp:RadioButton Text="Oui" ID="ouiGard" GroupName="Garderie" runat="server" ForeColor="Black" AutoPostBack="True" OnCheckedChanged="Garderie_CheckedChanged"/>
                <asp:RadioButton Text="Non " ID="nonGard" GroupName="Garderie" runat="server" ForeColor="Black" AutoPostBack="True" OnCheckedChanged="Garderie_CheckedChanged"/>

            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:Label Text="Cantine :    " ID="Label2" runat="server" ForeColor="Black"></asp:Label>

                <asp:RadioButton Text="Oui" ID="CheckBox1" GroupName="Cantine" runat="server" ForeColor="Black" />
                <asp:RadioButton Text="Non " ID="CheckBox2" GroupName="Cantine" runat="server" ForeColor="Black" />

            </div>
        </div>

       
    </div>
    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">

                <asp:Label Text="Allergies et/ou conditions médicales" ID="Label3" runat="server" ForeColor="Black"></asp:Label>
                <asp:FileUpload CssClass="form-control" ID="Fichier" runat="server" Style="border-color: #1A3B86" />
                <asp:TextBox ID="txtChemin" class="form-control form-control-user" runat="server" Visible="false"></asp:TextBox>
            </div>
        </div>


        <div class="col">
            <div class="form-group">
                <asp:Label Text="Photo Elève(Format: JPEG,JPG,PNG)" ID="Label4" runat="server" ForeColor="Black"></asp:Label>
                <asp:FileUpload CssClass="form-control" ID="Fichier1" runat="server" Style="border-color: #1A3B86" />
                <asp:TextBox ID="txtChemin1" class="form-control form-control-user" runat="server" Visible="false"></asp:TextBox>
            </div>
        </div>
    </div>


    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <asp:LinkButton ID="btnSave" Text="Ajouter" class="d-none d-sm-inline-block btn btn-primary shadow-sm" Style="background-color: #1A3B86; width: 350px; border-radius: 10px" runat="server"></asp:LinkButton>&nbsp;
        </div>
        <div class="col">
            <asp:LinkButton ID="btnUndo" Text="Retour" class="d-none d-sm-inline-block btn shadow-sm" Style="background-color: #D32A27; width: 350px; border-radius: 10px; color: white" runat="server"></asp:LinkButton>

        </div>

    </div>
    <br />
    <br />
</asp:Content>
