<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin.Master" CodeBehind="enseignant_admin.aspx.vb" Inherits="app_gest_ecole.enseignant_admin" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="row text-left" style="padding-left: 70px">
        <h2 style="color: #D32A27; display: inline; text-decoration: underline; text-align: center" class="text-left">AJOUTER</h2>
        &nbsp;
        <h2 style="color: #1A3B86; display: inline; text-align: left">UN ENSEIGNANT</h2>
        <br />
        <br />
        <br />
    </div>
    <div class="row text-left" style="padding-left: 70px">
        <asp:TextBox ID="txtId" class="form-control form-control-user" aria-describedby="emailHelp"
            runat="server" Visible="false" style="border-color: #1A3B86"></asp:TextBox>
        <div class="col">
            <div class="form-group">
                <label for="txtPrenom" style="color:black">Prénom:</label>
                <asp:TextBox ID="txtPrenom" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Prénom" runat="server"  style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNom" style="color:black">Nom:</label>
                <asp:TextBox ID="txtNom" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Nom" runat="server"  style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <asp:Label Text="Genre :    " ID="Label25" runat="server" ForeColor="Black"></asp:Label>

                <asp:CheckBox Text="Male" ID="male" runat="server"  style="border-color: #1A3B86" ForeColor="Black"/>
                <asp:CheckBox Text="Femelle " ID="femelle" runat="server"  style="border-color: #1A3B86" ForeColor="Black"/>
            </div>
        </div>
    </div>





    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="txtDat" style="color:black">Date de naissance:</label>
                <asp:TextBox ID="txtDat" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Date de naissance" runat="server"  style="border-color: #1A3B86"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtDat_CalendarExtender" Format="dd/MM/yyyy" runat="server" BehaviorID="txtDat_CalendarExtender" TargetControlID="txtDat"></ajaxToolkit:CalendarExtender>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtAdresse" style="color:black">Adresse:</label>
                <asp:TextBox ID="txtAdresse" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Adresse" runat="server"  style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtNumTel" style="color:black">N° Téléphone:</label>
                <asp:TextBox ID="txtNumTel" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="N° Téléphone" runat="server"  style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>

    </div>

    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="txtEmail" style="color:black">Email:</label>
                <asp:TextBox ID="txtEmail" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="Email" runat="server"  style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="txtCIN" style="color:black">N° CIN:</label>
                <asp:TextBox ID="txtCIN" class="form-control form-control-user" aria-describedby="emailHelp"
                    placeholder="N° CIN" runat="server"  style="border-color: #1A3B86"></asp:TextBox>
            </div>
        </div>
        <div class="col">
            <div class="form-group">
                <label for="dpType" style="color:black">Spécialité:</label>
                <asp:DropDownList ID="dpType" class="form-control dropdown-toggle" type="button"  style="border-color: #1A3B86" runat="server" DataSourceID="sqlSpec" DataTextField="Libelle" DataValueField="Code" AppendDataBoundItems="true">
                    <asp:ListItem Value="-1">Spécialité</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlSpec" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT [Code], [Libelle] FROM [Specialite]"></asp:SqlDataSource>
            </div>
        </div>

    </div>
    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <label for="dpType1" style="color:black">Classes Enseignée:</label>
                <asp:DropDownList ID="dpType1"   style="border-color: #1A3B86" class="form-control dropdown-toggle" type="button" runat="server" DataSourceID="sqlclass" DataTextField="Libelle" DataValueField="Code" AppendDataBoundItems="true">
                    <asp:ListItem Value="-1">Classes Enseignée</asp:ListItem>

                </asp:DropDownList>
                <asp:SqlDataSource ID="sqlclass" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>" SelectCommand="SELECT [Code], [Libelle] FROM [Classes]"></asp:SqlDataSource>
            </div>
        </div>

        <div class="col">
             <div class="form-group">
            <label for="dpAn" style="color: black; padding-right: 180px">Année Scolaire :</label>
            <asp:DropDownList ID="dpAn" CssClass="form-control" runat="server" DataSourceID="sqlan" DataTextField="libelle_an" DataValueField="code">
            </asp:DropDownList>

        </div>
        &nbsp;&nbsp;
             <asp:SqlDataSource ID="sqlan" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>"
            SelectCommand="SELECT [code], [libelle_an] FROM [annee_scolaire]"></asp:SqlDataSource>

        </div>

        <div class="col">
            <div class="form-group">
                <label for="dpNiveau" style="color: black">Cursus Universitaire:</label>
                <asp:DropDownList ID="dpNiveau" class="form-control dropdown-toggle" type="button" runat="server" AppendDataBoundItems="true" Style="border-color: #1A3B86">
                    <asp:ListItem Value="-1">Cursus Universitaire</asp:ListItem>
                    <asp:ListItem Value="la licence en 3 ans (bac+3)">la licence en 3 ans (bac+3)</asp:ListItem>
                    <asp:ListItem Value="le master en 2 ans (bac +5)">le master en 2 ans (bac +5)</asp:ListItem>
                    <asp:ListItem Value="le doctorat en 3 ans (bac+8)">le doctorat en 3 ans (bac+8)</asp:ListItem>
                    <asp:ListItem Value="le DAEU en 1 à 4 ans (niveau 4, équivalent du bac)">le DAEU en 1 à 4 ans (niveau 4, équivalent du bac)</asp:ListItem>
                    <asp:ListItem Value="le BUT en 3 ans (bac+3)">le BUT en 3 ans (bac+3)</asp:ListItem>
                    <asp:ListItem Value="le DEUST en 2 ans (bac+2)">le DEUST en 2 ans (bac+2)</asp:ListItem>
                    <asp:ListItem Value="le DU à durée variable">le DU à durée variable</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
    </div>

    <div class="row text-left" style="padding-left: 70px">
        <div class="col">
            <div class="form-group">
                <asp:Label Text="Photo Enseignant(Format: JPEG,JPG,PNG)" ID="Label4" runat="server"  style="border-color: #1A3B86" ForeColor="Black"></asp:Label>
                <asp:FileUpload CssClass="form-control" ID="Fichier" runat="server"  style="border-color: #1A3B86"/>
                <asp:TextBox ID="txtChemin" class="form-control form-control-user" runat="server" Visible="false"></asp:TextBox>
            </div>
        </div>
    </div>
   <div class="row text-left" style="padding-left: 70px">
       <div class="col">
            <asp:LinkButton ID="btnSave" Text="Ajouter" class="d-none d-sm-inline-block btn btn-primary shadow-sm" Style="background-color: #1A3B86; width: 350px; border-radius: 10px" runat="server"></asp:LinkButton>
       &nbsp;
       </div>
       <div class="col">
                   <asp:LinkButton ID="btnUndo" Text="Retour" class="d-none d-sm-inline-block btn shadow-sm" Style="background-color: #D32A27; width: 350px; border-radius: 10px; color:white"  runat="server"></asp:LinkButton>
       </div>
    </div>
    <br /><br /><br /><br /><br /><br /><br /><br /><br />

</asp:Content>
