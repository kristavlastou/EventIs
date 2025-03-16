<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList, java.util.List" %>
<%@ page import="EventIs.*" %>
<%@ page import="java.time.LocalDate, java.time.LocalTime" %>

<%
    String ename = request.getParameter("ename");
    String category = request.getParameter("category");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String city = request.getParameter("city");
    String place = request.getParameter("place");
    String entry = request.getParameter("entry");
    String priceAmountStr = request.getParameter("priceAmount");
    String description = request.getParameter("description");

    // convert to UTF-8 to support Greek characters input
    if (ename != null) {
        ename = new String(ename.getBytes("ISO-8859-1"), "UTF-8");
    }

    if (description != null) {
        description = new String(description.getBytes("ISO-8859-1"), "UTF-8");
    }

    if (city != null) {
        city = new String(city.getBytes("ISO-8859-1"), "UTF-8");
    }

    if (place != null) {
        place = new String(place.getBytes("ISO-8859-1"), "UTF-8");
    }

    boolean hasErrors = false;
    List<String> errorlist = new ArrayList<String>();

    if (ename == null || ename.trim().length() < 3) {
        hasErrors = true;
        errorlist.add("Event name must be at least 3 characters long.");
    }

    if (category == null || category.isEmpty()) {
        hasErrors = true;
        errorlist.add("You must choose a category.");
    }

    LocalDate eventDate = null;
    try {
        eventDate = LocalDate.parse(date);
    } catch (Exception e) {
        hasErrors = true;
        errorlist.add("Invalid or missing date. Please provide a valid date in YYYY-MM-DD format.");
    }

    LocalTime eventTime = null;
    try {
        eventTime = LocalTime.parse(time);
    } catch (Exception e) {
        hasErrors = true;
        errorlist.add("Invalid or missing time. Please provide a valid time in HH:MM format.");
    }

    if (city == null || city.trim().length() < 3) {
        hasErrors = true;
        errorlist.add("City must be at least 3 characters long.");
    }

    if (place == null || place.trim().length() < 3) {
        hasErrors = true;
        errorlist.add("Location must be at least 3 characters long.");
    }

    double priceAmount = 0.0;
    if ("price".equals(entry)) {
        try {
            priceAmount = Double.parseDouble(priceAmountStr);
            if (priceAmount <= 0) {
                hasErrors = true;
                errorlist.add("Entrance price must be a valid positive number.");
            }
        } catch (Exception e) {
            hasErrors = true;
            errorlist.add("Invalid entrance price. Please provide a valid number.");
        }
    }

    User user = (User) session.getAttribute("userObj2024");
    if (user == null) {
        request.setAttribute("message", "You are not authorized to access this resource. Please login.");
        %>
        <jsp:forward page="eventIs.jsp" />
        <%
        return;
    }

    if (!hasErrors) {
        Event event = new Event(ename, eventDate, eventTime, city, place, priceAmount, category, description);
        EventDAO eventdao = new EventDAO();
        try {
            eventdao.uploadEventToDatabase(event, user);
            request.setAttribute("successMessage", "Event uploaded successfully!");
            request.setAttribute("event", event);
        } catch (Exception e) {
            hasErrors = true;
            errorlist.add("An error occurred while uploading the event. Please try again.");
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Event Submission</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
        <style>
            body {
                background-color: #6a0dad;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                margin: 0;
                font-family: Arial, sans-serif;
            }
            .message-container {
                background-color: #f5e6ff;
                padding: 20px 30px;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                text-align: left;
                width: 90%;
                max-width: 600px;
            }
            h4 {
                margin-bottom: 20px;
            }
            .btn {
                background-color: #6a0dad;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                text-decoration: none;
                font-size: 1rem;
                display: inline-block;
                margin-top: 20px;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            .btn:hover {
                background-color: #5c0bb2;
            }
        </style>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    </head>
    <body>
        <%@ include file = "navbar.jsp" %>
        <div class="message-container">
            <% if (!hasErrors) { 
                Event event = (Event) request.getAttribute("event");
            %>
                <h4>Event was uploaded successfully! <i class="bi bi-emoji-wink"></i></h4>
                <p><b>Event name:</b> <%= event.getName() %></p>
                <p><b>Category:</b> <%= event.getCategory() %></p>
                <p><b>Date:</b> <%= event.getDate() %></p>
                <p><b>Time:</b> <%= event.getTime() %></p>
                <p><b>Location:</b> <%= event.getPlace() %></p>
                <p><b>Entrance:</b> <%= event.getPrice() > 0 ? "Ticket (€" + event.getPrice() + ")" : "Free" %></p>
                <p><b>Description:</b> <%= event.getDescription() != null ? event.getDescription() : "No description" %></p>
            <% } else { %>
                <h4>Form has errors <i class="bi bi-emoji-frown"></i></h4>
                <ul>
                    <% for (String error : errorlist) { %>
                        <li><%= error %></li>
                    <% } %>
                </ul>
                <a href="uploadEvent.jsp" class="btn btn-primary">Back to form</a>
            <% } %>
        </div>
    </body>
</html>
