Imports System.Data.Odbc

Public Class histbulletinEns
    Inherits System.Web.UI.Page
    Dim Connexion As OdbcConnection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Initialisation de la variable Connexion avec votre chaîne de connexion
        Connexion = New OdbcConnection(ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString)
        If Page.IsPostBack = False Then
            If Session.Item("id_eleve") IsNot System.DBNull.Value Then
                txtId.Text = Request.QueryString("id_eleve")

            End If
        End If
    End Sub
    Private Sub grd_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdListe.RowCommand
        If (e.CommandName = "OpenLg") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            Dim k As String
            k = ""
            k = grdListe.DataKeys(index).Value.ToString
            Response.Redirect(Trim("~/Documents/" & grdListe.DataKeys(index).Values("bulletinTrim1").ToString))
            Response.Redirect(Trim("~/Documents/" & grdListe.DataKeys(index).Values("bulletinTrim2").ToString))
            Response.Redirect(Trim("~/Documents/" & grdListe.DataKeys(index).Values("bulletinTrim3").ToString))

        End If
        If (e.CommandName = "SuppLg") Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update bulletin set bulletinTrim1 = '',bulletinTrim2 = '',bulletinTrim3 = '' where id_bul = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            grdListe.DataBind()

        End If
    End Sub
    Private Sub btnUndo_Click(sender As Object, e As EventArgs) Handles btnUndo.Click
        Response.Redirect("~\liste_eleve_ens.aspx")
    End Sub
End Class