<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/dir.Master" CodeBehind="Fiche_enseignant_dir.aspx.vb" Inherits="app_gest_ecole.Fiche_enseignant_dir" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="row text-left" style="padding-left: 70px">
        <h2 style="color: #D32A27; display: inline; text-decoration: underline; text-align: center" class="text-left">CONSULTER</h2>
        &nbsp;
        <h2 style="color: #1A3B86; display: inline; text-align: left">FICHE ENSEIGNANT</h2>
        <br />
        <br />
        <br />
    </div>
    <div class="row text-left" style="padding-left: 70px">
        <asp:TextBox ID="txtId" class="form-control form-control-user" aria-describedby="emailHelp"
            runat="server" Visible="false"></asp:TextBox>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtPrenom" ReadOnly="true" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Prénom" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtNom" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom" ReadOnly="true"  runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:Label Text="Genre :    " ID="Label25" runat="server"></asp:Label>

                <asp:CheckBox Enabled="false" Text="Male" ID="male" runat="server" />
                <asp:CheckBox  Text="Femelle " ID="femelle" runat="server"  Enabled="false"/>
            </div>
        </div>
    </div>





    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtDat" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Date de naissance" runat="server" ReadOnly="true"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtDat_CalendarExtender" Format="dd/MM/yyyy" runat="server" BehaviorID="txtDat_CalendarExtender" TargetControlID="txtDat"></ajaxToolkit:CalendarExtender>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtAdresse" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Adresse"  runat="server" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtNumTel" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="N° Téléphone"  runat="server" ReadOnly="true"></asp:TextBox>
            </div>
        </div>

    </div>

    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtEmail" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Email"  runat="server" ReadOnly="true"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:TextBox ID="txtCIN" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="N° CIN" ReadOnly="true" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:DropDownList ID="dpType" Enabled="false" class="form-control dropdown-toggle" type="button" runat="server" DataSourceID="sqlSpec" DataTextField="Libelle" DataValueField="Code" AppendDataBoundItems="true">
                    <asp:ListItem Value="-1">Spécialité</asp:ListItem>

                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlSpec" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT [Code], [Libelle] FROM [Specialite]"></asp:SqlDataSource>
            </div>
        </div>

    </div>
    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <asp:DropDownList ID="dpType1" Enabled="false" class="form-control dropdown-toggle" type="button" runat="server" DataSourceID="sqlclass" DataTextField="Libelle" DataValueField="Code" AppendDataBoundItems="true">
                    <asp:ListItem Value="-1">Classes Enseignée</asp:ListItem>

                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlclass" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT [Code], [Libelle] FROM [Classes]"></asp:SqlDataSource>
            </div>
        </div>


    </div>

    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <asp:Label Text="Photo Enseignant(Format: JPEG,JPG,PNG)" ID="Label4" runat="server"></asp:Label>
                <asp:FileUpload Enabled="false" CssClass="form-control" ID="Fichier" runat="server" />
                <asp:TextBox ID="txtChemin" class="form-control form-control-user" runat="server" Visible="false"></asp:TextBox>
            </div>
        </div>
    </div>
    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <asp:GridView ID="grdDoc" class="table table-bordered" runat="server" AutoGenerateColumns="False" DataSourceID="sqlDoc" DataKeyNames="chemin">
                <Columns>
                    <asp:BoundField DataField="chemin" HeaderText="fichiers" SortExpression="chemin" />
                    
                    
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="sqlDoc" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT [chemin] FROM [Enseignants] WHERE ([id_enseignant] = ?) and chemin <> ''">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtId" Name="Id" PropertyName="Text" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
        </div>
   <div class="row text-left" style="padding-left: 70px">
        <asp:LinkButton ID="imprim" Text="IMPRIMER" class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm" Style="background-color: #1A3B86; width: 350px; border-radius: 10px" runat="server"></asp:LinkButton>
        &nbsp;
        <asp:LinkButton ID="btnUndo" Text="Retour" class="d-none d-sm-inline-block btn btn-sm  shadow-sm" Style="background-color: #D32A27; width: 350px; border-radius: 10px; color:white"  runat="server"></asp:LinkButton>
    </div>
    
    
    <br /><br /><br /><br />

</asp:Content>
