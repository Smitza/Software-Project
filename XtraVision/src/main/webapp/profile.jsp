<%@ page import="daos.UserDao" %>
<%@ page import="business.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="head.jsp"/>
<h1>User Profile</h1>
<%
    int userId;
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    if (loggedInUser != null) {
        UserDao userDao = new UserDao("xtra");
        User user = userDao.getUserById(loggedInUser.getId());
%>
<p><strong>Username:</strong> <%= user.getUserName() %></p>
<p><strong>Email:</strong> <%= user.getEmail() %></p>
<p><strong>Phone:</strong> <%= user.getPhone() %></p>
<p><strong>Name:</strong> <%= user.getName() %></p>

<br>
<p>Something not right? <a href="EditUser.jsp">Change it</a></p>

<% } else {
response.sendRedirect("login.jsp");
} %>

<jsp:include page="footer.jsp"/>
</body>
</html>