Imports System.Data.Odbc

Public Class login
    Inherits System.Web.UI.Page




    Protected Sub btnOK_Click(sender As Object, e As EventArgs) Handles btnOK.Click
        Session.Item("login") = ""
        Session.Item("AS") = 0
        Dim profil As Integer = 0
        Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
        Dim commandtext As String = "select * from utilisateur where login ='" & txtLogin.Text & "'"

        Using Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            Connexion.Open()
            commande.CommandText = commandtext
            Dim lire As IDataReader = commande.ExecuteReader

            While lire.Read()
                If lire("Login") IsNot System.DBNull.Value AndAlso lire("mdp") = Trim(txtPass.Text) Then
                    profil = Convert.ToInt32(lire("profil"))
                    Session.Item("login") = txtLogin.Text
                    Exit While ' Sortir de la boucle une fois que les informations de connexion sont trouvées
                End If
            End While

            lire.Close() ' Fermer le lecteur avant de fermer la connexion

            If Connexion.State = ConnectionState.Open Then
                Connexion.Close()
            End If
        End Using
        Session.Item("AS") = dpAn.SelectedValue
        If profil = 1 Then
            Response.Redirect("~\Accueil_Super_Admin.aspx")
        ElseIf profil = 2 Then
            Response.Redirect("~\Accueil_Admin.aspx")
        ElseIf profil = 3 Then
            Response.Redirect("~\Accueil_Dir_Ped.aspx")
        Else
            Response.Redirect("~\Accueil_Enseignant.aspx")
        End If
    End Sub

End Class