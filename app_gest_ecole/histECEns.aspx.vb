Public Class histECEns
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Session.Item("id_eleve") IsNot System.DBNull.Value Then
                txtId.Text = Request.QueryString("id_eleve")

            End If
        End If
    End Sub
    Private Sub btnUndo_Click(sender As Object, e As EventArgs) Handles btnUndo.Click
        Response.Redirect("~\liste_eleve_ens.aspx")
    End Sub
End Class