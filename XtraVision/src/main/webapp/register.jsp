<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<body>
<jsp:include page="head.jsp"/>

<h2>User Registration</h2>

<% String errorMessage = (String) request.getSession().getAttribute("errorMessage");
    if(errorMessage != null) { %>
<p style="color:red;"><%= errorMessage %></p>
<% request.getSession().removeAttribute("errorMessage");
}
%>

<form action="Controller" method="post">
    <input type="hidden" name="command" value="RegisterCommand">

    <label for="username">Username:</label><br>
    <input type="text" id="username" name="username" required><br>

    <label for="email">Email:</label><br>
    <input type="email" id="email" name="email" required><br>

    <label for="password">Password:</label><br>
    <input type="password" id="password" name="password" required><br>

    <label for="phone">Phone:</label><br>
    <input type="text" id="phone" name="phone" required><br>

    <label for="name">Name:</label><br>
    <input type="text" id="name" name="name" required><br>

    <label for="membership">Membership (Enter 0 for Standard, 1 for Premium):</label><br>
    <input type="number" id="membership" name="membership" required><br>

    <label for="isAdmin">Admin Status (Enter 0 for User, 1 for Admin):</label><br>
    <input type="number" id="isAdmin" name="isAdmin" required><br>

    <input type="submit" value="register">
</form>

</body>

<jsp:include page="footer.jsp"/>

