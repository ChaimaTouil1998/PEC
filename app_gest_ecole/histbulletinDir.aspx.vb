﻿Public Class histbulletinDir
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Session.Item("id_eleve") IsNot System.DBNull.Value Then
                txtId.Text = Request.QueryString("id_eleve")

            End If
        End If
    End Sub
    Private Sub grdListe_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdListe.RowCommand

        If (e.CommandName = "Open") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim k As Integer
            k = grdListe.DataKeys(index).Value.ToString
            Response.Redirect("~\fichehisBulletinDir.aspx?id_eleve=" & k)
        End If

    End Sub


    Private Sub BtnUndo_Click(sender As Object, e As EventArgs) Handles btnUndo.Click
        Response.Redirect("~\liste_eleve_dir.aspx")
    End Sub

End Class