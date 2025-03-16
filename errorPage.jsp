<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 20px;
            background-color: #f8d7da;
            color: #721c24;
        }
        .container {
            margin-top: 50px;
        }
        h1 {
            font-size: 2em;
        }
        p {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Error</h1>
        <p><%= request.getAttribute("message") != null ? request.getAttribute("message") : "An unknown error occurred." %></p>
        <a href="homepage.jsp">Back to Homepage</a>
    </div>
</body>
</html>
