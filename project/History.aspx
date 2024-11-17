<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="project.History" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div align="center" class="navbar" style="height:auto">
<div align="right">
    <asp:LinkButton ID="Allorder" runat="server" onclick="Allorder_Click">Show All Order Detail</asp:LinkButton>
&nbsp;
</div>
    <b>Select Date:</b>
    <asp:TextBox ID="TextBox1" runat="server" Font-Bold="true" Width="122px"></asp:TextBox>
    <asp:ImageButton ID="ImageButton1" runat="server" Height="30px" 
            ImageUrl="~/Photo/calender.png" onclick="ImageButton1_Click" />
            <br  />
    <asp:Label ID="Label1" runat="server" Text="Year:" Font-Bold="true"></asp:Label>&nbsp;
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
        </asp:DropDownList>
        &nbsp;
    <asp:Label ID="Label2" runat="server" Text="Month:" Font-Bold="true"></asp:Label>&nbsp;
    <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
            onselectedindexchanged="DropDownList2_SelectedIndexChanged">
        </asp:DropDownList>
        &nbsp;

    <br  />
    <asp:Calendar ID="Calendar1" runat="server" 
            onselectionchanged="Calendar1_SelectionChanged" BackColor="White" 
            BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" 
            DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
            ForeColor="#003399" Height="200px" Width="220px">
        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
        <OtherMonthDayStyle ForeColor="#999999" />
        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" 
            Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
        <WeekendDayStyle BackColor="#CCCCFF" />
        </asp:Calendar>
    <asp:Button ID="Button1" runat="server" Text="Click" CssClass="button" 
            Font-Bold="true" Height="39px" Width="72px" onclick="Button1_Click" />
    <br /><br />
    <asp:GridView ID="GridView1" runat="server" onrowdatabound="GridView1_RowDataBound" 
            CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Order Status">
                <ItemTemplate>
                    <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" 
                        GroupName="Ostatus" Text="Pending" />
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="Ostatus" 
                        Text="Completed" />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <br />
    <asp:Button ID="Button2" runat="server" Text="Update Status" 
            onclick="Button2_Click" />
</asp:Content>
