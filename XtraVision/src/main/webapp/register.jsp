<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="head.jsp"/>


<% String errorMessage = (String) request.getSession().getAttribute("errorMessage");
    if(errorMessage != null) { %>
<p style="color:red;"><%= errorMessage %></p>
<% request.getSession().removeAttribute("errorMessage");
}
%>
<section class="register-form" style="background-image: url('images/shelfbg.png')">
    <div class="container pt-5" style="color:white; width: 758px;">
        <div class="row mb-5">
            <div class="col-md-8 col-xl-6 text-center mx-auto">
                <h1>Register</h1>
                <p class="w-lg-50">Sign-Up for an EX-Tra Deliveries account.</p>
            </div>
        </div>
        <div class="row d-flex justify-content-center pb-5">
            <div class="col-md-6 col-xl-4" style="width: 327px;">
                <div class="card mb-5" style="border-radius: 20px;border-width: 9px;background-color: rgba(33,37,41,0.80); box-shadow: 0 0 5px black; ">
                    <div class="card-body d-flex flex-column align-items-center" style="border-color: rgba(33,37,41,0.80);">
                        <%
                            String registerErrorMessage = (String) session.getAttribute("loginErrorMessage");
                            if (registerErrorMessage != null) {
                        %>
                        <h4 class="text-danger text-center mt-4" ><%= registerErrorMessage %></h4>
                        <%
                            }
                            session.removeAttribute("registerErrorMessage"); // Clear the error message from the session
                        %>
                        <i class="fa-solid fa-user fa-3x p-3"></i>
                        <form action="controller" class="text-center" method="POST">
                            <div class="mb-3">
                                <input type="text" id="username" name="username" placeholder="Username" required>
                            </div>
                            <div class="mb-3">
                                <input type="email" id="email" name="email" placeholder="Email" required>
                            </div>
                            <div class="mb-3">
                                <input type="password" id="password" name="password" placeholder="Password" required>
                            </div>
                            <div class="mb-3">
                                <input type="tel" id="phone" name="phone" placeholder="Phone Number" required>
                            </div>
                            <div class="mb-3">
                                <input type="text" id="name" name="name" placeholder="Name" required>
                            </div>
                            <div class="mb-3">
                                <button class="btn btn-primary d-block w-100" value="submit" type="submit">Signup</button>
                                <input type="hidden" name="action" value="register">
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

