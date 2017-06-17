<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TareasAlumno.aspx.vb" Inherits="WebApplication1.TareasAlumno" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
         <table style="width:100%; height: 209px;">
            <tr>
                <td class="auto-style2" colspan="2">
                    <p style="text-align: center; font-size: 40px; font-style: normal; font-variant: small-caps; color: #0000FF; background-color: #C0C0C0; font-weight: bold; width: 1475px;"> 
                        <br />
                        ALUMNO:        
                    <asp:Label ID="LabelUser" runat="server"></asp:Label>=&gt; GESTION DE TAREAS GENÉRICAS
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
    
    </div>
    <p style="text-align: center"> Seleccionar asignatura</p>
        <p style="text-align: center"> 
            <asp:DropDownList ID="DropDownListAsignaturas" runat="server" AutoPostBack="True">
            </asp:DropDownList>
        </p>
        <p style="text-align: center"> 
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:GridView ID="GridViewTareas" runat="server" HorizontalAlign="Center" EmptyDataText="No tienes tareas para instanciar" Height="234px" style="margin-bottom: 0px" Width="494px">
                <AlternatingRowStyle BackColor="#99CCFF" />
                <Columns>
                    <asp:CommandField ButtonType="Button" SelectText="Instanciar" ShowCancelButton="False" ShowSelectButton="True" />
                </Columns>
                <HeaderStyle BackColor="#0066FF" />
                <RowStyle BackColor="Aqua" />
            </asp:GridView>
        </p>
        <p>
            &nbsp;</p>
    </form>
    

</body>
</html>             