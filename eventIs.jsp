<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">

<!DOCTYPE html>
<html lang="el">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EventIs</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('http://ism.dmst.aueb.gr/ismgroup8/image%20for%20eventIs/Screenshot%202024-12-06%20155519.png'); /* Ορισμός φόντου */
            background-size: cover; /* Εξασφαλίζει ότι η εικόνα καλύπτει όλη την οθόνη */
            background-position: center; /* Κεντράρει την εικόνα */
            background-repeat: no-repeat; /* Αποτρέπει την επανάληψη της εικόνας */
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            text-align: center;
        }

        .form-container {
            background-color: rgba(0, 0, 0, 0.7); 
            padding: 20px;
            border-radius: 10px;
            width: 300px;
        }

        .form-container h1 {
            font-size: 2.5em; 
            margin: 0;
        }

        .form-container h2 {
            font-size: 1em; 
            margin: 10px 0 20px; 
        }

        .form-container input[type="text"],
        .form-container input[type="password"] {
            width: calc(100% - 20px); 
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            box-sizing: border-box; 
        }

        .form-container .login-button {
            display: inline-block;
            width: 100%;
            padding: 10px;
            background-color: #8e44ad;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            font-size: 1em;
        }

        .form-container .login-button:hover {
            background-color: #a569bd;
        }

        .form-container a {
            color: #b3b3ff;
            text-decoration: none;
        }

        .form-container a:hover {
            text-decoration: underline;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <div class="form-container">
        <% if(request.getAttribute("message") != null) { %>		
            <div class="alert text-center" style=" color: #cc3300" role="alert"><%=(String)request.getAttribute("message") %><i class="bi bi-exclamation-triangle"></i></div>
        <% } %>
        <h1>EventIs</h1>
        <h2>Experience the moment, not just the event!</h2>
        <form action="loginController.jsp" method="post">
            <input type="text" name="username" placeholder="Username" required>
            <input type="password" name="password" placeholder="Password" required>
            <button type="submit" class="login-button">Log In</button>
        </form>
        <p>Don't have an account? <a href="http://ism.dmst.aueb.gr/ismgroup8/trysignup.jsp">Sign up</a></p>
    </div>
</body>
</html>
