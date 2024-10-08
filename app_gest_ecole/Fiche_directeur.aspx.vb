Imports System.Data.Odbc

Public Class Fiche_directeur
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Trim(Session.Item("Nom")) <> "" Then txtNom.Text = Session.Item("Nom")
            If Session.Item("id_dir") IsNot System.DBNull.Value Then
                txtId.Text = Request.QueryString("id_dir")
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
            commandtext = "insert into directeurs_pedagogiques(
                prenom,
                nom,
                email,
                num_pass,
                chemin
                ) 
            values (
            N'" & Replace(txtPrenom.Text, "'", "''") & "',
            N'" & Replace(txtNom.Text, "'", "''") & "',
            N'" & Replace(txtEmail.Text, "'", "''") & "',
            N'" & Replace(txtNumPass.Text, "'", "''") & "',
            N'" & Replace(Chemin, "'", "''") & "'
          )"

            Dim Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand
            commande.CommandText = commandtext
            Connexion.Open()
            commande.ExecuteNonQuery()
            Connexion.Close()
            grdDoc.DataBind()
            sql.DataBind()
            Response.Redirect("~\liste_dir_admin.aspx")
        Else
            Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
            Dim commandtext As String
            commandtext = "update directeurs_pedagogiques set 
                chemin = N'" & Replace(txtChemin.Text, "'", "''") & "',
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
            grdDoc.DataBind()
            sql.DataBind()
            Response.Redirect("~\liste_dir_admin.aspx")
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
            commandtext = "update directeurs_pedagogiques set chemin = '' where id_dir = " & txtId.Text
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
        Response.Redirect("~\liste_dir_ped.aspx")
    End Sub
End Class