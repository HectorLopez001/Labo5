Public Class TareasProfesor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        LabelUser.Text = Session("UserID")
    End Sub

    Protected Sub LinkButtonCerrarSesion_Click(sender As Object, e As EventArgs) Handles LinkButtonCerrarSesion.Click
        Session.Abandon()
        Response.Redirect("inicio.aspx")
    End Sub

    Protected Sub ButtonInsertarNuevaTarea_Click(sender As Object, e As EventArgs) Handles ButtonInsertarNuevaTarea.Click
        Session("Asignatura") = DropDownList1.SelectedValue
        Response.Redirect("InsertarTarea.aspx")
    End Sub
End Class