<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="EventIs.*, java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <style>
        /*
        body {
            font-family: Arial, sans-serif;
            background-color: #6a0dad;
            color: rgb(251, 250, 252);
            margin: 0;
            padding: 56px 0 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;

        }
        .container {
            width: 90%;
            max-width: 1300px;
            background-color: rgb(58, 12, 93);
            color: rgb(251, 250, 252);
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: visible;
        }
        .profile-header {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        .profile-header img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-right: 20px;
            object-fit: cover;
        }
        .file-input {
            display: none;
        }
        .file-label {
            background-color: #a42bba;
            color: rgb(255, 254, 254);
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px; /* Space between image and button */
        /*}
        .add-post-button {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            position: sticky;
            bottom: 20px;
        }
        .add-post-button button {
            width: 50px;
            height: 50px;
            background-color: #a42bba;
            border: none;
            border-radius: 50%;
            color: white;
            font-size: 30px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .add-post-button button:hover {
            background-color: #6a0b71;
        }
        .event-card {
           flex: 1 1 calc(33.33% - 20px);
           width: 100%;
           max-width: calc(33.33% - 20px); 
           min-width: 100px;
           box-sizing: border-box;
           border-radius: 8px;
           overflow: hidden;
           box-shadow: 0 4px 12px rgba(128, 0, 128, 0.2);
           text-align: center;
           font-family: Arial, sans-serif;
           background-color: #f3e5f5;
           margin-bottom: 20px;
           transition: transform 0.3s;
        }
        .event-card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 16px rgba(98, 0, 125, 0.4);
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
        .event-info {
           padding: 12px;
        }
        .event-title {
            font-size: 18px;
            font-weight: bold;
            color: #6a1b9a;
            margin-bottom: 8px;
        }
        .event-city {
            font-size: 16px;
            color: #6a1b9a; 
            margin-bottom: 6px;
        }
        .event-date {
            font-size: 18px;
            font-weight: bold;
            color: #9c27b0;
        }
        .event-actions {
            display: flex;
            justify-content: space-around;
            margin-top: 10px;
        }

        .event-cards-grid {
            display: flex;
            max-width: 100;
            justify-content: space-between;
            justify-content: flex-start;
            flex-wrap: wrap;
            gap: 50px;
            padding-left: 60px;
            padding-right: 60px;
            padding-top: 15px;
        }
        .event-card {
            flex: 1;
            max-width: calc(33.33% - 10px); 
            box-sizing: border-box;
        }
        .edit-button, .delete-button {
            background-color: #a42bba;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            cursor: pointer;
        }
        .edit-button:hover {
            background-color: #6a0b71;
        }
        .delete-button:hover {
            background-color: #d22623;
        }
    

@media (max-width: 1200px) {
    .events-column {
        grid-template-columns: repeat(3, 1fr);  
    }
}

@media (max-width: 768px) {
    .events-column {
        grid-template-columns: repeat(2, 1fr);  
    }
}

@media (max-width: 480px) {
    .events-column {
        grid-template-columns: 1fr;  
    }
}

*/

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

.file-input {
    display: none;
}
.file-label {
    background-color: #a42bba;
    color: rgb(255, 254, 254);
    padding: 5px 10px;
    border-radius: 5px;
    cursor: pointer;
    margin-top: 10px;

}
h3 {
    font-size: 20px; 
    font-weight: normal;  
    text-align: center; 
    margin-top: 15px; 
    margin-bottom: 15px;
    text-transform: none;
    letter-spacing: 0.5px;
    border-bottom: 1px solid #d82c9f;
    width: fit-content; 
    margin-left: auto; /* ÎšÎµÎ½Ï„ÏÎ¬ÏÎ¹ÏƒÎ¼Î± */
    margin-right: auto; /* ÎšÎµÎ½Ï„ÏÎ¬ÏÎ¹ÏƒÎ¼Î± */
}
.heart-button {
            background-color: transparent;
            border: none;
            cursor: pointer;
            font-size: 60px;
            color: #a42bba;
            margin-left: auto;
            display: flex;
            align-items: center;
            justify-content: center;
}
.heart-button:hover {
    color: #d22623;
}
.event-cards-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 40px;
    padding-right: 30px;
    padding-left: 30px;
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
    color: #6a1b9a;
    margin-bottom: 8px;
}

.event-city {
    font-size: 16px;
    color: #6a1b9a;
    margin-bottom: 6px;
}

.event-date {
    font-size: 18px;
    font-weight: bold;
    color: #9c27b0;
}

.event-actions {
    display: flex;
    justify-content: space-around;
    margin-top: 10px;
}

.edit-button, .delete-button {
    background-color: #a42bba;
    color: white;
    border: none;
    padding: 5px 10px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
}

.edit-button:hover {
    background-color: #6a0b71;
}

.delete-button:hover {
    background-color: #d22623;
}

.add-post-button {
    display: flex;
    justify-content: center;
    margin-top: 20px;
    position: sticky;
    bottom: 20px;
}

.add-post-button button {
    width: 50px;
    height: 50px;
    background-color: #a42bba;
    border: none;
    border-radius: 50%;
    color: white;
    font-size: 30px;
    cursor: pointer;
    display: flex;
    align-items: center;
    justify-content: center;
}

.add-post-button button:hover {
    background-color: #6a0b71;
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
    }
}
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<%@ include file="navbar.jsp" %>

<%
    String imageURL = "#ffffff";
    User currentUser = (User) session.getAttribute("userObj2024");

    if (currentUser == null) {
        response.sendRedirect("eventIs.jsp");
        return;
    }

    String username = currentUser.getUsername();
%>

<div class="container">
    <div class="profile-header">
        <img id="profile-pic" src="photo profile.png" alt="Profile Picture">
        <h2><code><%= username %></code></h2>
        <button class="heart-button" onclick="window.location.href='saved_posts.jsp'"><i class="bi bi-suit-heart-fill"></i></button>
    </div>
    <div class="change-photo">
        <input type="file" id="file-input" class="file-input" accept="image/*" onchange="previewImage(event)">
        <label for="file-input" class="file-label">Change Photo</label>
    </div>
    <hr>
    <div class="form-container">
        <% if(request.getAttribute("message") != null) { %>		
            <div class="alert text-center" style=" color: #cc3300" role="alert"><%=(String)request.getAttribute("message") %><i class="bi bi-exclamation-triangle"></i></div>
        <% } %>
    <h3>My Events:</h3>
    <!-- Display Events -->
    <div class="event-cards">
        <div class="event-cards-grid">
        <%
            // Fetch user's events from the database
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
            <% if(event.getCategory().equals("Party")) {
                imageURL ="http://ism.dmst.aueb.gr/ismgroup8/party.jpg";
            }else if(event.getCategory().equals("Exhibition")){
                imageURL ="http://ism.dmst.aueb.gr/ismgroup8/art.jpg";
            }else if(event.getCategory().equals("Cinema")){
                imageURL ="http://ism.dmst.aueb.gr/ismgroup8/cinema.jpg"; 
            }else if(event.getCategory().equals("Concert")){
                imageURL ="http://ism.dmst.aueb.gr/ismgroup8/conserts.jpg";
            }else if(event.getCategory().equals("Theatre")){
                imageURL ="http://ism.dmst.aueb.gr/ismgroup8/theatre.jpg";
            }else if(event.getCategory().equals("Festival")){
                imageURL ="http://ism.dmst.aueb.gr/ismgroup8/festivals.jpg";
            }else if(event.getCategory().equals("Show")){
                imageURL ="http://ism.dmst.aueb.gr/ismgroup8/performance.jpg";
            }else if(event.getCategory().equals("Sport")){
                imageURL ="http://ism.dmst.aueb.gr/ismgroup8/sports.jpg";
            }
            
            %> 
            <div class="event-image">
                <img src="<%=imageURL%>" alt="image">
            </div>
            <div class="event-info">
                <p class="event-title"><%= event.getName() %></p>
                <p class="event-city"><%= event.getCity() %></p>
                <p class="event-date"><%= event.getDate() %></p>
            </div>
            <div class="event-actions">
                <button class="edit-button" onclick="window.location.href='edit.jsp?eventID=<%= event.getEventID() %>'">Edit <i class="bi bi-pencil"></i></button>

                <!-- Delete Form -->
                <form action="delete_post.jsp" method="POST" onsubmit="return confirm('Are you sure you want to delete this event?');">
                    <input type="hidden" name="eventID" value="<%= event.getEventID() %>">
                    <button type="submit" class="delete-button">Delete <i class="bi bi-trash3"></i></button>
                </form>
            </div>
        </div>
        <%
                }
            } else {
        %>
            <p>You have no events posted.</p>
        <%
            }
        %>
        </div>
    </div>

    <!-- Add New Event -->
    <div class="add-post-button">
        <button onclick="window.location.href='uploadEvent.jsp'"><i class="bi bi-plus-lg"></i></button>
    </div>
</div>

<script>
    function previewImage(event) {
        const input = event.target;
        const file = input.files[0];
        const reader = new FileReader();

        reader.onload = function() {
            const img = document.getElementById('profile-pic');
            img.src = reader.result; // Update profile picture
        }

        if (file) {
            reader.readAsDataURL(file); // Convert image to base64
        }
    }
</script>

</body>
</html>
