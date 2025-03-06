<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>
<html lang="el">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loading...</title>
    <style>
        body {
            background-color: #6a0dad;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .image-container {
            text-align: center;
        }

        .image-container img {
            width: 350px;
            height: 350px;
            border-radius: 50%;
        }
    </style>
    <script>
        // Μετά από 3 δευτερόλεπτα, ανακατευθύνει στη δεύτερη σελίδα
        setTimeout(function() {
            window.location.href = "http://ism.dmst.aueb.gr/ismgroup8/homepage.jsp";
        }, 750);
    </script>
</head>
<body>
    <div class="image-container">
        <img src="http://ism.dmst.aueb.gr/ismgroup8/photo%20profile2.png" alt="Loading Image">
    </div>
</body>
</html>
