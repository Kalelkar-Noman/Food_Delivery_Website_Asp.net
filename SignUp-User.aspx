﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="SignUp-User.aspx.cs" Inherits="Food_Delivery_Website.SignUp_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/signup.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="signup_container">
     <section class="signup_inner_container">
      <header>Registration Form</header>
      <section action="#" class="form">
        <div class="input-box">
          <label>Full Name</label>
            <asp:TextBox type="text" placeholder="Enter full name" required="true" ID="User_name" runat="server"></asp:TextBox>
          <%--<input type="text" placeholder="Enter full name" required />--%>
        </div>
        <div class="input-box">
          <label>Email Address</label>
          <input type="text" placeholder="Enter email address" required />
        </div>
           <div class="input-box otp-div">
               <%--<asp:Button ID="Button1" runat="server" Text="Get OTP" />--%>
               <%--<button id="otp_btn" >Get OTP</button>--%>
               <input id="otp_btn" type="button" value="Get OTP" />
               <asp:TextBox ID="Otp_inputbox" type="number" placeholder="Enter OTP" required="true" runat="server"></asp:TextBox>
          <%--<input type="number" placeholder="Enter OTP" required />--%>
        </div>
        <div class="column">
          <div class="input-box">
            <label>Phone Number</label>
              <asp:TextBox ID="Phone_number" type="number" placeholder="Enter phone number" required="true" runat="server"></asp:TextBox>
            <%--<input type="number" placeholder="Enter phone number" required />--%>
          </div>
       
        </div>
        <div class="gender-box">
          <h3>Gender</h3>
          <div class="gender-option">
            <div class="gender">
                <asp:RadioButton type="radio" ID="Check_male" GroupName="gender" runat="server" />
              <%--<input type="radio" id="check-male" name="gender" checked />--%>
              <label for="ContentPlaceHolder1_Check_male">male</label>
            </div>
            <div class="gender">
                <asp:RadioButton ID="Check_female" type="radio" runat="server" GroupName="gender" />
              <%--<input type="radio" id="check-female" name="gender" />--%>
              <label for="ContentPlaceHolder1_Check_female">Female</label>
            </div>
            <div class="gender">
                <asp:RadioButton ID="Check_other" GroupName="gender" checked="true" type="radio" runat="server" />
              <%--<input type="radio" id="check-other" name="gender" />--%>
              <label for="ContentPlaceHolder1_Check_other">prefer not to say</label>
            </div>
          </div>
        </div>
        <div class="input-box address">
          <label>Address</label>
            <asp:TextBox ID="Address_line1" type="text" placeholder="Enter street address" runat="server"></asp:TextBox>
          <%--<input type="text" placeholder="Enter street address" required />--%>
            <asp:TextBox ID="Address_line2" type="text" placeholder="Enter street address line 2" runat="server"></asp:TextBox>
          <%--<input type="text" placeholder="Enter street address line 2" required />--%>
          <div class="column">
              <asp:DropDownList CssClass="select-box" ID="Countrylist" runat="server">
                  <asp:listitem>India</asp:listitem>
                  <asp:ListItem>America</asp:ListItem>
                  <asp:listitem>Japan</asp:listitem>
                  <asp:listitem>Russia</asp:listitem>
                  <asp:listitem>China</asp:listitem>
                  <asp:listitem>Brazil</asp:listitem>
              </asp:DropDownList>

           <%-- <div class="select-box">
              <select>
                <option hidden>Country</option>
                <option>America</option>
                <option>Japan</option>
                <option>India</option>
                <option>Nepal</option>
              </select>
            </div>--%>
              <asp:TextBox ID="City_input" type="text" placeholder="Enter your city" runat="server"></asp:TextBox>
            <%--<input type="text" placeholder="Enter your city" required />--%>
          </div>
          <div class="column">
              <asp:TextBox ID="State_input" type="text" placeholder="Enter your state" runat="server"></asp:TextBox>
            <%--<input type="text" placeholder="Enter your state" required />--%>
              <asp:TextBox ID="Pin_input" type="number" placeholder="Enter pin code" runat="server"></asp:TextBox>
            <%--<input type="number" placeholder="Enter pin code" required />--%>
          </div>
        </div>
        <button>Submit</button>
      </section>
    </section>
    </div>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
    <script src="js/Signup.js"></script>
</asp:Content>
