Imports System.Data.Odbc
Imports System.Net
Imports System.Net.Mail

Public Class fichehisBulletinDir
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

        Using Connexion As OdbcConnection = New OdbcConnection(connectionString)
            Dim commande As OdbcCommand = Connexion.CreateCommand()

            commande.CommandText = commandtext

            Connexion.Open()

            Dim lire As IDataReader = commande.ExecuteReader()
            While lire.Read()
                DropDownList1.SelectedValue = lire("Classe_actuel")
                txtDat.Text = lire("date_naissance")
                If lire("prenom") IsNot System.DBNull.Value Then txtPrenom.Text = lire("prenom")
                If lire("nom") IsNot System.DBNull.Value Then txtNom.Text = lire("nom")
            End While
            lire.Close() ' Fermer le premier lecteur de données


        End Using
        Sql.SelectCommand = "SELECT id_bul,eleve.id_eleve,eleve,bulletinTrim1,bulletinTrim2,bulletinTrim3 FROM bulletin,  eleve Where bulletin.eleve = eleve.id_eleve and eleve.id_eleve = " & txtId.Text
        Sql.DataBind()
        grdListe.DataBind()
    End Sub
    Private Sub grdDoc_RowCommand(sender As Object, e As GridViewCommandEventArgs) Handles grdListe.RowCommand
        If (e.CommandName = "Open1") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            'Dim k As String
            'k = ""
            'k = grdListe.DataKeys(index).Value.ToString
            Response.Redirect(Trim("~/Documents/" & grdListe.DataKeys(index).Values("bulletinTrim1").ToString))

        End If
        If (e.CommandName = "Open2") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            'Dim k As String
            'k = ""
            'k = grdListe.DataKeys(index).Value.ToString
            Response.Redirect(Trim("~/Documents/" & grdListe.DataKeys(index).Values("bulletinTrim2").ToString))

        End If
        If (e.CommandName = "Open3") Then
            Dim index As Integer = Convert.ToInt32(e.CommandArgument)
            'Dim k As String
            'k = ""
            'k = grdListe.DataKeys(index).Value.ToString

            Response.Redirect(Trim("~/Documents/" & grdListe.DataKeys(index).Values("bulletinTrim3").ToString))

        End If

    End Sub
    Private Sub btnUndo_Click(sender As Object, e As EventArgs) Handles btnUndo.Click
        Response.Redirect("~\histbulletinDir.aspx")
    End Sub
    Private Sub btnEmail_Click(sender As Object, e As EventArgs) Handles btnEmail.Click
        Envoyer_Mail()
        Exit Sub
        Response.Redirect("~\histbulletinDir.aspx")

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