<%-- 
    Document   : shipping_accept_order
    Created on : Mar 16, 2023, 9:57:09 PM
    Author     : ADMIN
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="currentPage" value="${requestScope.currentPage}" />
<c:set var="queryString" value="${requestScope.queryString}" />
<c:set var="paging" value="${requestScope.orders}" />
<c:set var="orders" value="${requestScope.orders.items}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script src="${path}/assets/js/all.js"></script>
        <!-- Bootstrap -->
        <link href="${path}/assets/css/style.min.css" rel="stylesheet">

        <link type="text/css" rel="stylesheet" href="${path}/assets/css/bootstrap.min.css" />

        <!-- Slick -->

        <!-- nouislider -->

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="${path}/assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
              integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/style.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <title>Product List</title>
        <style>
            td, th,thead, tbody{
                text-align: center
            }
            input, select, button{
                padding:5px 10px;
            }
            li.active > a{
                color: #fff;
            }

            li.active > a:hover,:focus{
                color: #000;
            }
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                -webkit-appearance: none;
                margin: 0;
            }
        </style>
    </head>
    <body>
        <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
             data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
            <!-- ============================================================== -->
            <!-- Topbar header - style you can find in pages.scss -->
            <!-- ============================================================== -->


            <%--<jsp:include page="/views/elements/admin_header.jsp"/>--%>
            <%--<jsp:include page="/views/elements/admin_sidebar.jsp"/>--%>

            <!--            <div class="page-wrapper">
                            <div class="page-breadcrumb bg-white">
                                <div class="row align-items-center">
                                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                                        <h4 class="page-title">Order</h4>
                                    </div>
                                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                                        <div class="d-md-flex">
                                            <ul class="breadcrumb ms-auto">
                                                <li><a href="./addPetAdmin"
                                                       class="btn btn-danger  d-none d-md-block pull-right ms-3 hidden-xs hidden-sm waves-effect waves-light text-white">
                                                        ADD PET</a></li>
                                                <li><a href="./addAccessoryAdmin"
                                                       class="btn btn-danger  d-none d-md-block pull-right ms-3 hidden-xs hidden-sm waves-effect waves-light text-white">
                                                        ADD ACCESSORY</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>-->
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-9"></div>
                    <div class="col-md-3">

                        <a class="profile-pic btn btn-danger" href="/ShopPet/logout">
                            <span class="text-black font-medium">Logout</span></a>
                    </div>

                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <div style="display: flex; justify-content: space-between">
                                <form action="${path}/Shipper">
                                    <div>
                                        <input type="text" value="${param.customerName}"   placeholder="Customer Name" name="customerName" />
                                        <input type="text" value="${param.customerPhone}"   placeholder="Customer Phone" name="customerPhone" />
                                        <input type="text" style="width: 500px" value="${param.customerAddress}"   placeholder="Customer Address" name="customerAddress" />

                                    </div>
                                    <div>
                                        <label>
                                            Status:
                                        </label> 
                                        <select name="status" style="margin-right: 45px" onchange="form.submit()">

                                            <option value="0">  All</option>
                                            <option value="SHIPPING" <c:if test="${param.status eq 'SHIPPING'}"> selected </c:if> >Shipping</option>
                                            <option value="SUCCESS" <c:if test="${param.status == 'SUCCESS'}"> selected </c:if> >Success</option>
                                            <option value="CANCEL" <c:if test="${param.status == 'CANCEL'}"> selected </c:if> >Canceled</option>
                                            </select>
                                            <label style="margin-left: 20px">
                                                Limit:
                                            </label>
                                            <select name="limit" >
                                                <option value="5" <c:if test="${param.limit == 5}"> checked</c:if>>5</option>
                                            <option value="10" <c:if test="${param.limit == 10}"> checked</c:if>>10</option>
                                            <option value="15" <c:if test="${param.limit == 15}"> checked</c:if>>15</option>
                                            </select>
                                            <button style="padding: 5px 10px" type="submit">Search</button>
                                        </div>

                                    </form>


                                </div>
                                <div class="table-responsive">
                                    <hr/>
                                </div>

                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th scope="col" rowspan="2">Id</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Phone</th>
                                            <th scope="col">Address</th>
                                            <th scope="col">List Product</th>
                                            <th scope="col">Price Detail</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="o" items="${orders}">
                                        <tr>
                                            <th scope="row">${o.id}</th>
                                            <td>${o.customerName}</td>
                                            <td>${o.customerPhone}</td>
                                            <td>${o.customerAddress}</td>
                                            <td  style="text-align: left">
                                                <c:set var="total" value="${0}"/>
                                                <c:forEach var="item" items="${o.items}">
                                                    <div><img src="${item.productImage}" height="50px" width=70px />
                                                        <b>${item.productName}:</b>
                                                        ${item.quantity} x ${item.price}$ = ${item.price * item.quantity}$
                                                    </div>


                                                    <c:set var="total" value="${total + (item.price * item.quantity)}" />
                                                </c:forEach>

                                            </td>
                                            <td style="text-align: left">
                                                <b>Items Price:</b> ${total} <br/>
                                                <b>Shipping Price:</b> ${o.shipping.shippingPrice} <br/>
                                                <b>Total Price:</b> ${o.totalPrice} <br/>
                                                ${o.shipping.startAt}
                                            </td>
                                            <td >
                                                <c:if test="${o.shipping != null && (o.shipping.doneAt==null && o.shipping.cancelAt==null)}">
                                                    <form action="${path}/Shipper/report" style="margin-bottom: 5px">
                                                        <input type="text" hidden=""  name="shippingId" value="${o.shippingId}" />
                                                        <input type="text" hidden=""  name="newStatus" value="SUCCESS" />
                                                        <button type="submit" class="btn btn-success"> Success</button>
                                                    </form>

                                                    <form action="${path}/Shipper/report">
                                                        <input type="text" hidden="" name="shippingId" value="${o.shippingId}" />
                                                        <input type="text" hidden="" name="newStatus" value="CANCEL" />
                                                        <button type="submit" class="btn btn-danger">Cancel</button>
                                                    </form>
                                                </c:if>
                                                <c:if test="${o.shipping != null && o.shipping.doneAt!=null }">
                                                    <div>  You Are Shipped Order </div>
                                                </c:if>
                                                <c:if test="${o.shipping != null && o.shipping.cancelAt!=null}">
                                                    <div>  You Are Cancel Order </div>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>




                        </div>
                    </div>
                </div>
            </div>
            <div class="store-filter clearfix">  

                <span class="store-qty">Total: ${paging.itemCount} orders</span>



                <ul class="store-pagination" >
                    <c:if test="${param.page>1}">
                        <li>
                            <a href="${currentPage}?${queryString}&page=${param.page-1}&limit=${param.limit}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                            </a>
                        </li>
                    </c:if>

                    <c:if test="${paging.pageCount<= 5}">
                        <c:forEach var="i"  begin="1" end="${paging.pageCount}" step="1">
                            <!--&& param.page < ((paging.itemCount /paging.limit)+1)-->

                            <c:if test="${i<paging.pageCount+1 }">
                                <li class=" <c:if test="${i==param.page || (param.page==null && i==1)}">active</c:if>"><a href="${currentPage}?${queryString}&page=${i}&limit=${param.limit}">${i}</a></li>

                            </c:if>                                                                 

                        </c:forEach>
                    </c:if>
                    <c:if test="${paging.pageCount>5}">


                        <c:if test="${param.page>3}">
                            <c:if test="${param.page<=(paging.pageCount-2)}">
                                <c:forEach var="i"  begin="${param.page -2}" end="${param.page +2}" step="1">
                                    <!--&& param.page < ((paging.itemCount /paging.limit)+1)-->
                                    <c:if test="${i<paging.pageCount+1 }">
                                        <li class=" <c:if test="${i==param.page }">active</c:if>"><a href="${currentPage}?${queryString}&page=${i}&limit=${param.limit}">${i}</a></li>
                                        </c:if>

                                </c:forEach>
                            </c:if>

                            <c:if test="${param.page>(paging.pageCount-2)}">
                                <c:forEach var="i"  begin="${paging.pageCount-5}" end="${paging.pageCount}" step="1">
                                    <!--&& param.page < ((paging.itemCount /paging.limit)+1)-->
                                    <c:if test="${i<paging.pageCount+1}">
                                        <li class=" <c:if test="${i==param.page }">active</c:if>"><a href="${currentPage}?${queryString}&page=${i}&limit=${param.limit}">${i}</a></li>
                                        </c:if>

                                </c:forEach>
                            </c:if>

                        </c:if>

                        <c:if test="${param.page<=3|| param.page==null}">
                            <c:forEach var="i"  begin="1" end="5" step="1">
                                <!--&& param.page < ((paging.itemCount /paging.limit)+1)-->

                                <c:if test="${i<paging.pageCount+1 }">
                                    <li class=" <c:if test="${i==param.page || (param.page==null && i==1)}">active</c:if>"><a href="${currentPage}?${queryString}&page=${i}&limit=${param.limit}">${i}</a></li>

                                </c:if>                                                                 

                            </c:forEach>
                        </c:if>
                    </c:if>

                    <c:if test="${param.page<paging.pageCount || param.page==null}">
                        <li >
                            <a href="${currentPage}?${queryString}&page=${param.page+1}&limit=${param.limit}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next </span>
                            </a>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>

    </div>
</div>
<script src="${path}/assets/js/jquery.min.js"></script>

<script src="${path}/assets/js/custom.js"></script>
<script>

</script>
</body>
</html>

