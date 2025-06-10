<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Steel Calculator.aspx.cs" Inherits="last_hour.Steel_Calculator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    Steel Calculator</p>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="LoginUser" DataSourceID="SqlDataSource1">
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FYPConnectionString %>" SelectCommand="SELECT * FROM [LoginUser]"></asp:SqlDataSource>
    <br />
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <p>
&nbsp;&nbsp;
    <asp:Label ID="LabelDiameter" runat="server" Text="Diameter"></asp:Label>
&nbsp;<asp:TextBox ID="TextBoxDia" runat="server" ValidationGroup="SteelValidation" BackColor="#FF6600"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDia" runat="server" ControlToValidate="TextBoxDia" ErrorMessage="Field cannot be empty" ValidationGroup="SteelValidation" ForeColor="#000066"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorDiameter" runat="server" ControlToValidate="TextBoxDia" ErrorMessage="Invalid Input" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ValidationGroup="SteelValidation" ForeColor="#000066"></asp:RegularExpressionValidator>
</p>
<p>
&nbsp;&nbsp;
    <asp:Label ID="LabelLength" runat="server" Text="Length"></asp:Label>
&nbsp;<asp:TextBox ID="TextBoxLength" runat="server" ValidationGroup="SteelValidation" BackColor="#FF6600"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLength" runat="server" ControlToValidate="TextBoxLength" ErrorMessage="Field cannot be Empty" ValidationGroup="SteelValidation" ForeColor="#000066"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorLength" runat="server" ControlToValidate="TextBoxLength" ErrorMessage="Invalid Input" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ValidationGroup="SteelValidation" ForeColor="#000066"></asp:RegularExpressionValidator>
</p>
<p>
&nbsp;&nbsp;
    <asp:Label ID="Label4" runat="server" Text="Quantity/Nos."></asp:Label>
&nbsp;<asp:TextBox ID="TextBoxQuantity" runat="server" ValidationGroup="SteelValidation" BackColor="#FF6600"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorQty" runat="server" ControlToValidate="TextBoxQuantity" ErrorMessage="Field cannot be empty" ValidationGroup="SteelValidation" ForeColor="#000066"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorQuantity" runat="server" ControlToValidate="TextBoxQuantity" ErrorMessage="Invalid Input" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ValidationGroup="SteelValidation" ForeColor="#000066"></asp:RegularExpressionValidator>
</p>
<asp:Button ID="ButtonCalculateSteelWeight" runat="server" OnClick="ButtonCalculateSteelWeight_Click" Text="Calculate Weight" ValidationGroup="SteelValidation" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" />
<p>
    <asp:TextBox ID="TextBoxSteelWeight" runat="server" BackColor="#FF6600" ReadOnly="True"></asp:TextBox>
&nbsp;<asp:Label ID="LabelKG" runat="server" Text="KG"></asp:Label>
</p>
    <p>
        <asp:Button ID="Button1" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="Save" OnClick="Button1_Click" Height="65px" Width="86px" ValidationGroup="SteelValidation" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="Reset" OnClick="Button2_Click" Height="64px" Width="91px" />
&nbsp;
        <asp:Button ID="Button3" runat="server" BackColor="#FF6600" OnClick="Button3_Click" Text="View" Height="65px" Width="90px" />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:FYPConnectionString %>" SelectCommand="SELECT * FROM [Steel Calculate] WHERE ([Name] = @Name)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Steel Calculate] WHERE [Name] = @original_Name AND (([Diameter] = @original_Diameter) OR ([Diameter] IS NULL AND @original_Diameter IS NULL)) AND (([Length] = @original_Length) OR ([Length] IS NULL AND @original_Length IS NULL)) AND (([Nos] = @original_Nos) OR ([Nos] IS NULL AND @original_Nos IS NULL)) AND (([Quantity] = @original_Quantity) OR ([Quantity] IS NULL AND @original_Quantity IS NULL))" InsertCommand="INSERT INTO [Steel Calculate] ([Name], [Diameter], [Length], [Nos], [Quantity]) VALUES (@Name, @Diameter, @Length, @Nos, @Quantity)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Steel Calculate] SET [Diameter] = @Diameter, [Length] = @Length, [Nos] = @Nos, [Quantity] = @Quantity WHERE [Name] = @original_Name AND (([Diameter] = @original_Diameter) OR ([Diameter] IS NULL AND @original_Diameter IS NULL)) AND (([Length] = @original_Length) OR ([Length] IS NULL AND @original_Length IS NULL)) AND (([Nos] = @original_Nos) OR ([Nos] IS NULL AND @original_Nos IS NULL)) AND (([Quantity] = @original_Quantity) OR ([Quantity] IS NULL AND @original_Quantity IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Diameter" Type="Double" />
                <asp:Parameter Name="original_Length" Type="Double" />
                <asp:Parameter Name="original_Nos" Type="Double" />
                <asp:Parameter Name="original_Quantity" Type="Double" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" Type="String" />
                <asp:Parameter Name="Diameter" Type="Double" />
                <asp:Parameter Name="Length" Type="Double" />
                <asp:Parameter Name="Nos" Type="Double" />
                <asp:Parameter Name="Quantity" Type="Double" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="FormView1" Name="Name" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Diameter" Type="Double" />
                <asp:Parameter Name="Length" Type="Double" />
                <asp:Parameter Name="Nos" Type="Double" />
                <asp:Parameter Name="Quantity" Type="Double" />
                <asp:Parameter Name="original_Name" Type="String" />
                <asp:Parameter Name="original_Diameter" Type="Double" />
                <asp:Parameter Name="original_Length" Type="Double" />
                <asp:Parameter Name="original_Nos" Type="Double" />
                <asp:Parameter Name="original_Quantity" Type="Double" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Name" DataSourceID="SqlDataSource3" Visible="False">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" />
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
                <asp:BoundField DataField="Diameter" HeaderText="Diameter" SortExpression="Diameter" />
                <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                <asp:BoundField DataField="Nos" HeaderText="Nos" SortExpression="Nos" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            </Columns>
        </asp:GridView>
</p>
<p>
</p>
</asp:Content>
