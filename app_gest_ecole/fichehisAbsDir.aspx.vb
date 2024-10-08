Imports System.Data.Odbc

Public Class fichehisAbsDir
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
        Dim commandtext1 As String
        commandtext = "Select * from eleve where id_eleve = " & txtId.Text
        commandtext1 = "Select duree from absence where id_eleve = " & txtId.Text

        Using Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand()
            Dim commande1 As OdbcCommand = Connexion.CreateCommand()

            commande.CommandText = commandtext
            commande1.CommandText = commandtext1

            Connexion.Open()

            Dim lire As IDataReader = commande.ExecuteReader()
            If lire.Read() Then
                DropDownList1.SelectedValue = lire("Classe_actuel")
                txtDat.Text = lire("date_naissance")
                If lire("prenom") IsNot System.DBNull.Value Then txtPrenom.Text = lire("prenom")
                If lire("nom") IsNot System.DBNull.Value Then txtNom.Text = lire("nom")
            End If
            lire.Close() ' Fermer le premier lecteur de données

            Dim lire1 As IDataReader = commande1.ExecuteReader()
            If lire1.Read() Then
                If lire1("duree") IsNot System.DBNull.Value Then abs.Text = lire1("duree")
                If lire1("date_ab") IsNot System.DBNull.Value Then txtDatAbs.Text = lire1("date_ab")
            End If
            lire1.Close() ' Fermer le deuxième lecteur de données
        End Using
    End Sub

    Private Sub btnUndo_Click(sender As Object, e As EventArgs) Handles btnUndo.Click
        Response.Redirect("~\histAbsDir.aspx")
    End Sub
End Class