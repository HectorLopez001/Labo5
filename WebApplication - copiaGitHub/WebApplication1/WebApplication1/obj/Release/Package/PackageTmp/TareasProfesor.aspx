<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasProfesor.aspx.vb" Inherits="WebApplication1.TareasProfesor" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
 <table style="width:100%; height: 209px;">
            <tr>
                <td class="auto-style2" colspan="2">
                    <p style="text-align: center; font-size: 40px; font-style: normal; font-variant: small-caps; color: #0000FF; background-color: #C0C0C0; font-weight: bold; width: 1697px;"> 
                        <br />
                        PROFESOR:  
                    <asp:Label ID="LabelUser" runat="server"></asp:Label>=&gt;  GESTION DE TAREAS GENÉRICAS
                        <br /><br />
                    </p>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                        <asp:LinkButton ID="LinkButtonCerrarSesion" runat="server">Cerrar Sesion</asp:LinkButton>
                </td>
                <td class="auto-style1">                                   
                        <br />  
                        <br />              
                </td>
            </tr>

        </table>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <asp:Label ID="Label1" runat="server" Text="Seleccionar Asignatura:"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="codigo" AutoPostBack="True" Height="33px" Width="109px">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Server=tcp:hads21hads.database.windows.net,1433; Initial Catalog=1617hads21; Persist Security Info=False; User ID=hads21@hads21hads; Password=PerroPerro1" SelectCommand="SELECT Asignaturas.codigo FROM Asignaturas INNER JOIN GruposClase ON GruposClase.codigoasig = Asignaturas.codigo INNER JOIN ProfesoresGrupo ON ProfesoresGrupo.codigogrupo = GruposClase.codigo WHERE ProfesoresGrupo.email = @email">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <asp:Button ID="ButtonInsertarNuevaTarea" runat="server" Text="INSERTAR TAREA" Height="42px" Width="187px" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Codigo" DataSourceID="SqlDataSource2" EmptyDataText="No hay tareas que mostrar" Height="221px" Width="642px">
            <AlternatingRowStyle BackColor="#CCFFCC" />
            <Columns>
                <asp:CommandField EditText="Editar" ShowEditButton="True" CancelText="Cancelar" DeleteText="Borrar" InsertText="Insertar" NewText="Nueva" SelectText="Seleccionar" UpdateText="Actualizar" />
                <asp:BoundField DataField="Codigo" HeaderText="Codigo" ReadOnly="True" SortExpression="Codigo" />
                <asp:BoundField DataField="Descripcion" HeaderText="Descripcion" SortExpression="Descripcion" />
                <asp:BoundField DataField="CodAsig" HeaderText="CodAsig" SortExpression="CodAsig" />
                <asp:BoundField DataField="HEstimadas" HeaderText="HEstimadas" SortExpression="HEstimadas" />
                <asp:CheckBoxField DataField="Explotacion" HeaderText="Explotacion" SortExpression="Explotacion" />
                <asp:BoundField DataField="TipoTarea" HeaderText="TipoTarea" SortExpression="TipoTarea" />
            </Columns>
            <EditRowStyle BackColor="#CCFFCC" />
            <HeaderStyle BackColor="#CC0099" />
            <RowStyle BackColor="#FFCCCC" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Server=tcp:serverhector.database.windows.net,1433; Initial Catalog=BaseDatos; Persist Security Info=False; User ID=hector@serverhector; Password=kukorules009*" 
            SelectCommand="SELECT TareasGenericas.*
            FROM TareasGenericas 
            INNER JOIN GruposClase ON TareasGenericas.CodAsig = GruposClase.codigoasig
            INNER JOIN ProfesoresGrupo ON GruposClase.codigo = ProfesoresGrupo.codigogrupo
            WHERE TareasGenericas.CodAsig= @codasig
            AND ProfesoresGrupo.email = @email"
            UpdateCommand="UPDATE TareasGenericas
            SET Descripcion=@Descripcion, HEstimadas=@HEstimadas, Explotacion=@Explotacion, TipoTarea=@TipoTarea
            WHERE Codigo=@Codigo"
            >
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="codasig" PropertyName="SelectedValue" />
                <asp:SessionParameter Name="email" SessionField="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>