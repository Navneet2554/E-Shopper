<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Showdetail.aspx.cs" Inherits="project.Showdetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <center><asp:Label ID="Label1" runat="server" Text="Detail of User" Font-Bold="True"></asp:Label></center>
    <center>
    
           <asp:GridView ID = "Database" runat="server" AutoGenerateColumns="False" 
               CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" >
              
               <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
              
           <Columns>
                <asp:BoundField DataField="Fname" HeaderText="First Name" />
                <asp:BoundField DataField="Lname" HeaderText="Last Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                <asp:BoundField DataField="Address" HeaderText="Address" />
                <asp:BoundField DataField="Phone" HeaderText="Phone" />
                <asp:BoundField DataField="Password" HeaderText="Password" />
                <asp:TemplateField HeaderText="Operation"></asp:TemplateField>
           </Columns>


               <EditRowStyle BackColor="#999999" />
               <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
               <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
               <SortedAscendingCellStyle BackColor="#E9E7E2" />
               <SortedAscendingHeaderStyle BackColor="#506C8C" />
               <SortedDescendingCellStyle BackColor="#FFFDF8" />
               <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

           </asp:GridView>
           <asp:Button ID="Button1" runat="server" style="margin-right:50px" Text="Get Detail" 
                   onclick="Button1_Click2" Font-Bold="True" />
          <%-- <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>--%>
           <%--<asp:Button ID="Button2" runat="server" Font-Bold="True" 
               onclick="Button2_Click" Text="Edit User" />--%>
               </center>
</asp:Content>

