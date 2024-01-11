<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="CheckoutPage.aspx.cs" Inherits="Food_Delivery_Website.CheckoutPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Checkout.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Delivery_Page_Container headergap">
        <div class="Delivery_left">
            <div class="Delivery_profile del_shadows">
                <div class="del_p_img">
                    <i class="ri-user-follow-line"></i>
                    <h2>
                        <asp:Label ID="Label1" runat="server" Text="User"></asp:Label></h2>
                </div>
                <%--<div class="del_logout_btn"><button >Logout</button></div>--%>
            </div>
            <!-- address -->
            <div class="delivery_page_ad del_shadows">
                <div class="del_ad_heading">
                    <i class="ri-map-pin-2-line"></i>
                    <h2>Delivery Address</h2>
                </div>
                <div class="map">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d3768.143247952875!2d72.9770604951335!3d19.18894470859938!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sin!4v1704011280948!5m2!1sen!2sin"
                        style="border: 0"
                        allowfullscreen=""
                        loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
                <div class="del_address_text">
                    Lorem ipsum dolor, sit amet consectetur adipisicing elit. Qui
            voluptatum architecto molestias nihil, officiis exercitationem vel
            corporis velit ut expedita tempore modi facere excepturi enim totam
                </div>
                <div class="del_number">+919587412687</div>
                <button type="button">continue</button>
            </div>

            <!--  -->
        </div>
        <div class="Delivery_right">
            <div class="del_dialog del_shadows">
                <h2>Delivery Time</h2>
                <div class="del_mid_dialog">
                    <h4>Deliver Now</h4>
                    <p>Your order will be delivered within <b>45 minutes</b></p>
                </div>
            </div>
            <div class="del_items del_shadows">
                <%--<button class="minus-btn panel-btn">-</button><input class="panel-btn" type="number" min="1"><button class="plus-btn panel-btn">+</button>--%>
                <div class="del-cart-item">
                    <h3>Product Name</h3>
                    <div class="del-cart-side-panel">
                        <img src="/img/pizza.png" alt="Product Image" />
                        <div class="del-sidepanel-quantity-price">
                            <p class="del-price">$19.99</p>
                            <div class="del-quantity">
                                <button class="del-minus-btn del2panel-btn">-</button>
                                <input class="del-panel-btn del2panel-btn" type="number" value="1" min="1" />
                                <button class="del-plus-btn del2panel-btn ">+</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%--  --%>
                <div class="bill">
                    <div>Items price</div>
                    <div class="txt_end">$447.00</div>
                    <div>Packaging Fee</div>
                    <div class="txt_end">+$37.00</div>
                    <div>GST(5%)</div>
                    <div class="txt_end">+$24.00</div>
                    <div>CGST(2.5)</div>
                    <div class="txt_end">$12.10</div>
                    <div>SGST(2.5)</div>
                    <div class="txt_end">$12.10</div>
                </div>
                <hr />
                <div class="bill final_amt">
                    <h2>Payable</h2>
                    <h2 class="txt_end">$508.00</h2>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
