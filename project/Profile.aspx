<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="project.Profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" style="width: 700px; height: 600px">
            <tr>
                <td colspan="2" align="center">
                    <h2>User Profile</h2></td>
            </tr>
            <tr>
                <td style="width:50%">
                    <b>First Name:</b></td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" Height="51px" Width="213px" 
                        ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:50%">
                    <b>Last Name:</b></td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Height="51px" Width="213px" 
                        ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:50%">
                    <b>Email:</b></td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Height="51px" Width="213px" 
                        TextMode="Email" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width:50%">
                    <b>Gender:</b></td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" Height="29px" Width="210px" 
                        Enabled="False">
                        <asp:ListItem>Select Gender</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="width:50%">
                    <b>Address:</b></td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Height="51px" Width="213px" 
                        ReadOnly="True"></asp:TextBox>
            </tr>
            <tr>
                <td style="width:50%">
                    <b>Phone:</b></td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" Height="51px" Width="213px" 
                        TextMode="Phone" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <%--<tr>
                <td style="width:50%">
                    <b>Role:</b></td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server" Height="51px" Width="213px" 
                        TextMode="Password"></asp:TextBox>
                </td>
            </tr>--%>
            <tr>
                <td colspan="2" align="center">
                    
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
   <%-- <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    <asp:Button ID="Button1"
        runat="server" Text="Button" onclick="Button1_Click" />--%>
</asp:Content>
