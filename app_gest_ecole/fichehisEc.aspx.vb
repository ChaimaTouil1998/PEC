Imports System.Data.Odbc
Imports System.Net
Imports System.Net.Mail
Public Class fichehisEc
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack = False Then
            If Trim(Session.Item("Nom")) <> "" Then txtNom.Text = Session.Item("Nom")
            If Session.Item("id_eleve") IsNot System.DBNull.Value Then
                txtId.Text = Request.QueryString("id_ecart")
                Alimenter()

            End If
        End If
    End Sub
    Public Sub Alimenter()
        Dim connectionString = ConfigurationManager.ConnectionStrings("EcoleConnectionString").ConnectionString
        Dim commandtext As String
        commandtext = "Select ecart_disciplinaire.*, eleve.classe_actuel, date_naissance, prenom, nom  from ecart_disciplinaire, eleve where ecart_disciplinaire.id_eleve = eleve.id_eleve and  id_ecart = " & txtId.Text

        Using Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand()
            commande.CommandText = commandtext
            Connexion.Open()
            Dim lire As IDataReader = commande.ExecuteReader()
            If lire.Read() Then
                DropDownList1.SelectedValue = lire("Classe_actuel")
                txtDat.Text = lire("date_naissance")
                If lire("prenom") IsNot System.DBNull.Value Then txtPrenom.Text = lire("prenom")
                If lire("nom") IsNot System.DBNull.Value Then txtNom.Text = lire("nom")
                If lire("sanction") IsNot System.DBNull.Value Then sanction.Text = lire("sanction")
                If lire("description") IsNot System.DBNull.Value Then desc.Text = lire("description")
            End If
            lire.Close() ' Fermer le premier lecteur de données


        End Using
    End Sub
    Private Sub btnUndo_Click(sender As Object, e As EventArgs) Handles btnUndo.Click
        Response.Redirect("~\lstED.aspx")
    End Sub

    Private Sub btnEmail_Click(sender As Object, e As EventArgs) Handles btnEmail.Click
        Envoyer_Mail()
        Exit Sub
    End Sub

    Public Sub Envoyer_Mail()
        Dim smptpAdress As String = "smtp.office365.com"
        Dim portNumber As Integer = 587
        Dim EnableSSL As Boolean = True
        Dim EmailFrom As String = "ecole-canadienne-gg@hotmail.com"
        Dim Password As String = "MS@MS2024"
        Dim SUbjet As String = "Test envoi"
        Dim EmailTo As String = "binouswafa@yahoo.fr"
        Dim Body As String = "Test mailing"
        Dim Mail As New MailMessage
        Mail.From = New MailAddress(EmailFrom)
        Mail.To.Add(EmailTo)
        Mail.Subject = SUbjet
        Mail.Body = Body
        Mail.IsBodyHtml = True
        Dim SMTP As New SmtpClient
        SMTP.UseDefaultCredentials = False
        SMTP.Credentials = New NetworkCredential("ecole-canadienne-gg@hotmail.com", "MS@MS2024")
        SMTP.Port = 587
        SMTP.Host = "smtp.office365.com"
        SMTP.DeliveryMethod = SmtpDeliveryMethod.Network
        SMTP.EnableSsl = True
        SMTP.Send(Mail)
    End Sub
End Class