document.addEventListener('DOMContentLoaded', function() {
    const loginForm = document.querySelector('form');
    const messageContainer = document.createElement('div');
    messageContainer.id = 'message';
    loginForm.appendChild(messageContainer);

    loginForm.addEventListener('submit', function(e) {
        e.preventDefault();

        // Get input values
        const emailInput = loginForm.querySelector('input[type="text"]');
        const passwordInput = loginForm.querySelector('input[type="password"]');

        const formData = new FormData();
        formData.append('email', emailInput.value);
        formData.append('password', passwordInput.value);

        fetch('logic/login-admin.php', {
            method: 'POST',
            body: new URLSearchParams(formData)
        })
        .then(response => response.text())
        .then(data => {
            messageContainer.textContent = data;
            messageContainer.style.color = data.includes('berhasil') ? 'green' : 'red';
            
            if (data.includes('berhasil')) {
                setTimeout(() => {
                    window.location.href = 'dashboard-admin.php';
                }, 2000);
            }
        })
        .catch(error => {
            console.error('Error:', error);
            messageContainer.textContent = 'Terjadi kesalahan. Silakan coba lagi.';
            messageContainer.style.color = 'red';
        });
    });
});