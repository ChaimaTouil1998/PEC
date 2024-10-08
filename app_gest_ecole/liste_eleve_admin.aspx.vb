Imports System.Data.Odbc

Public Class liste_eleve_admin
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
            commandtext = "Delete from eleve  where id_eleve = " & k
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
            Session("id_eleve") = k
            Response.Redirect("~\Fiche_eleve.aspx?id_eleve=" & k)
        End If

        If (e.CommandName = "OpenEC") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim k As Integer
            k = grdListe.DataKeys(index).Value.ToString
            Session("id_eleve") = k
            Response.Redirect("~\Fiche_Ecart_dis_admin.aspx?id_eleve=" & k)
        End If


        If (e.CommandName = "OpenIn") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim k As Integer
            k = grdListe.DataKeys(index).Value.ToString
            Session("id_eleve") = k
            Response.Redirect("~\Fiche_Incident.aspx?id_eleve=" & k)
        End If

        If (e.CommandName = "OpenAb") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim k As Integer
            k = grdListe.DataKeys(index).Value.ToString
            Session("id_eleve") = k
            Response.Redirect("~\Fiche_Absence_admin.aspx?id_eleve=" & k)
        End If


        If (e.CommandName = "OpenB") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim k As Integer
            k = grdListe.DataKeys(index).Value.ToString
            Session("id_eleve") = k
            Response.Redirect("~\Fiche_Bulltin_admin.aspx?id_eleve=" & k)
        End If
    End Sub

    Protected Sub btnFiltrer_Click(sender As Object, e As EventArgs) Handles btnFiltrer.Click
        Dim filterExpression As String = "1 = 1" ' Expression de filtrage initiale

        ' Filtrer par prénom
        If Not String.IsNullOrEmpty(txtPrenom.Text) Then
            filterExpression &= String.Format(" AND [prenom] LIKE '%{0}%'", txtPrenom.Text)
        End If

        ' Filtrer par nom
        If Not String.IsNullOrEmpty(txtNom.Text) Then
            filterExpression &= String.Format(" AND [nom] LIKE '%{0}%'", txtNom.Text)
        End If

        ' Filtrer par date de naissance
        If Not String.IsNullOrEmpty(txtDateNaissance.Text) Then
            ' Assurez-vous que la date est dans un format valide avant de l'ajouter à l'expression de filtrage
            Dim parsedDate As DateTime
            If DateTime.TryParse(txtDateNaissance.Text, parsedDate) Then
                filterExpression &= String.Format(" AND [date_naissance] = #{0:yyyy-MM-dd}#", parsedDate)
            Else
                ' Gérer le cas où la date n'est pas dans un format valide
                ' Par exemple, afficher un message d'erreur à l'utilisateur
            End If
        End If

        ' Filtrer par classe actuelle
        If Not String.IsNullOrEmpty(ddlClasse.SelectedValue) Then
            filterExpression &= " AND [Classe_actuel] = '" & ddlClasse.SelectedValue & "'"
        End If



        ' Appliquer l'expression de filtrage à la source de données
        sqlEleve.FilterExpression = filterExpression

        ' Rafraîchir la GridView avec le nouveau filtrage
        grdListe.DataBind()
    End Sub



    Protected Sub btnReinitialiser_Click(sender As Object, e As EventArgs) Handles btnReinitialiser.Click
        ' Effacer les champs de recherche
        txtPrenom.Text = ""
        txtNom.Text = ""
        txtDateNaissance.Text = ""
        ' Réinitialiser l'expression de filtrage
        sqlEleve.FilterExpression = "1 = 1"
        grdListe.DataBind() ' Rafraîchir la GridView
    End Sub





    Protected Sub dpAn_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dpAn.SelectedIndexChanged
        If dpAn.SelectedValue <> "0" Then
            sqlEleve.SelectCommand = "SELECT eleve.*, Annee_scolaire.libelle_An, eleve.nom + ' ' + eleve.prenom as nomsal  FROM [eleve], annee_scolaire WHERE   eleve.annee_scolaire = annee_scolaire.code and  (eleve.[id_eleve] = " & Session.Item("id_eleve") & ") AND (eleve.[annee_scolaire] = " & dpAn.SelectedValue & ") "
            sqlEleve.DataBind()
            grdListe.DataBind()
        End If
    End Sub

    Private Sub dpAn_TextChanged(sender As Object, e As EventArgs) Handles dpAn.TextChanged
        If dpAn.SelectedValue <> "0" Then
            sqlEleve.SelectCommand = "SELECT eleve.*, Annee_scolaire.libelle_An, eleve.nom + ' ' + eleve.prenom as nomsal  FROM [eleve], annee_scolaire WHERE   eleve.annee_scolaire = annee_scolaire.code and  ((eleve.[id_eleve] = " & Session.Item("id_eleve") & ") AND (eleve.[annee_scolaire] = " & dpAn.SelectedValue & ")) "
            sqlEleve.DataBind()
            grdListe.DataBind()
        End If
    End Sub
End Class