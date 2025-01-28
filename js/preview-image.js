// js/preview-image.js
function previewImage(event) {
    const reader = new FileReader();
    reader.onload = function() {
        const preview = document.getElementById('currentImage');
        preview.src = reader.result;
    }
    reader.readAsDataURL(event.target.files[0]);
}