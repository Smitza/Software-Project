<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<body>
<jsp:include page="head.jsp"/>

<h2>Login:</h2>
<form action="controller" method="POST">
    <table>
        <tr>
            <td><label for="login_username">Username:</label></td>
            <td><input type="text" size=20 id="login_username" name="username" required/></td>
        </tr>
        <tr>
            <td><label for="login_password">Password:</label></td>
            <td><input type="password" size=30 id="login_password" name="password" required/></td>
        </tr>
    </table>
    <button type="submit" value="Submit">Submit</button>
    <input type ="hidden" name="action" value="login">
</form>

</body>

<jsp:include page="footer.jsp"/>