@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

body {
    background-image: url('images/background.jpg');
    font-family: 'Poppins', Arial, sans-serif;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-size: cover;
    background-position: center;
}

.login-container {
    background-color: rgba(255, 255, 255, 0.9);
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    text-align: center;
    width: 350px; /* Adjusted width */
    font-family: 'Poppins', Arial, sans-serif;
}


.header img {
    width: 200px; /* Adjust the width as needed */
    height: auto; /* Maintain aspect ratio */
    margin: 0 auto;
    display: block;
}

.login-container h2 {
    margin-bottom: 20px;
    color: #333;
    font-family: 'Poppins', Arial, sans-serif;
}

.login-container input {
    padding: 12px; /* Increased padding for a larger input box */
    margin: 10px 0;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
    font-family: 'Poppins', Arial, sans-serif;
    width: 100%; /* Full width for better alignment */
    box-sizing: border-box; /* Ensures padding does not overflow */
}

.login-container button {
    background-color: #f04e30;
    color: white;
    border: none;
    padding: 12px 0; /* Wider button */
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    font-family: 'Poppins', Arial, sans-serif;
    width: 100%; /* Full width for better alignment */
}

.login-container button:hover {
    background-color: #d84328;
}

.login-container .register-link {
    margin-top: 15px;
    font-size: 14px;
    font-family: 'Poppins', Arial, sans-serif;
}

.login-container .register-link a {
    color: #f04e30;
    text-decoration: none;
}

.login-container .register-link a:hover {
    text-decoration: underline;
}
