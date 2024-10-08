<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site1.Master" CodeBehind="Ajouter_classe_super.aspx.vb" Inherits="app_gest_ecole.Ajouter_classe_super" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit"%>

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
        <h2 style="color: #1A3B86; display: inline; text-decoration: underline; text-align: center" class="text-left">AJOUTER</h2>
        &nbsp;
        <h2 style="color: #D32A27; display: inline; text-align: left">UNE NOUVELLE CLASSE</h2>
        <br />
        <br />
        <br />
    </div>


    <div class="row text-left" >
        <div class="col-md-12" >
            <div class="card" style="box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); padding: 20px;">
                <h6 style="color: #1A3B86; display: inline; text-align: center; font-weight: bold; padding-bottom: 30px">UNE NOUVELLE CLASSE</h6>
                <div class="form-group">
                    <asp:TextBox ID="txtNvlClass" class="form-control form-control-user" aria-describedby="emailHelp"
                        placeholder="Nom De La Nouvelle Classe" runat="server" style="border-color: #1A3B86"></asp:TextBox>
                </div>
                <div class="row text-left" >
                <asp:LinkButton ID="btnSave" Text="Ajouter" class="d-none d-sm-inline-block btn btn-primary shadow-sm" Style="background-color: #1A3B86; width: 350px; border-radius: 10px" runat="server"></asp:LinkButton>
                </div>
                
            </div>
        </div>
        

    </div>

    <br /><br />
<div class="row text-left">
        <div class="auto-style1">
            <asp:SqlDataSource ID="sqlclasse" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT [code],[libelle] FROM [Classes]"></asp:SqlDataSource>

    
    <div class="row text-left" style="width:1760px">
        <div class="col-md-12">
            <asp:GridView ID="grdListe" runat="server" class="table table-bordered text-left" AutoGenerateColumns="False" DataKeyNames="Code" DataSourceID="sqlclasse" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                <AlternatingRowStyle BackColor="#DCDCDC" />
            <Columns>
                <asp:BoundField DataField="Code" HeaderText="Code" SortExpression="Code" />
                <asp:BoundField DataField="libelle" HeaderText="libelle" SortExpression="libelle" />
                

                <asp:TemplateField>
                <ItemTemplate>
                            <asp:LinkButton class="btn btn-danger btn-circle"  ID="AddButton" runat="server" 
                                CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" 
                                CommandName="SuppLg" ToolTip="supprimer" OnClientClick="return confirm('Vous êtes sûre?',);" >
                                   <i class="fas fa-trash"></i></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="True" />
                 </asp:TemplateField>
                <asp:TemplateField>
                 <ItemTemplate>
                            <asp:LinkButton class="btn btn-group btn-circle collapsed"  ID="Open" runat="server"  
                                CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>" 
                                CommandName="OpenLg" ToolTip="modifier" >
                                   <i class="fas fa-pen"></i></asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="True" />
                 </asp:TemplateField>
                <asp:TemplateField>
                        <HeaderTemplate>
                            <!-- Insérez votre titre d'en-tête ici -->
                            Email
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:LinkButton class="btn btn-success btn-circle" ID="OpenIn" runat="server"
                                CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>"
                                CommandName="OpenIn" ToolTip="ajouterIn">
                            <i class="fas fa-plus"></i></asp:LinkButton>
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
