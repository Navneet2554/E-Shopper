<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="project.WebF" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table align="center" style="width: 700px; height: 600px">
            <tr>
                <td colspan="2" align="center">
                    <h2>Sign Up</h2></td>
            </tr>
            <tr>
                <td style="width:50%">
                    <b>First Name:</b></td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Height="51px" Width="213px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="First Name is Empty" ForeColor="Red" 
                        ControlToValidate="TextBox1">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="TextBox1" ErrorMessage="Only Character" ForeColor="Red" 
                        ValidationExpression="^[A-Za-z]*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width:50%">
                    <b>Last Name:</b></td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Height="51px" Width="213px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="Last Name is Empty" ForeColor="Red" 
                        ControlToValidate="TextBox2">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="TextBox2" ErrorMessage="Only Character" ForeColor="Red" 
                        ValidationExpression="^[A-Za-z]*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width:50%">
                    <b>Email:</b></td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Height="51px" Width="213px" 
                        TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="Email is Empty" ForeColor="Red" ControlToValidate="TextBox3">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width:50%">
                    <b>Gender:</b></td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="29px" Width="210px">
                        <asp:ListItem>Select Gender</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="Gender is Empty" ForeColor="Red" 
                        ControlToValidate="DropDownList1">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width:50%">
                    <b>Address:</b></td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Height="51px" Width="213px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="Address is Empty" ForeColor="Red" 
                        ControlToValidate="TextBox4">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width:50%">
                    <b>Phone:</b></td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" Height="51px" Width="213px" 
                        TextMode="Phone"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ErrorMessage="Phone is Empty" ForeColor="Red" ControlToValidate="TextBox5">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                        ControlToValidate="TextBox5" ErrorMessage="Invalid No" ForeColor="Red" 
                        ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width:50%">
                    <b>Password:</b></td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server" Height="51px" Width="213px" 
                        TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ErrorMessage="Password is Empty" ForeColor="Red" 
                        ControlToValidate="TextBox6">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width:50%">
                    <b>Confirm Password:</b></td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server" Height="51px" Width="213px" 
                        TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ErrorMessage="Confirm Password is Empty" ForeColor="Red" 
                        ControlToValidate="TextBox7">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="TextBox6" ControlToValidate="TextBox7" 
                        ErrorMessage="Password Not Matched" ForeColor="Red"></asp:CompareValidator>
                    
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="Button1" runat="server" Font-Bold="True" ForeColor="Black" 
                        Text="Sign Up" onclick="Button1_Click" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="">Already Have an Account?</asp:Label>
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                        CausesValidation="False" ForeColor="Black">Sign In</asp:LinkButton>
                </td>
                <td>
                    
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
