<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>
</head>
<body>
    <%
        if (session != null) {
            session.invalidate(); 
        }

        response.sendRedirect("eventIs.jsp"); 
    %>
</body>
</html>
