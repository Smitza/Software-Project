<%@ page import="business.User" %>
<%@ page import="daos.Dao" %>
<%@ page import="daos.UserDao" %>
<%@ page import="daos.UserDaoInterface" %>
<%@ page import="java.util.List" %>
<jsp:include page="head.jsp"/>
<style>body{
    background: linear-gradient(45deg, rgb(26, 1, 117) 0%, rgba(225, 5, 34, 0) 70%) repeat scroll 0% 0%,
    linear-gradient(135deg, rgb(225, 5, 152) 10%, rgba(49, 5, 209, 0) 80%) repeat scroll 0% 0%,
    linear-gradient(225deg, hsla(179, 81%, 45%, 1) 10%, rgba(10, 219, 216, 0) 80%) repeat scroll 0% 0%,
    rgba(0, 0, 0, 0) linear-gradient(315deg, rgb(189, 5, 245) 100%, rgba(9, 245, 5, 0) 70%) repeat scroll 0% 0%;
}</style>
<div class="container rounded"  style="background-image: url('images/adminbg.jpg'); background-size: cover; background-attachment: fixed; ">
<div class="row row-cols-1 row-cols-md-2 g-4 mt-3 mb-3 pb-3 ">
    <%
        User u  = (User) session.getAttribute("loggedInUser");
        if(u.isAdmin() == 1){
            UserDao userDao = new UserDao("xtra");
            List<User> userList = userDao.getAllUsers();

            if (userList.isEmpty()) {
                response.sendRedirect("index.jsp");
            } else {
                // Display each user's details in a card format
                for (User user : userList) {
                    // Skip displaying the currently logged-in user
                    if (user.getId() == u.getId()) {
                        continue;
                    }
    %>
    <div class ="col">
<div class="card shadow-sm">
    <div class="card-body">
        <h5 class="card-title"><%= user.getUserName() %></h5>
        <p class="card-text">Email: <%= user.getEmail() %></p>
        <p class="card-text">Phone: <%= user.getPhone() %></p>
        <p class="card-text">Name: <%= user.getName() %></p>

        <% if (user.isAdmin() == 1) { %>
        <p class="card-text">User is already an admin.</p>
        <form action="controller" method="post">
            <input type="hidden" name="action" value="removeadmin">
            <input type="hidden" name="userId" value="<%= user.getId() %>">
            <button type="submit" class="btn btn-danger">Remove Admin Status</button>
        </form>
        <% } else { %>
        <form action="controller" method="post">
            <input type="hidden" name="action" value="upgradeuser">
            <input type="hidden" name="userId" value="<%= user.getId() %>">
            <button type="submit" class="btn btn-primary">Upgrade to Admin</button>
        </form>
        <% } %>
    </div>
</div>
    </div>
<%
            }
        }
    }
%>
</div>
</div>

<jsp:include page="footer.jsp"/>
