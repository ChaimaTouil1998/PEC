<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fiche.Master" CodeBehind="histEC.aspx.vb" Inherits="app_gest_ecole.histEC" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="row text-left" style="padding-left: 70px">
        <h2 style="color: #D32A27; display: inline; text-decoration: underline; text-align: center" class="text-left">CONSULTER</h2>
        <h2 style="color: #1A3B86; display: inline; text-align: left">&nbsp; LA LISTE DES ELÈVES </h2>
        <br />
        <br />
        <br />
    </div>
    
    <br />

    <asp:SqlDataSource ID="sqlEleve" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT [id_eleve], [prenom], [nom],[genre] FROM [eleve]"></asp:SqlDataSource>
     <asp:TextBox ID="txtId" class="form-control form-control-user" aria-describedby="emailHelp"
                    runat="server" Visible="false"></asp:TextBox>
    <div class="row text-left" style="padding-left: 60px">
        <div class="col-md-12">
            <asp:GridView ID="grdListe" runat="server" class="table table-bordered text-left" AutoGenerateColumns="False" DataKeyNames="id_eleve" DataSourceID="sqlEleve" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="prenom" HeaderText="prenom" SortExpression="prenom" />
                    <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <!-- Insérez votre titre d'en-tête ici -->
                            Ecart Disciplinaire
                        </HeaderTemplate>
                        <ItemTemplate>

                            <asp:LinkButton class="btn btn-group btn-circle collapsed" ID="Open" runat="server"
                                CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>"
                                CommandName="Open" ToolTip="modifier">
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
    <div class="row text-left" style="padding-left: 70px">
        &nbsp;
        <asp:LinkButton ID="btnUndo" Text="Retour" class="d-none d-sm-inline-block btn shadow-sm" Style="background-color: #D32A27; width: 350px; border-radius: 10px; color: white" runat="server"></asp:LinkButton>
    </div>
    <br />
</asp:Content>