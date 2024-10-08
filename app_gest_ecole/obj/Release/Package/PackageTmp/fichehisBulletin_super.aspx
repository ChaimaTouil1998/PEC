<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fiche.Master" CodeBehind="fichehisBulletin_super.aspx.vb" Inherits="app_gest_ecole.fichehisBulletin_super" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    
    <div class="row text-left" style="padding-left: 70px">
        <h2 style="color: #D32A27; display: inline; text-decoration: underline; text-align: center" class="text-left">CONSULTER</h2>
        <h2 style="color: #1A3B86; display: inline; text-align: left">&nbsp; les bulletins Elève</h2>
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
                    placeholder="Prénom..." runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNom" style="color:black">Nom:</label>
                <asp:TextBox ID="txtNom" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
       
        <div class="col">

            <div class="form-group">
                <label for="DropDownList1" style="color:black">Classe Actuelle:</label>&nbsp;<br />
                <asp:DropDownList ID="DropDownList1" class="form-control dropdown-toggle" type="button" ReadOnly="true" Enabled="False" runat="server" Style="border-color: #1A3B86" DataSourceID="sqlClasse" DataTextField="Libelle" DataValueField="Code" AppendDataBoundItems="True">
                   
                    <asp:ListItem Value="-1">Classe Actuelle</asp:ListItem>

                </asp:DropDownList>
                                <asp:SqlDataSource ID="sqlClasse" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT [Code], [Libelle] FROM [Classes]"></asp:SqlDataSource>

            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtDat" style="color:black">Date de naissance:</label>
                <asp:TextBox ID="txtDat" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Date de naissance" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>

            </div>
        </div>
        
    </div>
    <div class="row text-left" style=";padding-left: 70px">
       <div class="col">
            <asp:SqlDataSource ID="sql" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT id_bul,eleve.id_eleve,eleve,bulletinTrim1,bulletinTrim2,bulletinTrim3 FROM bulletin,  eleve Where bulletin.eleve = eleve.id_eleve and eleve.id_eleve = 0">
            
        </asp:SqlDataSource>
           
                <asp:TextBox ID="TextBox1" class="form-control form-control-user" aria-describedby="emailHelp"
                    runat="server" Visible="false"></asp:TextBox>
                <asp:GridView ID="grdListe" style="padding-left: 70px" runat="server" class="table table-bordered text-left" AutoGenerateColumns="False" DataKeyNames="id_bul,bulletinTrim1,bulletinTrim2,bulletinTrim3" DataSourceID="sql" CellPadding="4" GridLines="None" ForeColor="#333333">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="bulletinTrim1" HeaderText="Bulletin Trimestre 1" SortExpression="bulletinTrim1" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton class="btn btn-group btn-circle collapsed" ID="Open1" runat="server"
                                    CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>"
                                    CommandName="Open1" ToolTip="Modifier la ligne">
                                   <i class="fas fa-pen"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="True" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="bulletinTrim3" HeaderText="Bulletin Trimestre 3" SortExpression="bulletinTrim3" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton class="btn btn-group btn-circle collapsed" ID="Open2" runat="server"
                                    CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>"
                                    CommandName="Open2" ToolTip="Modifier la ligne">
                                   <i class="fas fa-pen"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="True" />
                        </asp:TemplateField>
                                                <asp:BoundField DataField="bulletinTrim2" HeaderText="Bulletin Trimestre 2" SortExpression="bulletinTrim2" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton class="btn btn-group btn-circle collapsed" ID="Open3" runat="server"
                                    CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>"
                                    CommandName="Open3" ToolTip="Modifier la ligne">
                                   <i class="fas fa-pen"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="True" />
                        </asp:TemplateField>
                       
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
    </div>
       
            </div>
        
   

    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
                    <asp:LinkButton ID="btnImprim" Text="Imprimer" class="d-none d-sm-inline-block btn  btn-primary shadow-sm" Style="background-color: #1A3B86; width: 350px; border-radius: 10px" runat="server"></asp:LinkButton>
        </div>
        <div class="col">
                    <asp:LinkButton ID="btnEmail" Text="Email" class="d-none d-sm-inline-block btn shadow-sm" Style="background-color: green; width: 350px; border-radius: 10px; color: white" runat="server"></asp:LinkButton>
        </div>
        <div class="col">
                    <asp:LinkButton ID="btnUndo" Text="Retour" class="d-none d-sm-inline-block btn shadow-sm" Style="background-color: #D32A27; width: 350px; border-radius: 10px; color: white" runat="server"></asp:LinkButton>
        </div>
        &nbsp;
    </div>
    <br />
    <br />
    <br /><br />
    <br />
    <br /><br />
    <br />
    <br /><br />
    <br />
    
</asp:Content>
