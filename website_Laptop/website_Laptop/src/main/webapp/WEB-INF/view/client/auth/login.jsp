<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>

</head>
<body>

  <div class="login-container">
    <h2>Login</h2>
    <form action="/login" method="POST">
        <c:if test="${param.error!=null}">
    <div style="color: red; font-weight: bold;">
        Invalid email or password
    </div>
</c:if>

<!-- <c:if test="${param.logout!=null}">
    <div style="color: green; ">
        You logged out successfully !
    </div>
</c:if> -->
      <div class="input-group">
        <label for="email">Email Address</label>
        <input type="email" id="email" name="username" placeholder="Enter your email" required>
      </div>
      <div class="input-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="Enter your password" required>
      </div>
      <div class="input-group">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
      </div>
      <div class="forgot-password">
        <a href="#">Forgot password?</a>
      </div>
      <button type="submit" class="btn">Login</button>
     <p style="margin-top: 20px;"> Do not have account ? <a href="/register">Register</a></p>
    </form>
  </div>

</body>
</html>



<style>
    /* Reset some basic styles */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    body {
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background-color: #f0f4f8;
    }

    .login-container {
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 400px;
      padding: 20px;
      box-sizing: border-box;
      height: 340px;
    }

    h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #333;
    }

    .input-group {
      margin-bottom: 15px;
    }

    .input-group label {
      font-size: 14px;
      color: #555;
      display: block;
      margin-bottom: 5px;
    }

    .input-group input {
      width: 100%;
      padding: 10px;
      font-size: 16px;
      border: 1px solid #ccc;
      border-radius: 5px;
      outline: none;
      transition: border-color 0.3s;
    }

    .input-group input:focus {
      border-color: #007bff;
    }

    .forgot-password {
      text-align: right;
      font-size: 14px;
    }

    .forgot-password a {
      color: #007bff;
      text-decoration: none;
    }

    .forgot-password a:hover {
      text-decoration: underline;
    }

    .btn {
      width: 100%;
      padding: 10px;
      font-size: 16px;
      background-color: #007bff;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s;
    }

    .btn:hover {
      background-color: #0056b3;
    }


    a{
        text-decoration: underline;
        color: violet;
        cursor: pointer;
    }
  </style>