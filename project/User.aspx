<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="project.User1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:1150px; height:30px">
    <tr style="background-color:Black">
        <td style="text-align:center">
            <asp:TextBox ID="TextBox1" runat="server" Height="25px" Width="269px" 
                style="margin-bottom: 0px"></asp:TextBox>
            <asp:ImageButton ID="ImageButton2" runat="server" Height="24px" 
                ImageUrl="~/Photo/search.jpeg" Width="38px" onclick="ImageButton2_Click" />
        </td>
    </tr>
</table>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
        RepeatDirection="Horizontal" onitemcommand="DataList1_ItemCommand" 
    RepeatColumns="4">
    <ItemTemplate>
       <table>
            <tr>
                <td style="text-align:center; background-color:Black">
                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("P_NAME") %>' Font-Bold="True" 
                        Font-Names="Arial Black" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style="text-align:center">
                    <asp:Image ID="Image1" runat="server" BorderColor="#5F98F3" BorderWidth="1px" 
                        Height="279px" Width="278px" ImageUrl='<%#Eval("P_IMAGE") %>'/>
                </td>
            </tr>
            <tr>
                <td style="text-align:center">
                    <asp:Label ID="Label2" runat="server" Text="Price: RS" Font-Bold="True" 
                        Font-Names="Arial" ForeColor="Black" style="text-align:center"></asp:Label>
                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("P_PRICE") %>' Font-Bold="True" 
                        Font-Names="Arial Black" ForeColor="Black" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td style="text-align:center">
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="40px" Width="160px" CommandArgument='<%# Eval("P_ID") %>' ImageUrl="~/Photo/add.jpeg" CommandName="addtocart" />
                </td>
            </tr>
       </table>
       <br />
       <br />
    </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:projectConnectionString %>" 
        SelectCommand="SELECT [P_ID], [P_NAME], [P_IMAGE], [P_PRICE] FROM [product1]"></asp:SqlDataSource>
</asp:Content>
