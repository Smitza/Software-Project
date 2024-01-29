<%--
  Created by IntelliJ IDEA.
  User: Sean
  Date: 29/01/2024
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error Page</title>
</head>
<body>
  <h1>Something went wrong</h1>
  <%
    String message = (String) session.getAttribute("errorMessage");
    if(message != null) {
  %>
  <div><%=message%></div>
  <%
    session.removeAttribute("errorMessage");
    } else {
  %>
  <div>How did you end up here? No error found...</div>
  <%
    }
  %>
</body>
</html>
