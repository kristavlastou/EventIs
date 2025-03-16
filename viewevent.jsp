<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="EventIs.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%@ include file="navbar.jsp" %>

<%
    // Λήψη του eventID από το αίτημα
    String category = request.getParameter("category");
    String eventIDParam = request.getParameter("eventID");
    int eventID = 0;

    if (eventIDParam != null && !eventIDParam.trim().isEmpty()) {
        try {
            eventID = Integer.parseInt(eventIDParam);
            System.out.println("Received eventID: " + eventID); // Debugging μήνυμα
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("message", "Invalid Event ID format.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("eventIs.jsp");
            dispatcher.forward(request, response);
            return;
        }
    } else {
        request.setAttribute("message", "Event ID is missing.");
        RequestDispatcher dispatcher = request.getRequestDispatcher("eventIs.jsp");
        dispatcher.forward(request, response);
        return;
    }

    // Ανάκτηση του event από τη βάση δεδομένων
    Event targetEvent = null;
    try {
        EventDAO eventDAO = new EventDAO();
        targetEvent = eventDAO.findEventByID(eventID);
        System.out.println("Event retrieved: " + (targetEvent != null ? targetEvent.getName() : "null")); // Debugging μήνυμα
    } catch (Exception e) {
        e.printStackTrace();
        request.setAttribute("message", "An error occurred while retrieving the event.");
        RequestDispatcher dispatcher = request.getRequestDispatcher("eventIs.jsp");
        dispatcher.forward(request, response);
        return;
    }

    if (targetEvent == null) {
        request.setAttribute("message", "Event not found.");
        RequestDispatcher dispatcher = request.getRequestDispatcher("eventIs.jsp");
        dispatcher.forward(request, response);
        return;
    }
    String backgroundBodyContainer = "#ffffff";
String backgroundEventBox = "#ffffff";
String filterbuttonColor = "#ffffff";
String backgroundFilterPanel = "#ffffff";
String eventcardBoxShadow = "#ffffff";
String backgroundEventCard = "#ffffff";
String hoverboxshadowEventCard = "#ffffff";
String backgroundEventOverlay = "#ffffff";
String eventoverlayColor = "#ffffff";
String eventTitle = "#ffffff";
String eventCity = "#ffffff";
String eventDate = "#ffffff";
String noevents = "#ffffff";
String imageURL = "#ffffff";
String navbarText = "#ffffff";


if (category != null) {
        if (category.equals("Party")) {
            backgroundBodyContainer ="#6a0dad";
            backgroundEventBox ="#690289";
            imageURL ="http://ism.dmst.aueb.gr/ismgroup8/party.jpg";
        } else if (category.equals("Concert")) {
            backgroundBodyContainer ="#1720d7";
            backgroundEventBox ="#2c59a7";
            imageURL ="http://ism.dmst.aueb.gr/ismgroup8/conserts.jpg";
        } else if (category.equals("Theatre")) {
            backgroundBodyContainer ="#ec4949";
            backgroundEventBox ="#cd2a2a";
            imageURL ="http://ism.dmst.aueb.gr/ismgroup8/theatre.jpg";
        } else if (category.equals("Cinema")) {
            backgroundBodyContainer ="#000000";
            backgroundEventBox ="#333333";
            imageURL ="http://ism.dmst.aueb.gr/ismgroup8/cinema.jpg";
        }else if (category.equals("Festival")) {
            backgroundBodyContainer ="#e7610e";
            backgroundEventBox ="#ef753c";
            imageURL ="http://ism.dmst.aueb.gr/ismgroup8/festivals.jpg";
        }else if (category.equals("Exhibition")) {
            backgroundBodyContainer ="#7a7b7b";
            backgroundEventBox ="#a8a087";
            imageURL ="http://ism.dmst.aueb.gr/ismgroup8/art.jpg";
        }else if (category.equals("Show")) {
            backgroundBodyContainer ="#090338";
            backgroundEventBox ="#14112c";
            imageURL ="http://ism.dmst.aueb.gr/ismgroup8/performance.jpg";
        }else if (category.equals("Sport")) {
            backgroundBodyContainer ="#049635";
            backgroundEventBox ="#20db4e";
            imageURL ="http://ism.dmst.aueb.gr/ismgroup8/sports.jpg";
        }
}
%>
<!DOCTYPE html>
<html lang="el">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Event Details - <%= targetEvent.getName() %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: <%=backgroundBodyContainer %>;
            color: #ffffff;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
 
        <%-- .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 20px;
            background-color: #1c1c1c;
            color: white;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            box-sizing: border-box;
        }

        .navbar .logo {
            font-size: 1.5em;
            font-weight: bold;
        }

        .navbar .tagline {
            font-size: 1em;
            font-style: italic;
            text-align: right;
            margin-left: 20px;
        } --%>

        .container {
            width: 90%;
            max-width: 800px;
            background: <%=backgroundEventBox %>;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            margin-top: 80px;
        }

        .event-image {
            width: 100%;
            height: auto;
            border-radius: 10px;
            margin-bottom: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.3);
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 28px;
            color: #ffffff;
        }

        .event-details p {
            margin: 10px 0;
            font-size: 18px;
        }

        .fixed-buttons {
            position: fixed;
            bottom: 20px;
            right: 20px;
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .fixed-button {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: <%=backgroundEventBox %>;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            color: white;
            font-size: 30px;
            text-decoration: none;
        }
        .fixed-button:hover {
            background-color: <%=backgroundBodyContainer %>;
        }
        /* Στυλ για το νέο κουμπί */

        .fixed-button:hover {
            background-color: <%=backgroundBodyContainer %>;
        }
    </style>
</head>
<body>
    <div class="container">
        <img src="<%=imageURL%>" alt="Event Image" class="event-image">
        <h1>Event Details</h1>
        <div class="event-details">
            <p><b>EVENT NAME:</b> <%= targetEvent.getName() %></p>
            <p><b>PLACE:</b> <%= targetEvent.getCity() %></p>
            <p><b>DATE:</b> <%= targetEvent.getDate() %></p>
            <p><b>TIME:</b> <%= targetEvent.getTime() %></p>
            <p><b>PRICE:</b> <%= targetEvent.getPrice() == 0 ? "Free Entrance" : "€" + targetEvent.getPrice() %></p>
            <p><b>DESCRIPTION:</b> <%= targetEvent.getDescription() %></p>
        </div>
    </div>

    
    <div class="fixed-buttons">
        <a class="fixed-button" title="Back" onclick="goBack()" style="cursor: pointer;">
        <i class="bi bi-arrow-left"></i>
        </a>
    </div>
    </div>

    <script>
    function goBack() {
        // Αν υπάρχει προηγούμενη σελίδα στο ιστορικό και είναι διαφορετική από την τρέχουσα
        if (window.history.length > 1) {
            window.history.go(-1); // Μεταφορά στην προηγούμενη σελίδα
        } else {
            window.location.href = 'index.jsp'; // Επιστροφή σε default σελίδα αν δεν υπάρχει ιστορικό
        }
    }
    </script>
</body>
</html>
