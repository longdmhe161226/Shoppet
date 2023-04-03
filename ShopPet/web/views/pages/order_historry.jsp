<%-- 
    Document   : blank
    Created on : Feb 22, 2023, 11:14:23 AM
    Author     : ADMIN
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="currentPage" value="${requestScope.currentPage}" />
<c:set var="queryString" value="${requestScope.queryString}" />
<c:set var="paging" value="${requestScope.myOrders}" />
<c:set var="orders" value="${requestScope.myOrders.items}" />

<!DOCTYPE html>
<html lang="en">

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
    <%--<jsp:include page="/views/elements/baseCss.jsp"/>--%>

    <body>
        <!-- HEADER -->
        <jsp:include page="/views/elements/header.jsp"/>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <jsp:include page="/views/elements/navigation.jsp"></jsp:include>
            <!-- /NAVIGATION -->

            <!-- BREADCRUMB -->
        <jsp:include page="/views/elements/breadcrumb.jsp"/>
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <div class="container">
                <div class="row">
                    <div>


                        <table border="1" style="width: 100%">

                            <tbody>
                                <tr>
                                    <th>Order Date</th>
                                    <th>Customer Name</th>
                                    <th>Customer Phone</th>
                                    <th>Order Address</th>
                                    <th>Status</th>
                                    <th></th>
                                </tr>
                                <tr>
                                    <td>123dasd</td>
                                    <td>and</td>
                                    <td>0394</td>
                                    <td>dsadasdsad</td>
                                    <td>success</td>
                                    <td>
                                        <button type="button" class="btn btn-info btn-sm" data-toggle="collapse" data-target="#demo">Simple collapsible</button>
                                   </td>
                                </tr>
                                <tr> 
                                    <td  colspan="10">
                                        <div id="demo" class="collapse" >
                                            Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                            sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                            quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                        </div>
<!--                                        <div class="panel-group" id="accordion">
                                            <div class="panel panel-default">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">
                                                        <a data-toggle="collapse" data-parent="#accordion" href="#order-history-1">Product 1</a>
                                                    </h4>
                                                </div>
                                                <div id="order-history-1" class="panel-collapse collapse ">
                                                    <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
                                                        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                                                        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
                                                </div>
                                            </div>
                                        </div>-->
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>



                    <ul
                        style="box-shadow:5px 10px 10px #e5e5e5 ;display: flex; font-size: 18px;justify-content: space-between;">
                        <li class="order_nav "><a <c:if test="${currentPage == currentPage}"></c:if> class="red" href="${currentPage}">Tất cả</a></li>
                        <li class="order_nav"><a <c:if test="${param.orderStatus == 'NULL'}"> class="red" </c:if>  href="${currentPage}?orderStatus=NULL">Waitting access</a></li>
                        <li class="order_nav"><a <c:if test="${param.shippingStatus == 'SHIPPING'}"> class="red" </c:if>  href="${currentPage}?shippingStatus=SHIPPING">Shipping</a></li>
                        <li class="order_nav"><a <c:if test="${param.shippingStatus == 'SUCCESS'}"> class="red" </c:if>  href="${currentPage}?shippingStatus=SUCCESS">Success</a></li>
                        <li class="order_nav"><a <c:if test="${param.shippingStatus == 'CANCEL'}"> class="red" </c:if>  href="${currentPage}?shippingStatus=CANCEL">Canceled</a></li>
                        <li class="order_nav"><a <c:if test="${param.orderStatus == 'DENY'}"> class="red" </c:if>  href="${currentPage}?orderStatus=DENY">Deny</a></li>
                            <li class="order_nav"><a href=""> 
                                    <!--(pageContext.request.requestURL+"?"+pageContext.request.queryString)-->
                                </a></li>
                        </ul>


                        <div style="position: relative; margin-top:10px" class="input-group flex-nowrap ">
                            <form action="${currentPage}" class="container">
                            <input style="display: none" name="shippingStatus" value="${param.shippingStatus}"/>
                            <input style="display: none" name="orderStatus" value="${param.orderStatus}"/>
                            <div class="row" >
                                <button type="submit">
                                    <i style="position: absolute; left:13px; z-index: 10;top:14px
                                       " class="fa-sharp fa-solid fa-magnifying-glass">


                                    </i>
                                </button> 
                                <input style="padding:20px 30px; " type="text" class="form-control"
                                       name="productName"
                                       placeholder="You can search Product Name here" aria-label="Username"
                                       aria-describedby="addon-wrapping">
                            </div>

                            <!--                            <div class="row" style="display: flex;">
                                                            <span class="form-control" style="width: fit-content">
                                                                <label>order Status</label>
                                                                <select name="orderStatus">
                                                                    <option value="">All</option>
                                                                    <option value ="ACCEPT">Accepted</option>
                                                                    <option value ="DENY">Denied</option>
                                                                    <option value ="NULL">Waitting Accept</option>
                            
                                                                </select>
                                                            </span>
                            
                                                            <span class="form-control" style="width: fit-content">
                                                                <label>Shipping Status</label>
                                                                <select name="shippingStatus">
                                                                    <option value="">All</option>
                                                                    <option value ="SHIPPING">Shipping</option>
                                                                    <option value ="SUCCESS">Successed</option>
                                                                    <option value ="CANCEL">Canceled</option>
                                                                </select>
                                                            </span>-->
                            <div class="d-flex justify-content-end">
                                <span class="form-control justify-content-end" style="width: fit-content ">
                                    <label>Sorted By</label>
                                    <select name="sortedBy" >
                                        <option value="">All</option>
                                        <option value="createdDate"  
                                                <c:if test="${param.sortedBy=='createdDate'}">
                                                    selected
                                                </c:if>
                                                >Sort by date </option>
                                    </select>
                                </span>
                            </div>

                    </div>

                    </form>

                </div>
            </div>
            <div class="container" style="width: 100%" >
                <div class="row order-history">
                    <div class="container-fluid " >

                        <c:forEach var="o" items="${orders}">
                            <div class="order-history shadow p-3 mb-5 bg-white rounded">
                                <div class="row ">
                                    <div class="container-fluid " >
                                        <div  class="row order_status d-flex flex-row justify-content-end" style="margin-right: 10px">
                                            <div class="mr-auto p-2" style="margin-left:  10px">
                                                <i class="fa-sharp fa-solid fa-calendar align-items-start"></i> <span><fmt:formatDate value="${o.createAt}" pattern="dd/MM/yyyy" /> v ${o.id}</span>
                                            </div>
                                            <c:if test="${o.shipping==null}">
                                                <div class="text-black font-weight-bold" style="margin-right: 10px">
                                                    <i class="fa-sharp fa-solid fa-phone-square"></i> <span>No Shipping</span>
                                                </div>
                                            </c:if>
                                            <c:if test="${o.shipping!=null}">
                                                <c:if test="${o.shipping.cancelAt==null && o.shipping.doneAt == null}">
                                                    <div class="text-warning font-weight-bold" style="margin-right: 10px">
                                                        <i class="fa-sharp fa-solid fa-car-side"></i> <span>Your Order are Shipping ...</span>
                                                    </div>
                                                </c:if>

                                                <c:if test="${o.shipping.doneAt!=null}">
                                                    <div class="text-success font-weight-bold" style="margin-right: 10px">
                                                        <i class="fa-sharp fa-solid fa-ticket"></i> <span>Your Order are Successed</span>
                                                    </div>
                                                </c:if>
                                                <c:if test="${o.shipping.cancelAt!=null}">
                                                    <div class="text-danger font-weight-bold" style="margin-right: 10px">
                                                        <i class="fa-sharp fa-solid fa-trash-o"></i> <span>Your Order are Canceled</span>
                                                    </div>
                                                </c:if>
                                            </c:if>
                                            <c:if test="${o.status==null}">
                                                <div>
                                                    <i class="fa-sharp fa-solid fa-circle-question"></i>
                                                    <span class="text-warning font-weight-bold" >Waitting Accept</span>
                                                </div>
                                            </c:if>
                                            <c:if test="${o.status == 'ACCEPT'}">
                                                <div>
                                                    <i class="fa-sharp fa-solid fa-circle-question"></i>
                                                    <span class="text-success font-weight-bold" >Accepted</span>
                                                </div>
                                            </c:if>
                                            <c:if test="${o.status == 'DENY'}">
                                                <div>
                                                    <i class="fa-sharp fa-solid fa-circle-question"></i>
                                                    <span class="text-danger font-weight-bold" > Denies</span>
                                                </div>
                                            </c:if>

                                        </div>
                                        <c:forEach var="item" items="${o.items}">
                                            <!--item-->

                                            <div class="row " style="margin-left: 20px">
                                                <div class="product-widget" style="height: 50px;  width: 100%">
                                                    <div class="product-img">
                                                        <img src="${item.productImage}" alt="" width="100px" height="60px">
                                                    </div>
                                                    <div class="product-body" >
                                                        <h3 class="product-name"><a href="$">${item.productName} ${item.id}</a></h3>
                                                        <div class="d-flex justify-content-end" style="margin-right: 20%">
                                                            <h4 class="product-price"><span class="qty">${item.quantity}x</span>${item.price}$</h4>
                                                        </div>

                                                    </div>
                                                    <!--<button class="delete"><i class="fa fa-close"></i></button>-->
                                                </div>
                                            </div>
                                            <hr />
                                            <!--item-->
                                        </c:forEach>

                                    </div>
                                </div>
                                <div class="row order-history-total">
                                    <div class="container-fluid " >
                                        <div  class="row order_status d-flex flex-row justify-content-end" style="margin-right: 10px">
                                            <div class="d-flex justify-content-end" style="margin-right: 20%">
                                                <h4 class=" text-black" style="margin-bottom: 10px">Total = ${o.totalPrice}$</h4>
                                            </div>
                                        </div>
                                    </div>
                                </div> 
                            </div>
                        </c:forEach>
                        <div class="row justify-content-center">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <c:if test="${param.page>1}">
                                        <li class="page-item">
                                            <a class="page-link" href="${currentPage}?${queryString}&page=${param.page-1}" aria-label="Previous">
                                                <span aria-hidden="true">&laquo;</span>
                                                <span class="sr-only">Previous</span>
                                            </a>
                                        </li>
                                    </c:if>

                                    <c:if test="${param.page>3}">
                                        <c:if test="${param.page<=(paging.pageCount-2)}">
                                            <c:forEach var="i"  begin="${param.page -2}" end="${param.page +2}" step="1">
                                                <!--&& param.page < ((paging.itemCount /paging.limit)+1)-->
                                                <c:if test="${i<paging.pageCount+1}">
                                                    <li class="page-item  <c:if test="${i==param.page }">active</c:if>"><a class="page-link" href="${currentPage}?${queryString}&page=${i}">${i}</a></li>
                                                    </c:if>

                                            </c:forEach>
                                        </c:if>

                                        <c:if test="${param.page>(paging.pageCount-2)}">
                                            <c:forEach var="i"  begin="${paging.pageCount-5}" end="${paging.pageCount}" step="1">
                                                <!--&& param.page < ((paging.itemCount /paging.limit)+1)-->
                                                <c:if test="${i<paging.pageCount+1}">
                                                    <li class="page-item  <c:if test="${i==param.page }">active</c:if>"><a class="page-link" href="${currentPage}?${queryString}&page=${i}">${i}</a></li>
                                                    </c:if>

                                            </c:forEach>
                                        </c:if>

                                    </c:if>

                                    <c:if test="${param.page<3|| param.page==null}">
                                        <c:forEach var="i"  begin="1" end="5" step="1">
                                            <!--&& param.page < ((paging.itemCount /paging.limit)+1)-->

                                            <c:if test="${i<paging.pageCount+1} ">
                                                <li class="page-item  <c:if test="${i==param.page}">active</c:if>"><a class="page-link" href="${currentPage}?${queryString}&page=${i}">${i}</a></li>

                                            </c:if>

                                        </c:forEach>
                                    </c:if>



                                    <li class="page-item">
                                        <a class="page-link" href="${currentPage}?${queryString}&page=${param.page+1}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                            <span class="sr-only">Next</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>


                    </div>

                </div>
            </div>
        </div>
        <!-- /SECTION -->



        <!-- FOOTER -->
        <jsp:include page="/views/elements/footer.jsp"/>
        <!-- /FOOTER -->

        <jsp:include page="/views/elements/baseJs.jsp" />

    </body>

</html>
