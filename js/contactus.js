const otpbtn = document.getElementById("contact mail");
otpbtn.addEventListener("click", (event) => {
    event.prevendefault();

    //sendmail(otp);
});
function sendmail(otp) {
    (function () {
        emailjs.init("Etq9tDOuA-Gr9aJ3o");
    })();
    var params = {
        sendername: "ashish",
        to: "kalelkarnoman014@gmail.com",
        subject: "project testing message",
        replyto: "dont reply",
        message:
            "Thanks for contacting Us " +
            otp,
    };
}