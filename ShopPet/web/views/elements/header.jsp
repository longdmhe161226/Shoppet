<%-- 
    Document   : header
    Created on : Feb 12, 2023, 1:44:56 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="categories" value="${sessionScope.categories}" />


<head>
    <script type="text/javascript"  src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

    <c:if test="${categories==null}">
        <script>
            $(document).ready(function () {
                $.ajax({
                    url: '${path}/categories',
                    method: 'GET',
                    success: function (data, textStatus, jqXHR) {
//                        alert("ccc");
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("get Category status: " + JSON.stringify(textStatus) + "\n" + jqXHR.toString() + "\n\n" + errorThrown.toString());
                    },
                    complete: function (jqXHR, textStatus) {
//                        alert(JSON.stringify(jqXHR) + "\n\n" + JSON.stringify(textStatus));
                    }
                })
            }
            )
        </script>      

    </c:if>

</head>

<!-- HEADER -->
<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="#"><i class="fa fa-phone"></i> +021-95-51-84</a></li>
                <li><a href="#"><i class="fa fa-envelope-o"></i> email@email.com</a></li>
                <li><a href="#"><i class="fa fa-map-marker"></i> 1734 Stonecoal Road</a></li>
            </ul>
            <ul class="header-links pull-right">
                <li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>
                    <c:if test="${sessionScope.Shop_Pet_Customer!=null}">
                    <li><a href="${path}/customer/profile"><i class="fa fa-user-o"></i> My Account</a></li>
                    <li><a href="${path}/logout"><i class="fa fa-key"></i>Logout</a></li>

                </c:if>
                <c:if test="${sessionScope.Shop_Pet_Admin!=null || sessionScope.Shop_Pet_Shipper!=null}">
                    <li><a href="${path}/logout"><i class="fa fa-key"></i>Logout</a></li>

                </c:if>
                <c:if test="${sessionScope.Shop_Pet_Customer==null && sessionScope.Shop_Pet_Admin==null  && sessionScope.Shop_Pet_Shipper==null}">
                    <li><a href="${path}/login"><i class="fa fa-key"></i>login</a></li>
                    </c:if>

            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="${path}/home" class="logo">

                            <img src="${path}/assets/img/logonew.png" alt="" width="169px" height="70px">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form id="f4" action="${path}/searchProduct">
                            <select class="input-select" name="cid">
                                <option value="0" >All Categories</option>
                                <c:forEach items="${categories}" var="c">
                                    <option value="${c.id}">${c.name.toUpperCase()}</option>
                                </c:forEach>
                            </select>
                            <input class="input" name="search" value="${requestScope.search}" placeholder="Search here">
                            <button type="submit" class="search-btn">Search</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Wishlist -->
                        <div>
                            <a href="#">
                                <i class="fa fa-heart-o"></i>
                                <span>Your Wishlist</span>
                                <div class="qty">2</div>
                            </a>
                        </div>
                        <!-- /Wishlist -->

                        <!-- Cart -->
                        <jsp:include page="/views/elements/cart/header_cart.jsp" />
                        <!-- /Cart -->

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- /HEADER -->
