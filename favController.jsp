<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="EventIs.*" %>
<%

User currentUser = (User) session.getAttribute("userObj2024");

if (currentUser == null) {
    response.sendRedirect("eventIs.jsp");
    return;
}

String username = currentUser.getUsername();
String category = request.getParameter("category");
String eventIDStr = request.getParameter("eventID");
int eventID = Integer.parseInt(eventIDStr);
UserDAO userDAO = new UserDAO();
boolean fav = userDAO.isFavorite(eventID, username);

try {
    if (fav) {
        userDAO.removeFavoriteFromDatabase(eventID, username);
        
    } else {
        userDAO.addFavoriteToDatabase(eventID, username);
        
    }   
} catch (Exception e) {
    e.printStackTrace();

   
}
String referer = request.getHeader("Referer");
if (referer != null && !referer.trim().isEmpty()) {
    response.sendRedirect(referer);
} else {
    // Αν δεν υπάρχει Referer, επέστρεψε σε default σελίδα
    response.sendRedirect("eventIs.jsp");
}
// response.sendRedirect("category.jsp?category=" + category);
%>