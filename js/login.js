document.addEventListener('DOMContentLoaded', function () {
    const loginForm = document.querySelector('form');
    const messageContainer = document.createElement('div');
    messageContainer.id = 'message';
    loginForm.appendChild(messageContainer);

    loginForm.addEventListener('submit', async function (e) {
        e.preventDefault();

        // Reset pesan
        messageContainer.textContent = '';
        messageContainer.style.display = 'none';

        // Get input values
        const emailInput = loginForm.querySelector('input[type="text"]');
        const passwordInput = loginForm.querySelector('input[type="password"]');

        if (!emailInput.value || !passwordInput.value) {
            messageContainer.textContent = 'Email dan password harus diisi.';
            messageContainer.style.color = 'red';
            messageContainer.style.display = 'block';
            return;
        }

        try {
            const formData = new FormData();
            formData.append('email', emailInput.value);
            formData.append('password', passwordInput.value);

            const response = await fetch('logic/login-user.php', {
                method: 'POST',
                body: formData
            });

            // Log raw response for debugging
            const rawResponse = await response.text();
            console.log('Raw response:', rawResponse);

            // Try to parse as JSON
            let data;
            try {
                data = JSON.parse(rawResponse);
            } catch (parseError) {
                console.error('JSON Parse Error:', parseError);
                throw new Error('Invalid response format');
            }

            console.log('Parsed data:', data);

            messageContainer.textContent = data.message;
            messageContainer.style.display = 'block';
            messageContainer.style.color = data.status === 'success' ? 'green' : 'red';

            if (data.status === 'success' && data.userId) {
                sessionStorage.setItem('userId', data.userId);
                console.log('User ID stored:', data.userId);
                
                setTimeout(() => {
                    window.location.href = 'home.xml';
                }, 2000);
            }
        } catch (error) {
            console.error('Error:', error);
            messageContainer.textContent = 'Terjadi kesalahan. Silakan coba lagi.';
            messageContainer.style.color = 'red';
            messageContainer.style.display = 'block';
        }
    });
});