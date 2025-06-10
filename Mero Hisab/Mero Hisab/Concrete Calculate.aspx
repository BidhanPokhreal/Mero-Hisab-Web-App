<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Concrete Calculate.aspx.cs" Inherits="last_hour.Concrete_Calculate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    &nbsp; &nbsp;<asp:Label ID="LabelConcreteCalculateSheet" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ForeColor="Black" Text="Concrete Calculate Sheet"></asp:Label>
</p>
    <asp:FormView ID="FormViewname" runat="server" DataKeyNames="LoginUser" DataSourceID="SqlDataSource1">
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="LabelRatio" runat="server" Text="Type of Concrete"></asp:Label>
&nbsp;
        <asp:DropDownList ID="DropDownListTypeOfConcrete" runat="server" BackColor="#FF6600">
            <asp:ListItem Value="5.5">M20(1:1.5:3)</asp:ListItem>
            <asp:ListItem Value="7">M15(1:2:4)</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<p>
&nbsp; <asp:Label ID="LabelLength" runat="server" Text="Length" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBoxLength" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ValidationGroup="concretevalidate"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorlength" runat="server" ErrorMessage="Field Cannot be Empy" ValidationGroup="concretevalidate" ControlToValidate="TextBoxLength" ForeColor="#000066" BackColor="Red"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorLength" runat="server" ControlToValidate="TextBoxLength" ErrorMessage="Invalid Input" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ValidationGroup="concretevalidate" BackColor="Red"></asp:RegularExpressionValidator>
</p>
<p>
&nbsp;
    <asp:Label ID="LabelBreadth" runat="server" Text="Breadth" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBoxBreadth" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ValidationGroup="concretevalidate"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorbreadth" runat="server" ErrorMessage="Field Cannot be Empy" ValidationGroup="concretevalidate" ControlToValidate="TextBoxBreadth" ForeColor="#000066" BackColor="Red"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorBreadth" runat="server" ControlToValidate="TextBoxBreadth" ErrorMessage="Invalid Input" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ValidationGroup="concretevalidate" BackColor="Red"></asp:RegularExpressionValidator>
</p>
<p>
&nbsp;&nbsp;
    <asp:Label ID="LabelDepth" runat="server" Text="Depth" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBoxDepth" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ValidationGroup="concretevalidate"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatordepth" runat="server" ErrorMessage="Field Cannot be Empy" ValidationGroup="concretevalidate" ControlToValidate="TextBoxDepth" ForeColor="#000066" BackColor="Red"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorDepth" runat="server" ControlToValidate="TextBoxDepth" ErrorMessage="Invalid Input" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ValidationGroup="concretevalidate" BackColor="Red"></asp:RegularExpressionValidator>
</p>
<p>
    &nbsp;</p>
<p>
    <asp:Button ID="ButtonCalculateVolume" runat="server" OnClick="ButtonCalculate_Click" Text="Calculate Dry Volume" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ValidationGroup="concretevalidate" UseSubmitBehavior="False" />
    <asp:Button ID="ButtonCalculateArea" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" OnClick="Button1_Click" Text="Calculate Area" ValidationGroup="concretevalidate" UseSubmitBehavior="False" />
</p>
<p>
    <asp:TextBox ID="TextBoxResultDryVolume" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ReadOnly="True" ValidationGroup="group 1"></asp:TextBox>
&nbsp;<asp:Label ID="LabelCuM" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="Cu.M"></asp:Label>
&nbsp;
    <asp:TextBox ID="TextBoxResultArea" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ReadOnly="True" ValidationGroup="group 1"></asp:TextBox>
&nbsp;
    <asp:Label ID="LabelSqM" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="Sq.M"></asp:Label>
</p>
    <p>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" BackColor="Red" ControlToValidate="TextBoxResultDryVolume" ErrorMessage="Field cannot be empty" ValidationGroup="group 1"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" BackColor="Red" ControlToValidate="TextBoxResultArea" ErrorMessage="Field cannot be empty" ValidationGroup="group 1"></asp:RequiredFieldValidator>
    </p>
    <asp:Button ID="ButtonWetVolumeOfMixture" runat="server" OnClick="ButtonWetVolumeOfMixture_Click" Text="Calculate Wet Volume of Mixture" ValidationGroup="concretevalidate" BackColor="#FF6600" UseSubmitBehavior="False" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonDryVolumeOfCement" runat="server" OnClick="Button1_Click1" Text="Dry Volume of Cement" ValidationGroup="DryVolume" BackColor="#FF6600" UseSubmitBehavior="False" />
    <br />
    <br />
    <asp:TextBox ID="TextBoxWetVolumeMix" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ValidationGroup="group 1" ReadOnly="True"></asp:TextBox>
    &nbsp;<asp:Label ID="LabelCuM0" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="Cu.M"></asp:Label>
    &nbsp;&nbsp;
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDryVolume" runat="server" ControlToValidate="TextBoxWetVolumeMix" ErrorMessage="Field cannot be empty" ForeColor="#000066" ValidationGroup="group 1" BackColor="Red"></asp:RequiredFieldValidator>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBoxDryVolumeOfCementCuM" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ReadOnly="True" ValidationGroup="group 1"></asp:TextBox>
    <asp:Label ID="LabelCuM1" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="Cu.M"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BackColor="Red" ControlToValidate="TextBoxDryVolumeOfCementCuM" ErrorMessage="Field cannot be empty" ValidationGroup="group 1"></asp:RequiredFieldValidator>
    <br />
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="ButtonDryVolumeOfSand" runat="server" OnClick="Button1_Click2" Text="Dry Volume Of Sand" ValidationGroup="DryVolume" BackColor="#FF6600" UseSubmitBehavior="False" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonDryVolumeOfAggregate" runat="server" OnClick="Button2_Click" Text="Dry Volume Of Aggregate" ValidationGroup="DryVolume" BackColor="#FF6600" UseSubmitBehavior="False" />
    </p>
    <p>
    <asp:TextBox ID="TextBoxDryVolumeOfSandCuM" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ReadOnly="True" ValidationGroup="group 1"></asp:TextBox>
    &nbsp;<asp:Label ID="LabelCuM2" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="Cu.M"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BackColor="Red" ControlToValidate="TextBoxDryVolumeOfSandCuM" ErrorMessage="Field cannot be empty" ValidationGroup="group 1"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBoxDryVolumeOfAggregateCuM" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" ReadOnly="True" ValidationGroup="group 1"></asp:TextBox>
    <asp:Label ID="LabelCuM3" runat="server" BackColor="#FF6600" BorderColor="#006600" BorderStyle="Double" Text="Cu.M"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" BackColor="Red" ControlToValidate="TextBoxDryVolumeOfAggregateCuM" ErrorMessage="Field cannot be empty" ValidationGroup="group 1"></asp:RequiredFieldValidator>
    </p>
    <p>
        &nbsp;</p>
    <p>
        <asp:Button ID="Buttonsave" runat="server" BackColor="#FF6600" Height="58px" OnClick="Buttonsave_Click" Text="save" ValidationGroup="group 1" Width="83px" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Buttonreset" runat="server" BackColor="#FF6600" Height="60px" OnClick="Buttonreset_Click" Text="reset" Width="93px" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Buttonview" runat="server" BackColor="#FF6600" Height="60px" OnClick="Buttonview_Click" Text="view" Width="92px" />
    </p>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:FYPConnectionString %>" SelectCommand="SELECT * FROM [concrete_calculate] WHERE ([name] = @name)">
        <SelectParameters>
            <asp:ControlParameter ControlID="FormViewname" Name="name" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
<p>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Visible="False">
        <Columns>
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="length" HeaderText="length" SortExpression="length" />
            <asp:BoundField DataField="breadth" HeaderText="breadth" SortExpression="breadth" />
            <asp:BoundField DataField="depth" HeaderText="depth" SortExpression="depth" />
            <asp:BoundField DataField="dry_volume" HeaderText="dry_volume" SortExpression="dry_volume" />
            <asp:BoundField DataField="area" HeaderText="area" SortExpression="area" />
            <asp:BoundField DataField="wet_volume" HeaderText="wet_volume" SortExpression="wet_volume" />
            <asp:BoundField DataField="cement" HeaderText="cement" SortExpression="cement" />
            <asp:BoundField DataField="sand" HeaderText="sand" SortExpression="sand" />
            <asp:BoundField DataField="aggregate" HeaderText="aggregate" SortExpression="aggregate" />
        </Columns>
    </asp:GridView>
</p>
</asp:Content>
