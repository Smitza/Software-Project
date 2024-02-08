<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<body>
<jsp:include page="head.jsp"/>

<%--    -------------- MAIN CAROUSEL ------------------------%>

    <section id="carouselSection">
        <div id="carouselMain" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-indicators">
                <button type="button" data-bs-target="#carouselMain" data-bs-slide-to="0" class="active"></button>
                <button type="button" data-bs-target="#carouselMain" data-bs-slide-to="1"></button>
                <button type="button" data-bs-target="#carouselMain" data-bs-slide-to="2"></button>
            </div>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="https://placehold.co/1920x500" class="d-block w-500" alt="">
                    <div class="carousel-caption">
                        <h3>Lorem ipsum</h3>
                        <p>dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://placehold.co/1920x500" class="d-block w-500" alt="">
                    <div class="carousel-caption">
                        <h3>Lorem ipsum</h3>
                        <p>dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="https://placehold.co/1920x500" class="d-block w-500" alt="">
                    <div class="carousel-caption">
                        <h3>Lorem ipsum</h3>
                        <p>dolor sit amet, consectetur adipiscing elit.</p>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselMain" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselMain" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </section>

<%--    ----------------------- MEMBERSHIP ADS -------------------------%>

    <section id="Memberships" style="background-image: linear-gradient(#fa0303, #ff960e 100%, #fff)">
        <div class="container pt-sm-3" id="membership-container">
            <div class="row text-center" id="membership-row">
                <div class="col-6 mx-auto" style="background-color: rgba(250, 177, 42, 0.64)">
                    <img class="img-fluid mb-3" width="450" src="images/xtragold.png">
                    <h4 class="text-center">With XtraV-ision Gold you get the following perks:</h4>
                    <ul class="list-group">
                        <li class="list-group-item">• Cras justo odio</li>
                        <li class="list-group-item">• Dapibus ac facilisis in</li>
                        <li class="list-group-item">• Morbi leo risus</li>
                        <li class="list-group-item">• Porta ac consectetur ac</li>
                    </ul>
                </div>
                <div class="col-6 x-auto" style="background-color: rgba(192, 192, 192, 0.75)">
                    <img class="img-fluid mb-3" width="450" src="images/xtrasilver.png">
                    <h4 class="text-center">With Xtra-Vision Silver you get the following perks:</h4>
                    <ul class="list-group">
                        <li class="list-group-item">• Cras justo odio</li>
                        <li class="list-group-item">• Dapibus ac facilisis in</li>
                        <li class="list-group-item">• Morbi leo risus</li>
                        <li class="list-group-item">• Porta ac consectetur ac</li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

</body>

<jsp:include page="footer.jsp"/>