<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="additem.aspx.cs" Inherits="project.additem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style1
        {
            height: 39px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    <table style="width:700px; height:390px; background-color:#5f98f3;" align="center">
        <tr>
            <td colspan="2" align="center" width="50%">
                <h1>Adding Product</h1><hr />
            </td>
        </tr>
        <tr>
            <td align="center" width="50%"><h3>Product Name:</h3></td>
            <td width="50%">
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="center" width="50%"><h3>Product Description:</h3></td>
            <td width="50%">
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="center" width="50%"><h3>Product Image:</h3></td>
            <td width="50%">
                <asp:FileUpload ID="FileUpload1" runat="server" /></td>
        </tr>
        <tr>
            <td align="center" width="50%"><h3>Product Price:</h3></td>
            <td width="50%">
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td align="center" width="50%" colspan="2">
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <td colspan="2">
                <center><asp:Button ID="Button1" runat="server" Text="Submit" Font-Bold="True" 
                        Font-Italic="False" onclick="Button1_Click" /></center></td>
        </tr>

    </table>
</div>
</asp:Content>
