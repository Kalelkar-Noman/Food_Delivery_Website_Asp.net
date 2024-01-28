<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Main_Page.aspx.cs" Inherits="Food_Delivery_Website.Main_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/mainpage.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- main --%>

    <div class="mainpage-container headergap">
        <div class="carousel-prev">
            <div class="carousel-arrow"><</div>
        </div>
        <div class="carousel-next">
            <div class="carousel-arrow">></div>
        </div>
        <div class="carousel-items">

            <asp:LinkButton ID="Inner_Menu" runat="server" CssClass="inner-con inner-con-active" CommandArgument="%%" OnClick="Inner_Menu_Click">  
                        <div class="menu-scroller"><span class="category_icon">All</span></div>
                        <p class="mybtn">All</p>
            </asp:LinkButton>
            <asp:Repeater ID="Repeater1" runat="server">
                <ItemTemplate>
                    <%--<div class="inner-con" >--%>
                    <asp:LinkButton ID="Inner_Menu" runat="server" CssClass="inner-con" CommandArgument='<%#DataBinder.Eval(Container,"DataItem.item_category")%>' OnClick="Inner_Menu_Click">
     
                        <div class="menu-scroller"><span class="category_icon"><%#DataBinder.Eval(Container,"DataItem.item_category")%></span></div>
                        <p class="mybtn"><%#DataBinder.Eval(Container,"DataItem.item_category")%></p>
                           
                    </asp:LinkButton>
                    <%--</div>--%>
                </ItemTemplate>

            </asp:Repeater>


        </div>
    </div>
    <div class="product-cards">


        <asp:Repeater ID="Repeater2" runat="server">
            <ItemTemplate>
                <div class="product-card">
                    <div class="badge">Hot</div>
                    <asp:HyperLink CssClass="product-tumb" ID="Link_to_Details" NavigateUrl='<%# "~/Product_Details.aspx?ProductId=" + DataBinder.Eval(Container, "DataItem.item_id") %>' runat="server">
            <%--<div class="product-tumb">--%>
                <img src="./UploadedImages/<%#DataBinder.Eval(Container,"DataItem.item_image")%>" alt="" />
            <%--</div>--%>
                    </asp:HyperLink>
                    <div class="product-details">
                        <span class="product-catagory"><%#DataBinder.Eval(Container,"DataItem.item_category")%></span>
                        <h4><a href="#"><%#DataBinder.Eval(Container,"DataItem.item_name")%></a></h4>
                        <p>
                            <%#DataBinder.Eval(Container,"DataItem.item_description")%>
                        </p>
                        <div class="product-bottom-details">
                            <div class="product-price"><small>$96.00</small>$<%#DataBinder.Eval(Container,"DataItem.item_price")%></div>
                            <div class="product-links">

                                <a href="#" class="for-asp-access" data-id=<%#DataBinder.Eval(Container,"DataItem.item_id")%> data-image="./UploadedImages/<%#DataBinder.Eval(Container,"DataItem.item_image")%>" data-price=<%#DataBinder.Eval(Container,"DataItem.item_price")%> data-product-name=<%#DataBinder.Eval(Container,"DataItem.item_name")%> id='shop-btn-<%#DataBinder.Eval(Container,"DataItem.item_id")%>'><i class="ri-shopping-cart-fill"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <%--  --%>

    <button class="open-button" id="cart-button">
        <svg
            class="icon-cart"
            viewBox="0 0 24.38 30.52"
            height="30.52"
            width="24.38"
            xmlns="http://www.w3.org/2000/svg">
            <title>icon-cart</title>
            <path
                transform="translate(-3.62 -0.85)"
                d="M28,27.3,26.24,7.51a.75.75,0,0,0-.76-.69h-3.7a6,6,0,0,0-12,0H6.13a.76.76,0,0,0-.76.69L3.62,27.3v.07a4.29,4.29,0,0,0,4.52,4H23.48a4.29,4.29,0,0,0,4.52-4ZM15.81,2.37a4.47,4.47,0,0,1,4.46,4.45H11.35a4.47,4.47,0,0,1,4.46-4.45Zm7.67,27.48H8.13a2.79,2.79,0,0,1-3-2.45L6.83,8.34h3V11a.76.76,0,0,0,1.52,0V8.34h8.92V11a.76.76,0,0,0,1.52,0V8.34h3L26.48,27.4a2.79,2.79,0,0,1-3,2.44Zm0,0">
            </path>
        </svg>
    </button>
    <div id="mySidepanel" class="sidepanel headergap">
        <a href="#" class="closebtn" id="cart-close">×</a>
        <!-- <p>This is the side panel content.</p> -->
        <%--<div class="cart-item">
            <h3>Product Name</h3>
            <div class="cart-side-panel">
                <img src="/img/pizza.png" alt="Product Image" />
                <div class="sidepanel-quantity-price">
                    <p class="price">$19.99</p>
                    <div class="quantity">
                        <button class="minus-btn panel-btn">-</button>
                        <input class="panel-btn" type="number" value="1" min="1" />
                        <button class="plus-btn panel-btn">+</button>
                    </div>
                </div>
            </div>
        </div>--%>
        <!--  -->
    </div>

    <%-- main --%>
    <script src="js/mainpage.js"> </script>
    <script> document.title = "HomePage";</script>
</asp:Content>
