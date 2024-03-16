<%--
  Created by IntelliJ IDEA.
  User: Sean
  Date: 29/01/2024
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="head.jsp" />
<body style="background-image: url('images/error.png')">
<section class="d-flex align-items-center min-vh-50 py-5">
  <div class="container py-5 mx-3">
        <img src="images/404icon.png">
  </div>
    <div class="col-md-6 text-center text-md-start">
      <div class="lc-block mb-3">
          <h1 class="fw-bold h4">SOMETHING WENT WRONG!<br></h1>
      </div>
      <div class="lc-block mb-3">
        <%
          String message = (String) session.getAttribute("errorMessage");
          if(message != null) {
        %>
      <h1 class="w-bold text-white"><%=message%></h1>
        <%
        session.removeAttribute("errorMessage");
        } else {
        %>
      <h2 class="fw-bold text-white">How did you end up here? No error found...</h2>
        <%
          }
        %>
      </div>
    </div>
</section>
  <jsp:include page="footer.jsp"/>


