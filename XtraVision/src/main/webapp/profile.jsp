<%@ page import="daos.UserDao" %>
<%@ page import="business.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<jsp:include page="head.jsp"/>
<%
    int userId;
    User loggedInUser = (User) session.getAttribute("loggedInUser");
    if (loggedInUser != null) {
        UserDao userDao = new UserDao("xtra");
        User user = userDao.getUserById(loggedInUser.getId());
%>
<div class="vh-100" style="background-image: url(images/profilebg.png);">
    <div class="container padding-bottom-3x pt-4 mb-2 " style="background-color: white">
        <div class="row">
            <div class="col-lg-4">
                <aside class="user-info-wrapper">
                        <div class="user-info">
                        <div class="user-data">
                            <h4><%=user.getUserName()%></h4>
                        </div>
                    </div>

                </aside>
                <nav class="list-group">
                    <a class="list-group-item with-badge" href="#"><i class=" fa fa-th"></i> Orders<span class="badge badge-primary badge-pill">6</span></a>
                    <a class="list-group-item" href="#"><i class="fa fa-receipt"></i> Receipts</a>
                    <a class="list-group-item" href="billingInfo.jsp"><i class="fa-solid fa-house"></i> Billing Information</a>

                    <p>Something not right? <a href="EditUser.jsp"> Change it</a></p>
                </nav>
            </div>
        </div>
    </div>
</div>
<% } else {
response.sendRedirect("login.jsp");
} %>

<jsp:include page="footer.jsp"/>