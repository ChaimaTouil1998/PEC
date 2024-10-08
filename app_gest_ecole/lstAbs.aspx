﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fiche_eleve_admin.Master" CodeBehind="lstAbs.aspx.vb" Inherits="app_gest_ecole.lstAbs" %>
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
        <h2 style="color: #1A3B86; display: inline; text-decoration: underline; text-align: center" class="text-left">Liste</h2>
        &nbsp;
        <h2 style="color: #D32A27; display: inline; text-align: left">des écarts disciplinaires</h2>
        <br />
        <br />
        <br />
    </div>


      <asp:SqlDataSource ID="sqlEleve" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT [id_absence], [date_ab], [An], eleve.[id_eleve], [duree], Annee_scolaire.libelle_An, eleve.nom + ' ' + eleve.prenom as nomsal  FROM [absence], annee_scolaire, eleve WHERE absence.id_eleve = eleve.id_eleve and absence.an = annee_scolaire.code and  ((absence.[id_eleve] = ?) AND (absence.[An] = ?)) order by date_ab desc" >
          <SelectParameters>
              <asp:SessionParameter Name="id_eleve" SessionField="id_eleve" Type="Int32" />
              <asp:SessionParameter Name="An" SessionField="AS" Type="Int32" />
          </SelectParameters>
</asp:SqlDataSource>
     <asp:TextBox ID="TextBox1" class="form-control form-control-user" aria-describedby="emailHelp"
                    runat="server" Visible="false"></asp:TextBox>
       <div class="row text-left" style="padding-left: 60px">
      <div class="form-group col-md-12">
                                            <asp:DropDownList ID="dpAn" CssClass="form-control" runat="server" DataSourceID="sqlan" DataTextField="libelle_an" DataValueField="code" AutoPostBack="True" AppendDataBoundItems="True">
                                                <asp:ListItem Text="Choisir l'année..." Value="0"></asp:ListItem>
                                            </asp:DropDownList>
                       <asp:SqlDataSource ID="sqlan" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>"
                                             SelectCommand="SELECT [Code], [libelle_an] FROM [annee_scolaire] ">
                                            </asp:SqlDataSource>
                                   
                                        </div>
           </div>
    <div class="row text-left" style="padding-left: 60px">
        <div class="col-md-12">
            <asp:GridView ID="grdListe" runat="server" class="table table-bordered text-left" AutoGenerateColumns="False" DataSourceID="sqlEleve" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" DataKeyNames="id_absence">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="libelle_An" HeaderText="A.S" SortExpression="libelle_An" />
                    <asp:BoundField DataField="nomsal" HeaderText="Nom et Prénom" SortExpression="nomsal" ReadOnly="True" />
                    <asp:BoundField DataField="date_ab" HeaderText="Date d'effet" SortExpression="date_ab" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="duree" HeaderText="Nombre d'absence en heure" SortExpression="duree" />
                    <asp:TemplateField>
                        <HeaderTemplate>
                            <!-- Insérez votre titre d'en-tête ici -->
                            Absence
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
    <br />
    <br />
    <br />


</asp:Content>