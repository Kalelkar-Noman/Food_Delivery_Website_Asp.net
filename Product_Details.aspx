<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="Product_Details.aspx.cs" Inherits="Food_Delivery_Website.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/ProductDetails.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--  --%>
    <div class="detailpage-container">
      <div class="product-container">
        <img src="/img/pizza.png" alt="Product Image" />
        <div class="detail-left">
          <div class="product-info">
            <div>
              <h2>Product Name</h2>
              <p>Price: $12.99</p>
            </div>
            <div class="quantity-button" id="quantity-button">
              <div id="add-div">Add</div>
            </div>
            <div>
              <h2>Description:</h2>
              <p>
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit
                fugit in quos ea reiciendis itaque autem ipsa dolores! Vitae
                dolorum qui ratione sed unde, deleniti ipsam inventore
                voluptatibus dignissimos labore numquam. Porro, asperiores ad.
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%--  --%>
    <script src="js/ProductDetail.js"></script>
</asp:Content>
