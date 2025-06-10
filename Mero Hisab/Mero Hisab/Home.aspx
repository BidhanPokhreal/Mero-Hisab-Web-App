<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="last_hour.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    &nbsp;</p>
<asp:Panel ID="Panel1" runat="server">
    Hi,
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LoginUser" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="LoginUser" HeaderText="LoginUser" ReadOnly="True" SortExpression="LoginUser" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FYPConnectionString %>" SelectCommand="SELECT * FROM [LoginUser]"></asp:SqlDataSource>
</asp:Panel>
<p>
    Welcome to our service.</p>
<p>
    &nbsp;</p>
<p>
    &nbsp;</p>
<p>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
</asp:Content>
