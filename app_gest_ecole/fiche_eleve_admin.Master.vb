Public Class fiche_eleve1
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        ' Vérifier si la session id_eleve est initialisée et contient une valeur
        If Session("id_eleve") IsNot Nothing AndAlso Not String.IsNullOrEmpty(Session("id_eleve").ToString()) Then
            ' Si la session id_eleve est valide, définir le lien avec l'ID de l'élève
            linkAjouterEcart.HRef = "Fiche_Ecart_dis_admin.aspx?id_eleve=" & Session("id_eleve").ToString()
        Else
            ' Si la session id_eleve n'est pas valide, désactiver ou masquer le lien
            linkAjouterEcart.Visible = True ' ou linkAjouterEcart.Disabled = True selon votre besoin
        End If

        '********************************************

        ' Vérifier si la session id_eleve est initialisée et contient une valeur
        If Session("id_eleve") IsNot Nothing AndAlso Not String.IsNullOrEmpty(Session("id_eleve").ToString()) Then
            ' Si la session id_eleve est valide, définir le lien avec l'ID de l'élève
            linkAjouterAbs.HRef = "Fiche_Absence_admin.aspx?id_eleve=" & Session("id_eleve").ToString()
        Else
            ' Si la session id_eleve n'est pas valide, désactiver ou masquer le lien
            linkAjouterAbs.Visible = True ' ou linkAjouterEcart.Disabled = True selon votre besoin
        End If

        '********************************************

        ' Vérifier si la session id_eleve est initialisée et contient une valeur
        If Session("id_eleve") IsNot Nothing AndAlso Not String.IsNullOrEmpty(Session("id_eleve").ToString()) Then
            ' Si la session id_eleve est valide, définir le lien avec l'ID de l'élève
            linkAjouterBulletin.HRef = "Fiche_Bulltin.aspx?id_eleve=" & Session("id_eleve").ToString()
        Else
            ' Si la session id_eleve n'est pas valide, désactiver ou masquer le lien
            linkAjouterBulletin.Visible = True ' ou linkAjouterEcart.Disabled = True selon votre besoin
        End If
        '********************************************






        ' Vérifier si la session id_eleve est initialisée et contient une valeur
        If Session("id_eleve") IsNot Nothing AndAlso Not String.IsNullOrEmpty(Session("id_eleve").ToString()) Then
            ' Si la session id_eleve est valide, définir le lien avec l'ID de l'élève
            linkAjouterIncident.HRef = "Fiche_Incident.aspx?id_eleve=" & Session("id_eleve").ToString()
        Else
            ' Si la session id_eleve n'est pas valide, désactiver ou masquer le lien
            linkAjouterIncident.Visible = True ' ou linkAjouterEcart.Disabled = True selon votre besoin
        End If
    End Sub




    '**************************************


End Class