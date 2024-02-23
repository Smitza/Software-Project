<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<body>
<jsp:include page="head.jsp"/>
<section class="login-form" style="background-image: url('images/shelfbg.png')">
    <div class="container pt-5" style="color:white; width: 758px;">
        <div class="row mb-5">
            <div class="col-md-8 col-xl-6 text-center mx-auto">
                <h1>Log in</h1>
                <p class="w-lg-50">Login to your Xtra-Xtra Vision account.</p>
            </div>
        </div>
        <div class="row d-flex justify-content-center pb-5">
            <div class="col-md-6 col-xl-4" style="width: 327px;">
                <div class="card mb-5" style="border-radius: 20px;border-width: 9px;background-color: rgba(33,37,41,0.80); box-shadow: 0 0 5px black; ">
                    <div class="card-body d-flex flex-column align-items-center" style="border-color: rgba(33,37,41,0.80);">
                        <i class="fa-solid fa-user fa-3x p-3"></i>
                        <form action="controller" class="text-center" method="POST">
                            <div class="mb-3">
                                <input type="text" id="login_username" name="username" placeholder="Username" required>
                            </div>
                            <div class="mb-3">
                                <input type="password" id="login_password" name="password" placeholder="Password" required>
                        </div>
                            <div class="mb-3">
                                <button class="btn btn-primary d-block w-100" value="submit" type="submit">Login</button>
                                <input type ="hidden" name="action" value="login">
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