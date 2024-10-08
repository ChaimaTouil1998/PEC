Imports System.Web.Security

Public Class Deconnexion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Private Sub btnDeconnexion_Click(sender As Object, e As EventArgs) Handles btnDeconnexion.Click
        ' Terminer la session de l'utilisateur
        FormsAuthentication.SignOut()

        ' Rediriger l'utilisateur vers la page de connexion ou une autre page d'accueil
        Response.Redirect("~/Login.aspx")
    End Sub
End Class