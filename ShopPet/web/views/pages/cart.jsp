<%-- 
    Document   : cart
    Created on : Mar 4, 2023, 7:42:31 PM
    Author     : khuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="cartPrice" value="${sessionScope.shop_pet_cart_totalPrice}" />
<!DOCTYPE html>
<html>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Cart Page</title>
    <script type="text/javascript"  src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

    <!--Google font--> 
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!--Bootstrap--> 
    <link type="text/css" rel="stylesheet" href="${path}/assets/css/bootstrap.min.css" />

    <!--Slick--> 

    <script src="${path}/assets/js/all.js"></script>
    <link type="text/css" rel="stylesheet" href="${path}/assets/css/slick.css" />
    <link type="text/css" rel="stylesheet" href="${path}/assets/css/slick-theme.css" />

    <!--nouislider--> 
    <link type="text/css" rel="stylesheet" href="${path}/assets/css/nouislider.min.css" />

    <!--Font Awesome Icon--> 
    <link rel="stylesheet" href="${path}/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css"
          integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!--Custom stlylesheet--> 
    <link type="text/css" rel="stylesheet" href="${path}/assets/css/style.css" />
    <!--Google font--> 
    <style>
        table,
        th,
        td {
            border: 1px solid;
            text-align: center;
        }
    </style>
    <!--public link-->
    <%--<jsp:include page="/views/elements/baseCss.jsp"/>--%>
    <script >
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
//                  alert(JSON.stringify (jqXHR) + "\n\n" + JSON.stringify(textStatus));
//                  addCart({item.id}, (this.value - {item.quantity}), item.quantity)
                }
            })

        }

//    function setCountCartItem(product, quantity, currentQuantity) {
//                            console.log("in set cout");
//                            $.ajax({
//                                url: '${path}/cart/add',
//                                method: 'GET',
//                                data: {
//                                    product_id: product,
//                                    quantity: (currentQuantity - quantity),
//                                },
//                                success: function (data, textStatus, jqXHR) {
//                                    $.ajax({
//                                        url: '${path}/cart',
//                                        method: 'GET',
//                                        success: function (data, textStatus, jqXHR) {
//                                            location.reload();
//                                        },
//                                        error: function (jqXHR, textStatus, errorThrown) {
//                                            alert("get cart status: " + JSON.stringify(textStatus) + "\n" + jqXHR.toString() + "\n\n" + errorThrown.toString());
//                                        },
//                                        complete: function (jqXHR, textStatus) {
//                                            //                    alert(JSON.stringify (jqXHR) + "\n\n" + JSON.stringify(textStatus));
//                                        }
//                                    })
//                                },
//                                error: function (jqXHR, textStatus, errorThrown) {
//                                    alert("get cart status: " + JSON.stringify(textStatus) + "\n" + jqXHR.toString() + "\n\n" + errorThrown.toString());
//                                },
//                                complete: function (jqXHR, textStatus) {
//                                    //                    alert(JSON.stringify (jqXHR) + "\n\n" + JSON.stringify(textStatus));
//                                }
//                                console.log("value " + quantity);
//                            })
//
//                        }

        function setCountCartItem(product, quantity, currentQuantity) {
            console.log("in set cout");
            $.ajax({
                url: '${path}/cart/add',
                method: 'GET',
                data: {
                    product_id: product,
                    quantity: (quantity - currentQuantity),
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
            console.log("value " + (product));
        }
    </script>
    <body>
        <jsp:include page="/views/elements/header.jsp"/>

        <!-- NAVIGATION -->
        <jsp:include page="/views/elements/navigation.jsp"></jsp:include>

            <!-- /HEADER -->
            <div id="breadcrumb" class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="breadcrumb-header">Cart</h3>
                            <ul class="breadcrumb-tree">
                                <li><a href="${path}/home">Home</a></li>
                            <li class="active">Cart</li>
                        </ul>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <div class="container">
            <table style=" width:100%; text-align: center;">
                <thead style="text-align: center">
                    <tr style="height: 80px;">
                        <th>View</th>
                        <th>Product Name</th>
                        <th>Quantity</th>
                        <th>Price</th>
                        <th>Clear</th>
                    </tr>
                </thead>


                <tbody>
                    <c:forEach var="item" items="${sessionScope.shop_pet_cart.items}">

                        <tr>
                            <td><img src="${item.product.imageProduct[0].img}" style="width: 80px;"></td>
                            <td>
                                <p style="color:rgb(22, 99, 187)">${item.product.name}</h3>
                            </td>
                            <td><input style="width:20%" type="number" min="1" value="${item.quantity}" onchange="setCountCartItem(${item.product.id}, this.value, ${item.quantity})" /></td>
                            <td>${item.product.price} <sup>$</sup></td>
                            <td><button onclick="setCountCartItem(${item.product.id}, 0, ${item.quantity})"><i class="fa-solid fa-trash"></i></button></td>
                        </tr>
                    </c:forEach>

                </tbody>
            </table>
            <div style="text-align: right;font-size: 20px;margin-top:30px">

                <span style=" font-weight: bold;">Total Price: </span><span style="color:red">${cartPrice}<sup
                        style="color:red">$</sup></span>
            </div>
            <div style="margin-top:20px; text-align:right;">
                <a style="color:white; " href="${path}/checkout">
                    <button
                        style=" text-align: center; display: inline-block; padding:10px 50px; border:1px solid #ccc; background-color: red;">
                        Checkout
                    </button>
                </a>
                <a style="color:black; " href="${path}/store">
                    <div style="text-align: center;display: inline-block; padding:10px 15px; border:1px solid #ccc">
                        Continue Shopping
                    </div>
                </a>
            </div>
        </div>
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







        <jsp:include page="/views/elements/footer.jsp"/>
        <!-- /FOOTER -->

        <jsp:include page="/views/elements/baseJs.jsp" />


    </body>

</html>

