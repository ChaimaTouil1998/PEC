Public Class lstED
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub grdListe_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdListe.RowCommand
        If (e.CommandName = "Open") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim k As Integer
            k = grdListe.DataKeys(index).Value.ToString
            Response.Redirect("~\fichehisEc.aspx?id_ecart=" & k)
        End If
    End Sub

    Protected Sub dpAn_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dpAn.SelectedIndexChanged
        If dpAn.SelectedValue <> "0" Then
            sqlEleve.SelectCommand = "SELECT [id_ecart], [date], [An], eleve.[id_eleve], [sanction], Annee_scolaire.libelle_An, eleve.nom + ' ' + eleve.prenom as nomsal  FROM [ecart_disciplinaire], annee_scolaire, eleve WHERE ecart_disciplinaire.id_eleve = eleve.id_eleve and ecart_disciplinaire.an = annee_scolaire.code and  ((ecart_disciplinaire.[id_eleve] = " & Session.Item("id_eleve") & ") AND (ecart_disciplinaire.[An] = " & dpAn.SelectedValue & ")) order by date desc"
            sqlEleve.DataBind()
            grdListe.DataBind()
        End If
    End Sub

    Private Sub dpAn_TextChanged(sender As Object, e As EventArgs) Handles dpAn.TextChanged
        If dpAn.SelectedValue <> "0" Then
            sqlEleve.SelectCommand = "SELECT [id_ecart], [date], [An], eleve.[id_eleve], [sanction], Annee_scolaire.libelle_An, eleve.nom + ' ' + eleve.prenom as nomsal  FROM [ecart_disciplinaire], annee_scolaire, eleve WHERE ecart_disciplinaire.id_eleve = eleve.id_eleve and ecart_disciplinaire.an = annee_scolaire.code and  ((ecart_disciplinaire.[id_eleve] = " & Session.Item("id_eleve") & ") AND (ecart_disciplinaire.[An] = " & dpAn.SelectedValue & ")) order by date desc"
            sqlEleve.DataBind()
            grdListe.DataBind()
        End If
    End Sub
End Class