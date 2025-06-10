<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Carpenting.aspx.cs" Inherits="last_hour.Carpenting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
        Carpenting Works:</p>
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
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
&nbsp;<asp:Label ID="LabelLength" runat="server" Text="Length" ForeColor="#000066"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBoxLength" runat="server" ValidationGroup="CarpentingValidate" BackColor="#FF6600" BorderColor="#006600" ForeColor="#000066"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorlength" runat="server" ControlToValidate="TextBoxLength" ErrorMessage="Field Cannot be Empy" ForeColor="#000066" ValidationGroup="CarpentingValidate" BackColor="#FF3300"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorLength" runat="server" ControlToValidate="TextBoxLength" ErrorMessage="Invalid Input" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ValidationGroup="CarpentingValidate" BackColor="#FF3300"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="LabelLength0" runat="server" Text="Breadth" ForeColor="#000066"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBoxBreadth" runat="server" ValidationGroup="CarpentingValidate" BackColor="#FF6600" BorderColor="#006600" ForeColor="#000066"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorBreadth" runat="server" ControlToValidate="TextBoxBreadth" ErrorMessage="Field Cannot be Empy" ForeColor="#000066" ValidationGroup="CarpentingValidate" BackColor="#FF3300"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorBreadth" runat="server" ControlToValidate="TextBoxBreadth" ErrorMessage="Invalid Input" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ValidationGroup="CarpentingValidate" BackColor="#FF3300"></asp:RegularExpressionValidator>
    <br />
    <asp:Label ID="LabelLength1" runat="server" Text="Depth/Height" ForeColor="#000066"></asp:Label>
&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBoxDepth" runat="server" ValidationGroup="CarpentingValidate" BackColor="#FF6600" BorderColor="#006600" ForeColor="#000066"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorDepth" runat="server" ControlToValidate="TextBoxDepth" ErrorMessage="Field Cannot be Empy" ForeColor="#000066" ValidationGroup="CarpentingValidate" BackColor="#FF3300"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidatorDepth" runat="server" ControlToValidate="TextBoxDepth" ErrorMessage="Invalid Input" ValidationExpression="^[0-9]\d{0,9}(\.\d{1,3})?%?$" ValidationGroup="CarpentingValidate" BackColor="#FF3300"></asp:RegularExpressionValidator>
    <br />
    <p>
        <asp:Button ID="ButtonCalculateVolume" runat="server" OnClick="ButtonCalculateVolume_Click" Text="Calculate Quantity" ValidationGroup="CarpentingValidate" BackColor="#FF6600" BorderColor="#006600" ForeColor="#000066" />
    </p>
    <asp:TextBox ID="TextBoxVolumeCuM" runat="server" BackColor="#FF6600" BorderColor="#006600" ForeColor="#000066"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
    <asp:Label ID="LabelCuM" runat="server" Text="Cu.M" ForeColor="#000066"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" BackColor="Red" ControlToValidate="TextBoxVolumeCuM" ErrorMessage="Field cannot be empty" ValidationGroup="CarpentingValidate1"></asp:RequiredFieldValidator>
    <br />
    <asp:TextBox ID="TextBoxVolumeCuFt" runat="server" BackColor="#FF6600" BorderColor="#006600" ForeColor="#000066"></asp:TextBox>
    <asp:Label ID="LabelCuFt" runat="server" Text="Cu.Ft" ForeColor="#000066"></asp:Label>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" BackColor="Red" ControlToValidate="TextBoxVolumeCuFt" ErrorMessage="Field cannot be empty" ValidationGroup="CarpentingValidate1"></asp:RequiredFieldValidator>
    <br />
    <br />
        <asp:Button ID="ButtonSave" runat="server" OnClick="ButtonSave_Click" Text="Save" BackColor="#FF6600" BorderColor="#006600" ForeColor="#000066" ValidationGroup="CarpentingValidate1" Height="63px" Width="79px" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="ButtonReset" runat="server" OnClick="Button2_Click" Text="Reset Data" BackColor="#FF6600" BorderColor="#006600" ForeColor="#000066" Height="66px" Width="156px" />
    &nbsp;
    <asp:Button ID="ButtonView" runat="server" BackColor="#FF6600" OnClick="ButtonView_Click" Text="View" Height="70px" Width="80px" />
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:FYPConnectionString %>" SelectCommand="SELECT * FROM [Carpenting] WHERE ([Name] = @Name)" ConflictDetection="CompareAllValues" DeleteCommand="DELETE FROM [Carpenting] WHERE [Name] = @original_Name AND (([Length] = @original_Length) OR ([Length] IS NULL AND @original_Length IS NULL)) AND (([Breadth] = @original_Breadth) OR ([Breadth] IS NULL AND @original_Breadth IS NULL)) AND (([Depth] = @original_Depth) OR ([Depth] IS NULL AND @original_Depth IS NULL)) AND (([Volume1] = @original_Volume1) OR ([Volume1] IS NULL AND @original_Volume1 IS NULL)) AND (([Volume2] = @original_Volume2) OR ([Volume2] IS NULL AND @original_Volume2 IS NULL))" InsertCommand="INSERT INTO [Carpenting] ([Name], [Length], [Breadth], [Depth], [Volume1], [Volume2]) VALUES (@Name, @Length, @Breadth, @Depth, @Volume1, @Volume2)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [Carpenting] SET [Length] = @Length, [Breadth] = @Breadth, [Depth] = @Depth, [Volume1] = @Volume1, [Volume2] = @Volume2 WHERE [Name] = @original_Name AND (([Length] = @original_Length) OR ([Length] IS NULL AND @original_Length IS NULL)) AND (([Breadth] = @original_Breadth) OR ([Breadth] IS NULL AND @original_Breadth IS NULL)) AND (([Depth] = @original_Depth) OR ([Depth] IS NULL AND @original_Depth IS NULL)) AND (([Volume1] = @original_Volume1) OR ([Volume1] IS NULL AND @original_Volume1 IS NULL)) AND (([Volume2] = @original_Volume2) OR ([Volume2] IS NULL AND @original_Volume2 IS NULL))">
        <DeleteParameters>
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Length" Type="Double" />
            <asp:Parameter Name="original_Breadth" Type="Double" />
            <asp:Parameter Name="original_Depth" Type="Double" />
            <asp:Parameter Name="original_Volume1" Type="String" />
            <asp:Parameter Name="original_Volume2" Type="Double" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Length" Type="Double" />
            <asp:Parameter Name="Breadth" Type="Double" />
            <asp:Parameter Name="Depth" Type="Double" />
            <asp:Parameter Name="Volume1" Type="String" />
            <asp:Parameter Name="Volume2" Type="Double" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="FormView1" Name="Name" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Length" Type="Double" />
            <asp:Parameter Name="Breadth" Type="Double" />
            <asp:Parameter Name="Depth" Type="Double" />
            <asp:Parameter Name="Volume1" Type="String" />
            <asp:Parameter Name="Volume2" Type="Double" />
            <asp:Parameter Name="original_Name" Type="String" />
            <asp:Parameter Name="original_Length" Type="Double" />
            <asp:Parameter Name="original_Breadth" Type="Double" />
            <asp:Parameter Name="original_Depth" Type="Double" />
            <asp:Parameter Name="original_Volume1" Type="String" />
            <asp:Parameter Name="original_Volume2" Type="Double" />
        </UpdateParameters>
    </asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Name" DataSourceID="SqlDataSource3" ForeColor="#000066" Visible="False">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name" />
            <asp:BoundField DataField="Length" HeaderText="Length" SortExpression="Length" />
            <asp:BoundField DataField="Breadth" HeaderText="Breadth" SortExpression="Breadth" />
            <asp:BoundField DataField="Depth" HeaderText="Depth" SortExpression="Depth" />
            <asp:BoundField DataField="Volume1" HeaderText="Volume1" SortExpression="Volume1" />
            <asp:BoundField DataField="Volume2" HeaderText="Volume2" SortExpression="Volume2" />
        </Columns>
    </asp:GridView>
    <br />
    <p>
    </p>
</asp:Content>
