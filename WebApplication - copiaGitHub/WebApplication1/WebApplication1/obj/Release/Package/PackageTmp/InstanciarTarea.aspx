<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="InstanciarTarea.aspx.vb" Inherits="WebApplication1.InstanciarTarea" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 20%;
            height: 79px;
        }
        .auto-style2 {
            height: 79px;
        }
        .auto-style3 {
            width: 1224px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 668px">
        <table style="width:100%; height: 209px;">
            <tr>
                <td class="auto-style2" colspan="2">
                    <p style="text-align: center; font-size: 40px; font-style: normal; font-variant: small-caps; color: #0000FF; background-color: #C0C0C0; font-weight: bold; width: 1475px;"> 
                        <br />
                        ALUMNO:        
                    <asp:Label ID="LabelUser" runat="server"></asp:Label>=&gt; INSTANCIAR TAREA GENÉRICA
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


    
        <asp:Label ID="Label2" runat="server" Text="Usuario"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxUsuario" runat="server" Height="16px" ReadOnly="True" Width="144px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Tarea "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxTarea" runat="server" ReadOnly="True" Width="142px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Horas Est."></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxHorasEstimadas" runat="server" ReadOnly="True" Width="148px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Horas Reales"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxHorasReales" runat="server" TextMode="Number">0</asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="LabelError" runat="server" ForeColor="Red"></asp:Label>
        <br />
        <table style="width:100%;">
            <tr>
                <td>
        <asp:Button ID="ButtonCrearTarea" runat="server" Text="Crear Tarea" Height="62px" Width="214px" />
                </td>
                <td rowspan="2">
        <asp:GridView ID="GridViewTareasUser" runat="server" Height="217px" Width="390px">
            <AlternatingRowStyle BackColor="#99CCFF" />
            <EditRowStyle BackColor="#FF99FF" />
            <FooterStyle BackColor="#CC0066" />
            <HeaderStyle BackColor="#3366FF" />
            <RowStyle BackColor="#66FFCC" />
        </asp:GridView>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" PostBackUrl="TareasAlumno.aspx">Página Anterior</asp:LinkButton>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
    
    </div>
    </form>
</body>
</html>
