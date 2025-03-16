<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="EventIs.*" %>
<%@ page import="java.util.List" %>
<%

User currentUser = (User) session.getAttribute("userObj2024");
if (currentUser == null) {
    response.sendRedirect("eventIs.jsp");
    return;
}

String username = currentUser.getUsername();
UserDAO userDAO = new UserDAO();

String category = request.getParameter("category");
EventDAO eventDAO = new EventDAO();
List<Event> events = eventDAO.getEventsByCategory(category);

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
            filterbuttonColor ="#6a0dad";
            backgroundFilterPanel ="#690289";
            eventcardBoxShadow ="#80008033";
            backgroundEventCard ="#f3e5f5";
            hoverboxshadowEventCard ="#62007D66";
            backgroundEventOverlay ="#4B0082CC";
            eventoverlayColor = "#e1bee7";
            eventTitle ="#6a1b9a";
            eventCity ="#6a1b9a";
            eventDate ="#9c27b0";
            noevents ="#130303";
            navbarText = "#000000";
            imageURL ="http://ism.dmst.aueb.gr/ismgroup8/party.jpg";
        } else if (category.equals("Concert")) {
            backgroundBodyContainer ="#1720d7";
            backgroundEventBox ="#2c59a7";
            filterbuttonColor ="#1720d7";
            backgroundFilterPanel ="#2c59a7";
            eventcardBoxShadow ="#00008033";
            backgroundEventCard ="#e3f2fd";
            hoverboxshadowEventCard ="#00336666";
            backgroundEventOverlay ="#0066CCCC";
            eventoverlayColor = "#bbdefb";
            eventTitle ="#0d47a1";
            eventCity ="#1565c0";
            eventDate ="#1976d2";
            noevents ="#130303";
            navbarText = "#000000";
            imageURL ="http://ism.dmst.aueb.gr/ismgroup8/conserts.jpg";
        } else if (category.equals("Theatre")) {
            backgroundBodyContainer ="#ec4949";
            backgroundEventBox ="#";
            filterbuttonColor ="#ec4949";
            backgroundFilterPanel ="#cd2a2a";
            eventcardBoxShadow ="#80000033";
            backgroundEventCard ="#fdecea";
            hoverboxshadowEventCard ="#99000066";
            backgroundEventOverlay ="#ec4949";
            eventoverlayColor = "#130303";
            eventTitle ="#b71c1c";
            eventCity ="#b71c1c";
            eventDate ="#d32f2f";
            noevents ="#130303";
            navbarText = "#000000";
            imageURL ="http://ism.dmst.aueb.gr/ismgroup8/theatre.jpg";
        } else if (category.equals("Cinema")) {
            backgroundBodyContainer ="#000000";
            backgroundEventBox ="#333333";
            filterbuttonColor ="#000000";
            backgroundFilterPanel ="#333333";
            eventcardBoxShadow ="#0000004D";
            backgroundEventCard ="#2e2e2e";
            hoverboxshadowEventCard ="#00000080";
            backgroundEventOverlay ="#00000080";
            eventoverlayColor = "#f5f5f5";
            eventTitle ="#ffffff";
            eventCity ="#b0b0b0";
            eventDate ="#e0e0e0";
            noevents ="#ffffff";
            navbarText = "#000000";
            imageURL ="http://ism.dmst.aueb.gr/ismgroup8/cinema.jpg";
        }else if (category.equals("Festival")) {
            backgroundBodyContainer ="#e7610e";
            backgroundEventBox ="#FFA50033";
            filterbuttonColor ="#e7610e";
            backgroundFilterPanel ="#ef753c";
            eventcardBoxShadow ="#FFA50033";
            backgroundEventCard ="#fff3e0";
            hoverboxshadowEventCard ="#FF8C0066";
            backgroundEventOverlay ="#e7610e";
            eventoverlayColor = "#fff3e0";
            eventTitle ="#ff6f20";
            eventCity ="#ff8f00";
            eventDate ="#ff9800";
            noevents ="#130303";
            navbarText = "#000000";
            imageURL ="http://ism.dmst.aueb.gr/ismgroup8/festivals.jpg";
        }else if (category.equals("Exhibition")) {
            backgroundBodyContainer ="#7a7b7b";
            backgroundEventBox ="#a8a087";
            filterbuttonColor ="#7a7b7b";
            backgroundFilterPanel ="#a8a087";
            eventcardBoxShadow ="#CC996633";
            backgroundEventCard ="#f5f5dc";
            hoverboxshadowEventCard ="#A57D3266";
            backgroundEventOverlay ="#A57D32CC";
            eventoverlayColor = "#fff8e1";
            eventTitle ="#6d4c41";
            eventCity ="#8d6e63";
            eventDate ="#bcaaa4";
            noevents ="#130303";
            navbarText = "#000000";
            imageURL ="http://ism.dmst.aueb.gr/ismgroup8/art.jpg";
        }else if (category.equals("Show")) {
            backgroundBodyContainer ="#090338";
            backgroundEventBox ="#14112c";
            filterbuttonColor ="#090338";
            backgroundFilterPanel ="#14112c";
            eventcardBoxShadow ="#00008033";
            backgroundEventCard ="#e3f2fd";
            hoverboxshadowEventCard ="#00006666";
            backgroundEventOverlay ="#00008BCC";
            eventoverlayColor = "#bbdefb";
            eventTitle ="#0d47a1";
            eventCity ="#0d47a1";
            eventDate ="#1e88e5";
            noevents ="#ffffff";
            navbarText = "#000000";
            imageURL ="http://ism.dmst.aueb.gr/ismgroup8/performance.jpg";
        }else if (category.equals("Sport")) {
            backgroundBodyContainer ="#049635";
            backgroundEventBox ="#";
            filterbuttonColor ="#049635";
            backgroundFilterPanel ="#20db4e";
            eventcardBoxShadow ="#00800033";
            backgroundEventCard ="#e8f5e9";
            hoverboxshadowEventCard ="#00640066";
            backgroundEventOverlay ="#049635";
            eventoverlayColor = "#20db4e";
            eventTitle ="#388e3c";
            eventCity ="#43a047";
            eventDate ="#4caf50";
            noevents ="#130303";
            navbarText = "#000000";
            imageURL ="http://ism.dmst.aueb.gr/ismgroup8/sports.jpg";
        }
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category: <%= category %></title>
<style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: <%=backgroundBodyContainer %> !important;

        } 

        .grid-container {
            display: grid;
            grid-template-columns: repeat(1, 1fr);
            gap: 20px;
            padding: 20px;
            background-color: <%=backgroundBodyContainer %> !important;
        }      
        .grid-item {
            height: 350px;
            background-size: cover;
            background-position: center;
            color: rgb(255, 255, 255);
            font-size: 6em;
            display: flex;
            justify-content: center;
            align-items: flex-end;
            border-radius: 10px;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }
        .grid-item span {
            opacity: 0.5;
        }
        .grid-item-1 {
            background-image: url('<%=imageURL%>');
        }
        .events-section {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 5px;
        }

        .events-column {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            align-items: start;
            width: 100%;
            max-width: 1200px; 
            justify-items: center;
            justify-content: center;
            text-align: center; 
        }

        .event-box-container {
            display: flex;
            justify-content: space-between;
            width: 100%;
        }
        .event-box {
            padding: 20px; 
            border-radius: 5px; 
            text-align: center; 
            width: 30%; 
            height: 150px;
            margin: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
            box-sizing: border-box;
            background-color: <%=backgroundEventBox %>; 
        }
        .events-column h1 {
            text-align: center;
            margin-bottom: 10px;
            font-size: 3em;
        }
        .filter-button { 
            border: none;
            border-radius: 25px; 
            padding: 12px 25px;  
            font-size: 1.2em;      
            cursor: pointer;
            margin-bottom: 20px;
            color: #fff;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);  
            transition: background-color 0.3s ease, transform 0.3s ease; 
            background-color: <%=filterbuttonColor %>;
        }

        .filter-button:hover {
            background-color: <%=hoverboxshadowEventCard %>; 
            transform: scale(1.05);   
}
        .filter-panel {
            display: none;
            padding: 20px;
            border-radius: 8px;  
            width: 80%;
            max-width: 500px;  
            color: #fff;
            text-align: center;
            margin-top: 20px;
            background-color: <%= backgroundFilterPanel %>;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.3);  
            z-index: 2;
        }

        .filter-panel label {
            display: block;
            margin: 10px 0;
        }
        
        .filter-panel input, .filter-panel select {
            margin: 8px 0;
            padding: 8px;
            width: 100%;
            font-size: 1em;
            border-radius: 4px;
            border: 1px solid #ccc;  
        }

        .filter-panel button {
            margin-top: 15px;
            border: none;
            padding: 12px 20px;
            color: #fff;
            border-radius: 25px;
            font-size: 1.1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
            background-color: <%= backgroundFilterPanel %>;
        }

        .no-events-message {
            display: none;
            font-size: 1.5em;
            margin-top: 20px;
            color:<%=noevents %>;
        }

        .event-card {
            width: 100%;  
            max-width: 250px;  
            box-sizing: border-box;
            position: relative;
            border-radius: 8px;
            overflow: hidden;
            text-align: center;
            font-family: Arial, sans-serif;
            transition: transform 0.3s;
            margin: 0 auto; 
            background-color: <%=backgroundEventCard %>;
            box-shadow: <%=eventcardBoxShadow %>;
      }

      .event-card:hover {
         transform: scale(1.05);
         box-shadow: <%=hoverboxshadowEventCard %>; 
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

      .event-overlay {
         position: absolute;
         top: 10px;
         left: 10px;
         padding: 4px 8px;
         border-radius: 4px;
         font-size: 12px;
         background-color:<%=backgroundEventOverlay %>; 
         color:<%=eventoverlayColor %>;
      }
      .event-info {
         padding: 12px;
      }

      .event-title {
         font-size: 18px;
         font-weight: bold;
         color: <%=eventTitle %>; 
         margin-bottom: 8px;
      }

      .event-city {
         font-size: 16px;
         color: <%=eventCity %>; 
         margin-bottom: 6px;
      }

      .event-date {
         font-size: 18px;
         font-weight: bold;
         color: <%=eventDate %>; 
      }

      .heart-icon {
        position: absolute;
        top: 10px;
        right: 10px;
        font-size: 1.5em;
        color: <%=backgroundEventCard %>;
        cursor: pointer;
        transition: color 0.3s ease;
        z-index: 10;
        display: block;
       }

       .heart-icon:hover {
           color: #e57373; 
        }

       .heart-icon.active i {
          color: #e57373; 
        }
       .no-avevents-message {
            font-size: 18px;
            font-weight: bold;
            color: black;
            grid-column: span 4;  
            display: flex;
            justify-content: center;  
            align-items: center;      
            height: 100%;             
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
  
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <%@ include file="navbar.jsp" %>
    
    <div class="grid-container">
        <div class="grid-item grid-item-1">
            <span class="item-text" style="font-size: 60px;" ><b><%=category %></b></span>
        </div>
    </div>

    <hr>
    
    <div class="events-section">

            <button class="filter-button" onclick="toggleFilterPanel()">filters</button>

            <div class="filter-panel" id="filterPanel">
                <h2>filters</h2>
                
                <label for="dateFilter">Date:</label>
                <input type="date" id="dateFilter" name="dateFilter">

                <label for="placeFilter">Place:</label>
                <select id="placeFilter" name="placeFilter">
                    <option value="">Select a city</option>
                    <option value="Athens">Athens</option>
                    <option value="Thessaloniki">Thessaloniki</option>
                    <option value="Patra">Patra</option>
                    <option value="Ioannina">Ioannina</option>
                    <option value="Chania">Chania</option>
                    <option value="Rethymno">Rethymno</option>
                    <option value="Volos">Volos</option>
                </select>

                <label for="priceFilter">Price:</label>
                <input type="number" id="priceFilter" name="priceFilter" placeholder="Enter maximum price">

                <button onclick="applyFilters()">Apply</button>
            </div>

            <h1><b>EVENTS</b></h1>
            
            <div class="no-events-message" id="noEventsMessage">There are no available events</div>

            <div class="events-column">
                <% if (events != null && !events.isEmpty()) { 
                     for (Event event : events) { 
                        
                        boolean isFavorite = userDAO.isFavorite(event.getEventID(), username);

                        %>
                        <div class="event-card" 
                            data-event="<%= event.getName() %>" 
                            data-date="<%= event.getDate() %>" 
                            data-place="<%= event.getCity() %>" 
                            data-price="<%= event.getPrice() %>">
                            
                            <form action="favController.jsp" method="POST" style="display:inline;" id="favForm<%= event.getEventID() %>">
                                <input type="hidden" name="eventID" value="<%= event.getEventID() %>">
                                <input type="hidden" name="category" value="<%= request.getParameter("category") %>">
                                
                                <div class="heart-icon <%= isFavorite ? "active" : "" %>" onclick="toggleHeart(this); document.getElementById('favForm<%= event.getEventID() %>').submit();">
                                    <i class="bi bi-heart-fill"></i>
                                </div>
                            </form>

                            <div class="event-image">
                                <img src="<%=imageURL%>" alt="<%= event.getName() %>" />
                            </div>
                            <div class="event-info">
                                <p class="event-title">
                                
                                    <a href="viewEvent.jsp?eventID=<%= event.getEventID() %>&category=<%= request.getParameter("category") %>" style="color: inherit; text-decoration: none;">
                                        <%= event.getName() %>
                                    </a>
                                </p>
                                <p class="event-city"><%= event.getPlace() %></p>
                                <p class="event-date"><%= event.getDate() %></p>
                                <p class="event-price">$<%= event.getPrice() %></p>
                            </div>
                        </div> 
                    <% } %>
                <% } else { %>
                    <div class="no-avevents-message">
                        <p>No events found for this category.</p>
                    </div>
                <% } %>

            </div>
        </div>
    

    <script>
        function toggleFilterPanel() {
            const filterPanel = document.getElementById("filterPanel");
            filterPanel.style.display = filterPanel.style.display === "none" ? "block" : "none";
        }

        function applyFilters() {
            const dateFilter = document.getElementById("dateFilter").value;
            const placeFilter = document.getElementById("placeFilter").value;
            const priceFilter = document.getElementById("priceFilter").value;

            const eventCards = document.querySelectorAll(".event-card");
            let hasVisibleEvents = false;

            eventCards.forEach(card => {
                const eventDate = card.getAttribute("data-date");
                const eventPlace = card.getAttribute("data-place");
                const eventPrice = parseInt(card.getAttribute("data-price"));

                let displayEvent = true;

                if (dateFilter && eventDate !== dateFilter) {
                    displayEvent = false;
                }
                if (placeFilter && eventPlace !== placeFilter) {
                    displayEvent = false;
                }
                if (priceFilter && eventPrice > parseInt(priceFilter)) {
                    displayEvent = false;
                }

                card.style.display = displayEvent ? "flex" : "none";
                if (displayEvent) {
                    hasVisibleEvents = true;
                }
            });

            document.getElementById("noEventsMessage").style.display = hasVisibleEvents ? "none" : "block";
        }


        function toggleHeart(element) {
             element.classList.toggle('active'); 
        }

    </script>
</body>
</html>