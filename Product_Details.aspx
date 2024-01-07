<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Product_Details.aspx.cs" Inherits="Food_Delivery_Website.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/ProductDetails.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--  --%>
    <asp:Repeater ID="Repeater1" runat="server"><ItemTemplate> 
    <div class="detailpage-container">
      <div class="product-container">
        <img src="./UploadedImages/<%#DataBinder.Eval(Container,"DataItem.item_image")%>" alt="Product Image" />
        <div class="detail-left">
          <div class="product-info">
            <div>
              <h2><%#DataBinder.Eval(Container,"DataItem.item_name")%></h2>
              <p>Price: ₹  <%#DataBinder.Eval(Container,"DataItem.item_price")%></p>
            </div>
            <div class="quantity-button" id="quantity-button">
              <div id="add-div">Add</div>
            </div>
            <div>
              <h2>Description:</h2>
              <p>
                <%#DataBinder.Eval(Container,"DataItem.item_description")%>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
        </ItemTemplate> </asp:Repeater>
    <%--  --%>
    <script src="js/ProductDetail.js"></script>
</asp:Content>
