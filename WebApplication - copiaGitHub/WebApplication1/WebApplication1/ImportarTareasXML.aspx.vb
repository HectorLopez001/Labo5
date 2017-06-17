Imports System.Xml
Imports System.Data.SqlClient

Public Class ImportarTareasXML
    Inherits System.Web.UI.Page

    Dim conClsf As SqlConnection = New SqlConnection("Server=tcp:serverhector.database.windows.net,1433; Initial Catalog=BaseDatos; Persist Security Info=False; User ID=hector@serverhector; Password=kukorules009*")

    Dim dapTareas As New SqlDataAdapter()
    Dim dstTareas As New DataSet
    Dim tblTareas As New DataTable
    Dim rowTareas As DataRow

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LabelUser.Text = Session("UserID")

    End Sub

    Protected Sub LinkButtonCerrarSesion_Click(sender As Object, e As EventArgs) Handles LinkButtonCerrarSesion.Click
        Session.Abandon()
        Response.Redirect("Inicio.aspx")
    End Sub

    Private Sub DropDownList1_DataBound(sender As Object, e As EventArgs) Handles DropDownList1.DataBound
        Dim exists As Boolean
        Dim ruta As String

        ruta = "App_Data/" & DropDownList1.SelectedValue & ".xml"
        exists = System.IO.File.Exists(Server.MapPath(ruta))
        LabelBBDD.Text = ""
        LabelError.Text = ""
        If exists Then
            ButtonImportarXMLD.Enabled = True
            Xml1.DocumentSource = Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")
            Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl")
        Else
            ButtonImportarXMLD.Enabled = False
            LabelError.Text = "El fichero:" & ruta & "no existe"
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Dim exists As Boolean
        Dim ruta As String

        ruta = "App_Data/" & DropDownList1.SelectedValue & ".xml"
        exists = System.IO.File.Exists(Server.MapPath(ruta))
        LabelBBDD.Text = ""
        LabelError.Text = ""
        If exists Then
            ButtonImportarXMLD.Enabled = True
            Xml1.DocumentSource = Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")
            Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl")
        Else
            ButtonImportarXMLD.Enabled = False
            LabelError.Text = "El fichero:" & ruta & "no existe"
        End If

    End Sub

    Protected Sub ButtonImportarXMLD_Click(sender As Object, e As EventArgs) Handles ButtonImportarXMLD.Click
        dapTareas = New SqlDataAdapter("SELECT * FROM TareasGenericas WHERE TareasGenericas.CodAsig='" & DropDownList1.SelectedValue & "'", conClsf)
        Dim bldTareas As New SqlCommandBuilder(dapTareas)

        dstTareas.Clear()
        dapTareas.Fill(dstTareas, "Tareas")
        tblTareas = dstTareas.Tables("Tareas")

        Dim xd As New XmlDocument
        xd.Load(Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml"))

        Dim LasTareasDelXML As XmlNodeList
        LasTareasDelXML = xd.GetElementsByTagName("tarea")

        Dim x As Integer
        Dim y As Integer
        Dim encontrado As Boolean
        Dim row As DataRow

        For x = 0 To LasTareasDelXML.Count - 1
            encontrado = False

            For y = 0 To tblTareas.Rows.Count - 1
                row = tblTareas.Rows(y)

                If StrComp(CStr(row("Codigo")), LasTareasDelXML(x).ChildNodes(0).ChildNodes(0).Value) = 0 Then
                    encontrado = True
                    Exit For
                End If
            Next

            If encontrado = False Then

                rowTareas = tblTareas.NewRow()
                rowTareas("Codigo") = LasTareasDelXML(x).ChildNodes(0).ChildNodes(0).Value
                rowTareas("Descripcion") = LasTareasDelXML(x).ChildNodes(1).ChildNodes(0).Value
                rowTareas("CodAsig") = DropDownList1.SelectedValue
                rowTareas("HEstimadas") = LasTareasDelXML(x).ChildNodes(2).ChildNodes(0).Value
                rowTareas("Explotacion") = LasTareasDelXML(x).ChildNodes(3).ChildNodes(0).Value
                rowTareas("TipoTarea") = LasTareasDelXML(x).ChildNodes(4).ChildNodes(0).Value

                tblTareas.Rows.Add(rowTareas)
            End If
        Next

        dapTareas.Update(dstTareas, "Tareas")
        dstTareas.AcceptChanges()

        Xml1.DocumentSource = Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml")
        Xml1.TransformSource = Server.MapPath("App_Data/XSLTFile.xsl")

        LabelBBDD.Text = "Guardado el XML en la BBDD"

    End Sub

End Class