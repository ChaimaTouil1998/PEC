Public Class lstbulletin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub




    Private Sub grdListe_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdListe.RowCommand
        If (e.CommandName = "Open") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim k As Integer = Convert.ToInt32(grdListe.DataKeys(index).Value)
            Response.Redirect("~/fichehisBulletin.aspx?id_bul=" & k)
        End If
    End Sub
    Protected Sub dpAn_SelectedIndexChanged(sender As Object, e As EventArgs) Handles dpAn.SelectedIndexChanged
        If dpAn.SelectedValue <> "0" Then
            sqlEleve.SelectCommand = "SELECT [id_bul],[An], eleve.[id_eleve], Annee_scolaire.libelle_An, eleve.nom + ' ' + eleve.prenom as nomsal  FROM [bulletin], annee_scolaire, eleve WHERE bulletin.id_eleve = eleve.id_eleve and bulletin.an = annee_scolaire.code and  ((bulletin.[id_eleve] = " & Session.Item("id_eleve") & ") AND (bulletin.[An] = " & dpAn.SelectedValue & ")) order by An desc"
            sqlEleve.DataBind()
            grdListe.DataBind()
        End If
    End Sub

    Private Sub dpAn_TextChanged(sender As Object, e As EventArgs) Handles dpAn.TextChanged
        If dpAn.SelectedValue <> "0" Then
            sqlEleve.SelectCommand = "SELECT [id_bul], [An], eleve.[id_eleve], Annee_scolaire.libelle_An, eleve.nom + ' ' + eleve.prenom as nomsal  FROM [bulletin], annee_scolaire, eleve WHERE bulletin.id_eleve = eleve.id_eleve and bulletin.an = annee_scolaire.code and  ((bulletin.[id_eleve] = " & Session.Item("id_eleve") & ") AND (bulletin.[An] = " & dpAn.SelectedValue & ")) order by An desc"
            sqlEleve.DataBind()
            grdListe.DataBind()
        End If
    End Sub
End Class