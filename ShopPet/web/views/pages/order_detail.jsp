<%-- 
    Document   : blank
    Created on : Feb 22, 2023, 11:14:23 AM
    Author     : ADMIN
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="order" value="${requestScope.order}" />
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Order Detail</title>

        <!--public link-->
        <jsp:include page="/views/elements/baseCss.jsp"/>

        <style>
            .rating {
                display: inline-block;
                position: relative;
                height: 50px;
                line-height: 50px;
                font-size: 50px;
            }

            .rating label {
                position: absolute;
                top: 0;
                left: 0;
                height: 100%;
                cursor: pointer;
            }

            .rating label:last-child {
                position: static;
            }

            .rating label:nth-child(1) {
                z-index: 5;
            }

            .rating label:nth-child(2) {
                z-index: 4;
            }

            .rating label:nth-child(3) {
                z-index: 3;
            }

            .rating label:nth-child(4) {
                z-index: 2;
            }

            .rating label:nth-child(5) {
                z-index: 1;
            }

            .rating label input {
                position: absolute;
                top: 0;
                left: 0;
                opacity: 0;
            }

            .rating label .icon {
                float: left;
                color: transparent;
            }

            .rating label:last-child .icon {
                color: #000;
            }

            .rating:not(:hover) label input:checked ~ .icon,
            .rating:hover label:hover input ~ .icon {
                color: #09f;
            }

            .rating label input:focus:not(:checked) ~ .icon:last-child {
                color: #000;
                text-shadow: 0 0 5px #09f;
            }

        </style>
        <script>
            $(':radio').change(function () {
                console.log('New star rating: ' + this.value);
            });
        </script>
    </head>

    <body>
        <!-- HEADER -->
        <jsp:include page="/views/elements/header.jsp"/>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <jsp:include page="/views/elements/navigation.jsp"></jsp:include>
            <!-- /NAVIGATION -->

            <!-- BREADCRUMB -->
            <div id="breadcrumb" class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12">
                            <!--<h3 class="breadcrumb-header">Order History Page</h3>-->
                            <ul class="breadcrumb-tree">
                                <li><a href="${path}/home">Home</a></li>
                            <li><a href="${path}/order/history">Order History</a></li>
                            <li class="active">Order Detail</li>
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
            <div class="container" style="border: 1px slategray double">
                <!-- row -->
                <div class="row" style="
                     width: 80%;
                     padding-left: auto;
                     padding-right: auto;
                     margin-left: auto;
                     margin-right: auto;
                     ">
                    <div>
                        Your Order Detail
                    </div>
                    <div class="col-md-5 d-flex">
                        <div> ${order.customerName}</div>
                        <div> ${order.customerPhone}</div>
                        <div> ${order.customerAddress}</div>
                    </div>
                    <div class="col-md-7 h-100 mh-100"
                         style="
                         /*height: 100%;*/
                         border-left: 1px slategrey solid;
                         height: 100px;
                         "
                         >
                        <c:if test="${order.shipping.cancelAt!=null}">
                            <div class="row">
                                <div class="col-md-2"><fmt:formatDate value="${order.shipping.cancelAt}" type="time" /></div>
                                <div class="col-md-3"><fmt:formatDate value="${order.shipping.cancelAt}" pattern="dd-MM-yyyy" /></div>
                                <div class="col-md-7">Cancel At</div>
                            </div>
                        </c:if>

                        <c:if test="${order.shipping.doneAt!=null}">
                            <div class="row">
                                <div class="col-md-2"><fmt:formatDate value="${order.shipping.doneAt}" type="time" /></div>
                                <div class="col-md-3"><fmt:formatDate value="${order.shipping.doneAt}" pattern="dd-MM-yyyy" /></div>
                                <div class="col-md-7">Done Time</div>
                            </div>
                        </c:if>


                        <c:if test="${order.shipping.startAt!=null}">
                            <div class="row">
                                <div class="col-md-2"><fmt:formatDate value="${order.shipping.startAt}" type="time" /></div>
                                <div class="col-md-3"><fmt:formatDate value="${order.shipping.startAt}" pattern="dd-MM-yyyy" /></div>
                                <div class="col-md-7">Shipping Time</div>
                            </div>
                        </c:if>


                        <div class="row">
                            <div class="col-md-2"><fmt:formatDate value="${order.createAt}" type="time" /></div>
                            <div class="col-md-3"><fmt:formatDate value="${order.createAt}" pattern="dd-MM-yyyy" /></div>
                            <div class="col-md-7">Created Order Time</div>
                        </div>
                    </div>
                </div>
                <!-- /row -->
                <!-- row -->
                <div class="row" style="
                     width: 80%;
                     padding-left: auto;
                     padding-right: auto;
                     margin-left: auto;
                     margin-right: auto;
                     ">
                    <div>
                        Order Product
                    </div>
                    <div class="container-fluid">
                        <c:forEach var="item" items="${order.items}">
                            <div class="row" style="
                                 border: 2px #000 solid;
                                 padding-top:  5px;
                                 padding-bottom:  5px;
                                 ">

                                <div class="col-md-2">
                                    <img src="${item.productImage}" height="70px"/>
                                </div>
                                <div class="col-md-7"> 
                                    <div> ${item.productName}</div>
                                    <div> x ${item.quantity}</div>

                                </div>
                                <div class="col-md-3"> 
                                    <div>    ${item.price}$</div>
                                    <c:if test="${order.shipping.doneAt!=null}">
                                        <div class="btn btn-sm btn-danger" data-toggle="collapse" data-target="#item-feedback-${item.id}">
                                            View Your Feedback

                                        </div>
                                    </c:if>
                                </div>
                                <c:if test="${order.shipping.doneAt!=null}">
                                    <div id="item-feedback-${item.id}" class="col-md-12 collapse"
                                         style="
                                         border: 1px slateblue solid;
                                         padding-top:  5px;
                                         padding-left:  100px;
                                         padding-bottom:  5px;
                                         margin-top: 10px;
                                         "
                                         > 
                                        <div  class="container-fluid">
                                            <div class="row">
                                                <c:if test="${item.feedback!=null}">
                                                    <div class="col-md-7">
                                                        <div class="media">
                                                            <div class="media-left">
                                                                <img src="" class="media-object" style="width:60px">
                                                            </div>
                                                            <div class="media-body">
                                                                <h4 class="media-heading">
                                                                    <c:forEach var="i" begin="0" end="${item.feedback.star}" step="1">
                                                                        ★
                                                                    </c:forEach>
                                                                </h4>
                                                                <p>${item.feedback.content} </p> 
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-3"><a class="btn btn-danger" href="${path}/feedback/delete?id=${item.feedback.id}" onclick="return confirm('do you want delete this feedback?')" style="margin-left: 80%">x</a></div>
                                                </c:if>
                                                <c:if test="${item.feedback==null}">
                                                    <form action="${path}/feedback/add" method="POST">
                                                        <div class="form-group">
                                                            <input hidden="" type="text" name="order_item_id" value="${item.id}" />
                                                            <label >Feedback:</label>
                                                            <textarea class="form-control" rows="3" name="content" required=""></textarea>

                                                            <label>
                                                                <input type="radio" name="star" value="1"  required/>
                                                                <span class="icon">★</span>
                                                            </label>
                                                            <label>
                                                                <input type="radio" name="star" value="2" />
                                                                <span class="icon">★</span>
                                                                <span class="icon">★</span>
                                                            </label>
                                                            <label>
                                                                <input type="radio" name="star" value="3" />
                                                                <span class="icon">★</span>
                                                                <span class="icon">★</span>
                                                                <span class="icon">★</span>   
                                                            </label>
                                                            <label>
                                                                <input type="radio" name="star" value="4" />
                                                                <span class="icon">★</span>
                                                                <span class="icon">★</span>
                                                                <span class="icon">★</span>
                                                                <span class="icon">★</span>
                                                            </label>
                                                            <label>
                                                                <input type="radio" name="star" value="5" />
                                                                <span class="icon">★</span>
                                                                <span class="icon">★</span>
                                                                <span class="icon">★</span>
                                                                <span class="icon">★</span>
                                                                <span class="icon">★</span>
                                                            </label>
                                                            <input type="submit" value="submit" style="margin-left: 45%"/>
                                                        </div>

                                                    </form>
                                                </c:if>



                                            </div>
                                        </div>
                                    </div>  
                                </c:if>
                            </div>

                        </c:forEach>


                    </div>

                </div>
                <!-- /row -->
                <div class="row" style="
                     width: 80%;
                     padding-left: auto;
                     padding-right: auto;
                     margin-left: auto;
                     margin-right: auto;
                     margin-bottom: 10px
                     /*border-top: 1px floralwhite solid;*/
                     ">
                    <table border="1px red solid" style="
                           border: 1px red solid;
                           text-align: right;
                           width: 100%;


                           ">

                        <tbody >
                            <tr>
                                <th style="width: 80%;text-align: right; padding-right: 10px"> Total Items Price:</th>
                                <td style="width: 20%; padding-right: 5px">${requestScope.totalItemsPrice}$</td>
                            </tr>
                            <tr>
                                <th style="width: 80%;text-align: right;; padding-right: 10px">Shipping Price:</th>
                                <td style="padding-right: 5px;">${order.shipping.shippingPrice}$</td>
                            </tr>
                            <tr>
                                <th style="width: 80%;text-align: right;; padding-right: 10px">Total Price:</th>
                                <td style="padding-right: 5px;">${order.totalPrice}$</td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->



        <!-- FOOTER -->
        <jsp:include page="/views/elements/footer.jsp"/>
        <!-- /FOOTER -->

        <jsp:include page="/views/elements/baseJs.jsp" />

    </body>

</html>
