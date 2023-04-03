<%-- Document : home.jsp Created on : Feb 17, 2023, 8:21:31 AM Author : khuat --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="currentPage" value="${requestScope.currentPage}" />
<c:set var="queryString" value="${requestScope.queryString}" />

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail Page</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <script src="${path}/assets/js/all.js"></script>
        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href ="${path}/assets/css/bootstrap.min.css" />

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/slick.css" />
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/slick-theme.css" />

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/nouislider.min.css" />

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="${path}/assets/css/font-awesome.min.css">
        <!--        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
                      integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
                      crossorigin="anonymous" referrerpolicy="no-referrer" />-->

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/style.css" />
    </head>

    <body>
        <!-- HEADER -->
        <jsp:include page="/views/elements/header.jsp"/>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <jsp:include page="/views/elements/navigation.jsp"></jsp:include>
            <!-- NAVIGATION -->
            <!-- HEADER -->
            <!-- HEADER -->

            <!-- /HEADER -->

            <!-- BREADCRUMB -->
            <div id="breadcrumb" class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">   
                        <div class="col-md-12">
                            <ul class="breadcrumb-tree">
                                <li><a href="${path}/home">Home</a></li>
                            <li><a href="${path}/filterCategory?cid=${categoryId}&subCategory=${subCategory}">${requestScope.product.subCategorys[0].name}</a></li>
                            <li><a href="">${requestScope.product.name}</a></li>
                        </ul>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- Product main img -->
                    <div class="col-md-5 col-md-push-2">
                        <div id="product-main-img">
                            <div class="product-preview">
                                <img style="height:458px" src="${requestScope.product.imageProduct[0].img}" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- /Product main img -->

                    <!-- Product thumb imgs -->
                    <div class="col-md-2  col-md-pull-5">
                        <div id="product-imgs">
                            <c:forEach items="${requestScope.product.imageProduct}" var="c">
                                <div class="product-preview">
                                    <img style="height:150px" src="${c.img}" alt="">
                                </div>
                            </c:forEach> 
                        </div>
                    </div>
                    <!-- /Product thumb imgs -->

                    <!-- Product details -->
                    <div class="col-md-5">
                        <div class="product-details">
                            <h2 class="product-name">${requestScope.product.name}</h2>
                            <h5>Code: ${requestScope.product.code}</h5>
                            <h5>Origin: ${product.origin[0].region}</h5>
                            <c:if test="${check==true}">
                                <h5>Dob: ${product.pet[0].dob}</h5>
                                <h5>HealthStatus: ${product.pet[0].healthStatus}</h5>
                                <h5>Gender: ${product.pet[0].gender==false?'Female':'Male'}</h5>
                                <h5>Weight: ${product.pet[0].weight} (kg)</h5>
                                <h5>Color: ${product.pet[0].color}</h5>
                                <h5>Vaccinated:${product.pet[0].vaccinated}</h5>
                                <h5>Identifify:${product.pet[0].identification}</h5>
                            </c:if>

                            <div>
                                <div class="product-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                                <a class="review-link" href="#">10 Review(s) | Add your review</a>
                            </div>
                            <div>
                                <h3 class="product-price">${requestScope.product.price} VND</h3>
                            </div>

                            <!-- <div class="product-options">
                                    <label>
                                            Size
                                            <select class="input-select">
                                                    <option value="0">X</option>
                                            </select>
                                    </label>
                                    <label>
                                            Color
                                            <select class="input-select">
                                                    <option value="0">Red</option>
                                            </select>
                                    </label>
                            </div> -->
                            <script>
                                function updateCount(product, quantity) {
                                    const number = document.getElementById("add-cart-product-" + product);
                                    if (number.value >= 0 && (Number(number.value) + quantity) > 0) {
                                        number.value = Number(number.value) + quantity;
                                    }

                                }

                                function setCount(product, quantity) {
                                    console.log("value " + quantity);

                                }
                                function addCart(product) {
                                    $.ajax({
                                        url: '${path}/cart/add',
                                        method: 'GET',
                                        data: {
                                            product_id: product,
                                            quantity: document.getElementById("add-cart-product-" + product).value,
                                        },
                                        success: function (data, textStatus, jqXHR) {
                                            $.ajax({
                                                url: '${path}/cart',
                                                method: 'GET',
                                                success: function (data, textStatus, jqXHR) {
                                                    location.reload();
                                                },
                                                error: function (jqXHR, textStatus, errorThrown) {
                                                    alert("get cart status: " + JSON.stringify(textStatus) + "\n" + jqXHR.toString() + "\n\n" + errorThrown.toString());
                                                },
                                                complete: function (jqXHR, textStatus) {
//                    alert(JSON.stringify (jqXHR) + "\n\n" + JSON.stringify(textStatus));
                                                }
                                            })
                                        },
                                        error: function (jqXHR, textStatus, errorThrown) {
                                            alert("get cart status: " + JSON.stringify(textStatus) + "\n" + jqXHR.toString() + "\n\n" + errorThrown.toString());
                                        },
                                        complete: function (jqXHR, textStatus) {
                                            //                    alert(JSON.stringify (jqXHR) + "\n\n" + JSON.stringify(textStatus));
                                        }
                                    })

                                }
                            </script>
                            <c:if test="${requestScope.product.quantity>0}">
                                <div class="add-to-cart">

                                    <c:if test="${product.pet[0]==null}">
                                        <div class="qty-label">
                                            Qty
                                            <div class="input-number">
                                                <input type="number" onchange="setCount(${requestScope.product.id}, this.value)" id="add-cart-product-${requestScope.product.id}" value=0>
                                                <span class="qty-up" onclick='updateCount(${requestScope.product.id}, 1)' >+</span>
                                                <span class="qty-down" onclick="updateCount(${requestScope.product.id}, -1)">-</span>
                                            </div>
                                        </div> 
                                        <button class="add-to-cart-btn" onclick="addCart(${requestScope.product.id})"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                    </c:if>
                                    <c:if test="${product.pet[0]!=null}">
                                        <input type="number" hidden="" onchange="setCount(${requestScope.product.id}, this.value)" id="add-cart-product-${requestScope.product.id}" value=1>

                                        <button class="add-to-cart-btn" onclick="addCart(${requestScope.product.id})"><i class="fa fa-shopping-cart"></i> add to cart</button>

                                    </c:if>
                                </div>
                            </c:if>


                            <ul class="product-links">
                                <li>Category:</li>
                                <li><a href="#">${requestScope.product.subCategorys[0].name}</a></li>

                            </ul>

                        </div>
                    </div>
                    <!-- /Product details -->

                    <!-- Product tab -->
                    <div class="col-md-12">
                        <div id="product-tab">
                            <!-- product tab nav -->
                            <ul class="tab-nav">
                                <li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>

                            </ul>
                            <!-- /product tab nav -->

                            <!-- product tab content -->
                            <div class="tab-content">
                                <!-- tab1  -->
                                <div id="tab1" class="tab-pane fade in active">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>${requestScope.product.description}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /tab1  -->
                            </div>
                            <!-- /product tab content  -->
                        </div>
                    </div>
                    <!-- /product tab -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- Section -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <div class="col-md-12">
                        <div class="section-title text-center">
                            <h3 class="title">Related Products</h3>
                        </div>
                    </div>
                    <c:forEach items="${requestScope.listProductRelative}" var="c">
                        <!-- product -->
                        <div class="col-md-3 col-xs-6">
                            <a href="${path}/product/product-detail?id=${c.id}" >
                                <div class="product">
                                    <div class="product-img">
                                        <img src="${c.imageProduct[0].img}" alt="">
                                        <div class="product-label">
                                        </div>
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">${c.subCategorys[0].name}</p>
                                        <h3 class="product-name"><a href="#">${c.name}</a></h3>
                                        <h4 class="product-price">${c.price} </h4>
                                        <div class="product-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                    </div>
                                    <div class="add-to-cart">
                                        <button class="add-to-cart-btn" onclick="addCartAllJs(${path}, ${c.id}, 1)"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </c:forEach>
                    <!-- /product -->



                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /Section -->
        <!-- FOOTER -->
        <jsp:include page="/views/elements/footer.jsp"/>
        <!-- /FOOTER -->

        <jsp:include page="/views/elements/baseJs.jsp" />
        <!-- /FOOTER -->
    </body>
</html>