Imports System.Data.Odbc

Public Class Ajouter_Eleve
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



        Dim VCB1 As String = ""
        If arabe.Checked Then
            VCB1 = "arabe"
        ElseIf francais.Checked Then
            VCB1 = "français"
        ElseIf anglais.Checked Then
            VCB1 = "anglais"
        Else
            VCB1 = "autre"
        End If



        Dim VCB2 As String = ""
        If ouiTrans.Checked Then
            VCB2 = "oui"
        Else
            VCB2 = "non"
        End If

        Dim VCB3 As String = ""
        If male.Checked Then
            VCB3 = "male"
        Else
            VCB3 = "femelle"
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
                nom,
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
                fichier_image) 
            values (
            N'" & Replace(txtPrenom.Text, "'", "''") & "',
            N'" & Replace(txtNom.Text, "'", "''") & "',
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
           N'" & Replace(VCB1, "'", "''") & "',
            N'" & Replace(adrMere.Text, "'", "''") & "',
            N'" & Replace(txtPrenomPere.Text, "'", "''") & "',
            N'" & Replace(txtNumPere.Text, "'", "''") & "',
            N'" & Replace(txtNomTuteur.Text, "'", "''") & "',
            N'" & Replace(txtEmailTuteur.Text, "'", "''") & "',
            N'" & Replace(txtNumTelMedecin.Text, "'", "''") & "',
             N'" & Replace(VCB2, "'", "''") & "',
            N'" & Replace(VCB3, "'", "''") & "',
                      
            " & dpType.SelectedValue & ",
            N'" & Replace(txtPrenomMere.Text, "'", "''") & "',
            N'" & Replace(txtNumMere.Text, "'", "''") & "',
            N'" & Replace(txtNomPere.Text, "'", "''") & "',
            N'" & Replace(txtAdrTuteur.Text, "'", "''") & "',
            N'" & Replace(txtNumTelAlter.Text, "'", "''") & "',
            N'" & Replace(Chemin, "'", "''") & "',
            N'" & Replace(VCB4, "'", "''") & "',
            N'" & Replace(Chemin1, "'", "''") & "'
          )"
            Dim Connexion As OdbcConnection = New OdbcConnection(ConnectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
        End If
        Response.Redirect("~\liste_eleve.aspx")
    End Sub



End Class