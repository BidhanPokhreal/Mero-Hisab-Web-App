<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Building Estimator.aspx.cs" Inherits="last_hour.Building_Estimator" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:Label ID="LabelConcreteCalculateSheet" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ForeColor="Black" Text="Building Material Calculate Sheet"></asp:Label>
</p>
    <p>
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FYPConnectionString %>" SelectCommand="SELECT * FROM [LoginUser]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    <p>
    <asp:Label ID="Label4" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="Name of Building"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBoxName" runat="server" ValidationGroup="buildingvalidate" BackColor="#FF6600" BorderColor="#006600"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorlengthofbuilding0" runat="server" ControlToValidate="TextBoxName" ErrorMessage="Field Cannot be Empy" ForeColor="#000066" ValidationGroup="buildingvalidate"></asp:RequiredFieldValidator>
    <br />
</p>
<p>
    <asp:Label ID="Label2" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="Length of Building"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBoxLength" runat="server" ValidationGroup="buildingvalidate" BackColor="#FF6600" BorderColor="#006600"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorlengthofbuilding" runat="server" ControlToValidate="TextBoxLength" ErrorMessage="Field Cannot be Empy" ForeColor="#000066" ValidationGroup="buildingvalidate"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidatorLength" runat="server" ControlToValidate="TextBoxLength" ErrorMessage="Invalid Input" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ValidationGroup="buildingvalidate"></asp:RegularExpressionValidator>
</p>
    <p>
        <asp:Label ID="Label3" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="Breadth of Building"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxBreadth" runat="server" ValidationGroup="buildingvalidate" BackColor="#FF6600" BorderColor="#006600"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorbreadthofbuilding" runat="server" ControlToValidate="TextBoxBreadth" ErrorMessage="Field Cannot be Empy" ForeColor="#000066" ValidationGroup="buildingvalidate"></asp:RequiredFieldValidator>
&nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidatorBreadth" runat="server" ControlToValidate="TextBoxBreadth" ErrorMessage="Invalid Input" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ValidationGroup="buildingvalidate"></asp:RegularExpressionValidator>
</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="ButtonCalculateArea" runat="server" OnClick="ButtonCalculateArea_Click" Text="Calculate Area" ValidationGroup="buildingvalidate" BackColor="#FF6600" BorderColor="#006600" ForeColor="#000066" />
</p>
    <asp:TextBox ID="TextBoxArea" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ReadOnly="True"></asp:TextBox>
&nbsp;&nbsp;
    <asp:Label ID="LabelSqM" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="Sq.M"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <br />
    <br />
    <asp:Button ID="ButtonCalculateCement" runat="server" Text="Calculate Cement" OnClick="ButtonCalculateCement_Click" ValidationGroup="buildingvalidate" BackColor="#FF6600" BorderColor="#006600" ForeColor="#000066" />
    <br />
    <br />
    <asp:TextBox ID="TextBoxCement" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ReadOnly="True"></asp:TextBox>
    <asp:Label ID="Labelbags" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="Bags"></asp:Label>
    <br />
<p>
    <asp:Button ID="ButtonCalculateSand" runat="server" Text="Calculate Sand" OnClick="ButtonCalculateSand_Click" ValidationGroup="buildingvalidate" BackColor="#FF6600" BorderColor="#006600" ForeColor="#000066" />
</p>
    <p>
        <asp:TextBox ID="TextBoxSand" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ReadOnly="True"></asp:TextBox>
    <asp:Label ID="LabelTon0" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="Ton"></asp:Label>
</p>
<p>
    <asp:Button ID="ButtonCalculateAggregate" runat="server" Text="Calculate Aggregate" OnClick="ButtonCalculateAggregate_Click" ValidationGroup="buildingvalidate" BackColor="#FF6600" BorderColor="#006600" ForeColor="#000066" />
</p>
    <p>
        <asp:TextBox ID="TextBoxAggregate" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ReadOnly="True"></asp:TextBox>
    &nbsp;
    <asp:Label ID="LabelTon" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="Ton"></asp:Label>
</p>
    <asp:Button ID="ButtonCalculateSteel" runat="server" OnClick="Button1_Click" Text="Calculate Steel " ValidationGroup="buildingvalidate" BackColor="#FF6600" BorderColor="#006600" ForeColor="#000066" />
    <br />
    <br />
        <asp:TextBox ID="TextBoxSteel" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ReadOnly="True"></asp:TextBox>
    &nbsp;<asp:Label ID="LabelKg" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="KG"></asp:Label>
    <p>
        <asp:Button ID="ButtonCalculateBricks" runat="server" OnClick="Button2_Click" Text="Calculate Bricks" ValidationGroup="buildingvalidate" BackColor="#FF6600" BorderColor="#006600" ForeColor="#000066" />
</p>
<p>
        <asp:TextBox ID="TextBoxBricks" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ReadOnly="True"></asp:TextBox>
    <asp:Label ID="LabelNos" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="Nos."></asp:Label>
    </p>
<p>
        &nbsp;</p>
<p>
        <asp:Button ID="ButtonCreateChart" runat="server" Text="Save Data" OnClick="ButtonCreateChart_Click" ValidationGroup="buildingvalidate" BackColor="#FF6600" BorderColor="#006600" ForeColor="#000066" Height="59px" Width="162px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonReset" runat="server" OnClick="ButtonReset_Click" Text="Reset data" BackColor="#FF6600" BorderColor="#006600" ForeColor="#000066" Height="60px" Width="162px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="view" runat="server" BackColor="#FF6600" BorderColor="#006600" ForeColor="#000066" OnClick="view_Click" Text="view" Height="62px" Width="78px" />
        </p>
    <p>
        <asp:GridView ID="GridViewSavedData" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Font-Bold="True" Font-Italic="True" Font-Names="Algerian" Font-Size="Medium" ForeColor="#000066" Visible="False">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                <asp:BoundField DataField="Breadth" HeaderText="Breadth" SortExpression="Breadth" />
                <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
                <asp:BoundField DataField="Cement" HeaderText="Cement" SortExpression="Cement" />
                <asp:BoundField DataField="Sand" HeaderText="Sand" SortExpression="Sand" />
                <asp:BoundField DataField="Aggregate" HeaderText="Aggregate" SortExpression="Aggregate" />
                <asp:BoundField DataField="Steel" HeaderText="Steel" SortExpression="Steel" />
                <asp:BoundField DataField="Bricks" HeaderText="Bricks" SortExpression="Bricks" />
                <asp:BoundField DataField="building_name" HeaderText="building_name" SortExpression="building_name" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FYPConnectionString %>" SelectCommand="SELECT * FROM [Building_Estimator] WHERE ([Name] = @Name)">
            <SelectParameters>
                <asp:ControlParameter ControlID="FormView1" Name="Name" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <br />
    <br />
    <br />
    <br />
</asp:Content>
