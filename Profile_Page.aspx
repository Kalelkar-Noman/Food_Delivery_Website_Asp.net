﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Profile_Page.aspx.cs" Inherits="Food_Delivery_Website.Profile_Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/Profile_page.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="profile_page_container">
      <div class="card bg-secondary shadow">
        <div class="card-header bg-white border-0">
          <div class="row align-items-center">
            <div class="col-8">
              <h3 class="mb-0">My account</h3>
            </div>
            <div class="col-4 text-right">
              <!-- <a href="#!" class="btn btn-sm btn-primary">Settings</a> -->
                <asp:Button CssClass="btn btn-sm btn-primary" ID="Button1" runat="server" Text="Edit" />
                <asp:Button CssClass="btn btn-sm btn-primary" ID="Button2" runat="server" Text="Save" />
             <%-- <button class="btn btn-sm btn-primary">edit</button
              ><button class="btn btn-sm btn-primary">save</button>--%>
            </div>
          </div>
        </div>
        <div class="card-body">
         
            <h6 class="heading-small text-muted mb-4">User information</h6>
            <div class="pl-lg-4">
              <div class="row">
                <div class="col-lg-6">
                  <div class="form-group focused">
                    <label class="form-control-label" for="input-username"
                      >Phone Number</label
                    >
                      <asp:TextBox  type="number" ID="Input_number" CssClass="form-control form-control-alternative"  placeholder="Phone Number" runat="server"></asp:TextBox>
                   <%-- <input
                      type="number"
                      id="input-number"
                      class="form-control form-control-alternative"
                      placeholder="Phone Number"
                    />--%>
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="form-group">
                    <label class="form-control-label" for="input-email"
                      >Email address</label
                    >
                      <asp:TextBox type="email" ID="Input_email" CssClass="form-control form-control-alternative"  placeholder="xyz@example.com" runat="server"></asp:TextBox>
                  <%--  <input
                      type="email"
                      id="input-email"
                      class="form-control form-control-alternative"
                      placeholder="xyz@example.com"
                    />--%>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group focused">
                    <label class="form-control-label" for="input-first-name"
                      >Your name</label
                    >
                      <asp:TextBox type="text" ID="Input_name" CssClass="form-control form-control-alternative" placeholder="name" runat="server"></asp:TextBox>
                   <%-- <input
                      type="text"
                      id="input-first-name"
                      class="form-control form-control-alternative"
                      placeholder="First name"
                    />--%>
                  </div>
                </div>
              <%--  <div class="col-lg-6">
                  <div class="form-group focused">
                    <label class="form-control-label" for="input-last-name"
                      >Last name</label
                    >
                    <input
                      type="text"
                      id="input-last-name"
                      class="form-control form-control-alternative"
                      placeholder="Last name"
                    />
                  </div>
                </div>--%>
              </div>
            </div>
            <hr class="my-4" />
            <!-- Address -->
            <h6 class="heading-small text-muted mb-4">Contact information</h6>
            <div class="pl-lg-4">
              <div class="row">
                <div class="col-md-12">
                  <div class="form-group focused">
                    <label class="form-control-label" for="input-address"
                      >Address</label
                    >
                      <asp:TextBox ID="input_address" CssClass="form-control form-control-alternative" placeholder="Home Address" type="text" runat="server"></asp:TextBox>
                    <%--<input
                      id="input-address"
                      class="form-control form-control-alternative"
                      placeholder="Home Address"
                      type="text"
                    />--%>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-4">
                  <div class="form-group focused">
                    <label class="form-control-label" for="input-city"
                      >City</label
                    >
                      <asp:TextBox ID="Input_city" type="text" CssClass="form-control form-control-alternative" placeholder="City" runat="server"></asp:TextBox>
                    <%--<input
                      type="text"
                      id="input-city"
                      class="form-control form-control-alternative"
                      placeholder="City"
                    />--%>
                  </div>
                </div>
                  <div class="col-lg-4">
                  <div class="form-group focused">
                    <label class="form-control-label" for="input-city"
                      >City</label
                    >
                      <asp:TextBox type="text" ID="Input_state" CssClass="form-control form-control-alternative" placeholder="State" runat="server"></asp:TextBox>
                    <%--<input
                      type="text"
                      id="input-state"
                      class="form-control form-control-alternative"
                      placeholder="State"
                    />--%>
                  </div>
                </div>
                <div class="col-lg-4">
                  <div class="form-group focused">
                    <label class="form-control-label" for="input-country"
                      >Country</label
                    >
                      <asp:TextBox type="text" ID="Input_country" CssClass="form-control form-control-alternative" placeholder="Country" runat="server"></asp:TextBox>
                    <%--<input
                      type="text"
                      id="input-country"
                      class="form-control form-control-alternative"
                      placeholder="Country"
                    />--%>
                  </div>
                </div>
                <div class="col-lg-4">
                  <div class="form-group">
                    <label class="form-control-label" for="input-country"
                      >Pin code</label
                    >
                      <asp:TextBox type="number" CssClass="form-control form-control-alternative"  placeholder="Pin code" ID="Input_pincode" runat="server"></asp:TextBox>
                    <%--<input
                      type="number"
                      id="input-postal-code"
                      class="form-control form-control-alternative"
                      placeholder="Pin code"
                    />--%>
                  </div>
                </div>
              </div>
            </div>
            <hr class="my-4" />
            <!-- Description -->
            <!-- <h6 class="heading-small text-muted mb-4">About me</h6>
            <div class="pl-lg-4">
              <div class="form-group focused">
                <label>About Me</label>
                <textarea
                  rows="4"
                  class="form-control form-control-alternative"
                  placeholder="A few words about you ..."
                >
A beautiful Dashboard for Bootstrap 4. It is Free and Open Source.</textarea
                >
              </div>
            </div> -->
   
        </div>
      </div>
    </div>
</asp:Content>
