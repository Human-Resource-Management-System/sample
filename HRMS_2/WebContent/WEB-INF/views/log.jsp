<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Login Page</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }
    
    .container {
      width: 300px;
      margin: 100px auto;
      background-color: #fff;
      border: 1px solid #ccc;
      padding: 20px;
    }
    
    h2 {
      text-align: center;
    }
    
    .input-group {
      margin-bottom: 15px;
    }
    
    .input-group label {
      display: block;
      margin-bottom: 5px;
    }
    
    .input-group input {
      width: 100%;
      padding: 7px;
      font-size: 16px;
      border-radius: 5px;
      border: 1px solid #ccc;
    }
    
    .btn {
      padding: 10px;
      font-size: 16px;
      color: #fff;
      background: #007bff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    
    .error {
      color: red;
      margin-bottom: 10px;
    }
  </style>
</head>
<body>
  <div class="container">
    <h2>Login</h2>
    <form id="loginForm">
      <div class="input-group">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required>
      </div>
      <div class="input-group">
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required>
      </div>
      <div class="input-group">
        <input type="submit" value="Login" class="btn">
      </div>
    </form>
  </div>

  <script>
    document.getElementById('loginForm').addEventListener('submit', function(e) {
      e.preventDefault(); // Prevent form submission

      var username = document.getElementById('username').value;
      var password = document.getElementById('password').value;

      // Array of user objects representing users and admins
      var users = [
        { username: 'john', password: 'john123', role: 'user' },
        { username: 'jane', password: 'jane123', role: 'user' },
        { username: 'admin', password: 'admin123', role: 'admin' }
      ];

      var foundUser = users.find(function(user) {
        return user.username === username && user.password === password;
      });

      if (foundUser) {
        // Store the username in session storage
        sessionStorage.setItem('username', foundUser.username);

        if (foundUser.role === 'admin') {
          // Redirect to admin dashboard
          window.location.href = 'admin-dashboard.jsp';
        } else {
          // Redirect to user dashboard
          window.location.href = 'user-dashboard.jsp';
        }
      } else {
        alert('Invalid username or password');
      }
    });
  </script>
</body>
</html>
