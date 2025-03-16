<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="EventIs.*, java.util.List" %>


<%    String category = request.getParameter("category");%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Saved Posts</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #6a0dad;
            color: aliceblue;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 90%;
            max-width: 1300px;
            color: rgb(255, 255, 255);
            background-color: rgb(58, 12, 93);
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            height: 80vh;
            overflow-y: auto;
        }
        h2 {
            text-align: center;
            margin-top: 10px;
        }
        .filter-container {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }
        .dropdown {
            background-color: #a42bba;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
        }
        .event-cards-grid {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 15px;
        }
        .event-card {
            width: 100%;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
            text-align: center;
            font-family: Arial, sans-serif;
            background-color: #ebd2e5;
            transition: transform 0.3s;
        }
        .event-card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.5);
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
        .event-actions {
            display: flex;
            justify-content: space-around;
            margin-top: 10px;
        }
        .back-button {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .back-button button {
            padding: 10px 20px;
            background-color: #a42bba;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }
        .back-button button:hover {
            background-color: #6a0b71;
        }
        @media (max-width: 768px) {
            .event-cards-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        @media (max-width: 480px) {
            .event-cards-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<%@ include file="navbar.jsp" %>

<%
    User currentUser = (User) session.getAttribute("userObj2024");

    if (currentUser == null) {
        response.sendRedirect("eventIs.jsp");
        return;
    }

    String username = currentUser.getUsername();
%>

<div class="container">
    <h2><i class="bi bi-suit-heart-fill"></i> Saved Posts</h2>

    <!-- Dropdown list for filtering events -->
    <div class="filter-container">
        <select class="dropdown" id="category-filter" onchange="filterPosts()">
            <option value="all">All</option>
            <option value="party">Party</option>
            <option value="concert">Concert</option>
            <option value="theatre">Theatre</option>
            <option value="cinema">Cinema</option>
            <option value="festival">Festival</option>
            <option value="exhibition">Exhibition</option>
            <option value="show">Show</option>
            <option value="sport">Sport</option>
        </select>
    </div>

    <!-- Saved posts list (displaying events dynamically) -->
    <div id="saved-posts-list">
        <div class="event-cards-grid">
            <%
                EventDAO eventDAO = new EventDAO();
                List<Event> favEvents = eventDAO.getFavEvents(username);

                if (favEvents != null && !favEvents.isEmpty()) {
                    for (Event event : favEvents) {
                        String imageURL = "#ffffff"; 
                        if (event.getCategory().equals("Party")) {
                            imageURL = "http://ism.dmst.aueb.gr/ismgroup8/party.jpg";
                        } else if (event.getCategory().equals("Exhibition")) {
                            imageURL = "http://ism.dmst.aueb.gr/ismgroup8/art.jpg";
                        } else if (event.getCategory().equals("Cinema")) {
                            imageURL = "http://ism.dmst.aueb.gr/ismgroup8/cinema.jpg"; 
                        } else if (event.getCategory().equals("Concert")) {
                            imageURL = "http://ism.dmst.aueb.gr/ismgroup8/conserts.jpg";
                        } else if (event.getCategory().equals("Theatre")) {
                            imageURL = "http://ism.dmst.aueb.gr/ismgroup8/theatre.jpg";
                        } else if (event.getCategory().equals("Festival")) {
                            imageURL = "http://ism.dmst.aueb.gr/ismgroup8/festivals.jpg";
                        } else if (event.getCategory().equals("Show")) {
                            imageURL = "http://ism.dmst.aueb.gr/ismgroup8/performance.jpg";
                        } else if (event.getCategory().equals("Sport")) {
                            imageURL = "http://ism.dmst.aueb.gr/ismgroup8/sports.jpg";
                        }
            %> 
            <div class="event-card" data-category="<%= event.getCategory().toLowerCase() %>">
                <div class="event-image">
                    <img src="<%= imageURL %>" alt="image">
                </div>
                <div class="event-info">
                    <p class="event-title">
                        <a href="viewEvent.jsp?eventID=<%= event.getEventID() %>&category=<%= event.getCategory() %>" style="color: inherit; text-decoration: none;">
                            <%= event.getName() %>
                        </a>
                    </p>
                    <p class="event-city"><%= event.getCity() %></p>
                    <p class="event-date"><%= event.getDate().toString() %></p>
                </div>
            </div>
            <%
                    }
                } else {
            %>
                <p id="no-posts-message" style="color: white;">No saved posts available.</p>
            <%
                }
            %>
        </div>
    </div>
</div>

<script>
    function filterPosts() {
        const selectedCategory = document.getElementById('category-filter').value.trim().toLowerCase();
        const posts = document.querySelectorAll('.event-card');
        const noPostsMessage = document.getElementById('no-posts-message');
        let postsFound = false;

        posts.forEach(post => {
            const category = post.getAttribute('data-category').trim().toLowerCase();

            if (selectedCategory === 'all' || category === selectedCategory) {
                post.style.display = 'block';
                postsFound = true;
            } else {
                post.style.display = 'none';
            }
        });

        if (noEventsMessage) {
            noEventsMessage.style.display = postsFound ? 'none' : 'block';
            if (!postsFound) {
                noEventsMessage.textContent = "No saved events found for the selected category.";
            }
        }
    }
</script>

</body>
</html>
