Imports System.Data.Odbc

Public Class sanctonEns
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Trim(Session.Item("Nom")) <> "" Then txtNom.Text = Session.Item("Nom")
            If Session.Item("id_enseignant") IsNot System.DBNull.Value Then
                txtId.Text = Request.QueryString("id_enseignant")
                Alimenter()

            End If
        End If
    End Sub
    Public Sub Alimenter()
        Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
        Dim commandtext As String
        commandtext = "Select * from Enseignants where id_enseignant = " & txtId.Text
        Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
        Dim commande As OdbcCommand = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        Dim nb As Integer = 0
        Dim lire As IDataReader = commande.ExecuteReader

        lire.Dispose()
        Connexion.Close()
        If Trim(txtId.Text) = "" Then Exit Sub
        commandtext = "Select * from Enseignants where id_enseignant = " & txtId.Text
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
        Dim id As Integer

        If Integer.TryParse(txtId.Text, id) Then

            Dim ConnectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "insert into sanction(
                motif,
                date_fait,
                observation,
                id_enseignant
               ) 
            values (
            N'" & Replace(txtMotif.Text, "'", "''") & "',  
            cast('" & txtDateFait.Text & "' as datetime),
            N'" & Replace(txtOb.Text, "'", "''") & "',
            " & txtId.Text & "
          )"
            Dim Connexion As OdbcConnection = New OdbcConnection(ConnectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            Response.Redirect("~\liste_enseignant_dir.aspx?id_enseignant=" & txtId.Text)

        End If
    End Sub
    Private Sub btnUndo_Click(sender As Object, e As EventArgs) Handles btnUndo.Click
        Response.Redirect("~\liste_enseignant_dir.aspx")
    End Sub
End Class