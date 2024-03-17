<%@ page import="business.User" %><%--
  Created by IntelliJ IDEA.
  User: Sean
  Date: 13/03/2024
  Time: 23:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="head.jsp"/>

<h2>Choose Your Subscription Plan</h2>
<% User user  = (User) session.getAttribute("loggedInUser");

    if(user != null){
%>
<form action="controller" method="post">
    <input type="hidden" name="action" value="subscribe">
    <label for="subscription">Select Subscription Plan:</label>
    <select id="subscription" name="subscription">
        <option value="gold">Gold</option>
        <option value="silver">Silver</option>
    </select>
    <br>
    <input type="submit" value="Subscribe">
</form>
<% } else {
    response.sendRedirect("login.jsp");
    String errorMessage = "Please login to subscribe";
    session.setAttribute("loginErrorMessage", errorMessage);
} %>

<jsp:include page="footer.jsp"/>