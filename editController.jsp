<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="EventIs.*" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalTime" %>

<%
/*
* Getting parameters from request.
*/
String eventIdParam = request.getParameter("eventId");
String name = request.getParameter("ename");
String category = request.getParameter("category");
String date = request.getParameter("date");
String time = request.getParameter("time");
String city = request.getParameter("city");
String place = request.getParameter("place");
String description = request.getParameter("description");
String entry = request.getParameter("entry");
String priceAmountParam = request.getParameter("priceAmount");

int countErrors = 0;

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

/*
* If page is called directly (from url) and not via form, all parameters will be null.
* In that case, errorPage.jsp will respond.
*/
if (eventIdParam == null || eventIdParam.isEmpty()) {
    countErrors++;
}

if (name == null || name.length() < 3) {
    countErrors++;
}

if (category == null || category.equals("")) {
    countErrors++;
}

if (date == null || date.equals("")) {
    countErrors++;
}

if (time == null || time.equals("")) {
    countErrors++;
}

if (city == null || city.length() < 2) {
    countErrors++;
}

if (place == null || place.length() < 2) {
    countErrors++;
}

/*
* If entry is "price", check that priceAmount is a valid number.
*/
double priceAmount = 0.0;
if ("price".equals(entry)) {
    try {
        priceAmount = Double.parseDouble(priceAmountParam);
        if (priceAmount < 0) {
            countErrors++;
        }
    } catch (NumberFormatException e) {
        countErrors++;
    }
}

/*
* If there is an error in form data, then add an attribute (with name errorMessage) to request 
* and forward to the edit event page.
*/
if (countErrors > 0) {
    request.setAttribute("errorMessage", "Form has " + (countErrors == 1 ? "1 error!" : countErrors + " errors!"));
    request.setAttribute("eventId", eventIdParam);  // Passing back the event ID
    RequestDispatcher dispatcher = request.getRequestDispatcher("edit.jsp");
    dispatcher.forward(request, response);
    return;
}


LocalDate localDate = LocalDate.parse(date);
LocalTime localTime = LocalTime.parse(time);
int eventId = Integer.parseInt(eventIdParam);
Event event = new Event(eventId, name,  localDate, localTime, city, place, priceAmount, category,description);


EventDAO eventDAO = new EventDAO();
try {
    eventDAO.editEventInDatabase(event);
} catch (Exception e) {
    // In case of other errors, appError.jsp will handle it
    request.setAttribute("errorMessage", "Error occurred while updating the event.");
    RequestDispatcher dispatcher = request.getRequestDispatcher("edit.jsp");
    dispatcher.forward(request, response);
    return;
}

RequestDispatcher dispatcher = request.getRequestDispatcher("userprofile.jsp");
dispatcher.forward(request, response);
%>
