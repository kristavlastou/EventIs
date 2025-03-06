<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Saved Posts</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            margin: 0;
            padding-top: 56px; 
            padding-bottom: 20px;
            font-family: Arial, sans-serif;
            background-color: #6a0dad; 
        }

        nav.navbar {
            background-color: #1c1c1c; 
            color: white;
        }

        nav.navbar .navbar-nav .nav-link {
            color: #1c1c1c; 
        }

        nav.navbar .navbar-nav .nav-link:hover {
            color: rgb(252, 247, 252); 
        }

        nav.navbar .btn-outline-light {
            color: #faf5fb;
            border-color: #1c1c1c;
            background-color: transparent;
            font-size: 15px;
        }

        nav.navbar .btn-outline-light:hover {
            color: #faf5fb;
            border-color: #1c1c1c;
            background-color: transparent;
            font-size: 15px;
        }
        
        span {
            color: white;
            text-align: left;
            padding-left: 20px;
            font-size: 20px;
        }

        /* Search bar container */
        .search-bar {
            display: flex;
            align-items: center;
            margin-left: 20px; /* Adjust spacing */
        }

        /* Search input field */
        .search-bar input[type="text"] {
            border: 2px solid #a42bba;
            border-radius: 25px;
            padding: 8px 15px;
            width: 250px;
            font-size: 16px;
            color: #1c1c1c;
        }

        .search-bar input[type="text"]::placeholder {
            color: #bdbdbd;
        }

        .search-bar button {
            color: white;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container-fluid">
            <!-- Logo -->
            <span><b>EventIs<i class="bi bi-soundwave"></i></b></span>
            <%
            String currentURI = request.getRequestURI(); // Αλλάξαμε το όνομα της μεταβλητής σε `currentURI`
            if (currentURI.contains("homepage.jsp")) {
        %>            
            <!-- Search Bar -->
            <form class="search-bar ms-3" role="search" action="searchResults.jsp" method="get">
                <input type="text" name="query" placeholder="Search..." required>
                <button class="btn" type="submit"><i class="bi bi-search"></i></button>
            </form>
            <% } %>

            <!-- Other Links -->
            <div class="d-flex ms-auto">
                <a class="btn btn-outline-light me-2" href="homepage.jsp"><i class="bi bi-house"></i></a>
                <a class="btn btn-outline-light me-2" href="userprofile.jsp"><i class="bi bi-person"></i></a>
                <a class="btn btn-outline-light me-2" href="saved_posts.jsp"><i class="bi bi-bookmark-heart"></i></a>
                <a class="btn btn-outline-light me-2" href="logout.jsp">Logout</a>
            </div>
        </div>
    </nav>
</body>
</html>
