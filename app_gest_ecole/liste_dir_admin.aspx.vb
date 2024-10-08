Imports System.Data.Odbc

Public Class liste_dir_admin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub





    Private Sub grdListe_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdListe.RowCommand
        If (e.CommandName = "SuppLg") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim Nb As Integer = 0
            Dim k As Integer = 0
            k = grdListe.DataKeys(index).Value.ToString
            Dim connectionstring As String = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String

            Dim Connexion As OdbcConnection = New OdbcConnection(connectionstring)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            Connexion.Open()
            commandtext = "Delete from directeurs_pedagogiques  where id_dir = " & k
            commande = Connexion.CreateCommand
            commande.CommandText = commandtext
            commande.ExecuteNonQuery()


            Connexion.Close()
            grdListe.DataBind()
            '*************************

        End If
        If (e.CommandName = "OpenLg") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim k As Integer
            k = grdListe.DataKeys(index).Value.ToString
            Response.Redirect("~\Fiche_directeur.aspx?id_dir=" & k)
        End If
    End Sub


    Protected Sub btnFiltrer_Click(sender As Object, e As EventArgs) Handles btnFiltrer.Click
        Dim filterExpression As String = "1 = 1" ' Expression de filtrage initiale
        If Not String.IsNullOrEmpty(txtPrenom.Text) Then
            filterExpression &= String.Format(" AND [prenom] LIKE '%{0}%'", txtPrenom.Text)
        End If
        If Not String.IsNullOrEmpty(txtNom.Text) Then
            filterExpression &= String.Format(" AND [nom] LIKE '%{0}%'", txtNom.Text)
        End If
        If Not String.IsNullOrEmpty(txtEmail.Text) Then
            filterExpression &= String.Format(" AND [email] LIKE '%{0}%'", txtEmail.Text)
        End If

        sqldir.FilterExpression = filterExpression ' Appliquer l'expression de filtrage à la source de données
        grdListe.DataBind() ' Rafraîchir la GridView avec le nouveau filtrage
    End Sub

    Protected Sub btnReinitialiser_Click(sender As Object, e As EventArgs) Handles btnReinitialiser.Click
        ' Effacer les champs de recherche
        txtPrenom.Text = ""
        txtNom.Text = ""
        txtEmail.Text = ""
        ' Réinitialiser l'expression de filtrage
        sqldir.FilterExpression = "1 = 1"
        grdListe.DataBind() ' Rafraîchir la GridView
    End Sub

End Class