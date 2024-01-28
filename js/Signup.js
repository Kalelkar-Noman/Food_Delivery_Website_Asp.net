const otpbtn = document.getElementById("otp_btn");
otpbtn.addEventListener("click", () => {
  //event.prevendefault();
  let otp = "";
  for (let i = 0; i < 6; i++) {
    otp += Math.floor(Math.random() * 10); // Generate a random digit between 0 and 9
  }
  document.cookie = `user_otp=${otp}; expires=Fri, 31 Dec 2034 23:59:59 GMT`;
  console.log(otp);
    sendmail(otp);
    console.log("otp sent");
});
function sendmail(otp) {
  (function () {
    emailjs.init("your");
  })();
  var params = {
    sendername: "ashish",
      to: "ashish73737447@gmail.com",
    subject: "project testing message",
    replyto: "dont reply",
    message:
      "ashish singh this is a project message please don't worry it looks like sended by mistake " +
      otp,
  };
  var serviceid = "your service id";
  var templateid = "your template id";
  emailjs.send(serviceid, templateid, params).then(
    function (response) {
      console.log("SUCCESS!", response.status, response.text);
      alert("email sended sucessfully");
    },
    function (error) {
      console.log("FAILED...", error);
      alert("failed please check your email");
    }
  );
}
