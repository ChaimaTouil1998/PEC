<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/cours.Master" CodeBehind="coursEns.aspx.vb" Inherits="app_gest_ecole.coursEns" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <br />
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
   

  <div class="row text-left" style="padding-left: 70px">
        <div class="col-md-6" >
            <div class="card" style="box-shadow: 0 4px 8px rgba(255, 0, 0, 0.2);padding-bottom:40px;">
                
                <div class="row text-left" style="padding-left: 100px; padding-top: 50px">
                    <asp:LinkButton ID="btnSave" Text="Ajouter Cours" class="d-none d-sm-inline-block btn btn-sm shadow-sm" Style="background-color: rgba(255, 0, 0, 0.6); width: 650px;height:280px; border-radius: 20px;font-size:60px; font-weight:bold;padding-top:105px; color:white" runat="server"></asp:LinkButton>

                </div>
            </div>
        </div>
      <div class="col-md-6" >
            <div class="card" style="box-shadow: 0 4px 8px rgb( 178 , 178 , 255);padding-bottom:40px;">
                
                <div class="row text-left" style="padding-left: 100px; padding-top: 50px">
                    <asp:LinkButton ID="LinkButton1" Text="Ajouter Note" class="d-none d-sm-inline-block btn btn-sm shadow-sm" Style="background-color: #B2B2FF; width: 650px;height:280px; border-radius: 20px;font-size:60px; font-weight:bold;padding-top:105px; color:white" runat="server"></asp:LinkButton>

                </div>
            </div>
        </div>

    </div>
    
    <br /><br /><br /><br /><br /><br /><br /><br /><br />
    <br /><br /><br /><br /><br /><br />
    <br /><br /><br /><br /><br /><br /><br /><br /><br />
</asp:Content>