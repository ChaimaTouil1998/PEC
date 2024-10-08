Imports System.Data.Odbc

Public Class PROFIL
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Trim(Session.Item("Nom")) <> "" Then txtNomUser.Text = Session.Item("Nom")
            If Session.Item("profil") IsNot System.DBNull.Value Then
                txtLogin.Text = Request.QueryString("profil")
                Alimenter()

            End If
        End If
    End Sub



    Public Sub Alimenter()
        Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
        Dim commandtext As String
        commandtext = "Select * from utilisateur where login = " & txtLogin.Text
        Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
        Dim commande As OdbcCommand = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        Dim nb As Integer = 0
        Dim lire As IDataReader = commande.ExecuteReader

        lire.Dispose()
        Connexion.Close()
        If Trim(txtId.Text) = "" Then Exit Sub
        commandtext = "Select * from utilisateur where login = " & txtLogin.Text
        commande = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        lire = commande.ExecuteReader

        While lire.Read()

            If lire("prenom") IsNot System.DBNull.Value Then txtPrenom.Text = lire("prenom")
            If lire("nom") IsNot System.DBNull.Value Then txtNomUser.Text = lire("nom")
            If lire("login") IsNot System.DBNull.Value Then txtLogin.Text = lire("login")
            If lire("mdp") IsNot System.DBNull.Value Then txtMDP.Text = lire("mdp")
            If lire("profil") IsNot System.DBNull.Value Then Profil.Text = lire("profil")

        End While

        lire.Dispose()
        Connexion.Close()

        '****************************
    End Sub


    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click


        If Trim(txtId.Text) = "" Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "insert into utilisateur(
                prenom,
                nom,
                login,
                mdp
                
                ) 
            values (
            N'" & Replace(txtPrenom.Text, "'", "''") & "',
            N'" & Replace(txtNomUser.Text, "'", "''") & "',
            N'" & Replace(txtLogin.Text, "'", "''") & "',
            N'" & Replace(txtMDP.Text, "'", "''") & "'
          )"

            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()

            Response.Redirect("~\liste_admin.aspx")
        Else
            Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update utilisateur set 
              
                prenom = '" & Replace(txtPrenom.Text, "'", "''") & "',
                nom = N'" & Replace(txtNomUser.Text, "'", "''") & "',
                login = N'" & Replace(txtLogin.Text, "'", "''") & "',
                mdp = N'" & Replace(txtMDP.Text, "'", "''") & "'
                Where login = " & txtLogin.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()

            Response.Redirect("~\liste_admin.aspx")
        End If

    End Sub
End Class