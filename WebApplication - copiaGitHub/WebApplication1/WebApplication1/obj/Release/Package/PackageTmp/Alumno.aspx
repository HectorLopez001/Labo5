<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Alumno.aspx.vb" Inherits="WebApplication1.Alumno" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {width: 17%;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <table style="width: 100%; height: 496px;">
            <tr>
                <td style="background-color:#FFCC66; font-size: 30px;" class="auto-style1">
                    <br />     
                    <asp:LinkButton ID="LinkButton2" runat="server">Cerrar Sesion</asp:LinkButton><br /><br />
                    <br />
                    <br />
                    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="TareasAlumno.aspx">Gestion de Tareas</asp:LinkButton>
                </td>
                <td style="background-color:#FFFFFF; text-align:center; font-size: 50px;">Gestión Web de Tareas-Dedicación <br />
                    <br />
&nbsp;Alumno:
                    <asp:Label ID="LabelUser" runat="server"></asp:Label></td>
            </tr>            
        </table>

        </div>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>