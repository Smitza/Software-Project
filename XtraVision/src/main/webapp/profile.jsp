<%@ page import="daos.UserDao" %>
<%@ page import="business.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
</head>
<body>
<jsp:include page="head.jsp"/>
<h1>User Profile</h1>
<%
    int userId;
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    if (loggedInUser != null) {
        UserDao userDao = new UserDao("xtra");
        User user = userDao.getUserById(loggedInUser.getId());
%>
<p><strong>User ID:</strong> <%= user.getId() %></p>
<p><strong>Username:</strong> <%= user.getName() %></p>
<p><strong>Email:</strong> <%= user.getEmail() %></p>
<p><strong>Phone:</strong> <%= user.getPhone() %></p>
<p><strong>Name:</strong> <%= user.getName() %></p>
<p><strong>Membership:</strong> <%= user.getMembership() %></p>
<p><strong>Admin:</strong> <%= user.isAdmin()%></p>
<br>
<p>Something not right? <a href="EditUser.jsp">Change it</a></p>

<% } else { %>
<p>User not found.</p>
<% } %>

<jsp:include page="footer.jsp"/>
</body>
</html>