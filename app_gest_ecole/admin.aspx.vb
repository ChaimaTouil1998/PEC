Imports System.Data.Odbc

Public Class admin
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then

        End If
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
            Dim ConnectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "insert into utilisateur(
                prenom,
                nom,
                login,
                mdp,
                profil,
                chemin)
            values (
            N'" & Replace(txtPrenom.Text, "'", "''") & "',
            N'" & Replace(txtNom.Text, "'", "''") & "',
            N'" & Replace(txtLogin.Text, "'", "''") & "',
            N'" & Replace(txtMDP.Text, "'", "''") & "',
                        " & DropDownList1.SelectedValue & ",
            N'" & Replace(Chemin, "'", "''") & "'
          )"
            Dim Connexion As OdbcConnection = New OdbcConnection(ConnectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
        End If
        Response.Redirect("~\liste_admin.aspx")
    End Sub


End Class