Imports System.Data.Odbc
Imports System.Net
Imports System.Net.Mail
Public Class Fiche_Bulltin_super
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Trim(Session.Item("Nom")) <> "" Then txtNom.Text = Session.Item("Nom")
            If Session.Item("id_eleve") IsNot System.DBNull.Value Then
                txtId.Text = Request.QueryString("id_eleve")
                Alimenter()

            End If
        End If
    End Sub
    Public Sub Alimenter()
        Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
        Dim commandtext As String
        commandtext = "Select * from eleve where id_eleve = '" & txtId.Text & "'"

        Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
        Dim commande As OdbcCommand = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        Dim nb As Integer = 0
        Dim lire As IDataReader = commande.ExecuteReader

        lire.Dispose()
        Connexion.Close()
        If Trim(txtId.Text) = "" Then Exit Sub
        commandtext = "Select * from eleve where id_eleve = '" & txtId.Text & "'"
        commande = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        lire = commande.ExecuteReader
        While lire.Read()

            If lire("prenom") IsNot System.DBNull.Value Then txtPrenom.Text = lire("prenom")
            If lire("nom") IsNot System.DBNull.Value Then txtNom.Text = lire("nom")
            If lire("date_naissance") IsNot System.DBNull.Value Then txtDat.Text = lire("date_naissance")



        End While

        lire.Dispose()
        Connexion.Close()

        '****************************
    End Sub


    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim Chemin1 As String = ""
        Dim Chemin2 As String = ""
        Dim Chemin3 As String = ""

        If bulletinTrim1.HasFile Then
            Chemin1 = Server.MapPath("~/Documents/")
            bulletinTrim1.SaveAs(Chemin1 & bulletinTrim1.FileName)
            Chemin1 = bulletinTrim1.FileName
            txtChemin1.Text = Chemin1
        End If

        If bulletinTrim2.HasFile Then
            Chemin2 = Server.MapPath("~/Documents/")
            bulletinTrim2.SaveAs(Chemin2 & bulletinTrim2.FileName)
            Chemin2 = bulletinTrim2.FileName
            txtChemin2.Text = Chemin2
        End If

        If bulletinTrim3.HasFile Then
            Chemin3 = Server.MapPath("~/Documents/")
            bulletinTrim3.SaveAs(Chemin3 & bulletinTrim3.FileName)
            Chemin3 = bulletinTrim3.FileName
            txtChemin3.Text = Chemin3
        End If
        Dim id As Integer
        If Integer.TryParse(txtId.Text, id) Then
            Dim ConnectionString As String = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String = "INSERT INTO bulletin (bulletinTrim1, bulletinTrim2, bulletinTrim3, annee_scolaire, eleve) VALUES (" &
                                            "'" & txtChemin1.Text.Replace("'", "''") & "', " &
                                            "'" & txtChemin2.Text.Replace("'", "''") & "', " &
                                            "'" & txtChemin3.Text.Replace("'", "''") & "', " &
                                            "'" & txtDat.Text.Replace("'", "''") & "', " & id & ")"

            Dim Connexion As New OdbcConnection(ConnectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand()
            commande.CommandText = commandtext

            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
        End If


        Response.Redirect("~\histbulletin_super.aspx?id_eleve=" & txtId.Text)


    End Sub

    Private Sub btnUndo_Click(sender As Object, e As EventArgs) Handles btnUndo.Click
        Response.Redirect("~\histbulletin_super.aspx")
    End Sub

End Class