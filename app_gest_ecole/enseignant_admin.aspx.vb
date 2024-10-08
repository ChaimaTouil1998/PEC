Imports System.Data.Odbc

Public Class enseignant_admin
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub



    Private Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click
        Dim Chemin As String = ""



        If Fichier.HasFile Then
            Chemin = Server.MapPath("~/Documents/")
            Fichier.SaveAs(Chemin & Fichier.FileName)
            Chemin = Fichier.FileName
            txtChemin.Text = Chemin
        End If

        Dim VCB As String

        ' Code pour obtenir la valeur de la checkbox (1 pour cochée, 0 pour non cochée)
        If male.Checked Then
            VCB = "male"
        Else
            VCB = "femelle"
        End If




        If Trim(txtId.Text) = "" Then
            Dim ConnectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "insert into Enseignants(
                prenom,
                nom,
                genre,
                date_naissance,
                adr,
                Num_tel,
                email,
                num_cin,
                specialite,
                id_classe,
                annee_scolaire,
                cursus,
                chemin)
            values (
            N'" & Replace(txtPrenom.Text, "'", "''") & "',
            N'" & Replace(txtNom.Text, "'", "''") & "',                      
            N'" & Replace(VCB, "'", "''") & "',
            cast('" & txtDat.Text & "' as datetime),
            N'" & Replace(txtAdresse.Text, "'", "''") & "',
            N'" & Replace(txtNumTel.Text, "'", "''") & "',
            N'" & Replace(txtEmail.Text, "'", "''") & "',
            N'" & Replace(txtCIN.Text, "'", "''") & "',
            " & dpType.SelectedValue & ",
            " & dpType1.SelectedValue & ",
            " & dpAn.SelectedValue & ",
            N'" & Replace(dpNiveau.Text, "'", "''") & "',
            N'" & Replace(Chemin, "'", "''") & "'
          )"
            Dim Connexion As OdbcConnection = New OdbcConnection(ConnectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
        End If
        Response.Redirect("~\liste_enseignant_admin.aspx")
    End Sub

    Private Sub btnUndo_Click(sender As Object, e As EventArgs) Handles btnUndo.Click
        Response.Redirect("~\liste_enseignant_admin.aspx")
    End Sub
End Class