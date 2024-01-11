<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Food_Delivery_Website.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/admin_css.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="admin_container" class="headergap">
        <div class="admin_input_conatiner">
            <div class="admin_img_preview">
                <asp:Image ID="Image_preview" runat="server" />
            </div>
            <asp:FileUpload ID="Item_image" runat="server" />
            <asp:TextBox ID="Item_id" type="number" placeholder="Id : dont't enter when inserting" runat="server"></asp:TextBox>
            <asp:TextBox ID="Item_name" type="text" placeholder="Enter Product Name" runat="server"></asp:TextBox>
            <asp:TextBox ID="Item_price" type="number" placeholder="Enter Product Price" runat="server"></asp:TextBox>
            <asp:TextBox ID="Item_category" type="text" placeholder="Enter Product Category" runat="server"></asp:TextBox>
            <asp:TextBox ID="Item_description" type="text" placeholder="Enter Product description" runat="server"></asp:TextBox>
            <div class="admin_button_container">
                <asp:Button ID="admin_add_submit" runat="server" Text="Add" OnClick="Admin_add_submit_Click" />
                <asp:Button ID="admin_update_submit" runat="server" Text="Update" OnClick="Admin_update_submit_Click" />
                <asp:Button ID="admin_search_submit" runat="server" Text="Search" OnClick="Admin_search_submit_Click" />
                <asp:Button ID="admin_delete_submit" runat="server" Text="Delete" OnClick="Admin_delete_submit_Click" />
            </div>

        </div>
        <div class="admin_preview">
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
        </div>
    </div>
    <%--  --%>
    <script src="js/admin_page.js"></script>
    <script> document.title = "Admin Page";</script>
</asp:Content>
