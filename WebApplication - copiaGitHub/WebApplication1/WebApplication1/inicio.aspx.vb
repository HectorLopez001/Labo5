Imports ClassL.accesodatosSQL
Public Class incio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim result As String
        result = conectar()

    End Sub


    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        cerrarconexion()

    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Dim result As String
        Dim resultado As String
        result = comprobarUsuario(usuario.Text, pass.Text)
        resultado = tipoUsuario(usuario.Text)

            If result And resultado = "P" Then
            Session("UserID") = usuario.Text()
            Response.Redirect("Profesor.aspx")
        ElseIf result And resultado = "A" Then
            Session("UserID") = usuario.Text
            Response.Redirect("Alumno.aspx")
            Else
            Response.Write("<script>alert('Error... Correo y/o contraseña no validos')</script>")
            End If
    End Sub

End Class