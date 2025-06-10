<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="applicatiob_dev.Register.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style1 {
            margin-left: 200px;
        }
    </style>
</head>
<body>
    <p>
        &nbsp;</p>
    <form id="form1" runat="server">
        <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label4" runat="server" BackColor="White" BorderColor="#006600" CssClass="auto-style1" Font-Bold="True" Font-Names="Alien Encounters" Font-Overline="False" Font-Size="XX-Large" Font-Strikeout="False" ForeColor="#FF6600" Text="Mero Hisab"></asp:Label>
    </p>
        <p>
            &nbsp;</p>
        <p>
        <br />
    </p>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
            <asp:TextBox ID="TextBoxUsername" runat="server" ValidationGroup="register validate"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" runat="server" ControlToValidate="TextBoxUsername" ErrorMessage="Please enter valid Username." ForeColor="#FF3300" ValidationGroup="register validate"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
            <asp:TextBox ID="TextBoxPassword" runat="server" TextMode="Password" ValidationGroup="register validate"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Please enter valid password" ForeColor="#FF3300" ValidationGroup="register validate"></asp:RequiredFieldValidator>
            <br />
            <br />
            Re-password<asp:TextBox ID="TextBoxRePassword" runat="server" TextMode="Password" ValidationGroup="register validate"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidatorRepassword" runat="server" ControlToCompare="TextBoxPassword" ControlToValidate="TextBoxRePassword" ErrorMessage="Password not match" ForeColor="Red" ValidationGroup="register validate"></asp:CompareValidator>
            <br />
            <asp:Label ID="Label3" runat="server" Text="Email"></asp:Label>
            <asp:TextBox ID="TextBoxEmail" runat="server" ValidationGroup="register validate"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" ControlToValidate="TextBoxEmail" Display="Dynamic" ErrorMessage="Please enter valid Mail" ForeColor="#FF3300" ValidationGroup="register validate"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidatorEmail" runat="server" BorderColor="#FF3300" ControlToValidate="TextBoxEmail" Display="Dynamic" ErrorMessage="Enter valid email format" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="register validate"></asp:RegularExpressionValidator>
            <br />
            <br />
            <asp:Label ID="LabelMessgae" runat="server" BackColor="Red"></asp:Label>
        </div>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" ValidationGroup="register validate" />
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Login" />
        </p>
        <p>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FYPConnectionString %>" DeleteCommand="DELETE FROM [Register] WHERE [Username] = @Username" InsertCommand="INSERT INTO [Register] ([Username], [password], [email]) VALUES (@Username, @password, @email)" SelectCommand="SELECT * FROM [Register] WHERE ([Username] = @Username)" UpdateCommand="UPDATE [Register] SET [password] = @password, [email] = @email WHERE [Username] = @Username">
                <DeleteParameters>
                    <asp:Parameter Name="Username" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Username" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBoxUsername" Name="Username" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="Username" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
        <div>
        </div>
    </form>
</body>
</html>
