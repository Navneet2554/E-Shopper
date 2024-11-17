<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="project.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" href="StyleSheet1.css" />
    <title></title>

     
</head>
<body >
    <form id="form1" runat="server">
    <div id="body">
    
        <table align="center" 
            
            style="height: 436px; width: 530px; background-color: #FFFFFF; background-image: none;">
            <tr>
                <td colspan="2" align="center">
                    <h2>Login Page</h2></td>
            </tr>
            <tr>
                     <td colspan="2" align="center">
                        <asp:RadioButton ID="RadioButtonAdmin" runat="server" GroupName="Role" Text="Admin" />
                        <asp:RadioButton ID="RadioButtonUser" runat="server" GroupName="Role" Text="User" Checked="True" />
                    </td>
            </tr>
            <tr>
                <td align="center" style="width:50%">
                    <b>Email ID:
                    </b></td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Height="47px" TextMode="Email" 
                        Width="204px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Email Field Sould not empty" 
                        ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="center" style="width:50%">
                    <b>Password:</b></td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Height="47px" TextMode="Password" 
                        Width="204px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan ="2" align="center"><asp:Label ID="Label2" runat="server" Text="Label">Don't Have an Account?</asp:Label>
                    <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="Black" 
                        onclick="LinkButton1_Click" CausesValidation="False"><b>Sign Up</b></asp:LinkButton></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="Button1" runat="server" Height="36px" Text="Login" 
                        Width="112px" BackColor="Red" Font-Bold="True" Font-Size="Large" 
                        onclick="Button1_Click" />
                    </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" align="center" >
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
