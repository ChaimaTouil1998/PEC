<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/fiche.Master" CodeBehind="Fiche_Bulltin_super.aspx.vb" Inherits="app_gest_ecole.Fiche_Bulltin_super" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

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
        <h2 style="color: #D32A27; display: inline; text-align: left">UN BULLETIN</h2>
        <br />
        <br />
        <br />
    </div>


    <div class="row text-left">
        <div class="col-md-12" >
            <div class="card" style="box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); padding: 20px;">
                <h6 style="color: #1A3B86; display: inline; text-align: center; font-weight: bold; padding-bottom: 30px"></h6>
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="txtNom" style="color: black; padding-right: 180px">Nom :</label>
                            <asp:TextBox ID="txtNom" class="form-control form-control-user" aria-describedby="emailHelp"
                                placeholder="" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label for="txtPrenom" style="color: black; padding-right: 180px">Prénom :</label>
                            <asp:TextBox ID="txtPrenom" class="form-control form-control-user" aria-describedby="emailHelp"
                                placeholder="" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
                        </div>


                    </div>



                    <div class="col">

                        <div class="form-group">
                            <label for="txtDat" style="color: black; padding-right: 180px">Date de naissance</label>
                            <asp:TextBox ID="txtDat" class="form-control form-control-user" aria-describedby="emailHelp"
                                placeholder="Date de naissance" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
                        </div>

                    </div>

                </div>
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <label for="dpAn" style="color: black; padding-right: 180px">Année Scolaire :</label>
                            <asp:DropDownList ID="dpAn" class="form-control dropdown-toggle" type="button" runat="server" Style="border-color: #1A3B86" DataSourceID="sqlan" DataTextField="libelle_an" DataValueField="code">
                            </asp:DropDownList>

                        </div>
                        &nbsp;&nbsp;
             <asp:SqlDataSource ID="sqlan" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>"
                 SelectCommand="SELECT [code], [libelle_an] FROM [annee_scolaire]"></asp:SqlDataSource>

                    </div>
                    <div class="col">
                        <div class="form-group">
                            <label for="DropDownList1" style="color: black; padding-right: 180px">Classe Actuelle:</label>

                            <asp:DropDownList ID="DropDownList1" class="form-control dropdown-toggle" type="button" runat="server" Style="border-color: #1A3B86" DataSourceID="sqlClasse" DataTextField="Libelle" DataValueField="Code" AppendDataBoundItems="true">
                                <asp:ListItem Value="-1">Classe Actuelle</asp:ListItem>

                            </asp:DropDownList>
                            <asp:SqlDataSource ID="sqlClasse" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT [Code], [Libelle] FROM [Classes]"></asp:SqlDataSource>
                        </div>
                    </div>


                </div>


                <div class="form-group">
                    <asp:Label Text="Bulletin Trimestre 1" ID="Label4" runat="server"></asp:Label>
                    <asp:FileUpload CssClass="form-control" ID="bulletinTrim1" runat="server" Style="border-color: #1A3B86" />
                    <asp:TextBox ID="txtChemin1" class="form-control form-control-user" runat="server" Visible="false"></asp:TextBox>
                </div>



                <div class="form-group">
                    <asp:Label Text="Bulletin Trimestre 2" ID="Label1" runat="server"></asp:Label>
                    <asp:FileUpload CssClass="form-control" ID="bulletinTrim2" runat="server" Style="border-color: #1A3B86" />
                    <asp:TextBox ID="txtChemin2" class="form-control form-control-user" runat="server" Visible="false"></asp:TextBox>
                </div>


                <div class="form-group">
                    <asp:Label Text="Bulletin Trimestre 3" ID="Label2" runat="server"></asp:Label>
                    <asp:FileUpload CssClass="form-control" ID="bulletinTrim3" runat="server" Style="border-color: #1A3B86" />
                    <asp:TextBox ID="txtChemin3" class="form-control form-control-user" runat="server" Visible="false"></asp:TextBox>
                </div>


                <div class="row text-left">
                    <div class="col">
                        <asp:LinkButton ID="btnSave" Text="Ajouter" class="d-none d-sm-inline-block btn btn-primary shadow-sm" Style="background-color: #1A3B86; width: 350px; border-radius: 10px" runat="server"></asp:LinkButton>
                    </div>
                    <div class="col">
                        <asp:LinkButton ID="btnUndo" Text="Retour" class="d-none d-sm-inline-block btn  shadow-sm" Style="background-color: #D32A27; width: 350px; border-radius: 10px; color: white" runat="server"></asp:LinkButton>

                    </div>
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
    <br />
    <br />
    <br />


</asp:Content>
