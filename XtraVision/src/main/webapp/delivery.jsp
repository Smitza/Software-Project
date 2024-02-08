<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<jsp:include page="head.jsp"/>
    <title>Delivery Page</title>
        <form  action="controller" method="post">

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required><br><br>

            <label for="phonenumber">Phonenumber:</label>
            <input type="number" id="phonenumber" name="phonenumber" required><br><br>

            <label for="payMethod">Payment method:</label>
            <input type="text" id="payMethod" name="payMethod" required><br><br>

            <input type="submit" value="Delivery">
            <input type="hidden" name="action" value="delivery">
        </form>


</body>
</html>
