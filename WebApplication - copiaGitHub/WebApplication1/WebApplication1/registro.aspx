<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="registro.aspx.vb" Inherits="WebApplication1.registro" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div  style="padding: 20px; height: 587px; width: 440px; background-color: lightblue;">
    
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" ForeColor="#0066FF" Text="FORMULARIO DE REGISTRO"></asp:Label>
            <br />
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            <br />
    
        Dirección de&nbsp; correo:
        <asp:TextBox ID="Correo" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="Correo" ForeColor="Red">* Necesario Correo</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="Correo" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ForeColor="Red">* Necesario Correo Válido</asp:RegularExpressionValidator>
        <br />
        Nombre:
        <asp:TextBox ID="Nombre" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="Nombre" ForeColor="Red">* Necesario Nombre</asp:RequiredFieldValidator>
        <br />
        <br />
        <br />
        Apellidos:
        <asp:TextBox ID="Apellidos" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="Apellidos" ForeColor="Red">* Necesario Apellido</asp:RequiredFieldValidator>
        <br />
        <br />
        DNI:
        <asp:TextBox ID="DNI" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="DNI" ForeColor="Red">* Necesario DNI</asp:RequiredFieldValidator>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="DNI" ValidationExpression="([0-9]{8})([A-Z]{1})" ForeColor="Red">* Necesario DNI Válido (PE:12121212X)</asp:RegularExpressionValidator>
        <br />
        Contraseña:
        <asp:TextBox ID="Contraseña" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="Contraseña" ForeColor="Red">* Necesario Contraseña</asp:RequiredFieldValidator>
        <br />    
        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="RegularExpressionValidator" ControlToValidate="Contraseña" ValidationExpression="[A-Za-z0-9]{6,20}" ForeColor="Red">Contraseña de minimo 6 caracteres</asp:RegularExpressionValidator>
        <br />
        <br />
        Confirmar contraseña:
        <asp:TextBox ID="Confirmar" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="Confirmar" ForeColor="Red">* Necesario Confirmación</asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Las contraseñas no coinciden" ControlToCompare="Contraseña" ControlToValidate="Confirmar" ForeColor="Red"></asp:CompareValidator>
            <br />
        <br />
        Pregunta secreta:
        <asp:TextBox ID="Pregunta" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Pregunta" ErrorMessage="Campo necesario" ForeColor="Red">*Campo necesario</asp:RequiredFieldValidator>
        <br />
        <br />
        Respuesta secreta:
        <asp:TextBox ID="Respuesta" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="Respuesta" ErrorMessage="Campo necesario" ForeColor="Red">*Campo necesario</asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Button ID="Enviar" runat="server" Text="Registrar" />
        <br />
        <asp:Button ID="Button1" runat="server" Text="inicio" CausesValidation="False" />
            <br />
    </div>
    </form>
</body>
</html>
