<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" session="true" %>
<%@ page import="EventIs.*" %>


<%
String username = request.getParameter("username");
String password = request.getParameter("password");

try {
    UserDAO userDAO = new UserDAO();

    User user = userDAO.authenticate(username, password);

    if (user != null) {
    session.setAttribute("userObj2024", user);
    //allaja to entrance
    response.sendRedirect("tryentrance.jsp");

    } else {
        request.setAttribute("message", "Wrong username or password");
        request.getRequestDispatcher("eventIs.jsp").forward(request, response);

    }

} catch (Exception e) {
    request.setAttribute("message", "Wrong username or password");
    request.getRequestDispatcher("eventIs.jsp").forward(request, response);
}
%>