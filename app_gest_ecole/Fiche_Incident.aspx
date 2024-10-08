<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Admin.Master" CodeBehind="Fiche_Incident.aspx.vb" Inherits="app_gest_ecole.Fiche_Incident" %>
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
        <h2 style="color: #D32A27; display: inline; text-align: left">UN INCIDENT</h2>
        <br />
        <br />
        <br />
    </div>


    <div class="row text-left" >
        <div class="col-md-12">
            <div class="card" style="box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); padding: 20px;">
                <h6 style="color: #1A3B86; display: inline; text-align: center; font-weight: bold; padding-bottom: 30px"></h6>
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <asp:TextBox ID="txtNom" class="form-control form-control-user" aria-describedby="emailHelp"
                                placeholder="" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" Format="dd/MM/yyyy" runat="server" BehaviorID="txtDat_CalendarExtender" TargetControlID="txtDat"></ajaxToolkit:CalendarExtender>
                        </div>
                         </div>
                        <div class="col">
                        <div class="form-group">
                            <asp:TextBox ID="txtPrenom" class="form-control form-control-user" aria-describedby="emailHelp"
                                placeholder="" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" Format="dd/MM/yyyy" runat="server" BehaviorID="txtDat_CalendarExtender" TargetControlID="txtDat"></ajaxToolkit:CalendarExtender>
                        </div>


                    </div>

                   <div class="form-group">
                                            <asp:DropDownList ID="dpAn" CssClass="form-control" runat="server" DataSourceID="sqlan" DataTextField="libelle_an" DataValueField="code">
                                            </asp:DropDownList>
                       <asp:SqlDataSource ID="sqlan" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>"
                                             SelectCommand="SELECT [Code], [libelle_an] FROM [annee_scolaire] WHERE ([Code] = ?)">
                           <SelectParameters>
                               <asp:SessionParameter Name="Code" SessionField="AS" Type="Int32" />
                           </SelectParameters>
                                            </asp:SqlDataSource>
                                   
                                        </div>
                    
                       <div class="col">
                        
                        <div class="form-group">
                            <asp:TextBox ID="txtDat" class="form-control form-control-user" aria-describedby="emailHelp"
                                placeholder="Date de naissance" runat="server" Style="border-color: #1A3B86" ReadOnly="true"></asp:TextBox>
                        </div>

                    </div>

                </div>
                <div class="row">
                    <div class="col">
                        <div class="form-group">
                            <asp:TextBox ID="txtDatInc" class="form-control form-control-user" aria-describedby="emailHelp"
                                placeholder="Date de l'incident" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
                            <ajaxToolkit:CalendarExtender ID="txtDatInc_CalendarExtender" Format="dd/MM/yyyy" runat="server" BehaviorID="txtDatInc_CalendarExtender" TargetControlID="txtDatInc"></ajaxToolkit:CalendarExtender>
                        </div>
                    </div>
                </div>
                
                 <div class="form-group">
                            <asp:TextBox ID="txtSA" class="form-control form-control-user" aria-describedby="emailHelp"
                                placeholder="la sanction appliquée" runat="server" Style="border-color: #1A3B86"></asp:TextBox>
                        </div>
                <div class="form-group">
                    <asp:TextBox ID="txtdesce" class="form-control form-control-user" aria-describedby="emailHelp"
                        placeholder="Description" runat="server"
                        TextMode="MultiLine" Style="border-color: #1A3B86"></asp:TextBox>
                </div>
                 
                <div class="row text-left" >
                   <div class="col">
                        <asp:LinkButton ID="btnSave" Text="Ajouter" class="d-none d-sm-inline-block btn btn-primary shadow-sm" Style="background-color: #1A3B86; width: 350px; border-radius: 10px" runat="server"></asp:LinkButton>
                    &nbsp;
                    </div>

                    <div class="col">
                                <asp:LinkButton ID="btnUndo" Text="Retour" class="d-none d-sm-inline-block btn shadow-sm" Style="background-color: #D32A27; width: 350px; border-radius: 10px; color:white"  runat="server"></asp:LinkButton>

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
