<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ImportarTareasXML.aspx.vb" Inherits="WebApplication1.ImportarTareasXML" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 52px;
            width: 313px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="width:100%; height: 209px;">
            <tr>
                <td class="auto-style2" colspan="2">
                    <p style="text-align: center; font-size: 40px; font-style: normal; font-variant: small-caps; color: #0000FF; background-color: #C0C0C0; font-weight: bold; width: 1697px;"> 
                        <br />
                        PROFESOR:  
                    <asp:Label ID="LabelUser" runat="server"></asp:Label>=&gt;  IMPORTACIÓN DE TAREAS GENÉRICAS
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
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="codigo" AutoPostBack="True" DataValueField="codigo">
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Server=tcp:serverhector.database.windows.net,1433; Initial Catalog=BaseDatos; Persist Security Info=False; User ID=hector@serverhector; Password=kukorules009*" SelectCommand="SELECT Asignaturas.codigo FROM Asignaturas 
INNER JOIN GruposClase ON GruposClase.codigoasig = Asignaturas.codigo 
INNER JOIN ProfesoresGrupo ON ProfesoresGrupo.codigogrupo = GruposClase.codigo
WHERE ProfesoresGrupo.email = @email">
            <SelectParameters>
                <asp:SessionParameter Name="email" SessionField="UserID" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="LabelError" runat="server" ForeColor="Red"></asp:Label>

                                 <asp:Xml  ID="Xml1" runat="server"></asp:Xml>

&nbsp;&nbsp;<br />
        <asp:Button ID="ButtonImportarXMLD" runat="server" Text="Importar (XMLD)" />
        &nbsp;
        <asp:Label ID="LabelBBDD" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:LinkButton ID="LinkButtonMenuProfesor" runat="server" PostBackUrl="/Profesor.aspx">Menu Profesor</asp:LinkButton>
        <br />
        <br />
        <br />
    </div>
    </form>
</body>
</html>
