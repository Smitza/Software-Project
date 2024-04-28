<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
        <div class="container py-4 py-xl-5" id="membership-container">
            <div class="bg-dark border rounded-3 border-5 border-dark overflow-hidden">
                <div class="row g-0">
                    <div class="col-md-6"><div class="text-white p-4 p-md-5">
                            <h2 class="fw-bold text-white mb-3">EX-Tra GOLD €9.99 per month</h2>
                            <h3 class="mb-4">Unleash the full potential of your entertainment with the Gold Membership, where luxury meets leisure.<br>
                            <br>
                            Perks Included in GOLD:</h3>
                            <p>- 4 free rentals per week<br>
                            <p>- GOLD deals on in-store & delivery rentals<br>
                            <p>- 4K Tv, Movie and Game Streaming <br>
                            <p>- Play an unlimited selection of games from the game catalogue</p>
                            <br>
                            <div class="my-3"><a class="btn btn-light btn-lg" role="button" href="subscribe.jsp">Subscribe</a></div>
                        </div>
                    </div>
                    <div class="col-md-6 order-first order-md-last" style="min-height: 250px;"><img class="w-100 h-100 fit-cover" src="images/xtragold.png"></div>
                </div>
            </div>

            <div class="bg-light border rounded-3 border-5 overflow-hidden mt-3">
                <div class="row g-0">
                    <div class="col-md-6"><div class="p-4 p-md-5">
                        <h2 class="fw-bold mb-3">EX-Tra SILVER €9.99 per month</h2>
                        <h3 class="mb-4">For those seeking a premium entertainment experience on a budget.<br>
                            <br>
                            Perks included in SILVER:</h3>
                        <p>- 2 free rentals per week<br>
                        <p>- SILVER deals on in-store & delivery rentals<br>
                        <p>- HD TV, Movie and Game Streaming<br>
                        <p>- Play a limited selection of the game catalogue</p>
                        <br>
                        <div class="my-3"><a class="btn btn-dark btn-lg" role="button" href="#">Subscribe</a></div>
                    </div>
                    </div>
                    <div class="col-md-6 order-last order-md-first" style="min-height: 250px;"><img class="w-100 h-100 fit-cover" src="images/xtrasilver.png"></div>
                </div>
            </div>
        </div>
    </section>
</body>

<jsp:include page="footer.jsp"/>