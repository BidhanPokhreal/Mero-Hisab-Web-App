<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Brick Calculator.aspx.cs" Inherits="last_hour.Brick_Calculator" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:Label ID="LabelBrickCalculator" runat="server" Text="Brick Calculator"></asp:Label>
    </p>
    <p>
        <asp:FormView ID="FormView2" runat="server" DataKeyNames="LoginUser" DataSourceID="SqlDataSource2">
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
    </p>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:FYPConnectionString %>" SelectCommand="SELECT * FROM [LoginUser]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FYPConnectionString %>" SelectCommand="SELECT * FROM [Brick_Calculator]"></asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <p>
        <asp:Label ID="LabelLength" runat="server" Text="Length Of Wall"></asp:Label>
&nbsp;
        <asp:TextBox ID="TextBoxLength" runat="server" ValidationGroup="BrickValidation" BackColor="#FF6600"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorLength" runat="server" ControlToValidate="TextBoxLength" ErrorMessage="Field cannot be empty" ValidationGroup="BrickValidation"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatorLength" runat="server" ControlToValidate="TextBoxLength" ErrorMessage="Invalid Input" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ValidationGroup="BrickValidation"></asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="LabelBreadth" runat="server" Text="Breadth Of Wall"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxBreadth" runat="server" ValidationGroup="BrickValidation" BackColor="#FF6600"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorBreadth" runat="server" ControlToValidate="TextBoxBreadth" ErrorMessage="Field cannot be empty" ValidationGroup="BrickValidation"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatoBreadth" runat="server" ControlToValidate="TextBoxBreadth" ErrorMessage="Invalid Input" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ValidationGroup="BrickValidation"></asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="LabelDepth" runat="server" Text="Depth/Thickness Of Wall"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBoxDepth" runat="server" ValidationGroup="BrickValidation" BackColor="#FF6600"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDepth" runat="server" ControlToValidate="TextBoxDepth" ErrorMessage="Field cannot be empty" ValidationGroup="BrickValidation"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidatorDepth" runat="server" ControlToValidate="TextBoxDepth" ErrorMessage="Invalid Input" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ValidationGroup="BrickValidation"></asp:RegularExpressionValidator>
    </p>
    <p>
        <asp:Label ID="LabelMortar" runat="server" Text="Mortar Ratio"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownListMortar" runat="server" BackColor="#FF6600">
            <asp:ListItem>1:4</asp:ListItem>
            <asp:ListItem>1:6</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        <br />
        &nbsp;```</p>
    <p>
        <asp:Button ID="ButtonVolume" runat="server" OnClick="ButtonVolume_Click" Text="Brick Volume" ValidationGroup="BrickValidation" BackColor="#FF6600" />
&nbsp;
        <asp:TextBox ID="TextBoxVolume" runat="server" ValidationGroup="VolumeValidator" ReadOnly="True" BackColor="#FF6600"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Text="Cu.M" BorderColor="#000066"></asp:Label>
&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorVolume" runat="server" ControlToValidate="TextBoxVolume" ErrorMessage="Calculate Volume First" ValidationGroup="BrickValidator"></asp:RequiredFieldValidator>
    </p>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="No. Of Bricks" ValidationGroup="VolumeValidator" BackColor="#FF6600" />
&nbsp;
    <asp:TextBox ID="TextBoxNoOfBricks" runat="server" ValidationGroup="BrickValidator" ReadOnly="True" BackColor="#FF6600"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="Label3" runat="server" Text="Nos." BorderColor="#000066"></asp:Label>
&nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBricks" runat="server" ControlToValidate="TextBoxNoOfBricks" ErrorMessage="Calculate No. Of Bricks First" ValidationGroup="BrickValidator"></asp:RequiredFieldValidator>
&nbsp;<p>
        <asp:Button ID="ButtonMortar" runat="server" OnClick="ButtonMortar_Click" Text="Volume Of Mortar" ValidationGroup="BrickValidator" BackColor="#FF6600" />
&nbsp;
        <asp:TextBox ID="TextBoxVolumeOfMortar" runat="server" ValidationGroup="Mortar" ReadOnly="True" BackColor="#FF6600"></asp:TextBox>
&nbsp;
        <asp:Label ID="Label4" runat="server" Text="Cu.M" BorderColor="#000066"></asp:Label>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidatorMortar" runat="server" ControlToValidate="TextBoxVolumeOfMortar" ErrorMessage="Calculate Mortar First" ValidationGroup="BrickValidator"></asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Button ID="ButtonCalculateCement" runat="server" OnClick="ButtonCalculateCement_Click" Text="Calculate Cement" ValidationGroup="Mortar" BackColor="#FF6600" />
&nbsp;
        <asp:TextBox ID="TextBoxCement" runat="server" ReadOnly="True" BackColor="#FF6600"></asp:TextBox>
&nbsp;<asp:Label ID="Label5" runat="server" Text="Cu.M" BorderColor="#000066"></asp:Label>
    </p>
    <p>
        <asp:Button ID="ButtonCalculateSand" runat="server" OnClick="ButtonCalculateSand_Click" Text="Calculate Sand" ValidationGroup="Mortar" BackColor="#FF6600" />
&nbsp;
        <asp:TextBox ID="TextBoxSand" runat="server" ReadOnly="True" BackColor="#FF6600"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Label ID="Label6" runat="server" Text="Cu.M" BorderColor="#000066"></asp:Label>
    </p>
    <p>
    </p>
    <p>
        <asp:Button ID="ButtonSave" runat="server" OnClick="ButtonSave_Click" Text="Save" BackColor="#FF6600" Height="57px" Width="103px" ValidationGroup="BrickValidator" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonReset" runat="server" OnClick="Button2_Click" Text="Reset Data" BackColor="#FF6600" Height="58px" Width="159px" />
&nbsp;<asp:Button ID="Button2" runat="server" OnClick="Button2_Click1" Text="View data" BackColor="#FF6600" Height="65px" Width="136px" />
    </p>
<p>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:FYPConnectionString %>" SelectCommand="SELECT * FROM [Brick_Calculator] WHERE ([name] = @name)">
            <SelectParameters>
                <asp:ControlParameter ControlID="FormView2" Name="name" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Visible="False" Font-Bold="True" Font-Italic="True" Font-Names="Algerian" Font-Size="Large" ForeColor="#000066">
            <Columns>
                <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
                <asp:BoundField DataField="Breadth" HeaderText="Breadth" SortExpression="Breadth" />
                <asp:BoundField DataField="Thickness" HeaderText="Thickness" SortExpression="Thickness" />
                <asp:BoundField DataField="Ratio" HeaderText="Ratio" SortExpression="Ratio" />
                <asp:BoundField DataField="Brick Volume" HeaderText="Brick Volume" SortExpression="Brick Volume" />
                <asp:BoundField DataField="No Of Bricks" HeaderText="No Of Bricks" SortExpression="No Of Bricks" />
                <asp:BoundField DataField="Mortar Volume" HeaderText="Mortar Volume" SortExpression="Mortar Volume" />
                <asp:BoundField DataField="Cement(Cu.M)" HeaderText="Cement(Cu.M)" SortExpression="Cement(Cu.M)" />
                <asp:BoundField DataField="Sand(Cu.M)" HeaderText="Sand(Cu.M)" SortExpression="Sand(Cu.M)" />
                <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            </Columns>
            <FooterStyle BackColor="#FF6600" />
        </asp:GridView>
    </p>
<p>
        &nbsp;</p>
    <p>
    </p>
</asp:Content>
