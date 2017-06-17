<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ExportarTareas.aspx.vb" Inherits="WebApplication1.ExportarTareas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
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
                    <asp:Label ID="LabelUser" runat="server"></asp:Label>=&gt;  EXPORTACIÓN DE TAREAS GENÉRICAS
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
        <br />
        <asp:Label ID="Label1" runat="server" Text="Seleccionar Asignatura:"></asp:Label>
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="ButtonExportarXML" runat="server" Text="EXPORTAR XML" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        <asp:Label ID="LabelExportacionResult" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <asp:GridView ID="GridViewTareas" runat="server" EmptyDataText="No hay tareas en esta asignatura">
        </asp:GridView>
        <br />
        <br />
        <asp:LinkButton ID="LinkButtonMenuProfesor" runat="server" PostBackUrl="Profesor.aspx">Menu Profesor</asp:LinkButton>
        <br />
        <br />


    </div>
    </form>
</body>
</html>
