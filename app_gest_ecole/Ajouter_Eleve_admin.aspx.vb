Imports System.Data.Odbc

Public Class Ajouter_Eleve_admin
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

        Dim Chemin1 As String = ""

        If Fichier1.HasFile Then
            Chemin1 = Server.MapPath("~/Documents/")
            Fichier1.SaveAs(Chemin1 & Fichier1.FileName)
            Chemin1 = Fichier1.FileName
            txtChemin1.Text = Chemin1
        End If
        Dim VCB As String

        ' Code pour obtenir la valeur de la checkbox (1 pour cochée, 0 pour non cochée)
        If CheckBox1.Checked Then
            VCB = "oui"
        Else
            VCB = "non"
        End If






        Dim VCB2 As String = ""
        If ouiTrans.Checked Then
            VCB2 = "oui"
        Else
            VCB2 = "non"
        End If




        Dim VCB4 As String = ""
        If ouiGard.Checked Then
            VCB4 = "oui"
        Else
            VCB4 = "non"
        End If




        If Trim(txtId.Text) = "" Then
            Dim ConnectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "insert into eleve(
                prenom,
                date_naissance,
                ecole_prec,
                nom_mere,
                Email_mere,
                Adresse_Pere,
                prenom_tuteur,
                num_tel_tuteur,
                nom_medecin,
                Cantine,
                Classe_actuel,
                adresse,
                langue_maison,
                adresse_mere,
                prenom_pere,
                num_tel_pere,
                nom_tuteur,
                email_tuteur,
                num_medecin,
                transport,
                genre,
                garde_legal,
                prenom_mere,
                num_tel_mere,
                nom_pere,
                adresse_tuteur,
                num_tel_alternatif,
                fichier,
                garderie,
                fichier_image,
                nom,
                email_pere,
                num_mere_2,
                num_pere_2,
                nationalite,
                annee_scolaire
                ) 
            values (
            N'" & Replace(txtPrenom.Text, "'", "''") & "',
            cast('" & txtDat.Text & "' as datetime),
            N'" & Replace(txtEcole.Text, "'", "''") & "',
            N'" & Replace(txtNomMere.Text, "'", "''") & "',
            N'" & Replace(TextBox1.Text, "'", "''") & "',
            N'" & Replace(txtAdrPere.Text, "'", "''") & "',
            N'" & Replace(txtPrenomTuteur.Text, "'", "''") & "',
            N'" & Replace(txtNumTuteur.Text, "'", "''") & "',
            N'" & Replace(txtNomMedecin.Text, "'", "''") & "',
            N'" & Replace(VCB, "'", "''") & "',
            " & DropDownList1.SelectedValue & ",    
            N'" & Replace(txtAdresse.Text, "'", "''") & "',
            " & dpLangue.SelectedValue & ",
            N'" & Replace(adrMere.Text, "'", "''") & "',
            N'" & Replace(txtPrenomPere.Text, "'", "''") & "',
            N'" & Replace(txtNumPere.Text, "'", "''") & "',
            N'" & Replace(txtNomTuteur.Text, "'", "''") & "',
            N'" & Replace(txtEmailTuteur.Text, "'", "''") & "',
            N'" & Replace(txtNumTelMedecin.Text, "'", "''") & "',
            N'" & Replace(VCB2, "'", "''") & "',
            " & dpGenre.SelectedValue & ",
            " & dpType.SelectedValue & ",
            N'" & Replace(txtPrenomMere.Text, "'", "''") & "',
            N'" & Replace(txtNumMere.Text, "'", "''") & "',
            N'" & Replace(txtNomPere.Text, "'", "''") & "',
            N'" & Replace(txtAdrTuteur.Text, "'", "''") & "',
            N'" & Replace(txtNumTelAlter.Text, "'", "''") & "',
            N'" & Replace(Chemin, "'", "''") & "',
            N'" & Replace(VCB4, "'", "''") & "',
            N'" & Replace(Chemin1, "'", "''") & "',
            N'" & Replace(txtNom.Text, "'", "''") & "',
            N'" & Replace(txtEmailPere.Text, "'", "''") & "',
            N'" & Replace(txtNumMere2.Text, "'", "''") & "',
            N'" & Replace(txtNumPere2.Text, "'", "''") & "',
            N'" & Replace(txtnationnalite.Text, "'", "''") & "',
            " & dpAn.SelectedValue & "
          )"
            Dim Connexion As OdbcConnection = New OdbcConnection(ConnectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
        End If
        Response.Redirect("~\liste_eleve_admin.aspx")
    End Sub

    Private Sub btnUndo_Click(sender As Object, e As EventArgs) Handles btnUndo.Click
        Response.Redirect("~\liste_eleve_admin.aspx")
    End Sub

    Protected Sub Garderie_CheckedChanged(sender As Object, e As EventArgs)
        If ouiGard.Checked Then
            CheckBox1.Checked = True
        ElseIf nonGard.Checked Then
            CheckBox2.Checked = True
        End If
    End Sub
    Protected Sub Transport_CheckedChanged(sender As Object, e As EventArgs)
        ' Disable the Cantine radio buttons if either Transport option is selected
        DisableCantineButtons(ouiTrans.Checked)
    End Sub

    Private Sub DisableCantineButtons(disable As Boolean)
        ouiGard.Enabled = Not disable
        nonGard.Enabled = Not disable
    End Sub
End Class