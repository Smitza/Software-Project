<%@ page import="business.User" %>
<%@ page import="daos.Dao" %>
<%@ page import="daos.UserDao" %>
<%@ page import="daos.UserDaoInterface" %>
<%@ page import="java.util.List" %>
<jsp:include page="head.jsp"/>

<h1 class="text-center">User List:</h1>
<% User u  = (User) session.getAttribute("loggedInUser");
    if(u.isAdmin() == 1){
        UserDao userDao = new UserDao("xtra");
         List<User> userList = userDao.getAllUsers();

         if (userList.isEmpty()) {
            response.sendRedirect("index.jsp");
         } else {
            // Display each user's details in a card format
            for (User user : userList) {
%>

    <div class="card">
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
    <%
            }
        }
    }
%>


<jsp:include page="footer.jsp"/>

