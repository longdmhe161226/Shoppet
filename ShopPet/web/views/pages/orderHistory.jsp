<%-- 
    Document   : orderHistory
    Created on : Mar 13, 2023, 8:07:04 PM
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
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <script src="${path}/assets/js/all.js"></script>
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/slick.css" />
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/slick-theme.css" />

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/nouislider.min.css" />

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="${path}/assets/css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/style.css" />


        <style>
            /*            .page-item, .page-link{
                                background-color: #D10024 !important;
                border-color: #D10024 !important;
                        }*/
            .pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
                z-index: 3;
                color: #fff;
                cursor: default;
                background-color: #D10024;
                border-color: #D10024;
            }
            .pagination>li>a:focus, .pagination>li>a:hover, .pagination>li>span:focus, .pagination>li>span:hover {
                z-index: 2;
                color: #D10024;
                background-color: #eee;
                border-color: #ddd;
            }
            .order-summary .order-col>div {
                padding: 3px 0px;
            }

            .pagination>li>a, .pagination>li>span {
                position: relative;
                float: left;
                padding: 6px 12px;
                margin-left: -1px;
                line-height: 1.42857143;
                color: #D10024 ;
                text-decoration: none;
                background-color: #fff;
                border: 1px solid #ddd;
            }
            .PROJECT-RED {
                background-color: #D10024;
                border-color: #D10024;
                color: white
            }
            button>a, button>a:hover{
                color: #fff;
            }
        </style>
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
            <div id="breadcrumb" class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12">
                            <!--<h3 class="breadcrumb-header">Order History Page</h3>-->
                            <ul class="breadcrumb-tree">
                                <li><a href="${path}/home">Home</a></li>
                            <li class="active">Order History</li>
                        </ul>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /BREADCRUMB -->
        <!-- /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <div class="container">

                <div class="row">
                    <ul
                        style="box-shadow:5px 10px 10px #e5e5e5 ;display: flex; font-size: 18px;justify-content: space-between;">

                        <li class=""><a href=""> 
                                <!--(pageContext.request.requestURL+"?"+pageContext.request.queryString)-->
                            </a></li>
                    </ul>
                    <div style="position: relative; margin-top:10px" class="">


                        <div class="container-fluid" >
                            <div class="row ">
                                <form class="form-inline" action="${currentPage}" style="width: 100%; display: flex; justify-content: center" >
                                    <div class="form-group">
                                        <input type="text" class="form-control"
                                               name="productName"
                                               placeholder="You can search Product Name here" 
                                               style="width: 500px" 
                                               >
                                        <input class="form-control PROJECT-RED" type="submit" value="Search" />    
                                    </div>

                                </form>
                            </div>

                            <div class="row" style="margin: 10px">
                                <div class="col-md-2"></div>
                                <div class="col-md-2"></div>
                                <div class="col-md-2"></div>
                                <div class="col-md-2">
                                    <div class="dropdown">
                                        <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">

                                            <c:if test="${param.orderStatus  == null && param.shippingStatus==null}">ORDER STATUS</c:if>
                                            <c:if test="${param.orderStatus == 'NULL'}">Waitting Access</c:if>
                                            <c:if test="${param.shippingStatus == 'SHIPPING'}"> Shipping </c:if>
                                            <c:if test="${param.shippingStatus == 'SUCCESS'}"> Shipping Success </c:if> 
                                            <c:if test="${param.shippingStatus == 'CANCEL'}"> Shipping Canceled </c:if>
                                            <c:if test="${param.orderStatus == 'DENY'}"> Order Denied </c:if> 

                                                <span class="caret"></span></button>
                                            <ul class="dropdown-menu">
                                                <li class=" "><a class="" href="${currentPage}">ALL</a></li>
                                            <li class=""><a class=""   href="${currentPage}?orderStatus=NULL">Waitting Access</a></li>
                                            <li class=""><a   href="${currentPage}?shippingStatus=SHIPPING">Shipping</a></li>
                                            <li class=""><a  href="${currentPage}?shippingStatus=SUCCESS">Shipping Success</a></li>
                                            <li class=""><a  href="${currentPage}?shippingStatus=CANCEL">Shipping Canceled</a></li>
                                            <li class=""><a  href="${currentPage}?orderStatus=DENY">Order Denied</a></li>
                                        </ul>
                                    </div>
                                </div>

                                <div class="col-md-2">
                                    <div class="dropdown">
                                        <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">SORT BY
                                            <span class="caret"></span></button>
                                        <ul class="dropdown-menu">
                                            <li class=""><a <c:if test="${param.orderStatus == 'DENY'}"> class="" </c:if>  href="${currentPage}?sortedBy=createdDate">Sort by date</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="dropdown">
                                            <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
                                            <c:if test="${param.limit==null}">Limit</c:if>
                                            <c:if test="${param.limit==3}">3</c:if>
                                            <c:if test="${param.limit==7}">7</c:if>
                                            <c:if test="${param.limit==10}">10</c:if>
                                                <span class="caret"></span></button>
                                            <ul class="dropdown-menu">
                                                <li class=""><a href="${currentPage}?${queryString}&limit=3">3</a></li>
                                            <li class=""><a href="${currentPage}?${queryString}&limit=7">7</a></li>
                                            <li class=""><a href="${currentPage}?${queryString}&limit=10">10</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>


                    </div>

                </div>
                <div class="row">
                    <table border="1" style="width: 100%">

                        <tbody>
                            <tr>
                                <th>Order Date</th>
                                <th>Customer Name</th>
                                <th>Customer Phone</th>
                                <th>Order Address</th>
                                <th>Total Price</th>
                                <th>Status</th>
                                <th>

                                    <!--                                        <select name="limit">
                                                                                <a><option> 3</option></a>
                                                                                <option><a href="{currentPage}?{queryString}&limit=5">5</a> </option>
                                                                                <option><a href="{currentPage}?{queryString}&limit=10">10</a> </option>
                                                                            </select>-->
                                </th>
                            </tr>
                            <c:forEach var="o" items="${orders}">
                                <tr>
                                    <td>
                                        <i class="fa-sharp fa-solid fa-calendar align-items-start"></i> 
                                        <span><fmt:formatDate value="${o.createAt}" pattern="dd/MM/yyyy" /> </span>
                                    </td>
                                    <td>${o.customerName}</td>
                                    <td>${o.customerPhone}</td>
                                    <td>${o.customerAddress}</td>
                                    <td>${o.totalPrice}</td>
                                    <td style="font-weight: bold">
                                        <c:if test="${o.shipping==null}">
                                            <c:if test="${o.status==null}">
                                                <div>
                                                    <i class="fa-sharp fa-solid fa-circle-question"></i>
                                                    <span class="text-warning font-weight-bold" >Waitting Accept</span>
                                                </div>
                                            </c:if>

                                            <c:if test="${o.status == 'ACCEPT'}">
                                                <div>
                                                    <i class="fa-sharp fa-solid fa-circle-question"></i>
                                                    <span class="text-success font-weight-bold" >Finding Shipper</span>
                                                </div>
                                            </c:if>
                                            <c:if test="${o.status == 'DENY'}">
                                                <div>
                                                    <i class="fa-sharp fa-solid fa-circle-question"></i>
                                                    <span class="text-danger font-weight-bold" > Denied</span>
                                                </div>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${o.shipping!=null}">
                                            <c:if test="${o.shipping.cancelAt==null && o.shipping.doneAt == null}">
                                                <div class="text-warning font-weight-bold" style="margin-right: 10px">
                                                    <i class="fa-sharp fa-solid fa-car-side"></i> <span>Shipping ...</span>
                                                </div>
                                            </c:if>

                                            <c:if test="${o.shipping.doneAt!=null && o.status == 'ACCEPT'}">
                                                <div class="text-success font-weight-bold" style="margin-right: 10px">
                                                    <i class="fa-sharp fa-solid fa-ticket"></i> <span>Shipping Successed</span>
                                                </div>
                                            </c:if>
                                            <c:if test="${o.shipping.cancelAt!=null || o.status == 'DENY'}">
                                                <div class="text-danger font-weight-bold" style="margin-right: 10px">
                                                    <i class="fa-sharp fa-solid fa-trash-o"></i> <span>Shipping Canceled</span>
                                                </div>
                                            </c:if>
                                        </c:if>

                                    </td>
                                    <td>
                                        <button type="button" class="btn btn-info btn-sm" data-toggle="collapse" data-target="#order-product-${o.id}">View Product</button>
                                        <button type="button" class="btn btn-primary btn-sm" ><a href="${path}/order/detail?id=${o.id}" >View Detail</a> </button>
                                    </td>
                                </tr>
                                <tr> 
                                    <td  colspan="10">
                                        <div id="order-product-${o.id}" class="collapse" >
                                            <div class="container-fluid" style="margin: 5px"> 


                                                <!--item-->
                                                <div class="row" style="
                                                     display: grid;
                                                     grid-template-columns: 5% 20% 60% 5%;
                                                     " >

                                                    <div class="order-summary" style="width: 100%;
                                                         grid-column: 2/4;

                                                         ">
                                                        <div class="order-col">
                                                            <div style="width: 200px"><strong>IMAGE</strong></div>
                                                            <div><strong>PRODUCT</strong></div>
                                                            <div style="margin-right: 20%"><strong>TOTAL</strong></div>
                                                        </div>

                                                        <div class="order-products" >
                                                            <c:forEach var="item" items="${o.items}">


                                                                <div class="order-col">
                                                                    <div style="width: 200px">  
                                                                        <img src="${item.productImage}" alt="Girl in a jacket" width="100px" height="60px">
                                                                    </div>
                                                                    <div>${item.quantity}x<a href="${path}/product/product-detail?id=${item.productId}">
                                                                            ${item.productName}
                                                                        </a></div>
                                                                    <div>${item.price}$</div>
                                                                </div>
                                                            </c:forEach>

                                                        </div>
                                                        <!--                                                            <div class="order-col">
                                                                                                                        <div>Shiping</div>
                                                                                                                        <div><strong>FREE</strong></div>
                                                                                                                    </div>
                                                                                                                    <div class="order-col">
                                                                                                                        <div><strong>TOTAL</strong></div>
                                                                                                                        <div><strong class="order-total">$2940.00</strong></div>
                                                                                                                    </div>-->
                                                    </div>

                                                </div>

                                                <!--item-->


                                            </div>


                                        </div>

                                    </td>
                                </tr>
                            </c:forEach>

                            <tr>
                                <td colspan="10">
                                    <div class="container-fluid " >
                                        <div class="row justify-content-center" style="    display: flex;
                                             justify-content: center;">
                                            <nav aria-label="Page navigation example">
                                                <ul class="pagination">
                                                     <c:if test="${param.page>1}">
                                                            <li class="page-item">
                                                                <a class="page-link" href="${currentPage}?${queryString}&page=${param.page-1}&limit=${param.limit}" aria-label="Previous">
                                                                    <span aria-hidden="true">&laquo;</span>
                                                                    <span class="sr-only">Previous</span>
                                                                </a>
                                                            </li>
                                                        </c:if>
                                                    <c:if test="${paging.pageCount<= 5}">
                                                        <c:forEach var="i"  begin="1" end="${paging.pageCount+1}" step="1">
                                                            <!--&& param.page < ((paging.itemCount /paging.limit)+1)-->

                                                            <c:if test="${i<paging.pageCount+1}">
                                                                <li class="page-item  <c:if test="${i==param.page || (param.page==null && i==1) }">active</c:if>"><a class="page-link" href="${currentPage}?${queryString}&page=${i}&limit=${param.limit}">${i}</a></li>
                                                                </c:if>                                                               

                                                        </c:forEach>
                                                    </c:if>
                                                    <c:if test="${paging.pageCount > 5}">
                                                       

                                                        <c:if test="${param.page>3}">
                                                            <c:if test="${param.page<=(paging.pageCount-2)}">
                                                                <c:forEach var="i"  begin="${param.page -2}" end="${param.page +2}" step="1">
                                                                    <!--&& param.page < ((paging.itemCount /paging.limit)+1)-->
                                                                    <c:if test="${i<paging.pageCount+1}">
                                                                        <li class="page-item  <c:if test="${i==param.page || (param.page==null && i==1) }">active</c:if>"><a class="page-link" href="${currentPage}?${queryString}&page=${i}&limit=${param.limit}">${i}</a></li>
                                                                        </c:if>

                                                                </c:forEach>
                                                            </c:if>

                                                            <c:if test="${param.page>(paging.pageCount-2)}">
                                                                <c:forEach var="i"  begin="${paging.pageCount-5}" end="${paging.pageCount}" step="1">
                                                                    <!--&& param.page < ((paging.itemCount /paging.limit)+1)-->
                                                                    <c:if test="${i<paging.pageCount+1}">
                                                                        <li class="page-item  <c:if test="${i==param.page || (param.page==null && i==1)}">active</c:if>"><a class="page-link" href="${currentPage}?${queryString}&page=${i}&limit=${param.limit}">${i}</a></li>
                                                                        </c:if>

                                                                </c:forEach>
                                                            </c:if>

                                                        </c:if>

                                                        <c:if test="${param.page<=3|| param.page==null}">
                                                            <c:forEach var="i"  begin="1" end="5" step="1">
                                                                <!--&& param.page < ((paging.itemCount /paging.limit)+1)-->

                                                                <c:if test="${i<paging.pageCount+1 }">
                                                                    <li class="page-item  <c:if test="${i==param.page || (param.page==null && i==1)}">active</c:if>"><a class="page-link" href="${currentPage}?${queryString}&page=${i}&limit=${param.limit}">${i}</a></li>

                                                                </c:if>                                                                 

                                                            </c:forEach>
                                                        </c:if>
                                                    </c:if>

                                                    <c:if test="${param.page<paging.pageCount || (param.page==null && ! paging.pageCount <2)}">
                                                       
                                                        <li class="page-item">
                                                            <a class="page-link" href="${currentPage}?${queryString}&page=${param.page+1}&limit=${param.limit}" aria-label="Next">
                                                                <span aria-hidden="true">&raquo;</span>
                                                                <span class="sr-only">Next </span>
                                                            </a>
                                                        </li>
                                                    </c:if>
                                                </ul>
                                            </nav>
                                        </div>

                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>








                </div>
            </div>
            <div class="container" style="width: 100%" >
                <div class="row order-history">


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

