Imports System.Data.Odbc

Public Class Profil_dir
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Trim(Session.Item("Nom")) <> "" Then txtNom.Text = Session.Item("Nom")
            If Session.Item("id_user") IsNot System.DBNull.Value Then
                txtId.Text = Request.QueryString("id_user")
                Alimenter()

            End If
        End If
    End Sub

    Public Sub Alimenter()
        Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
        Dim commandtext As String
        commandtext = "Select * from directeurs_pedagogiques where id_dir = " & txtId.Text
        Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
        Dim commande As OdbcCommand = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        Dim nb As Integer = 0
        Dim lire As IDataReader = commande.ExecuteReader

        lire.Dispose()
        Connexion.Close()


        If Trim(txtId.Text) = "" Then Exit Sub
        commandtext = "Select * from directeurs_pedagogiques where id_dir = " & txtId.Text
        commande = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        lire = commande.ExecuteReader

        While lire.Read()

            If lire("prenom") IsNot System.DBNull.Value Then txtPrenom.Text = lire("prenom")
            If lire("nom") IsNot System.DBNull.Value Then txtNom.Text = lire("nom")

            If lire("email") IsNot System.DBNull.Value Then txtEmail.Text = lire("email")
            If lire("num_pass") IsNot System.DBNull.Value Then txtNumPass.Text = lire("num_pass")

        End While

        lire.Dispose()



        Dim nb1 As Integer = 0
        Dim lire1 As IDataReader = commande.ExecuteReader

        lire1.Dispose()
        Connexion.Close()
        If Trim(txtId.Text) = "" Then Exit Sub
        commandtext = "Select * from utilisateur where id_user = " & txtId.Text
        commande = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        lire1 = commande.ExecuteReader

        While lire1.Read()

            If lire1("login") IsNot System.DBNull.Value Then txtPrenom.Text = lire1("login")
            If lire1("mdp") IsNot System.DBNull.Value Then txtPass.Text = lire1("mdp")



        End While

        lire.Dispose()
        Connexion.Close()

        '****************************
    End Sub


    Private Sub btnSave1_Click(sender As Object, e As EventArgs) Handles btnOK1.Click





        If Trim(txtId.Text) = "" Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "insert into utilisateur(
                prenom,
                nom,
                email,
                num_pass
                
                ) 
            values (
            N'" & Replace(txtPrenom.Text, "'", "''") & "',
            N'" & Replace(txtNom.Text, "'", "''") & "',
            N'" & Replace(txtEmail.Text, "'", "''") & "',
            N'" & Replace(txtNumPass.Text, "'", "''") & "'
          )"

            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()

            Response.Redirect("~\login.aspx")
        Else
            Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update directeurs_pedagogiques set 
                prenom = '" & Replace(txtPrenom.Text, "'", "''") & "',
                nom = N'" & Replace(txtNom.Text, "'", "''") & "',
                
                email= N'" & Replace(txtEmail.Text, "'", "''") & "',
                num_pass = N'" & Replace(txtNumPass.Text, "'", "''") & "'
                
                Where id_dir = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()

            Response.Redirect("~\login.aspx")
        End If

    End Sub





    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnOK.Click





        If Trim(txtId.Text) = "" Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "insert into utilisateur(
                login,
                mdp
                
                ) 
            values (
            N'" & Replace(txtLogin.Text, "'", "''") & "',
            N'" & Replace(txtPass.Text, "'", "''") & "'
          )"

            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()

            Response.Redirect("~\login.aspx")
        Else
            Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update utilisateur set 
                login = '" & Replace(txtLogin.Text, "'", "''") & "',
                mdp = N'" & Replace(txtPass.Text, "'", "''") & "'
                
                
                
                Where id_user = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()

            Response.Redirect("~\login.aspx")
        End If

    End Sub
End Class