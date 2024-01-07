<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Food_Delivery_Website.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/ContactUs.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="background">
    <div class="contactus_container">
      <div class="screen">
 
        <div class="screen-body">
          <div class="screen-body-item left">
            <div class="app-title">
              <span>CONTACT</span>
              <span>US</span>
            </div>
            <div class="app-contact">CONTACT INFO : +62 81 314 928 595</div>
          </div>
          <div class="screen-body-item">
            <div class="app-form">
              <div class="app-form-group">
                <input class="app-form-control" type="text" placeholder="NAME" >
              </div>
              <div class="app-form-group">
                <input class="app-form-control" type="email" placeholder="EMAIL">
              </div>
              <div class="app-form-group">
                <input class="app-form-control" type="text" placeholder="Subject">
              </div>
              <div class="app-form-group message">
                <input class="app-form-control" type="text" placeholder="MESSAGE">
              </div>
              <div class="app-form-group buttons">
                <%--<button class="app-form-button">CANCEL</button>--%>
                <button class="app-form-button" id="contactmail">SEND</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    
    </div>
  </div>
    <script src="js/contactus.js"></script>
</asp:Content>
