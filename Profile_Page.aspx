<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Profile_Page.aspx.cs" Inherits="Food_Delivery_Website.Profile_Page" %>

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
                        <asp:Button CssClass="btn btn-sm btn-primary" ID="Edit" OnClick="Edit_Click" runat="server" Text="Edit" />
                        <asp:Button CssClass="btn btn-sm btn-primary" ID="Save" runat="server" OnClick="Save_Click" Text="Save" />

                    </div>
                </div>
            </div>
            <div class="card-body">
     


                <h6 class="heading-small text-muted mb-4">User information</h6>
                <div class="pl-lg-4">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group focused">
                                <label class="form-control-label" for="input-username">
                                    Phone Number</label>

                                <asp:TextBox type="number" required="true" ID="Input_number" CssClass="form-control form-control-alternative" placeholder='Enter phone Number' runat="server"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label class="form-control-label" for="input-email">
                                    Email address</label>
                                <asp:TextBox required="true" type="email" ID="Input_email" CssClass="form-control form-control-alternative" placeholder='Enter email' runat="server"></asp:TextBox>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="form-group focused">
                                <label class="form-control-label" for="input-first-name">
                                    Your name</label>
                                <asp:TextBox required="true" type="text" ID="Input_name" CssClass="form-control form-control-alternative" placeholder='Enter name' runat="server"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group focused">
                                <label class="form-control-label" for="input-last-name">
                                    Password</label>
                                <asp:TextBox required="true" type="text" ID="Input_password" CssClass="form-control form-control-alternative" placeholder='Enter password' runat="server"></asp:TextBox>

                            </div>
                        </div>
                    </div>
                </div>
                <hr class="my-4" />
                <!-- Address -->
                <h6 class="heading-small text-muted mb-4">Contact information</h6>
                <div class="pl-lg-4">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group focused">
                                <label class="form-control-label" for="input-address">
                                    Address</label>
                                <asp:TextBox ID="Input_address" CssClass="form-control form-control-alternative" placeholder='Enter address' runat="server"></asp:TextBox>

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group focused">
                                <label class="form-control-label" for="input-city">
                                    City</label>
                                <asp:TextBox ID="Input_city" type="text" CssClass="form-control form-control-alternative" placeholder='Enter city' runat="server"> </asp:TextBox>

                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group focused">
                                <label class="form-control-label" for="input-city">
                                    City</label>
                                <asp:TextBox type="text" ID="Input_state" CssClass="form-control form-control-alternative" placeholder='Enter State' runat="server"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group focused">
                                <label class="form-control-label" for="input-country">
                                    Country</label>
                                <asp:TextBox type="text" ID="Input_country" CssClass="form-control form-control-alternative" placeholder='Enter Country' runat="server"></asp:TextBox>

                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label class="form-control-label" for="input-country">
                                    Pin code</label>
                                <asp:TextBox type="number" ID="Input_pincode" CssClass="form-control form-control-alternative" placeholder='Enter Pincode' runat="server"></asp:TextBox>

                            </div>
                        </div>
                    </div>
                </div>
                <hr class="my-4" />


            </div>
        </div>
    </div>


    <script> document.title = "Profile";</script>
</asp:Content>
