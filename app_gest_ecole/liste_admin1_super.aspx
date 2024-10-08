<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="liste_admin1_super.aspx.vb" Inherits="app_gest_ecole.liste_admin1_super" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
        <h2 style="color: #1A3B86; display: inline; text-align: left">&nbsp; LA LISTE DES UTILISATEURS</h2>
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
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Entrez l'email"></asp:TextBox>
    </div>&nbsp;&nbsp;
          
    <asp:Button ID="btnFiltrer" runat="server" Text="CHERCHER" OnClick="btnFiltrer_Click" CssClass="btn btn-primary" />&nbsp;&nbsp;
    <asp:Button ID="btnReinitialiser" runat="server" Text="Réinitialiser" OnClick="btnReinitialiser_Click" CssClass="btn btn-success" />
</div>

    </div>
    <br />

    <div class="row text-left" style="padding-left: 40px">
        <div class="auto-style1">
            <asp:SqlDataSource ID="sqldir" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT [id_user], [prenom], [nom], [login], profil.Libelle as profil FROM [utilisateur], profil WHERE utilisateur.profil = profil.code"></asp:SqlDataSource>

    <div class="row text-left">
        <div class="col-md-12">
            <asp:GridView ID="grdListe" runat="server" class="table table-bordered text-left" AutoGenerateColumns="False" DataKeyNames="id_user" DataSourceID="sqldir" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="id_user" HeaderText="id_user" SortExpression="id_user" Visible="false" />
                <asp:BoundField DataField="prenom" HeaderText="prenom" SortExpression="prenom" />
                <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
                <asp:BoundField DataField="profil" HeaderText="profil" SortExpression="profil" />
                <asp:BoundField DataField="login" HeaderText="login" SortExpression="login" />

                <asp:TemplateField>
                <ItemTemplate>
                            <asp:LinkButton class="btn btn-danger btn-circle"  ID="AddButton" runat="server" 
                                CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" 
                                CommandName="SuppLg" ToolTip="supprimer" OnClientClick="return confirm('Vous êtes sûre?',);" >
                                   <i class="fas fa-trash"></i></asp:LinkButton>
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
</asp:Content>
