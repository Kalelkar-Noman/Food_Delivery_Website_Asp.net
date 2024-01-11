<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="SignUp-User.aspx.cs" Inherits="Food_Delivery_Website.SignUp_User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/signup.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="signup_container headergap">
        <section class="signup_inner_container">

            <header>Registration Form</header>
            <section action="#" class="form">
                <div class="input-box">
                    <label>Full Name</label>
                    <asp:TextBox type="text" placeholder="Enter full name" required="true" ID="User_name" runat="server"></asp:TextBox>

                </div>
                <div class="input-box">
                    <label>Email Address</label>
                    <asp:TextBox ID="Email_input" type="email" required="true" placeholder="Enter email address" runat="server"></asp:TextBox>

                </div>
                <div class="input-box otp-div">

                    <input id="otp_btn" type="button" value="Get OTP" />
                    <asp:TextBox ID="Otp_inputbox" type="number" placeholder="Enter OTP" required="true" runat="server"></asp:TextBox>

                </div>
                <div class="column">
                    <div class="input-box">
                        <label>Phone Number</label>
                        <asp:TextBox ID="Phone_number" type="number" placeholder="Enter phone number" required="true" runat="server"></asp:TextBox>

                    </div>
                    <div class="input-box">
                        <label>PassWord</label>
                        <%--pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"--%>
                        <asp:TextBox ID="User_pass" type="password" placeholder="Enter Your password" minlength="8" required="true" runat="server"></asp:TextBox>

                    </div>
                </div>
                <div class="gender-box">
                    <h3>Gender</h3>
                    <div class="gender-option">
                        <div class="gender">
                            <asp:RadioButton type="radio" ID="Check_male" GroupName="gender" runat="server" />

                            <label for="ContentPlaceHolder1_Check_male">male</label>
                        </div>
                        <div class="gender">
                            <asp:RadioButton ID="Check_female" type="radio" runat="server" GroupName="gender" />

                            <label for="ContentPlaceHolder1_Check_female">Female</label>
                        </div>
                        <div class="gender">
                            <asp:RadioButton ID="Check_other" GroupName="gender" Checked="true" type="radio" runat="server" />

                            <label for="ContentPlaceHolder1_Check_other">prefer not to say</label>
                        </div>
                    </div>
                </div>
                <div class="input-box address">
                    <label>Address</label>
                    <asp:TextBox ID="Address_line1" type="text" placeholder="Enter street address" runat="server"></asp:TextBox>

                    <asp:TextBox ID="Address_line2" type="text" placeholder="Enter street address line 2" runat="server"></asp:TextBox>

                    <div class="column">
                        <asp:DropDownList CssClass="select-box" ID="Countrylist" runat="server">
                            <asp:ListItem Value="india">India</asp:ListItem>
                            <asp:ListItem Value="america">America</asp:ListItem>
                            <asp:ListItem Value="japan">Japan</asp:ListItem>
                            <asp:ListItem Value="russia">Russia</asp:ListItem>
                            <asp:ListItem Value="china">China</asp:ListItem>
                            <asp:ListItem Value="brazil">Brazil</asp:ListItem>
                        </asp:DropDownList>


                        <asp:TextBox ID="City_input" type="text" placeholder="Enter your city" runat="server"></asp:TextBox>

                    </div>
                    <div class="column">
                        <asp:TextBox ID="State_input" type="text" placeholder="Enter your state" runat="server"></asp:TextBox>

                        <asp:TextBox ID="Pin_input" type="number" placeholder="Enter pin code" runat="server"></asp:TextBox>


                    </div>
                </div>
                <asp:Button CssClass="submit_btn" ID="Submit_form" runat="server" Text="Submit" OnClick="Submit_form_Click" />

            </section>
        </section>
    </div>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
    <script src="js/Signup.js"></script>
    <script> document.title = "Sign-Up";</script>
</asp:Content>
