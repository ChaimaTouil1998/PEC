Imports System.Data.Odbc

Public Class Fiche_enseignants
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Trim(Session.Item("Nom")) <> "" Then txtNom.Text = Session.Item("Nom")
            If Session.Item("id_enseignant") IsNot System.DBNull.Value Then
                txtId.Text = Request.QueryString("id_enseignant")
                Alimenter()

            End If
        End If
    End Sub




    Public Sub Alimenter()
        Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
        Dim commandtext As String
        commandtext = "Select * from Enseignants where id_enseignant = " & txtId.Text
        Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
        Dim commande As OdbcCommand = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        Dim nb As Integer = 0
        Dim lire As IDataReader = commande.ExecuteReader

        lire.Dispose()
        Connexion.Close()
        If Trim(txtId.Text) = "" Then Exit Sub
        commandtext = "Select * from Enseignants where id_enseignant = " & txtId.Text
        commande = Connexion.CreateCommand
        commande.CommandText = commandtext
        Connexion.Open()
        lire = commande.ExecuteReader

        While lire.Read()
            dpType.SelectedValue = lire("specialite")
            dpType1.SelectedValue = lire("id_classe")
            txtDat.Text = lire("date_naissance")
            If lire("prenom") IsNot System.DBNull.Value Then txtPrenom.Text = lire("prenom")
            If lire("nom") IsNot System.DBNull.Value Then txtNom.Text = lire("nom")
            If lire("genre") IsNot System.DBNull.Value Then male.Text = lire("genre")
            If lire("genre") IsNot System.DBNull.Value Then femelle.Text = lire("genre")
            If lire("adr") IsNot System.DBNull.Value Then txtAdresse.Text = lire("adr")
            If lire("Num_tel") IsNot System.DBNull.Value Then txtNumTel.Text = lire("Num_tel")
            If lire("email") IsNot System.DBNull.Value Then txtEmail.Text = lire("email")
            If lire("num_cin") IsNot System.DBNull.Value Then txtCIN.Text = lire("num_cin")
            If lire("cursus") IsNot System.DBNull.Value Then txtNiveau.Text = lire("cursus")

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

        Dim VCB As String = ""
        If male.Checked Then
            VCB = "male"
        Else
            VCB = "femelle"
        End If



        If Trim(txtId.Text) = "" Then
            Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
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
                cursus,
                chemin
                ) 
            values (
            N'" & Replace(txtPrenom.Text, "'", "''") & "',
            N'" & Replace(txtNom.Text, "'", "''") & "',
            N'" & Replace(VCB, "'", "''") & "',
            cast('" & txtDat.Text & "' as datetime),
            N'" & Replace(txtAdresse.Text, "'", "''") & "',
            N'" & Replace(txtNumTel.Text, "'", "''") & "',
            N'" & Replace(txtEmail.Text, "'", "''") & "',
            N'" & Replace(txtCIN.Text, "'", "''") & "',
            N'" & dpType.SelectedValue & "',
            N'" & dpType1.SelectedValue & "',
            N'" & Replace(txtNiveau.Text, "'", "''") & "',
            N'" & Replace(Chemin, "'", "''") & "'
          )"

            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            sqlDoc.DataBind()
            grdDoc.DataBind()

            Response.Redirect("~\liste_enseignant_admin.aspx")
        Else
            Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update Enseignants set 
                chemin = N'" & Replace(txtChemin.Text, "'", "''") & "',
                prenom = '" & Replace(txtPrenom.Text, "'", "''") & "',
                nom = N'" & Replace(txtNom.Text, "'", "''") & "',
                date_naissance = cast('" & txtDat.Text & "' as datetime),
                Num_tel= N'" & Replace(txtNumTel.Text, "'", "''") & "',
                email= N'" & Replace(txtEmail.Text, "'", "''") & "',
                adr = N'" & Replace(txtAdresse.Text, "'", "''") & "',
                num_cin = N'" & Replace(txtCIN.Text, "'", "''") & "',
                id_classe = N'" & Replace(dpType1.SelectedValue, "'", "''") & "',
                specialite = N'" & Replace(dpType.SelectedValue, "'", "''") & "',
                cursus = N'" & Replace(txtNiveau.Text, "'", "''") & "'
                Where id_enseignant = " & txtId.Text
            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            grdDoc.DataBind()
            Response.Redirect("~\liste_enseignant_admin.aspx")
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
            commandtext = "update Enseignants set chemin = '' where id_enseignant = " & txtId.Text
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