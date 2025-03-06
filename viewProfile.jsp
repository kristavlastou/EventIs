<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="EventIs.*, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #6a0dad;
            color: rgb(251, 250, 252);
            margin: 0;
            padding: 56px 0 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            width: 90%;
            font-family: Arial, sans-serif;
            max-width: 1200px;
            background-color: rgb(58, 12, 93);
            color: rgb(251, 250, 252);
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 5px;
            margin-left: 15px;
        }

        .profile-header img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-right: 10px;
            margin-bottom: 5px;
            object-fit: cover;
        }

        h3 {
            font-size: 20px; 
            font-weight: normal;  
            text-align: center; 
            margin-top: 15px; 
            margin-bottom: 15px;
            text-transform: none;
            letter-spacing: 0.5px;
            width: fit-content; 
            margin-left: auto;
            margin-right: auto;
        }

        .event-cards-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 50px;
            padding-right: 100px;
            padding-left: 100px;
            padding-top: 20px;
            padding-bottom: 20px;
        }

        .event-card {
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(128, 0, 128, 0.2);
            background-color: #f3e5f5;
            transition: transform 0.3s;
        }

        .event-card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 16px rgba(98, 0, 125, 0.4);
        }

        .event-image img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            filter: brightness(90%);
        }

        .event-info {
            padding: 12px;
            text-align: center;
        }

        .event-title {
            font-size: 18px;
            font-weight: bold;
            color: #320c39;
            margin-bottom: 8px;
        }

        .event-city {
            font-size: 16px;
            color: #320c39;
            margin-bottom: 6px;
        }

        .event-date {
            font-size: 16px;
            color: #320c39;
        }

        .event-price {
            font-size: 14px;
            color: #320c39;
        }

        .event-actions {
            display: flex;
            justify-content: space-around;
            margin-top: 10px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .profile-header {
                flex-direction: column;
                align-items: center;
            }

            .profile-header img {
                margin-bottom: 10px;
            }

            .file-label {
                width: 100%;
                text-align: center;
            }
        }

        @media (max-width: 480px) {
            .event-cards-grid {
                grid-template-columns: 1fr;
                padding-right: 30px;
                padding-left: 30px;
            }
            .heart-button{
                align-items: center;
            }
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<%@ include file="navbar.jsp" %>

<%
    String imageURL = ""; // Δήλωση της μεταβλητής imageURL

    // Λήψη του username του χρήστη που θέλουμε να δούμε από το request
    String requestedUsername = request.getParameter("username");
    if (requestedUsername == null || requestedUsername.isEmpty()) {
        response.sendRedirect("eventIs.jsp");
        return;
    }

    // Εύρεση του χρήστη από τη βάση δεδομένων
    UserDAO userDao = new UserDAO();
    User viewedUser = userDao.findUser(requestedUsername);

    if (viewedUser == null) {
        request.setAttribute("message", "The requested user profile does not exist.");
        request.getRequestDispatcher("error.jsp").forward(request, response);
        return;
    }

    String username = viewedUser.getUsername();
%>

<div class="container">
    <div class="profile-header">
        <img id="profile-pic" src="photo profile.png" alt="Profile Picture">
        <h2 style="color: white;"><%= username %></h2>
    </div>
   
    <hr>
    <div class="form-container">
        <% if(request.getAttribute("message") != null) { %>		
            <div class="alert text-center" style=" color: #cc3300" role="alert"><%=(String)request.getAttribute("message") %><i class="bi bi-exclamation-triangle"></i></div>
        <% } %>
    <h3>Events:</h3>
    <!-- Display Events -->
    <div class="event-cards">
        <div class="event-cards-grid">
        <%
            // Λήψη των events του χρήστη που βλέπουμε
            EventDAO eventDao = new EventDAO();
            List<Event> userEvents = eventDao.getEventsByUser(username);

            if (userEvents != null && !userEvents.isEmpty()) {
                for (int i = 0; i < userEvents.size(); i++) {
                    Event event = userEvents.get(i);

                    if (i % 3 == 0 && i != 0) {
        %>
            </div><div class="event-cards-grid">
        <%
                    }
        %>
        <div class="event-card">
            <% 
                // Λογική επιλογής εικόνας με βάση την κατηγορία του event
                if(event.getCategory().equals("Party")) {
                    imageURL ="http://ism.dmst.aueb.gr/ismgroup8/party.jpg";
                } else if(event.getCategory().equals("Exhibition")){
                    imageURL ="http://ism.dmst.aueb.gr/ismgroup8/art.jpg";
                } else if(event.getCategory().equals("Cinema")){
                    imageURL ="http://ism.dmst.aueb.gr/ismgroup8/cinema.jpg"; 
                } else if(event.getCategory().equals("Concert")){
                    imageURL ="http://ism.dmst.aueb.gr/ismgroup8/conserts.jpg";
                } else if(event.getCategory().equals("Theatre")){
                    imageURL ="http://ism.dmst.aueb.gr/ismgroup8/theatre.jpg";
                } else if(event.getCategory().equals("Festival")){
                    imageURL ="http://ism.dmst.aueb.gr/ismgroup8/festivals.jpg";
                } else if(event.getCategory().equals("Show")){
                    imageURL ="http://ism.dmst.aueb.gr/ismgroup8/performance.jpg";
                } else if(event.getCategory().equals("Sport")){
                    imageURL ="http://ism.dmst.aueb.gr/ismgroup8/sports.jpg";
                }
            %> 
            <div class="event-image">
                <img src="<%=imageURL%>" alt="image">
            </div>
            <div class="event-info">
                <p class="event-title">
                    <a href="viewEvent.jsp?eventID=<%= event.getEventID() %>&category=<%=event.getCategory()%>" style="color: inherit; text-decoration: none;">
                        <%= event.getName() %>
                    </a>
                </p>
                <p class="event-city"><%= event.getCity() %>, <%=event.getPlace()%></p>
                <p class="event-date"><%= event.getDate() %></p>
                <p class="event-price"><%= event.getPrice() %>$</p>
            </div>
    
        </div>
        <%
                }
            } else {
        %>
            <p>No events posted.</p>
        <%
            }
        %>
        </div>
    </div>

</div>

</body>
</html>
