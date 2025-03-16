<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="EventIs.*" %>

<%
User user = (User) session.getAttribute("userObj2024");

    if (user == null) {
        request.setAttribute("message", "You are not authorized to access this resource. Please login.");
        %>
        <jsp:forward page="eventIs.jsp" />
        <%
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Upload Event</title>
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
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        h1 {
            color: #ffffff;
            font-size: 2.3em;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }

        form {
            display: flex;
            flex-direction: column;
            width: 100%;
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

        .category-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            gap: 10px;
            margin-top: 10px;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        #priceField {
            display: none;
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
            text-align: center;
        }

        input[type="submit"]:hover, .back-button:hover {
            background-color: #5c0bb2;
        }

        .back-button {
            margin-top: 10px;
        }

        @media (max-width: 600px) {
            .form-container {
                width: 100%;
                padding: 20px;
            }

            input[type="submit"], .back-button {
                padding: 10px;
                font-size: 0.9em;
            }
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

    <div class="form-container">
        <h1>My Event <i class="bi bi-mic"></i></h1>
        <form method="post" action="upload_Controller.jsp">
            <label for="ename">Event Name:</label>
            <input type="text" id="ename" name="ename">

            <p>Choose Category:</p>
            <div class="category-grid">
                <div>
                    <input type="radio" id="party" name="category" value="Party">
                    <label for="party">Party</label>
                </div>
                <div>
                    <input type="radio" id="concert" name="category" value="Concert">
                    <label for="concert">Concert</label>
                </div>
                <div>
                    <input type="radio" id="theatre" name="category" value="Theatre">
                    <label for="theatre">Theatre</label>
                </div>
                <div>
                    <input type="radio" id="cinema" name="category" value="Cinema">
                    <label for="cinema">Cinema</label>
                </div>
                <div>
                    <input type="radio" id="festival" name="category" value="Festival">
                    <label for="festival">Festival</label>
                </div>
                <div>
                    <input type="radio" id="exhibition" name="category" value="Exhibition">
                    <label for="exhibition">Exhibition</label>
                </div>
                <div>
                    <input type="radio" id="show" name="category" value="Show">
                    <label for="show">Show</label>
                </div>
                <div>
                    <input type="radio" id="sport" name="category" value="Sport">
                    <label for="sport">Sport</label>
                </div>
            </div>

            
            <p><label for="date"><i class="bi bi-calendar-heart"></i> Date:</label>
            <input type="date" id="date" name="date"></p>

            <p><label for="time"><i class="bi bi-clock"></i> Time:</label>
            <input type="time" id="time" name="time"></p>

            <p><label for="city"><i class="bi bi-pin"></i> City:</label>
            <input type="text" id="city" name="city"></p>

            <p><label for="place"><i class="bi bi-pin"></i> Place:</label>
            <input type="text" id="place" name="place"></p>

            <p>
                <label><i class="bi bi-ticket"></i> Entrance:</label>
                <input type="radio" id="free" name="entry" value="free" onclick="togglePriceField()" checked>
                <label for="free">Free</label>

                <input type="radio" id="price" name="entry" value="price" onclick="togglePriceField()">
                <label for="price">Price</label>

                <div id="priceField">
                    <label for="priceAmount">Entrance Price:</label>
                    <input type="number" id="priceAmount" name="priceAmount" min="0" step="0.01">
                </div>
            </p>

            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="4"></textarea>

            <label for="photo"><i class="bi bi-upload"></i> Upload Event Photo:</label>
            <input type="file" id="photo" name="photo" accept="image/*">

            <input type="submit" value="Submit">
        </form>
        <button class="back-button" onclick="window.location.href='http://ism.dmst.aueb.gr/ismgroup8/userprofile.jsp'">Back to Profile</button>
    </div>

    <script>
        function togglePriceField() {
            var priceField = document.getElementById("priceField");
            priceField.style.display = document.getElementById("price").checked ? "block" : "none";
        }
    </script>

</body>
</html>
