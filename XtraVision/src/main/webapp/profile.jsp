<%@ page import="daos.UserDao" %>
<%@ page import="business.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<body>
<jsp:include page="head.jsp"/>

    <%
    String id = request.getParameter("userId");
    if( id != null){
      try {
        int userId = Integer.parseInt(id);
        UserDao dao = new UserDao("user_database");
        User u = dao.getUserById(userId);
        if(u != null){
          %>
<table>
    <tr><td>User ID:</td><td><%=u.getId()%></td></tr>
    <tr><td>Username:</td><td><%=u.getUserName()%></td></tr>
    <tr><td>Email:</td><td><%=u.getEmail()%></td></tr>
    <tr><td>Phone:</td><td><%=u.getPhone()%></td></tr>
    <tr><td>Name:</td><td><%=u.getName()%></td></tr>
</table>
    <%
        }else{
          %>
<p>No user with the supplied ID value.</p>
    <%
        }

      }catch(NumberFormatException e){
        %>
<p>Incorrect id information supplied. Please use a number for the user's id!</p>
    <%
      }
    }else{
        %>
<p>No id information supplied. Please try again!</p>
    <%
      }
  %>
<jsp:include page="footer.jsp"/>