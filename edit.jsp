<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session = "true" %>
<%@ page import="EventIs.*" %>

<%
    // Πάρτε το eventId από το αίτημα (είτε από την παράμετρο του URL είτε από τη φόρμα)
    String eventIdParam = request.getParameter("eventID");
    
    Event event = null;
    
    // Ελέγξτε αν το eventId υπάρχει και είναι έγκυρο
    if (eventIdParam != null && !eventIdParam.isEmpty()) {
        try {
            int eventId = Integer.parseInt(eventIdParam);
            // Δημιουργήστε το DAO και ανακτήστε το event από τη βάση δεδομένων
            EventDAO eventDAO = new EventDAO();
            event = eventDAO.findEventByID(eventId);
            
            if (event == null) {
                request.setAttribute("errorMessage", "Event not found.");
            }
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid event ID format.");
        }
    } else {
        request.setAttribute("errorMessage", "Missing event ID.");
    }

    // Αν υπάρχει σφάλμα, εμφανίστε το μήνυμα
    if (request.getAttribute("errorMessage") != null) {
%>
    <div class="error-message"><%= request.getAttribute("errorMessage") %></div>
<%
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Event</title>
    <style>
        body {
            background-color: #6a0dad;
            display: flex;
            justify-content: center;
            align-items: center;
            height: auto;
            padding: 40px 0;
            margin: 0;
            font-family: Arial, sans-serif;
            color: #fafafa;
        }

        .form-container {
            width: 95%;
            max-width: 500px;
            padding: 60px 95px;
            background-color: rgba(0, 0, 0, 0.8);
            border-radius: 8px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.4);
        }

        h1 {
            color: #ffffff;
            font-size: 2.3em;
            text-align: center;
        }

        label {
            margin-top: 10px;
            font-size: 1em;
            color: #d4d4d4;
        }

        input[type="text"], input[type="date"], input[type="time"], input[type="number"], textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: #f2f2f2;
        }

        input[type="submit"], .back-button {
            background-color: #6a0dad;
            color: white;
            padding: 12px 20px;
            margin-top: 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s ease;
            width: 100%;
        }

        .back-button {
            margin-top: 10px;
        }

        .error-message {
            color: red;
            font-weight: bold;
            text-align: center;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

    <div class="form-container">
        <h1>Edit Event  <i class="bi bi-megaphone"></i></h1>
        <form method="post" action="editController.jsp">
            <input type="hidden" name="eventId" value="<%= event.getEventID() %>">

            <label for="ename">Event Name:</label>
            <input type="text" id="ename" name="ename" value="<%= event.getName() %>">

            <label for="category">Choose Category:</label>
            <select id="category" name="category">
                <% 
                    String[] categories = { "Party", "Concert", "Theatre", "Cinema", "Festival", "Exhibition", "Show", "Sport" };
                    for (String cat : categories) { 
                %>
                    <option value="<%= cat %>" <%= cat.equals(event.getCategory()) ? "selected" : "" %>><%= cat %></option>
                <% } %>
            </select><br><br>

            <label for="date"><i class="bi bi-calendar-heart"></i> Date:</label>
            <input type="date" id="date" name="date" value="<%= event.getDate() %>">

            <label for="time"><i class="bi bi-clock"></i> Time:</label>
            <input type="time" id="time" name="time" value="<%= event.getTime() %>">

            <label for="city"><i class="bi bi-pin"></i> City:</label>
            <input type="text" id="city" name="city" value="<%= event.getCity() %>">

            <label for="place"><i class="bi bi-pin"></i> Place:</label>
            <input type="text" id="place" name="place" value="<%= event.getPlace() %>">

            <p><i class="bi bi-ticket"></i> Entrance:</p>
            <input type="radio" id="free" name="entry" value="free" <%= (event.getPrice() == 0) ? "checked" : "" %>> Free
            <input type="radio" id="price" name="entry" value="price" <%= (event.getPrice() > 0) ? "checked" : "" %>> Paid

            <div id="priceField" style="display: none;">
                <label for="priceAmount">Price:</label>
                <input type="number" id="priceAmount" name="priceAmount" value="<%= event.getPrice() %>" min="0" step="0.01">
            </div><br>
            <br>

            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="4"><%= event.getDescription() %></textarea>

            <label for="photo">Upload Photo:</label>
            <input type="file" id="photo" name="photo" accept="image/*">

            <input type="submit" value="Update">
        </form>
        <button class="back-button" onclick="window.location.href='userprofile.jsp'"><i class="bi bi-chevron-left"></i> Back to Profile</button>
    </div>
    <script>
        document.getElementById("price").addEventListener("click", () => {
            document.getElementById("priceField").style.display = "block";
        });
        document.getElementById("free").addEventListener("click", () => {
            document.getElementById("priceField").style.display = "none";
        });
    </script>
</body>
</html>
