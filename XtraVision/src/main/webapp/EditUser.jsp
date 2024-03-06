<%@ page import="daos.UserDao" %>
<%@ page import="business.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %><!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
</head>
<body>
    <%
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    if (loggedInUser != null) {
        UserDao userDao = new UserDao("xtra");
        User user = userDao.getUserById(loggedInUser.getId());

        username: user.getUserName();
%>
<html>
<head>
    <title>Edit your details</title>
</head>
<body>
<jsp:include page="head.jsp"/>
<section class="editUser-form" style="background-image: url('images/shelfbg.png')">
    <div class="container pt-5" style="color:white; width: 758px;">
        <div class="row mb-5">
            <div class="col-md-8 col-xl-6 text-center mx-auto">
                <h1>Edit Details</h1>
                <p class="w-lg-50">Edit you user details here.</p>
            </div>
        </div>
        <div class="row d-flex justify-content-center pb-5">
            <div class="col-md-6 col-xl-4" style="width: 327px;">
                <div class="card mb-5" style="border-radius: 20px;border-width: 9px;background-color: rgba(33,37,41,0.80); box-shadow: 0 0 5px black; ">
                    <div class="card-body d-flex flex-column align-items-center" style="border-color: rgba(33,37,41,0.80);">
                        <i class="fa-solid fa-user fa-3x p-3"></i>
                        <form action="controller" class="text-center" method="POST">
                            <div class="mb-3">
                                <input type="text" id="username" name="username" value="<%= user.getUserName()%>" required>
                            </div>
                            <div class="mb-3">
                                <input type="email" id="email" name="email" value="<%= user.getEmail()%>" required>
                            </div>
                            <div class="mb-3">
                                <input type="tel" id="phone" name="phone" value="<%= user.getPhone()%>" required>
                            </div>
                            <div class="mb-3">
                                <input type="text" id="name" name="name" value="<%= user.getName()%>" required>
                            </div>
                            <br>
                            <p>Confirm your changes by entering your password</p>
                            <div class="mb-3">
                                <input type="password" id="password" name="password" placeholder="Password" required>
                            </div>
                            <div class="mb-3">
                                <button class="btn btn-primary d-block w-100" value="submit" type="submit">Confirm</button>
                                <input type="hidden" name="action" value="editUser">
                            </div>
                            <p class="text-white">Forgot your password?</p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<jsp:include page="footer.jsp"/>
</body>
</html>
<% } %>