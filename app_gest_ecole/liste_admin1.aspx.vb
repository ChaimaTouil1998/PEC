Public Class liste_admin1
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

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