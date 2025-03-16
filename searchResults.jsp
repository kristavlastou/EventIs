<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="EventIs.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>

<%
List<String> eventIds = new ArrayList<String>();
List<String> usernames = new ArrayList<String>();
String query = request.getParameter("query");
try {
    EventDAO eventDAO = new EventDAO();
    
    eventIds = eventDAO.searchEvents(query);
    usernames = eventDAO.searchUsernames(query);

} catch (Exception e) {

}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding-top: 56px; 
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
        h1 {
            font-size: 2rem;
            text-align: left;
            margin-left: 20px;
            color: #350632;
            margin-top: 20px;
        }
        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }
        .grid-item {
            height: 200px;
            background-color: #d2bdf0;
            color: #240222;;
            font-size: 0.9em;
            display: flex;
            justify-content: center;
            align-items: center;
            border-radius: 10px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
            text-align: center;
            transition: transform 0.2s ease;
        }
        .grid-item:hover {
            transform: scale(1.1);
        }

        /* Events & Users section */
        .section-title {
            text-align: center;
            color: #a772bc;
            margin: 20px 0;
        }

    </style>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>

<body>
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container-fluid">
            <!-- Logo -->
            <span><b>EventIs<i class="bi bi-soundwave"></i></b></span>

            <div class="d-flex ms-auto">
                <a class="btn btn-outline-light me-2" href="homepage.jsp"><i class="bi bi-house"></i></a>
                <a class="btn btn-outline-light me-2" href="userprofile.jsp"><i class="bi bi-person"></i></a>
                <a class="btn btn-outline-light me-2" href="saved_posts.jsp"><i class="bi bi-bookmark-heart"></i></a>
                <a class="btn btn-outline-light me-2" href="logout.jsp">Logout</a>
            </div>
        </div>
    </nav>
    <h1>Search Results</h1>
    
    <div class="section-title">Events Found</div>
    <div class="grid-container">
        <% if (eventIds != null && !eventIds.isEmpty()) { 
            for (String eventIdStr: eventIds) { 
                EventDAO eventDAO = new EventDAO();
                Integer eventId = Integer.parseInt(eventIdStr);
                Event event = eventDAO.findEventByID(eventId);     
        %>
            <div class="grid-item">
                <div>
                    <strong><%= event.getName() %></strong><br>
                    <small><%= event.getCity() %></small>
                    <small><%= event.getDate() %></small>

                </div>
            </div>
        <%  } 
        } else { %>
            <a href="homepage.jsp" style="display: block; text-decoration: none; cursor: pointer;">
                <div class="grid-item">
                   <strong> No events found. Search Again!</strong> 
                </div>
            </a>
        <% } %>
    </div>
    <div class="section-title">Users Found</div>
    <div class="grid-container">
        <% if (usernames != null && !usernames.isEmpty()) { 
            for (String username : usernames) { 
                UserDAO userDAO = new UserDAO();
                User user = userDAO.findUser(username);
        %>
            <div class="grid-item">
                <a href="viewProfile.jsp?username=<%= user.getUsername() %>" style="text-decoration: none; color: inherit;">
                    <div>
                        <strong><%= user.getUsername() %></strong><br>
                    </div>
                </a>
            </div>
        <%  } 
        } else { %>   
            <a href="homepage.jsp" style="display: block; text-decoration: none; cursor: pointer;">
                <div class="grid-item">
                    <strong> No users found. Search Again!</strong> 
                </div>
            </a>   
        <% } %>
    </div>

</body>
</html> --%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="EventIs.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.*" %>

<%@ include file="navbar.jsp" %>

<%
List<String> eventIds = new ArrayList<String>();
List<String> usernames = new ArrayList<String>();
String query = request.getParameter("query");
String imageURL = ""; // Δήλωση του imageURL
try {
    EventDAO eventDAO = new EventDAO();
    
    eventIds = eventDAO.searchEvents(query);
    usernames = eventDAO.searchUsernames(query);

} catch (Exception e) {
    e.printStackTrace(); // Εκτύπωση σφάλματος για εντοπισμό
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding-top: 56px;
            font-family: Arial, sans-serif;
            background-color: #6a0dad;
        }

        h1 {
            font-size: 2rem;
            text-align: center;
            color: #fff;
            margin-top: 20px;
        }

        .results-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            padding: 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .event-image {
            position: relative;
            width: 100%;
            height: 150px;
            overflow: hidden;
        }

        .event-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(90%); 
        }

        .section {
            background-color: #d2bdf0;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
        }

        .section-title {
            text-align: center;
            color: #350632;
            margin-bottom: 20px;
            font-weight: bold;
        }

        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
        }

        .grid-item {
            background-color: #fff;
            color: #000;
            text-align: center;
            padding: 10px;
            border-radius: 10px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
            transition: transform 0.2s ease;
        }

        .grid-item:hover {
            transform: scale(1.05);
        }

        a {
            text-decoration: none;
            color: inherit;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <h1>Search Results</h1>
    <div class="results-container">
        <!-- Events Section -->
        <div class="section">
            <div class="section-title">Events Found</div>
            <div class="grid-container">
                <% if (eventIds != null && !eventIds.isEmpty()) {
                    for (String eventIdStr : eventIds) {
                        EventDAO eventDAO = new EventDAO();
                        Integer eventId = Integer.parseInt(eventIdStr);
                        Event event = eventDAO.findEventByID(eventId);

                        // Ενημέρωση του imageURL βάσει κατηγορίας
                        String category = event.getCategory();
                        if (category != null) {
                            if (category.equals("Party")) {
                                imageURL = "http://ism.dmst.aueb.gr/ismgroup8/party.jpg";
                            } else if (category.equals("Concert")) {
                                imageURL = "http://ism.dmst.aueb.gr/ismgroup8/conserts.jpg";
                            } else if (category.equals("Theatre")) {
                                imageURL = "http://ism.dmst.aueb.gr/ismgroup8/theatre.jpg";
                            } else if (category.equals("Cinema")) {
                                imageURL = "http://ism.dmst.aueb.gr/ismgroup8/cinema.jpg";
                            } else if (category.equals("Festival")) {
                                imageURL = "http://ism.dmst.aueb.gr/ismgroup8/festivals.jpg";
                            } else if (category.equals("Exhibition")) {
                                imageURL = "http://ism.dmst.aueb.gr/ismgroup8/art.jpg";
                            } else if (category.equals("Show")) {
                                imageURL = "http://ism.dmst.aueb.gr/ismgroup8/performance.jpg";
                            } else if (category.equals("Sport")) {
                                imageURL = "http://ism.dmst.aueb.gr/ismgroup8/sports.jpg";
                            } else {
                                imageURL = "http://ism.dmst.aueb.gr/ismgroup8/default.jpg";
                            }
                        }
                %>
                    <div class="grid-item">
                        <div class="event-image">
                            <img src="<%= imageURL %>" alt="Event Image" />
                        </div>
                        <a href="viewEvent.jsp?eventID=<%= event.getEventID() %>&category=<%= event.getCategory() %>" style="color: inherit; text-decoration: none;">
                            <strong><%= event.getName() %></strong>
                        </a><br>
                        <small><%= event.getCity() %></small><br>
                        <small><%= event.getDate() %></small>
                    </div>
                <%  }
                } else { %>
                <div class="grid-item">
                    <a href="homepage.jsp">No events found. Back to homepage!</a>
                </div>
                <% } %>
            </div>
        </div>

        <!-- Users Section -->
        <div class="section">
            <div class="section-title">Users Found</div>
            <div class="grid-container">
                <% if (usernames != null && !usernames.isEmpty()) {
                    for (String username : usernames) {
                        UserDAO userDAO = new UserDAO();
                        User user = userDAO.findUser(username);
                %>
                    <div class="grid-item">
                        <a href="viewProfile.jsp?username=<%= user.getUsername() %>">
                            <strong><%= user.getUsername() %></strong>
                        </a>
                    </div>
                <%  }
                } else { %>
                <div class="grid-item">
                    <a href="homepage.jsp">No users found. Back to homepage!</a>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</body>
</html>
