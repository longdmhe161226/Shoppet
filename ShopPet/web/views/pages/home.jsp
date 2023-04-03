<%-- Document : home.jsp Created on : Feb 17, 2023, 8:21:31 AM Author : khuat --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <!--public link-->
        <script type="text/javascript"  src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/bootstrap.min.css" />

        <!-- Slick -->
        
<script src="${path}/assets/js/all.js"></script>
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/slick.css" />
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/slick-theme.css" />

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/nouislider.min.css" />

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="${path}/assets/css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/style.css" />

    </head>


    <body>
        <!-- HEADER -->
        <jsp:include page="/views/elements/header.jsp"/>

        <!-- NAVIGATION -->
        <jsp:include page="/views/elements/navigation.jsp"></jsp:include>
            <!-- /NAVIGATION -->

            <!-- SECTION -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- shop -->
                    <c:forEach items="${requestScope.listCategory}" var="c">
                        <div class="col-md-3 col-xs-6">
                            <div class="shop">
                                <div class="shop-img">
                                    <img style="height:200px" src="${c.image}" alt="">
                                </div>
                                <div class="shop-body">
                                    <h3>${c.name.toUpperCase()}<br>COLLECTION</h3>
                                    <a href="${path}/store?cid=${c.id}" class="cta-btn">Shop now <i
                                            class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">New Products</h3>
                            <div class="section-nav">
                                <ul class="section-tab-nav tab-nav">
                                    <c:forEach items="${requestScope.listCategory}" var="c">
                                        <li><a class="${c.id==cid?"red":""}"  href="${path}/home?cid=${c.id}">${c.name.toUpperCase()}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">
                                        <c:forEach items="${requestScope.listRandom}" var="c">
                                            <!-- product -->
                                            <div class="product">
                                                <div class="product-img">
                                                    <img src="${c.imageProduct[0].img}" alt="">
                                                    <div class="product-label">
                                                        <span class="new">NEW</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">${c.subCategorys[0].name}</p>
                                                    <h3 class="product-name"><a href="${path}/product/product-detail?id=${c.id}">${c.name}</a></h3>
                                                    <h4 class="product-price">${c.price} </h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>

                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn"  onclick="addCartAllJs('${path}', '${c.id}',1)"><i
                                                            class="fa fa-shopping-cart"></i> add to
                                                        cart</button>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- HOT DEAL SECTION -->
        <div id="hot-deal" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="hot-deal">
                            <ul class="hot-deal-countdown">
                                <li>
                                    <div>
                                        <h3>02</h3>
                                        <span>Days</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>10</h3>
                                        <span>Hours</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>34</h3>
                                        <span>Mins</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>60</h3>
                                        <span>Secs</span>
                                    </div>
                                </li>
                            </ul>
                            <h2 class="text-uppercase">hot deal this week</h2>
                            <p>New Collection Up to 50% OFF</p>
                            <a class="primary-btn cta-btn" href="#">Shop now</a>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /HOT DEAL SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Featured products</h3>
                            <div class="section-nav">
                                <ul class="section-tab-nav tab-nav">
                                    <c:forEach items="${requestScope.listCategory}" var="c">
                                        <li><a href="home?cid=${c.id}">${c.name.toUpperCase()}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab2" class="tab-pane fade in active">
                                    <div class="products-slick" data-nav="#slick-nav-2">
                                        <!-- product -->
                                        <c:forEach items="${requestScope.listRandom}" var="c">
                                            <!-- product -->
                                            <div class="product">
                                                <div class="product-img">
                                                    <img src="${c.imageProduct[0].img}" alt="">
                                                    <div class="product-label">
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">Category</p>
                                                    <h3 class="product-name"><a href="${path}/product/product-detail?id=${c.id}">${c.name}</a></h3>
                                                    <h4 class="product-price">${c.price} </h4>
                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>

                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn" onclick="addCartAllJs(`${path}`, `${c.id}`,`1`)"><i
                                                            class="fa fa-shopping-cart"></i> add to
                                                        cart</button>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-2" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- /Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <p>Sign Up for the <strong>NEWSLETTER</strong></p>
                            <form>
                                <input class="input" type="email" placeholder="Enter Your Email">
                                <button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
                            </form>
                            <ul class="newsletter-follow">
                                <li><a href="#"><i class="fa-brands fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa-brands fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa-brands fa-google"></i></a></li>
                                <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /NEWSLETTER -->

       	<!-- FOOTER -->
        <jsp:include page="/views/elements/footer.jsp"/>
        <!-- /FOOTER -->

        <jsp:include page="/views/elements/baseJs.jsp" />
    </body>

</html>