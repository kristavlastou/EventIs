<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="EventIs.*" %>
<!DOCTYPE html>
<html lang="el">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #6a0dad; /* Purple background */
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            text-align: center;
        }

        .form-container {
            background-color: rgba(0, 0, 0, 0.7); /* Transparent black for form container */
            padding: 20px;
            border-radius: 10px;
            width: 300px;
        }

        .form-container h1 {
            font-size: 2.5em; /* Big header size */
            margin: 0;
        }

        .form-container input[type="text"],
        .form-container input[type="password"],
        .form-container input[type="number"],
        .form-container input[type="submit"] {
            width: calc(100% - 20px); /* Full-width input with padding */
            padding: 10px;
            margin: 10px 0;
            border: none;
            border-radius: 5px;
            box-sizing: border-box; /* Ensures padding doesn't overflow */
        }

        .form-container input[type="text"],
        .form-container input[type="password"] {
            background-color: rgba(255, 255, 255, 0.979); /* Light background for inputs */
            color: rgba(0, 0, 0, 0.7); /* Dark text */
        }

        .custom-btn {
            background: linear-gradient(45deg, #6a0dad, #8e44ad); /* Gradient for button */
            color: white; /* White text */
            padding: 10px 20px; /* Padding around text */
            border: none; /* No border */
            border-radius: 30px; /* Rounded button corners */
            font-size: 16px; /* Font size */
            font-weight: bold; /* Bold text */
            cursor: pointer; /* Pointer cursor */
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.3); /* Subtle shadow */
            transition: all 0.3s ease; /* Smooth transition */
        }

        .custom-btn:hover {
            background: linear-gradient(45deg, #8e44ad, #6a0dad); /* Reversed gradient on hover */
            box-shadow: 0px 6px 8px rgba(0, 0, 0, 0.5); /* Stronger shadow */
            transform: scale(1.05); /* Slightly increase size */
        }

        .custom-btn:active {
            transform: scale(0.95); /* Slightly decrease size on click */
            box-shadow: 0px 3px 5px rgba(0, 0, 0, 0.4); /* Smaller shadow */
        }
    </style>
</head>
<body>
<%
    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String confirm = request.getParameter("confirm");
    String age = request.getParameter("age");
    String email = request.getParameter("email");
    String city = request.getParameter("city");

    boolean valid = true; 
    StringBuilder errors = new StringBuilder(); 
    int errornumber = 0;

    if (username == null || username.length() < 5) {
        valid = false;
        errornumber++;
        errors.append("<p>").append(errornumber).append(". Username must be at least 5 characters long</p>");
    }
    if (password == null || password.length() < 5) {
        valid = false;
        errornumber++;
        errors.append("<p>").append(errornumber).append(". Password must be at least 5 characters long</p>");
    }
    if (confirm == null || !confirm.equals(password)) {
        valid = false;
        errornumber++;
        errors.append("<p>").append(errornumber).append(". Password and confirm do not match.</p>");
    }

    if (valid) {
        User newUser = new User(username,name, surname, password, age, city, email); 
        try {
            UserDAO userDAO = new UserDAO();
            userDAO.register(newUser);  
            response.sendRedirect("http://ism.dmst.aueb.gr/ismgroup8/eventIs.jsp");
            return;  // Redirect after successful registration
        } catch (Exception e) {
            errors.append(e.getMessage());
        }
    }
%>

<% if (errors.length() > 0) { %>
    <div class="container">
        <img src="http://ism.dmst.aueb.gr/ismgroup8/what-is-wrong-5ae0cf.jpg" alt="What's wrong!" />
        <h2>Registration form has errors</h2>
        <div class="alert alert-danger" role="alert">
            <div>
                <%= errors.toString() %>
            </div>
        </div>

        <div class="text-left" style="margin-top: 20px;">
            <form action="signup.jsp" method="get">
                <button type="submit" class="custom-btn">
                    Back to the Form
                </button>
            </form>
        </div>
    </div>
<% } else { %>

<% } %>

</body>
</html>
