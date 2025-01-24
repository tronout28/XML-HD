document.addEventListener('DOMContentLoaded', function() {
    const registerForm = document.getElementById('registerForm');
    const messageDiv = document.getElementById('message');
 
    registerForm.addEventListener('submit', function(e) {
        e.preventDefault();
 
        const formData = new FormData(this);
 
        fetch('logic/register.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: new URLSearchParams(formData)
        })
        .then(response => response.text())
        .then(data => {
            messageDiv.textContent = data;
            messageDiv.style.color = data.includes('berhasil') ? 'green' : 'red';
            if (data.includes('berhasil')) {
                setTimeout(() => {
                    window.location.href = 'login.xml';
                }, 2000);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            messageDiv.textContent = 'Terjadi kesalahan. Silakan coba lagi.';
            messageDiv.style.color = 'red';
        });
    });
 });