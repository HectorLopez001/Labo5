Imports ClassL.accesodatosSQL
Public Class confirmacion
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim email As String
        Dim NumConf As String
        Dim resul As String

        conectar()

        email = Request.QueryString("mbr")
        NumConf = Request.QueryString("numconf")

        resul = setConfirmacion(email, NumConf)
        If resul = 1 Then
            Label2.Text = "ACTIVACION CORRECTA"
        Else
            Label2.Text = "ERROR AL ACTIVAR"
        End If

        cerrarconexion()
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles inicio.Click
        Response.Redirect("inicio.aspx")
    End Sub
End Class