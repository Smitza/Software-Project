<%@ page import="business.User" %><%--
  Created by IntelliJ IDEA.
  User: Sean
  Date: 06/01/2024
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="css/styles.css"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Xtra-Xtra-Vision</title>
</head>
<body>
    <nav class="navbar navbar-expand-sm navbar-dark" style="background-image: linear-gradient(#fa0303, #ff960e 100%, #fff)">
        <div class="container-fluid">
            <a class="navbar-brand mx-auto" href="index.jsp"><img src="images/Xtra-Logo.png" width="300" alt="Return Home"></a>
            <ul class="navbar-nav me-auto fs-3">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="gameslist.jsp">Games</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="movieslist.jsp">Movies</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="tvlist.jsp">Tv-Shows</a>
                </li>
                <% User user  = (User) session.getAttribute("loggedInUser");

                    if(user != null){
                %>
                <li class="nav-item">
                    <a class="nav-link" href="profile.jsp">Profile</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="controller?action=logout">Logout</a>
                </li>
                <%
                    } else {
                %>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="register.jsp">Register</a>
                </li>
                <%}%>
            </ul>
        </div>
    </nav>
