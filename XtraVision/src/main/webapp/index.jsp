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
                    <img src="images/persona3hero.png" style="height: 500px" class="d-block " alt="">
                    <div class="carousel-caption">
                        <h3>Persona 3: Reload</h3>
                        <p>Experience the pivotal game of the Persona Series, faithfully remade with cutting-edge graphics, modernized ''quality-of-life'' features, and signature stylish UI.</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="images/dunehero.png" style="height: 500px" class="d-block w-500" alt="">
                    <div class="carousel-caption">
                        <h3>DUNE: PART TWO</h3>
                        <p>The saga continues as award-winning filmmaker Denis Villeneuve embarks on “Dune: Part Two,” the next chapter of Frank Herbert’s celebrated novel Dune</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img src="images/lastofushero.png" style="height: 500px" class="d-block w-500" alt="">
                    <div class="carousel-caption">
                        <h3>The Last of Us</h3>
                        <p>THE LAST OF US story takes place twenty years after modern civilization has been destroyed. Joel, a hardened survivor, is hired to smuggle Ellie, a 14-year-old girl, out of an oppressive quarantine zone.</p>
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
                <div class="col-6 mx-auto">
                    <img class="img-fluid mb-3" width="450" src="images/xtragold.png">
                    <h4 class="text-center">With Xtra-Vision Gold you get the following perks:</h4>
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