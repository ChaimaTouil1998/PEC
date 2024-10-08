<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Enseignant.Master" CodeBehind="fiche_eleve_ens.aspx.vb" Inherits="app_gest_ecole.fiche_eleve_ens" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="row text-left" style="padding-left: 70px">
        <h2 style="color: #D32A27; display: inline; text-decoration: underline; text-align: center" class="text-left">MODIFIER</h2>
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
                    <label for="txtPrenom" style="color:black">Prénom:</label>

                <asp:TextBox ID="txtPrenom" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Prénom..." runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                                    <label for="txtNom" style="color:black">Nom:</label>
                <asp:TextBox ID="txtNom" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                                    <label for="" style="color:black">Genre:</label>
                <asp:CheckBox Text="Male" ID="male" runat="server"  ForeColor="black" />
                <asp:CheckBox Text="Femelle " ID="femelle" runat="server"  ForeColor="black"/>
            </div>
        </div>
    </div>
    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                 <label for="txtDat" style="color:black">Date de Naissance:</label>
                <asp:TextBox ID="txtDat" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Date de naissance" runat="server" style="border-color: #1A3B86"></asp:TextBox>

            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtAdresse" style="color:black">Adresse:</label>
                <asp:TextBox ID="txtAdresse" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Adresse" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="dpType" style="color:black">Garde Légale:</label>
                <asp:DropDownList ID="dpType" class="form-control dropdown-toggle" type="button" runat="server" AppendDataBoundItems="true" style="border-color: #1A3B86">
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
                <label for="txtEcole" style="color:black">Ecole Précédente:</label>
                <asp:TextBox ID="txtEcole" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Ecole Précédente" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:Label Text="Langue :" ID="Label1" runat="server" ForeColor="Black"></asp:Label>

                <asp:CheckBox Text="Arabe" ID="arabe" runat="server" ForeColor="Black"/>
                <asp:CheckBox Text="Français " ID="francais" runat="server" ForeColor="Black"/>
                <asp:CheckBox Text="Anglais" ID="anglais" runat="server" ForeColor="Black"/>
                <asp:CheckBox Text="Autre " ID="autre" runat="server" ForeColor="Black"/>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtPrenomMere" style="color:black">Prénom de la mère:</label>
                <asp:TextBox ID="txtPrenomMere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Prénom de la mère" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
    </div>

    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="txtNomMere" style="color:black">Nom de la mère:</label>
                <asp:TextBox ID="txtNomMere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom de la mère" runat="server"  style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="adrMere" style="color:black">Adresse De La Mère:</label>
                <asp:TextBox ID="adrMere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Adresse De La Mère" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNumMere" style="color:black">Numéro de la mère:</label>
                <asp:TextBox ID="txtNumMere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Numéro de la mère" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
    </div>



    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="TextBox1" style="color:black">Email de la mère:</label>
                <asp:TextBox ID="TextBox1" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Email de la mère" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtPrenomPere" style="color:black">Prénom Du Père:</label>
                <asp:TextBox ID="txtPrenomPere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Prénom Du Père" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNomPere" style="color:black">Nom Du Père:</label>
                <asp:TextBox ID="txtNomPere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom Du Père" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
    </div>



    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="txtAdrPere" style="color:black">Adresse du Père:</label>
                <asp:TextBox ID="txtAdrPere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Adresse du Père" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNumPere" style="color:black">N° De Téléphone Du Père:</label>
                <asp:TextBox ID="txtNumPere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="N° De Téléphone Du Père" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtEmailPere" style="color:black">Email Du Père:</label>
                <asp:TextBox ID="txtEmailPere" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Email Du Père" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
    </div>



    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="txtEmailPere" style="color:black">Prénom Du Tuteur:</label>
                <asp:TextBox ID="txtPrenomTuteur" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Prénom Du Tuteur" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNomTuteur" style="color:black">Nom Du Tuteur:</label>
                <asp:TextBox ID="txtNomTuteur" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom Du Tuteur" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtAdrTuteur" style="color:black">Adresse Du tuteur:</label>
                <asp:TextBox ID="txtAdrTuteur" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Adresse Du tuteur" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
    </div>


    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="txtNumTuteur" style="color:black">N° De Téléphone Du Tuteur:</label>
                <asp:TextBox ID="txtNumTuteur" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="N° De Téléphone Du Tuteur" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtEmailTuteur" style="color:black">Email Du Tuteur:</label>
                <asp:TextBox ID="txtEmailTuteur" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Email Du Tuteur" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNumTelAlter" style="color:black">N° De Téléphone Alternatif:</label>
                <asp:TextBox ID="txtNumTelAlter" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="N° De Téléphone Alternatif" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
    </div>



    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="txtNomMedecin" style="color:black">Nom Du Médecin:</label>
                <asp:TextBox ID="txtNomMedecin" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom Du Médecin" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNumTelMedecin" style="color:black">N° De Téléphone Du Médecin:</label>
                <asp:TextBox ID="txtNumTelMedecin" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="N° De Téléphone Du Médecin" runat="server" style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">

            <div class="form-group">
                <label for="DropDownList1" style="color:black">Classe Actuelle:</label>
                <asp:DropDownList ID="DropDownList1" class="form-control dropdown-toggle" type="button" runat="server" style="border-color: #1A3B86" DataSourceID="sqlClasse" DataTextField="Libelle" DataValueField="Code" AppendDataBoundItems="true">
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

                <asp:CheckBox Text="Oui" ID="ouiTrans" runat="server" ForeColor="Black"/>
                <asp:CheckBox Text="Non " ID="nonTrans" runat="server" ForeColor="Black"/>

            </div>
        </div>

        <div class="col">
            <div class="form-group">
                <asp:Label Text="Garderie :    " ID="Label6" runat="server" ForeColor="Black"></asp:Label>

                <asp:CheckBox Text="Oui" ID="ouiGard" runat="server" ForeColor="Black"/>
                <asp:CheckBox Text="Non " ID="nonGard" runat="server" ForeColor="Black"/>

            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:Label Text="Cantine :    " ID="Label2" runat="server" ForeColor="Black"></asp:Label>

                <asp:CheckBox Text="Oui" ID="CheckBox1" runat="server" ForeColor="Black"/>
                <asp:CheckBox Text="Non " ID="CheckBox2" runat="server" ForeColor="Black"/>

            </div>
        </div>


    </div>
    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">

                <asp:Label Text="Allergies et/ou conditions médicales" ID="Label3" runat="server" ForeColor="Black"></asp:Label>
                <asp:FileUpload CssClass="form-control" ID="Fichier" runat="server" style="border-color: #1A3B86" />
                <asp:TextBox ID="txtChemin" class="form-control form-control-user" runat="server" Visible="false"></asp:TextBox>
            </div>
        </div>


        <div class="col">
            <div class="form-group">
                <asp:Label Text="Photo Elève(Format: JPEG,JPG,PNG)" ID="Label4" runat="server" ForeColor="Black"></asp:Label>
                <asp:FileUpload CssClass="form-control" ID="Fichier1" runat="server" style="border-color: #1A3B86"/>
                <asp:TextBox ID="txtChemin1" class="form-control form-control-user" runat="server" Visible="false"></asp:TextBox>
            </div>
        </div>
    </div>
    
        <asp:SqlDataSource ID="sqlDoc" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT id_eleve, [fichier_image] FROM [eleve] WHERE ([id_eleve] = ?) and fichier_image<>'' ">
         <SelectParameters>
             <asp:ControlParameter ControlID="txtId" Name="id_eleve" PropertyName="Text" Type="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>

    <asp:GridView ID="grd" class="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDoc" DataKeyNames="id_eleve,fichier_image">
    <Columns>
        <asp:BoundField DataField="fichier_image" HeaderText="fichier_image" SortExpression="fichier_image" />
          <asp:TemplateField>
                 <ItemTemplate>
                            <asp:LinkButton class="btn btn-group btn-circle collapsed"  ID="Open" runat="server"  
                                CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" 
                                CommandName="OpenLg" ToolTip="Modifier la ligne" >
                                   <i class="fas fa-pen"></i></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="True" />
                 </asp:TemplateField>
          <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton class="btn btn-danger btn-circle"  ID="AddButton" runat="server" 
                        CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" 
                        CommandName="SuppLg" >
                           <i class="fas fa-trash"></i></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="True" />
            </asp:TemplateField>
    </Columns>
        </asp:GridView>






     <asp:SqlDataSource ID="sql" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT id_eleve, [fichier] FROM [eleve] WHERE ([id_eleve] = ?) and fichier<>'' ">
         <SelectParameters>
             <asp:ControlParameter ControlID="txtId" Name="id_eleve" PropertyName="Text" Type="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>

    <asp:GridView ID="grdDoc" class="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDoc" DataKeyNames="id_eleve,fichier">
    <Columns>
        <asp:BoundField DataField="fichier" HeaderText="fichier" SortExpression="fichier" />
          <asp:TemplateField>
                 <ItemTemplate>
                            <asp:LinkButton class="btn btn-group btn-circle collapsed"  ID="Open" runat="server"  
                                CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" 
                                CommandName="OpenLg" ToolTip="Modifier la ligne" >
                                   <i class="fas fa-pen"></i></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="True" />
                 </asp:TemplateField>
          <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton class="btn btn-danger btn-circle"  ID="AddButton" runat="server" 
                        CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" 
                        CommandName="SuppLg" >
                           <i class="fas fa-trash"></i></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="True" />
            </asp:TemplateField>
    </Columns>
        </asp:GridView>


    <asp:SqlDataSource ID="sqlBulletin" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>"
    SelectCommand="SELECT * FROM bulletin WHERE id_eleve = @id_eleve">
    <SelectParameters>
        <asp:ControlParameter ControlID="txtId" Name="id_eleve" PropertyName="Text" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>

    <asp:GridView ID="grdBulletin" runat="server" AutoGenerateColumns="True">
</asp:GridView>

    <div class="row text-left" style="padding-left: 70px">
        <asp:LinkButton ID="btnSave" Text="MODIFIER" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" Style="background-color: #1A3B86; width: 350px; border-radius: 10px" runat="server"></asp:LinkButton>
 &nbsp;
        <asp:LinkButton ID="btnUndo" Text="Retour" class="d-none d-sm-inline-block btn btn-sm  shadow-sm" Style="background-color: #D32A27; width: 350px; border-radius: 10px; color:white"  runat="server"></asp:LinkButton>
    </div>

</asp:Content>