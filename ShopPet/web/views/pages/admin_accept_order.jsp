<%-- 
    Document   : admin_accept_order
    Created on : Mar 14, 2023, 4:19:09 PM
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


            <jsp:include page="/views/elements/admin_header.jsp"/>
            <jsp:include page="/views/elements/admin_sidebar.jsp"/>

            <div class="page-wrapper">

                <div class="page-breadcrumb bg-white">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <h4 class="page-title">Accept Order</h4>
                        </div>
                        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                            <div class="d-md-flex">
                                <ol class="breadcrumb ms-auto">
                                    <li><a href="${path}/addPetAdmin" 
                                           class="btn btn-danger  d-none d-md-block pull-right ms-3 hidden-xs hidden-sm waves-effect waves-light text-white">

                                            ADD PET</a></li>
                                    <li><a href="${path}/addAccessoryAdmin" 
                                           class="btn btn-danger  d-none d-md-block pull-right ms-3 hidden-xs hidden-sm waves-effect waves-light text-white">

                                            ADD ACCESSORY</a></li>
                                </ol>

                            </div>
                        </div>
                    </div>

                </div>   
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="white-box">
                                <div style="display: flex; justify-content: space-between">
                                    <form action="${path}/admin/order/accept">
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
                                                <option value="NULL" <c:if test="${fn:contains(param.status, 'NULL')}"> selected </c:if> >Waitting Access</option>
                                                <option value="SHIPPING" <c:if test="${param.status eq 'SHIPPING'}"> selected </c:if> >In Shipping</option>
                                                <option value="SUCCESS" <c:if test="${param.status == 'SUCCESS'}"> selected </c:if> >Shipping Success</option>
                                                <option value="CANCEL" <c:if test="${param.status == 'CANCEL'}"> selected </c:if> >Shipping Canceled</option>
                                                <option value="DENY" <c:if test="${param.status == 'DENY'}"> selected </c:if> >Order Denied</option>
                                                </select>
                                                <label>
                                                    From:
                                                </label>  
                                                <input type="date"  name="dateFrom" value="${param.dateFrom}" placeholder="dd-mm-yyyy"  min="1997-01-01" max="2222-05-26"/> 
                                            <label>
                                                To:
                                            </label>  
                                            <input type="date"  name="dateTo" value="${param.dateTo}" placeholder="dd-mm-yyyy" min="1997-01-01" max="2222-05-26"/> 
                                            <label style="margin-left: 20px">
                                                Limit:
                                            </label>
                                            <select name="limit" >
                                                <option value="5" <c:if test="${param.limit == 5}"> checked</c:if>>5</option>
                                                <option value="10" <c:if test="${param.limit == 10}"> checked</c:if>>10</option>
                                                <option value="15" <c:if test="${param.limit == 15}"> checked</c:if>>15</option>
                                                </select>
                                            </div>
                                            <div>


                                                <button style="padding: 5px 10px" type="submit">Search</button>
                                            </div>
                                        </form>


                                    </div>
                                    <div class="table-responsive">
                                        <hr/>
                                    </div>
                                <c:forEach var="o" items="${orders}">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th scope="col" rowspan="2">Id</th>
                                                <th scope="col">Name</th>
                                                <th scope="col">Phone</th>
                                                <th scope="col">Address</th>
                                                <th scope="col">Order Time</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">View Order</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            <tr>
                                                <th scope="row">${o.id}</th>
                                                <td>${o.customerName}</td>
                                                <td>${o.customerPhone}</td>
                                                <td>${o.customerAddress}</td>
                                                <td style="text-align: left">
                                                    <c:if test="${o.shipping.cancelAt!=null}">
                                                        <div  class="text-danger font-bold">- Cancel At: <fmt:formatDate value="${o.shipping.cancelAt}" pattern="dd/MM/yyyy" /> - <fmt:formatDate type="time" value="${o.shipping.cancelAt}" /></div>
                                                    </c:if>
                                                    <c:if test="${o.shipping.doneAt!=null}">
                                                        <div  class="text-success font-bold">- Done At: <fmt:formatDate value="${o.shipping.doneAt}" pattern="dd/MM/yyyy" /> - <fmt:formatDate type="time" value="${o.shipping.doneAt}" /></div>
                                                    </c:if>

                                                    <div class="text-black-50 font-bold">- Created At: <fmt:formatDate value="${o.createAt}" pattern="dd/MM/yyyy" /> - <fmt:formatDate type="time" value="${o.createAt}" /></div>
                                                </td>
                                                <td >
                                                    <c:if test="${ o.status==null}">
                                                        <div>
                                                            <form method="POST">
                                                                <input type="text" hidden="" name="id" value="${o.id}" />
                                                                <input type="text" hidden="" name="update-status" value="accept" />
                                                                <input type="number" name="price"  style="width: 200px" placeholder="Shipping Price" required=""/>
                                                                <button style="margin-right:10px; width: 70px; margin-bottom: 5px" type="submit"  class="btn btn-success" >Accept</button>  
                                                            </form>

                                                        </div>
                                                        <div>
                                                            <form method="POST" onsubmit="return confirm('Do you want to Deny Order-${o.id} ?');">
                                                                <input type="text" hidden="" name="id" value="${o.id}" />
                                                                <input type="text" hidden="" name="update-status" value="deny" />
                                                                <button style="margin-right:10px; width: 70px" class="btn btn-danger" >Deny</button>  

                                                            </form>

                                                        </div>
                                                    </c:if>
                                                    <c:if test="${o.status!=null}">
                                                        <c:if test="${fn:contains(o.status, 'ACCEPT')}">
                                                            <div class="text-success">Accepted</div>
                                                        </c:if>
                                                        <c:if test="${fn:contains(o.status, 'DENY')}">
                                                            <div class="text-danger">Denied</div>
                                                        </c:if>
                                                    </c:if>

                                                </td>
                                                <td >
                                                    <button type="button" class="btn btn-danger"  data-toggle="modal" data-target="#order-detail-${o.id}" >View Order</button>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                    <!-- Modal -->


                                    <div class="modal fade"  id="order-detail-${o.id}" role="dialog">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <!--<button type="button" class="close" data-dismiss="modal" style="align-items: end">&times;</button>-->
                                                    <h4 class="modal-title">Detail Order ${o.id}</h4>
                                                </div>
                                                <div class="modal-body" >
                                                    <div class="container-fluid" style="padding: 20px">
                                                        <table class="table table-bordered">
                                                            <thead>
                                                                <tr>
                                                                    <th scope="col" rowspan="2">Image</th>
                                                                    <th scope="col">Product Name</th>
                                                                    <th scope="col">Quantity</th>
                                                                    <th scope="col">Price</th>
                                                                    <th scope="col">Total Price</th>

                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                                <c:set var="total" value="${0}"/>
                                                                <c:forEach var="item" items="${o.items}">
                                                                    <tr>
                                                                        <td scope="row"><img src="${item.productImage}" height="70px" width=100px /></td>
                                                                        <td>${item.productName}</td>
                                                                        <td>x ${item.quantity}</td>
                                                                        <td>${item.price}</td>
                                                                        <th>${item.price * item.quantity}</th>
                                                                    </tr>
                                                                    <c:set var="total" value="${total + (item.price * item.quantity)}" />
                                                                </c:forEach>

                                                                <tr>
                                                                    <td scope="row" colspan="4" style="text-align: end">Total Item Price:</td>
                                                                    <th>${total}</th>
                                                                </tr>
                                                                <tr>
                                                                    <td scope="row" colspan="4" style="text-align: end">Shipping Price:</td>
                                                                    <th>

                                                                        <c:if test="${o.shipping !=null}"> ${o.shipping.shippingPrice}</c:if>
                                                                        <c:if test="${o.shipping ==null}">N/A</c:if>
                                                                        </th>
                                                                    </tr>
                                                                    <tr>
                                                                        <td scope="row" colspan="4" style="text-align: end">Total Price:</td>
                                                                        <th>${o.totalPrice}</th>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div> 
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </c:forEach>

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
