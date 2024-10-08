<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/dir_ped.Master" CodeBehind="Profil_dir.aspx.vb" Inherits="app_gest_ecole.Profil_dir" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
        <div class="col-4">
            <asp:TextBox ID="txtId" class="form-control form-control-user" aria-describedby="emailHelp"
            runat="server" Visible="false"></asp:TextBox>
            <div class="container" style="background-color: transparent">

        <!-- Outer Row -->
        <div class="row justify-content-center" style="padding-top: 10px;">

            <div class="col-xl-10 col-lg-12 col-md-9" style="background-color: transparent; padding-left:200px">

                <div class="card o-hidden border-0 shadow-lg my-5" style="background-color: rgba(255, 255, 255, 0.5); width:550px; padding-left:100px; padding-right:100px">
                    <div class="card-body" style="background-color: transparent">
                        <!-- Nested Row within Card Body -->

                        <div class="row">

                            <div class="col-12">
                                <div class="">
                                    <div class="text-center">
                                        <h1 class="h4 text-900 mb-4" style="font-weight:bold;color:black">Fiche Connexion</h1>
                                    </div>

                                    <div class="form-group">

                                        <asp:TextBox ID="txtLogin" class="form-control form-control-user text-left" aria-describedby="emailHelp"
                                            placeholder="Login (Essayer Votre Email)" runat="server"></asp:TextBox>
                                    </div>

                                    <br />
                                    <div class="form-group">

                                        <asp:TextBox ID="txtPass" type="password" class="form-control form-control-user text-left" placeholder="Mot de passe (essayer votre Num CIN ou Num Passeport)" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox small">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox small">
                                        </div>
                                    </div>
                                   
                                    <asp:Button class="btn btn-primary btn-user btn-block" ID="btnOK" runat="server" Text="MODIFIER" />
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
        </div>

        <div class="col-8">
            <div class="container" style="background-color: transparent">

        <!-- Outer Row -->
        <div class="row justify-content-center" style="padding-top: 10px;">

            <div class="col-xl-10 col-lg-12 col-md-9" style="background-color: transparent; padding-left:200px">

                <div class="card o-hidden border-0 shadow-lg my-5" style="background-color: rgba(255, 255, 255, 0.5); width:550px; padding-left:100px; padding-right:100px">
                    <div class="card-body" style="background-color: transparent">
                        <!-- Nested Row within Card Body -->

                        <div class="row">

                            <div class="col-12">
                                <div class="">
                                    <div class="text-center">
                                        <h1 class="h4 text-900 mb-4" style="font-weight:bold;color:black">Fiche Profil</h1>
                                    </div>

                                    <div class="form-group">

                                        <asp:TextBox ID="txtNom" class="form-control form-control-user text-left" aria-describedby="emailHelp"
                                            placeholder="NOM" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="form-group">

                                        <asp:TextBox ID="txtPrenom" class="form-control form-control-user text-left" aria-describedby="emailHelp"
                                            placeholder="PRENOM" runat="server"></asp:TextBox>
                                    </div>
                                    
                                    <div class="form-group">

                                        <asp:TextBox ID="txtEmail" class="form-control form-control-user text-left" aria-describedby="emailHelp"
                                            placeholder="EMAIL" runat="server"></asp:TextBox>
                                    </div>

                                    <div class="form-group">

                                        <asp:TextBox ID="txtNumPass" class="form-control form-control-user text-left" aria-describedby="emailHelp"
                                            placeholder="Numéro Passeport" runat="server"></asp:TextBox>
                                    </div>
                                    

                                    <asp:Button class="btn btn-primary btn-user btn-block" ID="btnOK1" runat="server" Text="MODIFIER" />
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
        </div>
    </div>
    
    
    <br />
    <br />
    <br />
    <br />
</asp:Content>