<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site3.Master" CodeBehind="Deconnexion.aspx.vb" Inherits="app_gest_ecole.Deconnexion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
                                        <h1 class="h4 text-900 mb-4" style="font-weight:bold;color:black">Se Connecter</h1>
                                    </div>

                                   
                                    
                                    

                                    <asp:Button class="btn btn-primary btn-user btn-block" ID="btnDeconnexion" runat="server" Text="Se Déconnecter" />
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
    <br />
    <br />
    <br />
    <br />
</asp:Content>