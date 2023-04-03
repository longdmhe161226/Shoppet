<%-- 
    Document   : checkout.jsp
    Created on : Mar 4, 2023, 7:32:44 PM
    Author     : khuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="server" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}" />
<c:set var="orderInfos" value="${requestScope.orderInfos}" />
<c:set var="info" value="${requestScope.orderInfo}" />
<c:set var="listCity" value="${requestScope.listCity}" />
<c:set var="listStreet" value="${requestScope.listStreet}" />
<c:set var="cartItems" value="${sessionScope.shop_pet_cart.items}" />
<!DOCTYPE html>
<html>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>Checkout Page</title>
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
    <!-- Google font -->
    <script></script>
    <body>
        <jsp:include page="/views/elements/header.jsp"/>

        <!-- NAVIGATION -->
        <jsp:include page="/views/elements/navigation.jsp"></jsp:include>

            <!-- BREADCRUMB -->
            <div id="breadcrumb" class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12">
                            <h3 class="breadcrumb-header">Checkout</h3>
                            <ul class="breadcrumb-tree">
                                <li><a href=" ${path}/home">Home</a></li>
                            <li class="active">Checkout</li>
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

                    <div class="col-md-7">

                        <!-- Shiping Details -->
                        <div class="shiping-details">
                            <div class="section-title">
                                <h3 class="title">Shiping address</h3>

                                <div class="" id="accordion" role="tablist" aria-multiselectable="true">

                                    <div class="panel">
                                        <a role="button"  class="form-group" data-toggle="collapse" href="#collapAddress" aria-expanded="false" aria-controls="collapAddress">
                                            View Your template
                                            <i class="fa fa-address-card"></i>
                                        </a>
                                        <div id="collapAddress" class="panel-collapse collapse" role="tabpanel">
                                            <div class="panel-body">
                                                <table border="1">

                                                    <tbody>
                                                        <tr>
                                                            <th style="width: 500px">Name</th>
                                                            <th style="width: 200px">Phone</th>
                                                            <th style="width: 700px">Address Detail</th>
                                                            <th style="width: 300px">Street</th>
                                                            <th style="width: 200px">City</th>
                                                            <th style="width: 200px">Action</th>
                                                        </tr>
                                                        <c:forEach var="oi" items="${orderInfos}">

                                                            <tr>
                                                                <td>${oi.customerName}</td>
                                                                <td> ${oi.phone}</td>
                                                                <td> ${oi.addressDetail}</td>
                                                                <td> ${oi.street}</td>
                                                                <td>${oi.city}</td>
                                                                <td >
                                                                    <div style="margin: 10px; text-align: center; min-height: 100px; display: flex; flex-direction: column;justify-content: space-between;align-items: center;" >
                                                                        <a class="btn-sm btn-info" style="width: 60px !important;" onclick="window.location.replace('${server}/checkout?orderInfo=${oi.id}');">Use </a>
                                                                        <a class="btn-sm btn-primary" style="width: 60px !important;" data-toggle="modal" data-target="#order-info-${oi.id}"> Edit</a>
                                                                        <a class="btn-sm btn-danger" style="width: 60px !important;" onclick="{
                                                                                    console.log('ima in');
                                                                                    if (
                                                                                            confirm('Do you want to delete the Address : ${oi.customerName}, ${oi.phone}, ${oi.addressDetail}, ${oi.street}, ${oi.city}')

                                                                                            ) {
//                                                                                window.location.href = '/orderInfo/delete';
                                                                                        window.location.replace('${server}/orderInfo/delete?id=${oi.id}');
                                                                                                    }
                                                                                                }
                                                                           "> Delete</a>

                                                                    </div>
                                                                </td>
                                                            </tr>

                                                            <!-- The modal -->
                                                        <div class="modal fade" id="order-info-${oi.id}" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered" role="document">
                                                                <div class="modal-content">
                                                                    <form action="${path}/orderInfo/edit" method="Post" >

                                                                        <div class="modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                                                <span aria-hidden="true">&times;</span>
                                                                            </button>
                                                                            <h4 class="modal-title" id="modalLabel">Edit Address</h4>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            <input class="input" type="text" name="id"  hidden="" value ="${oi.id}" >
                                                                            <div class="form-group">
                                                                                <input class="input" type="text" name="name" placeholder="Name" required="" value ="${oi.customerName}">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <input class="input" type="text" name="phone" placeholder="Phone" required="" pattern="0\d{9,10}" title="you must input phone number" value ="${oi.phone}">
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <input class="input" type="text" name="address-detail" placeholder="Address-Detail" required="" value ="${oi.addressDetail}">
                                                                            </div>

                                                                            <div class="form-group">
                                                                                <input  class="input" name="street" required="" placeholder="Street" value ="${oi.street}"/>
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <input  class="input" name="city" required="" placeholder="City" value = "${oi.city}"/>

                                                                            </div>

                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <div class="btn btn-secondary" data-dismiss="modal">Close</div>
                                                                            <input type="submit" value="Save" />
                                                                        </div>
                                                                    </form>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                    </tbody>
                                                </table>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="input-checkbox">
                                        <input type="checkbox" id="shiping-address">
                                        <label for="shiping-address">
                                            <span></span>
                                            You want create new Address template?
                                        </label>

                                        <div class="caption">
                                            <form action="${path}/orderInfo/add" method="Post" >
                                                <div class="form-group">
                                                    <input class="input" type="text" name="name" placeholder="Name" required="" >
                                                </div>
                                                <div class="form-group">
                                                    <input class="input" type="text" name="phone" placeholder="Phone" required="" pattern="0\d{9,10}" title="you must input phone number">
                                                </div>
                                                <div class="form-group">
                                                    <input class="input" type="text" name="address-detail" placeholder="Address-Detail" required="">
                                                </div>

                                                <div class="form-group">
                                                    <input  class="input" name="street" required="" placeholder="Street" />
                                                </div>
                                                <div class="form-group">
                                                    <input  class="input" name="city" required="" placeholder="City" />

                                                </div>

                                                <div class="form-group d-flex justify-content-end">
                                                    <input type="submit" value="New Template" class="primary-btn"  style="justify-items: end"/>
                                                </div>

                                            </form>
                                        </div>
                                    </div>


                                </div>
                            </div>




                            <!-- Billing Details -->
                            <!--                            <div class="billing-details">
                                                            <div class="section-title">
                                                                <h3 class="title">Billing address</h3>
                                                            </div>
                                                            <div class="form-group">
                                                                <input class="input" type="text" name="name" placeholder="Name" value="${info.customerName}">
                                                            </div>
                                                            <div class="form-group">
                                                                <input class="input" type="text" name="phone" placeholder="Phone" value="${info.phone}">
                                                            </div>
                                                            <div class="form-group">
                                                                <input class="input" type="text" name="address" placeholder="Address" value="${info.addressDetail}, ${info.street}, ${info.city}">
                                                            </div>
                                                            <input type="submit" class="primary-btn order-submit" value="" />
                            
                                                                                        <div class="form-group">
                                                                                            <select  class="input" name="city" required="">
                                                            
                                                                                                <option value="">choose your City</option>
                                                            
                                                                                                <cforEach var="c" items="{listCity}">
                                                            
                                                                                                    <option value="{c}">{c}</option>
                                                                                                </cforEach>
                                                            
                                                                                            </select>
                                                            
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <select  class="input" name="street" required="">
                                                            
                                                                                                <option >choose your Street</option>
                                                                                                <cforEach var="s" items="{listStreet}">
                                                                                                    <option value="{s}">{s} </option>
                                                                                                </cforEach>
                                                            
                                                                                            </select>
                                                                                        </div>
                                                                                        <div class="form-group">
                                                                                            <div class="input-checkbox">
                                                                                                <input type="checkbox" id="create-account">
                                                                                                <label for="create-account">
                                                                                                    <span></span>
                                                                                                    Create Account?
                                                                                                </label>
                                                                                                <div class="caption">
                                                                                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                                                                                        incididunt.</p>
                                                                                                    <input class="input" type="password" name="password"
                                                                                                           placeholder="Enter Your Password">
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                        </div>-->
                            <!-- /Billing Details -->



                            <!-- Order notes -->
                            <!--                            <div class="order-notes">
                                                            <textarea class="input" placeholder="Order Notes"></textarea>
                                                        </div>-->
                            <!-- /Order notes -->
                        </div>
                    </div>
                    <!-- Order Details -->
                    <!--                    <div class="col-md-5 order-details">
                                            <div class="section-title text-center">
                                                <h3 class="title">Your Order</h3>
                                            </div>
                                            <div class="order-summary">
                                                <div class="order-col">
                                                    <div><strong>PRODUCT</strong></div>
                                                    <div><strong>TOTAL</strong></div>
                                                </div>
                                                <div class="order-products">
                                                    <div class="order-col">
                                                        <div>1x Product Name Goes Here</div>
                                                        <div>$980.00</div>
                                                    </div>
                                                    <div class="order-col">
                                                        <div>2x Product Name Goes Here</div>
                                                        <div>$980.00</div>
                                                    </div>
                                                </div>
                                                <div class="order-col">
                                                    <div>Shiping</div>
                                                    <div><strong>FREE</strong></div>
                                                </div>
                                                <div class="order-col">
                                                    <div><strong>TOTAL</strong></div>
                                                    <div><strong class="order-total">$2940.00</strong></div>
                                                </div>
                                            </div>
                                            <div class="payment-method">
                                                <div class="input-radio">
                                                    <input type="radio" name="payment" id="payment-1">
                                                    <label for="payment-1">
                                                        <span></span>
                                                        Direct Bank Transfer
                                                    </label>
                                                    <div class="caption">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                                            incididunt ut labore et dolore magna aliqua.</p>
                                                    </div>
                                                </div>
                                                <div class="input-radio">
                                                    <input type="radio" name="payment" id="payment-2">
                                                    <label for="payment-2">
                                                        <span></span>
                                                        Cheque Payment
                                                    </label>
                                                    <div class="caption">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                                            incididunt ut labore et dolore magna aliqua.</p>
                                                    </div>
                                                </div>
                                                <div class="input-radio">
                                                    <input type="radio" name="payment" id="payment-3">
                                                    <label for="payment-3">
                                                        <span></span>
                                                        Paypal System
                                                    </label>
                                                    <div class="caption">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                                            incididunt ut labore et dolore magna aliqua.</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="input-checkbox">
                                                <input type="checkbox" id="terms">
                                                <label for="terms">
                                                    <span></span>
                                                    I've read and accept the <a href="#">terms & conditions</a>
                                                </label>
                                            </div>
                                            <a href="#" class="primary-btn order-submit">Place order</a>
                                        </div>-->
                    <!-- /Order Details -->


                    <!-- /Shiping Details -->
                    <div class="col-md-5 order-details">
                        <form action="${path}/checkout" method="POST">
                            <div class="section-title text-center">
                                <h3 class="title">Your Order</h3>
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="name" placeholder="Name" value="${info.customerName}">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="phone" placeholder="Phone" value="${info.phone}">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="address" placeholder="Address" value="${info.addressDetail}, ${info.street}, ${info.city}">
                            </div>
                            <input type="submit" class="primary-btn order-submit" value="Submit" />     
                        </form>


                    </div>
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
                                <li>
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                </li>
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
        <!-- /FOOTER -->
        <!-- jQuery Plugins -->
        <jsp:include page="/views/elements/footer.jsp"/>
        <!-- /FOOTER -->

        <jsp:include page="/views/elements/baseJs.jsp" />

    </body>
</html>
