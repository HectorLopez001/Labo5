<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="cambiarpass.aspx.vb" Inherits="WebApplication1.cambiarpass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 622px; background-color: lightblue; width: 1579px;">
    
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#0066FF" Text="CAMBIAR CONTRASEÑA"></asp:Label>
        <br />
        <br />
        <br />
        <asp:Label ID="Label8" runat="server" Text="Introduce tu correo a continuacion"></asp:Label>
        :&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox6" ErrorMessage="Error... Introduce tu correo" ForeColor="#CC0000"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="TextBox6" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="#CC0000">* Necesario Correo Válido</asp:RegularExpressionValidator>
        
        <br />
        <br />
        <asp:Button ID="Button4" runat="server" Text="Introducir correo" Width="250px" Height="30px" />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Volver a Inicio" Width="250px" Height="45px" />
        <br />
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="Responde a la pregunta secreta:" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#006600" Text="LabelPregunta" Visible="False"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label5" runat="server" Text="Respuesta:" Visible="False"></asp:Label>
        &nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox4" runat="server" Visible="False"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="Error... Introduce una respuesta a la pregunta" Font-Bold="False" ForeColor="#CC0000" Visible="False"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" Text="Introducir Respuesta" Width="259px" CausesValidation="False" Visible="False" />
        <br />
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Introduzca una nueva contraseña:" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Error... Introduce una nueva contraseña" Font-Bold="False" ForeColor="#CC0000" Visible="False"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Error... La contraseña debe contener entre 6 y 20 caracteres" ForeColor="#CC0000" Visible="False" ControlToValidate="TextBox2" ValidationExpression="[A-Za-z0-9]{6,20}"></asp:RegularExpressionValidator>
        <br />
        <asp:Label ID="Label4" runat="server" Text="Repita la contraseña:" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server" Visible="False"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Error... Vuelve a introducir la contraseña" Font-Bold="False" ForeColor="#CC0000" Visible="False" Font-Underline="False"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2" ControlToValidate="TextBox3" ErrorMessage="Error... La contraseña no coincide" ForeColor="#CC0000" Visible="False"></asp:CompareValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Error... La contraseña debe contener entre 6 y 20 caracteres" ForeColor="#CC0000" ValidationExpression="[A-Za-z0-9]{6,20}" Visible="False" ControlToValidate="TextBox3"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Confirmar Cambio" Visible="False" />
        &nbsp;&nbsp;&nbsp;
        <br />
        <br />
    
    </div>
    </form>
</body>
</html>
