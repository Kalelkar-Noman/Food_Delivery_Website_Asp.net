function PreviewImage() {
    console.log("hello");
    var fileUpload = document.getElementById("FileUpload1");
    var previewImage = document.getElementById("ImagePreview");

    var file = fileUpload.files[0];
    var reader = new FileReader();

    reader.onload = function (e) {
        previewImage.src = e.target.result;
        previewImage.style.display = "block";
    };

    reader.readAsDataURL(file);
}
//document.getElementById("ContentPlaceHolder1_Item_image").addEventListener("change", PreviewImage());
const input = document.getElementById("ContentPlaceHolder1_Item_image");

const previewPhoto = () => {
    const file = input.files;
    if (file) {
        const fileReader = new FileReader();
        const preview = document.getElementById("ContentPlaceHolder1_Image_preview");
        fileReader.onload = event => {
            preview.setAttribute('src', event.target.result);
        }
        fileReader.readAsDataURL(file[0]);
    }
}
input.addEventListener('change', previewPhoto);