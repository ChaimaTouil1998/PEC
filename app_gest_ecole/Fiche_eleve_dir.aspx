<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fiche.Master" CodeBehind="Fiche_eleve_dir.aspx.vb" Inherits="app_gest_ecole.Fiche_eleve_dir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="row text-left" style="padding-left: 70px">
        <h2 style="color: #D32A27; display: inline; text-decoration: underline; text-align: center" class="text-left">CONSULTER</h2>
        <h2 style="color: #1A3B86; display: inline; text-align: left">&nbsp; FICHE  ELEVE</h2>
        <br />
        <br />
        <br />
    </div>


    <div class="row text-left" style="padding-left: 70px">
        <asp:TextBox ID="txtId" class="form-control form-control-user" aria-describedby="emailHelp"
            runat="server" Visible="false"></asp:TextBox>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtPrenom" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Prénom..." runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtNom" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:Label Text="Genre :    " ID="Label25" runat="server"></asp:Label>

                <asp:CheckBox Text="Male" ID="male" runat="server"  ReadOnly="true" Enabled="false"/>
                <asp:CheckBox Text="Femelle " ID="femelle" runat="server" ReadOnly="true" Enabled="false"/>
            </div>
        </div>
    </div>
    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtDat" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Date de naissance" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>

            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtAdresse" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Adresse" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:DropDownList ID="dpType" Enabled="false" ReadOnly="true" class="form-control dropdown-toggle" type="button" runat="server" AppendDataBoundItems="true" Style="border-color: #1A3B86">
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
                <asp:TextBox ID="txtEcole" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Ecole Précédente" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:Label Text="Langue :    " ID="Label1" runat="server" ReadOnly="true"></asp:Label>

                <asp:CheckBox Text="Arabe" ID="arabe" runat="server" ReadOnly="true" Enabled="false"/>
                <asp:CheckBox Text="Français " ID="francais" runat="server" ReadOnly="true" Enabled="false"/>
                <asp:CheckBox Text="Anglais" ID="anglais" runat="server" Enabled="false"/>
                <asp:CheckBox Text="Autre " ID="autre" runat="server" Enabled="false"/>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtPrenomMere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Prénom de la mère" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
    </div>

    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtNomMere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom de la mère" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="adrMere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Adresse De La Mère" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtNumMere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Numéro de la mère" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
    </div>



    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="TextBox1" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Email de la mère" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtPrenomPere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Prénom Du Père" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtNomPere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom Du Père" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
    </div>



    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtAdrPere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Adresse du Père" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtNumPere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="N° De Téléphone Du Père" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtEmailPere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Email Du Père" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
    </div>



    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtPrenomTuteur" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Prénom Du Tuteur" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtNomTuteur" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom Du Tuteur" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtAdrTuteur" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Adresse Du tuteur" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
    </div>


    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtNumTuteur" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="N° De Téléphone Du Tuteur" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtEmailTuteur" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Email Du Tuteur" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtNumTelAlter" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="N° De Téléphone Alternatif" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
    </div>



    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtNomMedecin" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom Du Médecin" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtNumTelMedecin" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="N° De Téléphone Du Médecin" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">

            <div class="form-group">
                <asp:DropDownList ID="DropDownList1" class="form-control dropdown-toggle" type="button"  ReadOnly="true" Enabled="false" runat="server" Style="border-color: #1A3B86" DataSourceID="sqlClasse" DataTextField="Libelle" DataValueField="Code" AppendDataBoundItems="true">
                    <asp:ListItem Value="-1">Classe Actuelle</asp:ListItem>

                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlClasse" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT [Code], [Libelle] FROM [Classes]"></asp:SqlDataSource>
            </div>
        </div>


    </div>





    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <asp:Label Text="Transport :    " ID="Label5" runat="server" ReadOnly="true"></asp:Label>

                <asp:CheckBox Text="Oui" Enabled="false" ID="ouiTrans" runat="server" ReadOnly="true"/>
                <asp:CheckBox Text="Non" Enabled="false" ID="nonTrans" runat="server" ReadOnly="true"/>

            </div>
        </div>

        <div class="col">
            <div class="form-group">
                <asp:Label Text="Garderie :    " ID="Label6" runat="server" ReadOnly="true"></asp:Label>

                <asp:CheckBox Text="Oui" Enabled="false" ID="ouiGard" runat="server" ReadOnly="true"/>
                <asp:CheckBox Text="Non " Enabled="false" ID="nonGard" runat="server" ReadOnly="true"/>

            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:Label Text="Cantine :    " ID="Label2" runat="server"></asp:Label>

                <asp:CheckBox Text="Oui" Enabled="false" ID="CheckBox1" runat="server" ReadOnly="true" />
                <asp:CheckBox Text="Non " Enabled="false" ID="CheckBox2" runat="server" ReadOnly="true"/>

            </div>
        </div>


    </div>
    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <asp:Label Text="Allergies et/ou conditions médicales" ID="Label3" runat="server"></asp:Label>
                <asp:FileUpload Enabled="false" CssClass="form-control" ID="Fichier" runat="server" Style="border-color: #1A3B86" ReadOnly="true"/>
                <asp:TextBox ID="txtChemin" class="form-control form-control-user" runat="server" Visible="false"></asp:TextBox>
            </div>
        </div>


        <div class="col">
            <div class="form-group">
                <asp:Label Text="Photo Elève(Format: JPEG,JPG,PNG)" ID="Label4" runat="server"></asp:Label>
                <asp:FileUpload CssClass="form-control" ID="Fichier1" runat="server" Enabled="false" Style="border-color: #1A3B86" ReadOnly="true"/>
                <asp:TextBox ID="txtChemin1" class="form-control form-control-user" runat="server" Visible="false"></asp:TextBox>
            </div>
        </div>
    </div>




    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <asp:GridView ID="grdDoc" Enabled="false" class="table table-bordered" ReadOnly="true" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDoc" DataKeyNames="Fichier">
                <Columns>
                    <asp:BoundField DataField="Fichier" HeaderText="Allergies et/ou conditions médicales" SortExpression="Fichier" />
                    
                    
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sqlDoc" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT [fichier] FROM [eleve] WHERE ([id_eleve] = ?) and fichier <> ''">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtId" Name="Id" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        <div class="col">
            <asp:GridView ID="grd" class="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="sql" DataKeyNames="fichier_image">
                <Columns>
                    <asp:BoundField DataField="fichier_image" HeaderText="fichier_image" SortExpression="fichier_image" />
                    
                    
                </Columns>
            </asp:GridView>


            <asp:SqlDataSource ID="sql" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT [fichier_image] FROM [eleve] WHERE ([id_eleve] = ?) and fichier_image <> ''">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtId" Name="Id" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>








    </div>



    <div class="row text-left" style="padding-left: 70px">
        <asp:LinkButton ID="btnImprim" Text="Imprimer" class="d-none d-sm-inline-block btn btn-primary shadow-sm" Style="background-color: #1A3B86; width: 350px; border-radius: 10px" runat="server"></asp:LinkButton>
         &nbsp;
        <asp:LinkButton ID="btnUndo" Text="Retour" class="d-none d-sm-inline-block btn  shadow-sm" Style="background-color: #D32A27; width: 350px; border-radius: 10px; color:white"  runat="server"></asp:LinkButton>
    </div>

</asp:Content>