Imports System.Data.Odbc

Public Class Fiche_eleve
    Inherits System.Web.UI.Page
    ' Déclaration de la variable Connexion
    Dim Connexion As OdbcConnection

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' Initialisation de la variable Connexion avec votre chaîne de connexion
        Connexion = New OdbcConnection(ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString)
        If Page.IsPostBack = False Then
            If Trim(Session.Item("Nom")) <> "" Then txtNom.Text = Session.Item("Nom")
            If Session.Item("id_eleve") IsNot System.DBNull.Value Then
                txtId.Text = Session.Item("id_eleve")
                Alimenter()

            End If
        End If
    End Sub





    Public Sub Alimenter()

        Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
        Dim commandtext As String
        commandtext = "Select * from eleve where id_eleve = " & txtId.Text
        Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
        Dim commande As OdbcCommand = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        Dim nb As Integer = 0
        Dim lire As IDataReader = commande.ExecuteReader

        lire.Dispose()
        Connexion.Close()
        commandtext = "Select * from eleve where id_eleve = " & txtId.Text
        commande = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        lire = commande.ExecuteReader
        While lire.Read()
            DropDownList1.SelectedValue = lire("Classe_actuel")
            dpLangue.SelectedValue = lire("langue_maison")
            dpGenre.SelectedValue = lire("genre")
            dpType.SelectedValue = lire("garde_legal")
            txtDat.Text = lire("date_naissance")
            If lire("prenom") IsNot System.DBNull.Value Then txtPrenom.Text = lire("prenom")
            If lire("nom") IsNot System.DBNull.Value Then txtNom.Text = lire("nom")
            If lire("ecole_prec") IsNot System.DBNull.Value Then txtEcole.Text = lire("ecole_prec")
            If lire("nom_mere") IsNot System.DBNull.Value Then txtNomMere.Text = lire("nom_mere")
            If lire("Email_mere") IsNot System.DBNull.Value Then TextBox1.Text = lire("Email_mere")
            If lire("Adresse_Pere") IsNot System.DBNull.Value Then txtAdrPere.Text = lire("Adresse_Pere")
            If lire("prenom_tuteur") IsNot System.DBNull.Value Then txtPrenomPere.Text = lire("prenom_tuteur")
            If lire("num_tel_tuteur") IsNot System.DBNull.Value Then txtNumTuteur.Text = lire("num_tel_tuteur")
            If lire("nom_medecin") IsNot System.DBNull.Value Then txtNomMedecin.Text = lire("nom_medecin")
            Dim cantineValue As String = lire("cantine").ToString()
            If cantineValue = "oui" Then
                CheckBox1.Checked = True
            ElseIf cantineValue = "non" Then
                CheckBox2.Checked = True
            End If
            If lire("adresse") IsNot System.DBNull.Value Then txtAdresse.Text = lire("adresse")
            If lire("adresse_mere") IsNot System.DBNull.Value Then adrMere.Text = lire("adresse_mere")
            If lire("prenom_pere") IsNot System.DBNull.Value Then txtPrenomPere.Text = lire("prenom_pere")
            If lire("num_tel_pere") IsNot System.DBNull.Value Then txtNumPere.Text = lire("num_tel_pere")
            If lire("nom_tuteur") IsNot System.DBNull.Value Then txtNomTuteur.Text = lire("nom_tuteur")
            If lire("email_tuteur") IsNot System.DBNull.Value Then txtEmailTuteur.Text = lire("email_tuteur")
            If lire("num_medecin") IsNot System.DBNull.Value Then txtNumTelMedecin.Text = lire("num_medecin")

            Dim transportValue As String = lire("transport").ToString()
            If transportValue = "oui" Then
                ouiTrans.Checked = True
            ElseIf transportValue = "non" Then
                nonTrans.Checked = True
            End If
            If lire("prenom_mere") IsNot System.DBNull.Value Then txtPrenomMere.Text = lire("prenom_mere")
            If lire("num_tel_mere") IsNot System.DBNull.Value Then txtNumMere.Text = lire("num_tel_mere")
            If lire("nom_pere") IsNot System.DBNull.Value Then txtNomPere.Text = lire("nom_pere")
            If lire("adresse_tuteur") IsNot System.DBNull.Value Then txtAdrTuteur.Text = lire("adresse_tuteur")
            If lire("num_mere_2") IsNot System.DBNull.Value Then txtNumMere2.Text = lire("num_mere_2")
            If lire("num_pere_2") IsNot System.DBNull.Value Then txtNumPere2.Text = lire("num_pere_2")
            If lire("nationalite") IsNot System.DBNull.Value Then txtnationnalite.Text = lire("nationalite")

            Dim garderieValue As String = lire("garderie").ToString()
            If garderieValue = "oui" Then
                ouiGard.Checked = True
            ElseIf garderieValue = "non" Then
                nonGard.Checked = True

            End If


        End While

        lire.Dispose()
        Connexion.Close()



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



        ' Code pour obtenir la valeur de la checkbox (1 pour cochée, 0 pour non cochée)
        Dim VCB As String = ""

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
            Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
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

            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            grdDoc.DataBind()
            grd.DataBind()
            sqlDoc.DataBind()
            sql.DataBind()
            Response.Redirect("~\liste_eleve_admin.aspx")
        Else

            Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update eleve set 
                cantine = N'" & Replace(VCB, "'", "''") & "',
                transport = N'" & Replace(VCB2, "'", "''") & "',
                garderie =  N'" & Replace(VCB4, "'", "''") & "',
                prenom = '" & Replace(txtPrenom.Text, "'", "''") & "',
                langue_maison = N'" & Replace(dpLangue.SelectedValue, "'", "''") & "',
                genre = N'" & Replace(dpGenre.SelectedValue, "'", "''") & "',
                nom = N'" & Replace(txtNom.Text, "'", "''") & "',
                date_naissance = cast('" & txtDat.Text & "' as datetime),
                ecole_prec = N'" & Replace(txtEcole.Text, "'", "''") & "',
                nom_mere = N'" & Replace(txtNomMere.Text, "'", "''") & "',
                garde_legal = N'" & Replace(dpType.SelectedValue, "'", "''") & "',
                Email_mere = N'" & Replace(TextBox1.Text, "'", "''") & "',
                Adresse_Pere = N'" & Replace(txtAdrPere.Text, "'", "''") & "',
                prenom_tuteur = N'" & Replace(txtPrenomTuteur.Text, "'", "''") & "',
                num_tel_tuteur = N'" & Replace(txtNumTuteur.Text, "'", "''") & "',
                nom_medecin = N'" & Replace(txtNomMedecin.Text, "'", "''") & "',
                adresse = N'" & Replace(txtAdresse.Text, "'", "''") & "',
                adresse_mere = N'" & Replace(adrMere.Text, "'", "''") & "',
                prenom_pere = N'" & Replace(txtPrenomPere.Text, "'", "''") & "',
                num_tel_pere = N'" & Replace(txtNumPere.Text, "'", "''") & "',
                nom_tuteur = N'" & Replace(txtNomTuteur.Text, "'", "''") & "',
                email_tuteur = N'" & Replace(txtEmailTuteur.Text, "'", "''") & "',
                num_medecin = N'" & Replace(txtNumTelMedecin.Text, "'", "''") & "',
                prenom_mere = N'" & Replace(txtPrenomMere.Text, "'", "''") & "',
                num_tel_mere = N'" & Replace(txtNumMere.Text, "'", "''") & "',
                nom_pere = N'" & Replace(txtNomPere.Text, "'", "''") & "',
                adresse_tuteur = N'" & Replace(txtAdrTuteur.Text, "'", "''") & "',
                num_tel_alternatif = N'" & Replace(txtNumTelAlter.Text, "'", "''") & "',
                num_mere_2 = N'" & Replace(txtNumMere2.Text, "'", "''") & "',
                num_pere_2 = N'" & Replace(txtNumPere2.Text, "'", "''") & "',
                Classe_actuel = N'" & Replace(DropDownList1.SelectedValue, "'", "''") & "',
                nationalite =  N'" & Replace(txtnationnalite.Text, "'", "''") & "',
                annee_scolaire = N'" & Replace(dpAn.SelectedValue, "'", "''") & "'
                Where id_eleve = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            grd.DataBind()
            grdDoc.DataBind()
            sqlDoc.DataBind()
            sql.DataBind()
            Response.Redirect("~\liste_eleve_admin.aspx")
        End If

    End Sub




    Private Sub grd_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grd.RowCommand
        If (e.CommandName = "OpenLg") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            'Dim k As String
            'k = ""
            'k = grdListe.DataKeys(index).Value.ToString
            Response.Redirect(Trim("~/Documents/" & grd.DataKeys(index).Values("fichier_image").ToString))

        End If
        If (e.CommandName = "SuppLg") Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update eleve set fichier_image = '' where id_eleve = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            grd.DataBind()

        End If
    End Sub



    Private Sub grdDoc_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdDoc.RowCommand
        If (e.CommandName = "OpenLg") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            'Dim k As String
            'k = ""
            'k = grdListe.DataKeys(index).Value.ToString
            Response.Redirect(Trim("~/Documents/" & grdDoc.DataKeys(index).Values("fichier").ToString))

        End If
        If (e.CommandName = "SuppLg") Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update eleve set fichier = '' where id_eleve = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            grdDoc.DataBind()

        End If
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