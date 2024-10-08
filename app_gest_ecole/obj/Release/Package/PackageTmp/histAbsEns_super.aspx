﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fiche.Master" CodeBehind="histAbsEns_super.aspx.vb" Inherits="app_gest_ecole.histAbsEns_super" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="row text-left" style="padding-left: 70px">
        <h2 style="color: #D32A27; display: inline; text-decoration: underline; text-align: center" class="text-left">CONSULTER</h2>
        <h2 style="color: #1A3B86; display: inline; text-align: left">&nbsp; LISTE DES ABSENCES DES ELEVES</h2>
        <br />
        <br />
        <br />
    </div>
    <div class="row text-left" style="padding-left: 740px">
        <asp:SqlDataSource ID="sql" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT absence.id_absence,absence.duree,absence.date_ab ,eleve.nom, eleve.prenom FROM absence JOIN eleve ON absence.id_eleve = eleve.id_eleve"></asp:SqlDataSource>

        <div class="row text-left" style="padding-left: 60px">
            <div class="col-md-12">
                <asp:TextBox ID="txtId" class="form-control form-control-user" aria-describedby="emailHelp"
                    runat="server" Visible="false"></asp:TextBox>
                <asp:GridView ID="grdListe" runat="server" class="table table-bordered text-left" AutoGenerateColumns="False" DataKeyNames="id_absence" DataSourceID="sql" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="nom" HeaderText="nom" SortExpression="nom" />
                        <asp:BoundField DataField="prenom" HeaderText="prenom" SortExpression="prenom" />
                        <asp:BoundField DataField="duree" HeaderText="durée" SortExpression="duree" />
                        <asp:BoundField DataField="date_ab" HeaderText="date de l'absence" SortExpression="date_ab" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton class="btn btn-group btn-circle collapsed" ID="Open" runat="server"
                                    CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>"
                                    CommandName="OpenLg" ToolTip="Modifier la ligne">
                                   <i class="fas fa-pen"></i></asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="100px" Wrap="True" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton class="btn btn-danger btn-circle" ID="AddButton" runat="server"
                                    CommandArgument="<%# CType(Container, GridViewRow).RowIndex %>"
                                    CommandName="SuppLg">
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
    <br />
    <div class="row text-left" style="padding-left: 940px">
        <asp:LinkButton ID="btnUndo" Text="Retour" class="d-none d-sm-inline-block btn btn-sm  shadow-sm" Style="background-color: #D32A27; width: 350px; border-radius: 10px; color: white" runat="server"></asp:LinkButton>

    </div>
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
</asp:Content>