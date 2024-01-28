const ml = document.getElementById("contactmail");
ml.addEventListener("click", (event) => {
    event.preventDefault();
    sendmail();
})
function sendmail() {
    //event.preventdefault();
    (function () {
        emailjs.init("you js code");
    })();
    var params = {
        sendername: "ashish",
        to: "kalelkarnoman014@gmail.com",
        subject: "project contact",
        replyto: "dont reply",
        message:
            "Thanks for contacting us ",
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
