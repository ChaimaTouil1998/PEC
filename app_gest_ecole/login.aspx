<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site3.Master" CodeBehind="login.aspx.vb" Inherits="app_gest_ecole.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="background-color: transparent">

        <!-- Outer Row -->
        <div class="row justify-content-center" style="padding-top: 10px;">

            <div class="col-xl-10 col-lg-12 col-md-9" style="background-color: transparent; padding-left: 200px">

                <div class="card o-hidden border-0 shadow-lg my-5" style="background-color: rgba(255, 255, 255, 0.9); width: 550px; padding-left: 100px; padding-right: 100px">
                    <div class="card-body" style="background-color: transparent">
                        <!-- Nested Row within Card Body -->

                        <div class="row">

                            <div class="col-12">
                                <div class="">
                                    <div class="text-center">
                                        <h1 class="h4 text-900 mb-4" style="font-weight: bold; color: black">Se Connecter</h1>
                                    </div>

                                    <div class="form-group">

                                        <asp:TextBox ID="txtLogin" class="form-control form-control-user text-left" aria-describedby="emailHelp"
                                            placeholder="Login (Essayer Votre Email)" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">

                                        <asp:TextBox ID="txtPass" type="password" class="form-control form-control-user text-left" placeholder="Mot de passe (essayer votre Num CIN ou Num Passeport)" runat="server"></asp:TextBox>
                                    </div>
                                        <div class="form-group">
                                            <label for="dpAn" style="color:black; padding-right:180px">Année Scolaire :</label>
                                            <asp:DropDownList ID="dpAn" CssClass="form-control" runat="server" DataSourceID="sqlan" DataTextField="libelle_an" DataValueField="code">
                                            </asp:DropDownList>

                                        </div>
                                        &nbsp;&nbsp;
                                         <asp:SqlDataSource ID="sqlan" runat="server" ConnectionString="<%$ ConnectionStrings:EcoleConnectionString %>" ProviderName="<%$ ConnectionStrings:EcoleConnectionString.ProviderName %>"
                                             SelectCommand="SELECT [code], [libelle_an] FROM [annee_scolaire]"></asp:SqlDataSource>
                                   
                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox small">
                                        </div>
                                    </div>

                                    <asp:Button class="btn btn-primary btn-user btn-block" ID="btnOK" runat="server" Text="Se Connecter" />
                                    <hr>


                                    <hr>
                                    <br />
                                    <br />
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </div>


    </div>
    <br />
    <br />
    <br />
    <br />
</asp:Content>
