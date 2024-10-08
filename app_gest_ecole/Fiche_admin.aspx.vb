Imports System.Data.Odbc

Public Class Fiche_admin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Trim(Session.Item("Nom")) <> "" Then txtNom.Text = Session.Item("Nom")
            If Session.Item("id_admin") IsNot System.DBNull.Value Then
                txtId.Text = Request.QueryString("id_admin")
                Alimenter()

            End If
        End If
    End Sub


    Public Sub Alimenter()
        Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
        Dim commandtext As String
        commandtext = "Select * from utilisateur where id_user = " & txtId.Text
        Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
        Dim commande As OdbcCommand = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        Dim nb As Integer = 0
        Dim lire As IDataReader = commande.ExecuteReader

        lire.Dispose()
        Connexion.Close()
        If Trim(txtId.Text) = "" Then Exit Sub
        commandtext = "Select * from utilisateur where id_user = " & txtId.Text
        commande = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        lire = commande.ExecuteReader

        While lire.Read()

            If lire("prenom") IsNot System.DBNull.Value Then txtPrenom.Text = lire("prenom")
            If lire("nom") IsNot System.DBNull.Value Then txtNom.Text = lire("nom")
            If lire("login") IsNot System.DBNull.Value Then txtLogin.Text = lire("login")
            If lire("mdp") IsNot System.DBNull.Value Then txtMDP.Text = lire("mdp")


        End While

        lire.Dispose()
        Connexion.Close()

        '****************************
    End Sub


    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim Chemin As String = ""


        If Fichier.HasFile Then
            Chemin = Server.MapPath("~/Documents/")
            Fichier.SaveAs(Chemin & Fichier.FileName)
            Chemin = Fichier.FileName
            txtChemin.Text = Chemin
        End If

        If Trim(txtId.Text) = "" Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "insert into utilisateur(
                prenom,
                nom,
                login,
                mdp,
                chemin
                ) 
            values (
            N'" & Replace(txtPrenom.Text, "'", "''") & "',
            N'" & Replace(txtNom.Text, "'", "''") & "',
            N'" & Replace(txtLogin.Text, "'", "''") & "',
            N'" & Replace(txtMDP.Text, "'", "''") & "',
            N'" & Replace(Chemin, "'", "''") & "'
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
                chemin = N'" & Replace(txtChemin.Text, "'", "''") & "',
                prenom = '" & Replace(txtPrenom.Text, "'", "''") & "',
                nom = N'" & Replace(txtNom.Text, "'", "''") & "',
                
                login= N'" & Replace(txtLogin.Text, "'", "''") & "',
                mdp = N'" & Replace(txtMDP.Text, "'", "''") & "'
                
                Where id_user = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()

            Response.Redirect("~\liste_admin.aspx")
        End If

    End Sub

    Private Sub grdDoc_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdDoc.RowCommand
        If (e.CommandName = "OpenLg") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            'Dim k As String
            'k = ""
            'k = grdListe.DataKeys(index).Value.ToString
            Response.Redirect(Trim("~/Documents/" & grdDoc.DataKeys(index).Values("chemin").ToString))

        End If
        If (e.CommandName = "SuppLg") Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update utilisateur set chemin = '' where id_user = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            grdDoc.DataBind()

        End If
    End Sub
End Class