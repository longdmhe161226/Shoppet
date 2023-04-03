<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : view-cart
    Created on : Feb 17, 2023, 11:27:06 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<c:set var="cartPrice" value="${sessionScope.shop_pet_cart_totalPrice}" />
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>List Cart</title>

        <!--public link-->
        <jsp:include page="/views/elements/baseCss.jsp"/>
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/cart.css" />

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
                      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
                      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
                    <![endif]-->
        <script>
            function addCart(product, quantity) {
                $.ajax({
                    url: '${path}/cart/add',
                    method: 'GET',
                    data: {
                        product_id: product,
                        quantity: quantity
                    },
                    success: function (data, textStatus, jqXHR) {
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("get cart status: " + JSON.stringify(textStatus) + "\n" + jqXHR.toString() + "\n\n" + errorThrown.toString());
                    },
                    complete: function (jqXHR, textStatus) {
//                    alert(JSON.stringify (jqXHR) + "\n\n" + JSON.stringify(textStatus));
                    }
                })

            }</script>
    </head>

    <body>
        <!-- HEADER -->
        <jsp:include page="/views/elements/header.jsp"/>
        <!-- /HEADER -->


        <section class="h-100 h-custom" style="background-color: #d2c9ff;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-12">
                        <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                            <div class="card-body p-0">
                                <div class="row g-0">
                                    <div class="col-lg-8">
                                        <div class="p-5">
                                            <div class="d-flex justify-content-between align-items-center mb-5">
                                                <h1 class="fw-bold mb-0 text-black">Shopping Cart</h1>
                                                <h3 class="mb-0 text-muted">${sessionScope.shop_pet_cart.items.size()} items</h3>
                                            </div>
                                            <hr class="my-4">
                                            <script>


                                                function setCount(product, quantity, currentQuantity) {

                                                    $.ajax({
                                                        url: '${path}/cart/add',
                                                        method: 'GET',
                                                        data: {
                                                            product_id: product,
                                                            quantity: (currentQuantity - quantity),
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
                                                        console.log("value " + quantity);
                                                    } )

                                                }
                                            </script>

                                            <c:forEach var="item" items="${sessionScope.shop_pet_cart.items}">

                                                <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                    <div class="col-md-2 col-lg-2 col-xl-2">
                                                        <img src="${item.product.imageProduct} https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img5.webp"
                                                             class="img-fluid rounded-3" alt="Cotton T-shirt">
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-3">
                                                        <h3 class="text-muted">Shirt</h3>
                                                        <h3 class="text-black mb-0">${item.product.name}</h3>
                                                    </div>
                                                    <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                        <button class="btn btn-link px-2"
                                                                onclick="this.parentNode.parentNode.querySelector('input[type=number]').stepDown()">
                                                            <i class="fas fa-minus"></i>
                                                        </button>

                                                        <input id="form1" min="0" name="quantity" value="${item.quantity}" onchange="setCount(${item.id}, this.value, item.quantity)" style="width: 50px" type="number"
                                                               class="form-control form-control-sm" />

                                                        <button class="btn btn-link px-2"
                                                                onclick="this.parentNode.parentNode.querySelector('input[type=number]').stepUp()">
                                                            <i class="fas fa-plus"></i>
                                                        </button>
                                                    </div>
                                                    <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                        <h3 class="mb-0">${item.product.price}</h3>
                                                    </div>
                                                    <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                        <a href="#!" class="text-muted"><i style="font-size: 25px;"
                                                                                           class="fas fa-times"></i></a>
                                                    </div>
                                                </div>
                                                <hr class="my-4">
                                            </c:forEach>




                                            <!--                                            <div class="row mb-4 d-flex justify-content-between align-items-center">
                                                                                            <div class="col-md-2 col-lg-2 col-xl-2">
                                                                                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img6.webp"
                                                                                                     class="img-fluid rounded-3" alt="Cotton T-shirt">
                                                                                            </div>
                                                                                            <div class="col-md-3 col-lg-3 col-xl-3">
                                                                                                <h3 class="text-muted">Shirt</h3>
                                                                                                <h3 class="text-black mb-0">Cotton T-shirt</h3>
                                                                                            </div>
                                                                                            <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                                                                                <button class="btn btn-link px-2"
                                                                                                        onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                                                                                                    <i class="fas fa-minus"></i>
                                                                                                </button>
                                            
                                                                                                <input id="form1" min="1" name="quantity" value="1" type="number"
                                                                                                       class="form-control form-control-sm" />
                                            
                                                                                                <button class="btn btn-link px-2"
                                                                                                        onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                                                                                                    <i class="fas fa-plus"></i>
                                                                                                </button>
                                                                                            </div>
                                                                                            <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                                                                                <h3 class="mb-0">€ 44.00</h3>
                                                                                            </div>
                                                                                            <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                                                                                                <a href="#!" class="text-muted"><i style="font-size: 25px;"
                                                                                                                                   class="fas fa-times"></i></a>
                                                                                            </div>
                                                                                        </div>
                                            
                                                                                        <hr class="my-4">-->



                                            <div class="pt-5">
                                                <a href="${path}/store">
                                                    <button class="btn btn-lg btn-primary" >
                                                        <i class="fas fa-long-arrow-alt-left me-2"></i>
                                                        Back to shop
                                                    </button>

                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 bg-grey">
                                        <div class="p-5">
                                            <h3 class="fw-bold mb-5 mt-2 pt-1">Summary</h3>
                                            <hr class="my-4">

                                            <div class="d-flex justify-content-between mb-4">
                                                <h5 class="text-uppercase">items ${sessionScope.shop_pet_cart.items.size()}</h5>
                                                <h5>€ ${cartPrice}</h5>
                                            </div>

                                            <h5 class="text-uppercase mb-3">Your Order Info</h5>

                                            <div class="mb-4 pb-2">
                                                <select class="select">
                                                    <option value="1">Standard-Delivery- €5.00</option>
                                                    <option value="2">Two</option>
                                                    <option value="3">Three</option>
                                                    <option value="4">Four</option>
                                                </select>
                                            </div>

                                            <h5 class="text-uppercase mb-3">Give code</h5>

                                            <div class="mb-5">
                                                <div class="form-outline">
                                                    <input type="text" id="form3Examplea2"
                                                           class="form-control form-control-lg" />
                                                    <label class="form-label" for="form3Examplea2">Enter your code</label>
                                                </div>
                                            </div>

                                            <hr class="my-4">

                                            <div class="d-flex justify-content-between mb-5">
                                                <h5 class="text-uppercase">Total price</h5>
                                                <h5>€ ${cartPrice}</h5>
                                            </div>

                                            <button type="button" class="btn btn-dark btn-block btn-lg"
                                                    data-mdb-ripple-color="dark">Register</button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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
