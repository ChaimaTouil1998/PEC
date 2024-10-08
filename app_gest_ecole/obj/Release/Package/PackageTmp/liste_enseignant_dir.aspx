<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/dir.Master" CodeBehind="liste_enseignant_dir.aspx.vb" Inherits="app_gest_ecole.liste_enseignant_dir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            position: relative;
            width: 100%;
            flex: 0 0 100%;
            max-width: 100%;
            left: 1px;
            top: -1px;
            padding-left: .75rem;
            padding-right: .75rem;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="row text-left" style="padding-left: 70px">
        <h2 style="color: #D32A27; display: inline; text-decoration: underline; text-align: center" class="text-left">CONSULTER</h2>
        <h2 style="color: #1A3B86; display: inline; text-align: left">&nbsp; LA LISTE DES ENSEIGNANTS TRIÉS PAR SPÉCIALITÉ</h2>
        <br />
        <br />
        <br />
    </div>
    

   <div class="row text-left"  style="padding-left:120px;">
        <div class="form-inline" style=" background-color:white;padding-left:20px;padding-top:20px;padding-right:20px;padding-bottom:20px;border-radius:15px">
    <div class="form-group">
        <asp:TextBox ID="txtPrenom" runat="server" CssClass="form-control" placeholder="Entrez le prénom"></asp:TextBox>
    </div>&nbsp;&nbsp;
    <div class="form-group">
        <asp:TextBox ID="txtNom" runat="server" CssClass="form-control" placeholder="Entrez le nom"></asp:TextBox>
    </div>&nbsp;&nbsp;
            <div class="form-group">
        <asp:TextBox ID="txtNumTel" runat="server" CssClass="form-control" placeholder="Entrez le numéro de téléphone"></asp:TextBox>
    </div>&nbsp;&nbsp;
            <div class="form-group">
        <asp:TextBox ID="txtspec" runat="server" CssClass="form-control" placeholder="Entrez la spécialité"></asp:TextBox>
    </div>&nbsp;&nbsp;
            
    <asp:Button ID="btnFiltrer" runat="server" Text="CHERCHER" OnClick="btnFiltrer_Click" CssClass="btn btn-primary" />&nbsp;&nbsp;
    <asp:Button ID="btnReinitialiser" runat="server" Text="Réinitialiser" OnClick="btnReinitialiser_Click" CssClass="btn btn-success" />
</div>

    </div>
    <br />

    

    <div class="row text-left">
        <div class="auto-style1">
            <asp:SqlDataSource ID="sqlEnseignant" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT  [id_enseignant],[prenom], [nom], [genre], [Num_tel], Specialite.libelle as Specialite FROM [Enseignants] , Specialite WHERE Enseignants.specialite = Specialite.Code"></asp:SqlDataSource>

    <div class="row text-left" >
        <div class="col-md-12">
            <asp:GridView ID="grdListe" runat="server" class="table table-bordered text-left" AutoGenerateColumns="False" DataKeyNames="id_enseignant" DataSourceID="sqlEnseignant" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="id_enseignant" HeaderText="id_enseignant" SortExpression="id_enseignant" />
                <asp:BoundField DataField="specialite" HeaderText="specialite" SortExpression="specialite" />
                <asp:BoundField DataField="prenom" HeaderText="prenom" SortExpression="prenom" />
                <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
                <asp:BoundField DataField="genre" HeaderText="genre" SortExpression="genre" />
                <asp:BoundField DataField="Num_tel" HeaderText="Num_tel" SortExpression="Num_tel" />

                <asp:TemplateField>
                        <HeaderTemplate>
                            <!-- Insérez votre titre d'en-tête ici -->
                            Sanction
                        </HeaderTemplate>
                        <ItemTemplate>
                            <!-- Contenu de l'item -->
                            <asp:LinkButton class="btn btn-success btn-circle" ID="OpenEC" runat="server"
                                CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>"
                                CommandName="OpenEC" ToolTip="ajouterEc">
                            <i class="fas fa-plus"></i></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="50px" Wrap="True" />
                    </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                            <!-- Insérez votre titre d'en-tête ici -->
                            Fiche
                        </HeaderTemplate>
                 <ItemTemplate>
                            <asp:LinkButton class="btn btn-group btn-circle collapsed"  ID="Open" runat="server"  
                                CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" 
                                CommandName="OpenLg" ToolTip="modifier" >
                                   <i class="fas fa-eye"></i></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="True" />
                 </asp:TemplateField>
            </Columns>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
            </div>
        
    </div>
        </div>
       


    </div>
    <br /><br /><br /><br /><br /><br /><br /><br /><br />
</asp:Content>
