Imports System.Data.Odbc

Public Class Fiche_eleve_dir
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Trim(Session.Item("Nom")) <> "" Then txtNom.Text = Session.Item("Nom")
            If Session.Item("id_eleve") IsNot System.DBNull.Value Then
                txtId.Text = Request.QueryString("id_eleve")
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
        If Trim(txtId.Text) = "" Then Exit Sub
        commandtext = "Select * from eleve where id_eleve = " & txtId.Text
        commande = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        lire = commande.ExecuteReader
        While lire.Read()
            DropDownList1.SelectedValue = lire("Classe_actuel")
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
            If lire("Cantine") IsNot System.DBNull.Value Then CheckBox1.Text = lire("Cantine")
            If lire("Cantine") IsNot System.DBNull.Value Then CheckBox2.Text = lire("Cantine")
            If lire("adresse") IsNot System.DBNull.Value Then txtAdresse.Text = lire("adresse")
            If lire("langue_maison") IsNot System.DBNull.Value Then anglais.Text = lire("langue_maison")
            If lire("langue_maison") IsNot System.DBNull.Value Then francais.Text = lire("langue_maison")
            If lire("langue_maison") IsNot System.DBNull.Value Then arabe.Text = lire("langue_maison")
            If lire("langue_maison") IsNot System.DBNull.Value Then autre.Text = lire("langue_maison")
            If lire("adresse_mere") IsNot System.DBNull.Value Then adrMere.Text = lire("adresse_mere")
            If lire("prenom_pere") IsNot System.DBNull.Value Then txtPrenomPere.Text = lire("prenom_pere")
            If lire("num_tel_pere") IsNot System.DBNull.Value Then txtNumPere.Text = lire("num_tel_pere")
            If lire("nom_tuteur") IsNot System.DBNull.Value Then txtNomTuteur.Text = lire("nom_tuteur")
            If lire("email_tuteur") IsNot System.DBNull.Value Then txtEmailTuteur.Text = lire("email_tuteur")
            If lire("num_medecin") IsNot System.DBNull.Value Then txtNumTelMedecin.Text = lire("num_medecin")
            If lire("transport") IsNot System.DBNull.Value Then ouiTrans.Text = lire("transport")
            If lire("transport") IsNot System.DBNull.Value Then nonTrans.Text = lire("transport")
            If lire("genre") IsNot System.DBNull.Value Then male.Text = lire("genre")
            If lire("genre") IsNot System.DBNull.Value Then femelle.Text = lire("genre")
            If lire("prenom_mere") IsNot System.DBNull.Value Then txtPrenomMere.Text = lire("prenom_mere")
            If lire("num_tel_mere") IsNot System.DBNull.Value Then txtNumMere.Text = lire("num_tel_mere")
            If lire("nom_pere") IsNot System.DBNull.Value Then txtNomPere.Text = lire("nom_pere")
            If lire("adresse_tuteur") IsNot System.DBNull.Value Then txtAdrTuteur.Text = lire("adresse_tuteur")
            If lire("num_tel_alternatif") IsNot System.DBNull.Value Then txtNumTelAlter.Text = lire("num_tel_alternatif")
            If lire("garderie") IsNot System.DBNull.Value Then ouiGard.Text = lire("garderie")
            If lire("garderie") IsNot System.DBNull.Value Then nonGard.Text = lire("garderie")

        End While

        lire.Dispose()
        Connexion.Close()

        '****************************
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
        Response.Redirect("~\liste_enseignant_dir.aspx")
    End Sub

End Class