Imports System.Xml
Imports System.Data.SqlClient

Public Class ExportarTareas
    Inherits System.Web.UI.Page

    Dim conClsf As SqlConnection = New SqlConnection("Server=tcp:serverhector.database.windows.net,1433; Initial Catalog=BaseDatos; Persist Security Info=False; User ID=hector@serverhector; Password=kukorules009*")

    Dim dapAsignaturas As New SqlDataAdapter()
    Dim dstAsignaturas As New DataSet
    Dim tblAsignaturas As New DataTable
    Dim rowAsignaturas As DataRow

    Dim dapTareas As New SqlDataAdapter()
    Dim dstTareas As New DataSet
    Dim tblTareas As New DataTable
    Dim rowTareas As DataRow

    Dim dvTareas As DataView

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Page.IsPostBack Then
            dstAsignaturas = Session("Asignaturas")
            dstTareas = Session("Tareas")
        Else
            dapAsignaturas = New SqlDataAdapter("SELECT Asignaturas.codigo FROM Asignaturas INNER JOIN GruposClase ON GruposClase.codigoasig = Asignaturas.codigo INNER JOIN ProfesoresGrupo ON ProfesoresGrupo.codigogrupo = GruposClase.codigo WHERE ProfesoresGrupo.email = '" & Session("UserID") & "'", conClsf)
            Dim bldAsignaturas As New SqlCommandBuilder(dapAsignaturas)
            dapAsignaturas.Fill(dstAsignaturas, "Asignaturas")
            tblAsignaturas = dstAsignaturas.Tables("Asignaturas")

            DropDownList1.DataSource = tblAsignaturas
            DropDownList1.DataValueField = "codigo"
            DropDownList1.DataTextField = "codigo"
            DropDownList1.DataBind()

            Session("Asignaturas") = dstAsignaturas
            Session("AdapterAsignaturas") = dapAsignaturas

            'A partir de aquí es como el método DropDownList1_SelectedIndexChanged (llena la tabla con el valor por defecto del DropDownList).

            dapTareas = New SqlDataAdapter("SELECT * FROM TareasGenericas WHERE CodAsig='" & DropDownList1.SelectedValue & "'", conClsf)
            Dim bldTareas As New SqlCommandBuilder(dapTareas)

            dstTareas.Clear()
            dapTareas.Fill(dstTareas, "Tareas")
            tblTareas = dstTareas.Tables("Tareas")

            dvTareas = dstTareas.Tables(0).DefaultView

            GridViewTareas.DataSource = dvTareas
            GridViewTareas.DataBind()

            Session("Tareas") = dstTareas
            Session("AdapterTareas") = dapTareas
        End If

        LabelUser.Text = Session("UserID")
        LabelExportacionResult.Text = ""

    End Sub

    Protected Sub LinkButtonCerrarSesion_Click(sender As Object, e As EventArgs) Handles LinkButtonCerrarSesion.Click
        Session.Abandon()
        Response.Redirect("Inicio.aspx")
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        LabelExportacionResult.Text = ""

        tblTareas.Rows.Clear()

        dapTareas = New SqlDataAdapter("SELECT * FROM TareasGenericas WHERE CodAsig='" & DropDownList1.SelectedValue & "'", conClsf)
        Dim bldTareas As New SqlCommandBuilder(dapTareas)

        dstTareas.Clear()
        dapTareas.Fill(dstTareas, "Tareas")
        tblTareas = dstTareas.Tables("Tareas")

        'Se crea el DataView
        dvTareas = dstTareas.Tables(0).DefaultView

        'Se añade el Dataview al GridView
        GridViewTareas.DataSource = dvTareas
        GridViewTareas.DataBind()

        'Se actualiza la variable de sesion del adapter
        Session("AdapterTareas") = dapTareas
    End Sub

    Protected Sub ButtonExportarXML_Click(sender As Object, e As EventArgs) Handles ButtonExportarXML.Click

        'Primero se pasan los datos a un xml temporal
        dstTareas.WriteXml(Server.MapPath("App_Data/temporal.xml"))

        'Se especifica una configuracion para el XMLWriter
        Dim settings As XmlWriterSettings = New XmlWriterSettings()
        settings.Indent = True

        'Se crea el XMLWriter segun el valor seleccionado en el DropDownList con la configuracion anterior
        Using writer As XmlWriter = XmlWriter.Create(Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml"), settings)

            writer.WriteStartDocument()
            writer.WriteStartElement("tareas")

            'Se crea el XMLReader para ir leyendo
            Using xtr As XmlReader = XmlReader.Create(Server.MapPath("App_Data/temporal.xml"))

                While xtr.Read()

                    If xtr.NodeType = XmlNodeType.Element And xtr.LocalName = "Tareas" Then

                        writer.WriteStartElement("tarea")
                        xtr.MoveToElement()

                        xtr.ReadToDescendant("Codigo")
                        writer.WriteElementString("codigo", xtr.ReadElementContentAsString)
                        xtr.MoveToContent()

                        writer.WriteElementString("descripcion", xtr.ReadElementContentAsString)
                        xtr.MoveToContent()

                        'El siguiente campo (codigo de asignatura) lo saltamos ya que nuestro esquema xsd no tiene de referencia a esa informacion
                        xtr.ReadElementContentAsString()
                        xtr.MoveToContent()

                        writer.WriteElementString("hestimadas", xtr.ReadElementContentAsString)
                        xtr.MoveToContent()

                        writer.WriteElementString("explotacion", xtr.ReadElementContentAsString)
                        xtr.MoveToContent()

                        writer.WriteElementString("tipotarea", xtr.ReadElementContentAsString)

                        writer.WriteEndElement()

                    End If
                End While
            End Using

            writer.WriteEndElement()
            writer.WriteEndDocument()

        End Using

        'Añadir namespace (Opcional punto 2º)
        Dim doc As XmlDocument = New XmlDocument()
        doc.Load(Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml"))
        Dim root As XmlElement = doc.DocumentElement
        root.SetAttribute("xmlns:has", "http://ji.ehu.es/has")
        doc.Save(Server.MapPath("App_Data/" & DropDownList1.SelectedValue & ".xml"))

        LabelExportacionResult.Text = "Se han exportado los campos a XML"
    End Sub

End Class