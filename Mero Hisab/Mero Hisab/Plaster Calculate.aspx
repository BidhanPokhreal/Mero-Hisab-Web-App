<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Plaster Calculate.aspx.cs" Inherits="last_hour.Plaster_Calculate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:Label ID="LabelConcreteCalculateSheet" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ForeColor="Black" Text="Plaster Calculate Sheet"></asp:Label>
    </p>
<p>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FYPConnectionString %>" SelectCommand="SELECT * FROM [LoginUser]"></asp:SqlDataSource>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="LoginUser" DataSourceID="SqlDataSource2">
        <EditItemTemplate>
            LoginUser:
            <asp:Label ID="LoginUserLabel1" runat="server" Text='<%# Eval("LoginUser") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            LoginUser:
            <asp:TextBox ID="LoginUserTextBox" runat="server" Text='<%# Bind("LoginUser") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            LoginUser:
            <asp:Label ID="LoginUserLabel" runat="server" Text='<%# Eval("LoginUser") %>' />
            <br />

        </ItemTemplate>
    </asp:FormView>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        &nbsp;</p>
    <p>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Plaster Thickness" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DropDownListplaster" runat="server" BackColor="#FF6600">
        <asp:ListItem Value="10">10mm</asp:ListItem>
        <asp:ListItem Value="15">15mm </asp:ListItem>
        <asp:ListItem Value="20">20mm</asp:ListItem>
        <asp:ListItem Value="25">25mm</asp:ListItem>
    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="ButtonReset" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" OnClick="ButtonReset_Click" Text="Reset" />
</p>
<p>
&nbsp;<asp:Label ID="Label4" runat="server" Text="Plaster Length" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double"></asp:Label>
&nbsp;&nbsp;
    <asp:TextBox ID="TextBoxLength" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ValidationGroup="plastervalidate"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorplasterlength" runat="server" ControlToValidate="TextBoxLength" ErrorMessage="Field Cannot be Empy" ForeColor="Red" ValidationGroup="plastervalidate"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidatorLength" runat="server" ControlToValidate="TextBoxLength" ErrorMessage="Invalid Input" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ValidationGroup="plastervalidate" ForeColor="Red"></asp:RegularExpressionValidator>
</p>
<p>
&nbsp;<asp:Label ID="Label5" runat="server" Text="Plaster Breadth" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double"></asp:Label>
&nbsp;
    <asp:TextBox ID="TextBoxBreadth" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ValidationGroup="plastervalidate"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorplasterbreadth" runat="server" ControlToValidate="TextBoxBreadth" ErrorMessage="Field Cannot be Empy" ForeColor="Red" ValidationGroup="plastervalidate"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidatorBreadth" runat="server" ControlToValidate="TextBoxBreadth" ErrorMessage="Invalid Input" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ValidationGroup="plastervalidate" ForeColor="Red"></asp:RegularExpressionValidator>
</p>
<p>
    <asp:Button ID="ButtonCalculateVolume" runat="server" OnClick="Button1_Click" Text="Calculate Volume" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ValidationGroup="plastervalidate" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="ButtonCalculateArea" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" OnClick="Button1_Click1" Text="Calculate Area" ValidationGroup="plastervalidate" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<p>
    <asp:TextBox ID="TextBoxResultVolume" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double"></asp:TextBox>
&nbsp;<asp:Label ID="LabelCuM" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="Cu.M"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBoxResultArea" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double"></asp:TextBox>
&nbsp;<asp:Label ID="LabelSqM" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="Sq.M"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
    <asp:Button ID="ButtonSave" runat="server" Text="Save" OnClick="ButtonSave_Click" BackColor="#FF6600" Height="71px" ValidationGroup="plastervalidate" Width="87px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonResetPlaster" runat="server" OnClick="Button2_Click" Text="Reset Data" BackColor="#FF6600" Height="67px" Width="145px" />
&nbsp;
    <asp:Button ID="ButtonView" runat="server" BackColor="#FF6600" OnClick="ButtonView_Click" Text="View" Height="66px" Width="100px" />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FYPConnectionString %>" SelectCommand="SELECT * FROM [Plaster_Calculate] WHERE ([Name] = @Name)">
        <SelectParameters>
            <asp:ControlParameter ControlID="FormView1" Name="Name" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
&nbsp;<p>
        &nbsp;</p>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" ForeColor="#000066" Visible="False">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Thickness" HeaderText="Thickness" SortExpression="Thickness" />
            <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
            <asp:BoundField DataField="Breadth" HeaderText="Breadth" SortExpression="Breadth" />
            <asp:BoundField DataField="Volume" HeaderText="Volume" SortExpression="Volume" />
            <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
        </Columns>
    </asp:GridView>
<p>
</p>
</asp:Content>
