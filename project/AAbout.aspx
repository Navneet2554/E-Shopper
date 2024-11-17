<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AAbout.aspx.cs" Inherits="project.AAbout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center><asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="XX-Large" 
        Text="About Us"></asp:Label></center>
    <center><h2>Frontend Developer</h2></center>
    <br />
    <br />
   <center> <asp:Image ID="Image1" runat="server" Height="249px" ImageUrl="~/Photo/nav.png" 
        Width="244px" />
    <br />
    <p>Name: Navneet Kumar</p>
    <p>Role: Front-end Developer</p>

    <center><h2>Backend Developer</h2></center>
    <br />
    <br />
    <asp:Image ID="Image2" runat="server" Height="249px" ImageUrl="~/Photo/nek.jpg" 
        Width="244px" />
    <p>Name: Nekhil Kumar</p>
    <p>Role: Back-end Developer</p>

    <br />
    <br />
    <asp:Image ID="Image3" runat="server" Height="249px" ImageUrl="~/Photo/sum.jpg" 
        Width="244px" />
     <p>Name: Sumedh Kumar</p>
    <p>Role: Back-end Developer</p></center>
</asp:Content>
