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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="apple-touch-icon" sizes="180x180" href="images/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/x-icon" sizes="32x32" href="images/favicon/favicon-16x16.png">
    <meta charset="utf-8">
    <title>Xtra-Xtra-Vision</title>
</head>
<body>
    <nav class="navbar navbar-expand-sm navbar-dark" style="background-image: linear-gradient(#fa0303, #ff960e 100%, #fff) ;">
        <div class="container-fluid">
            <a class="navbar-brand mx-auto" href="index.jsp"><img src="images/Xtra-Logo.png" width="300" alt="Return Home"></a>
            <ul class="navbar-nav me-auto fs-3">
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
                <li class="nav-item">
                    <a class="nav-link" href="Cart.jsp">Cart</a>
                </li>
                <% if(user.isAdmin() == 1 ) { %>
                <li class="nav-item">
                    <a class="nav-link" href="admincontrol.jsp">Admin Control Panel</a>
                </li>
                <% }
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
