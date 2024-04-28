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
<div style="background-image: url(images/profilebg.png); background-size: cover; background-attachment: fixed;">
    <div class="container pt-5 pb-5 p-3 d-flex justify-content-center">
        <div class="profile-card card p-4">
            <div class=" d-flex flex-column justify-content-center align-items-center">
                <i class="fa-solid fa-user fa-6x"></i>
                <span class="name mt-3"><%=user.getName()%></span>
                <span class="idd">@<%=user.getUserName()%></span>
                <span class="phone"><i class="fa-solid fa-phone"></i> <%=user.getPhone()%></span>
                <div class="profilemember d-flex flex-row justify-content-center align-items-center mt-3">
                    <%if(user.getMembership() == 0 || user.getMembership() == 1){%>
                    <span class="membership"><i class="fa-solid fa-ticket"></i> Free Tier</span>
                    <% } else if (user.getMembership() == 2) {%>
                    <span class="membership"><i class="fa-solid fa-ticket"></i> EX-Silver</span>
                    <% } else if (user.getMembership() == 3) {%>
                    <span class="membership"><i class="fa-solid fa-ticket"></i> EX-Gold</span>
                    <%} else{%>
                    <span class="membership"><i class="fa-solid fa-ticket"></i> No membership found!!</span>
                    <%} %>
                </div>
                <div class="d-flex mt-2">
                    <a href="EditUser.jsp" class="editbtn btn btn-dark">
                        Edit Profile
                    </a>
                </div>
            </div>
                <nav class="mt-3 list-group">
                    <a class="list-group-item with-badge" href="Order.jsp"><i class=" fa fa-th"></i> Orders<span class="badge badge-primary badge-pill">6</span></a>
                    <a class="list-group-item" href="billingInfo.jsp"><i class="fa-solid fa-house"></i> Billing Information</a>
                </nav>
        </div>
    </div>
</div>

                <%--<nav class="mt-3 list-group">
                    <a class="list-group-item with-badge" href="Order.jsp"><i class=" fa fa-th"></i> Orders<span class="badge badge-primary badge-pill">6</span></a>
                    <a class="list-group-item" href="#"><i class="fa fa-receipt"></i> Receipts</a>
                    <a class="list-group-item" href="billingInfo.jsp"><i class="fa-solid fa-house"></i> Billing Information</a>
                </nav>

            </div>
        </div>
    </div>
    <div class="container padding-bottom-3x pt-4 mb-2 " style="background-color: white">
        <div class="row">
            <div class="col-lg-4">
                <aside class="user-info-wrapper">
                        <div class="user-info">
                            <div class=" d-flex mt-2">
                                <button class="btn1 btn-dark">Edit Profile</button>
                            </div>
                    </div>

                </aside>
                <nav class="list-group">
                    <a class="list-group-item with-badge" href="Order.jsp"><i class=" fa fa-th"></i> Orders<span class="badge badge-primary badge-pill">6</span></a>
                    <a class="list-group-item" href="#"><i class="fa fa-receipt"></i> Receipts</a>
                    <a class="list-group-item" href="billingInfo.jsp"><i class="fa-solid fa-house"></i> Billing Information</a>

                    <p>Something not right? <a href="EditUser.jsp"> Change it</a></p>
                </nav>
            </div>
        </div>
    </div>
</div>--%>
<% } else {
response.sendRedirect("login.jsp");
} %>

<jsp:include page="footer.jsp"/>