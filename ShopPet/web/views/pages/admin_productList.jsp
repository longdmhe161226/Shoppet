<%-- 
    Document   : admin_productList
    Created on : Mar 4, 2023, 11:55:16 PM
    Author     : khuat
--%>

<%-- 
    Document   : admin_profile
    Created on : Mar 4, 2023, 11:51:32 PM
    Author     : khuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
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

        <title>Product List</title>
        <style>
            td, th,thead, tbody{
                text-align: center
            }
        </style>
    </head>
    <body>
        <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
             data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
            <!-- ============================================================== -->
            <!-- Topbar header - style you can find in pages.scss -->
            <!-- ============================================================== -->
            <header class="topbar" data-navbarbg="skin5">
                <nav style="display: flex; justify-content: right"class="navbar top-navbar navbar-expand-md navbar-dark">
                    <div class="navbar-collapse collapse" id="navbarSupportedContent" data-navbarbg="skin5">


                        <ul class="navbar-nav ms-auto d-flex align-items-center">


                            <li class=" in">
                                <form role="search" class="app-search d-none d-md-block me-3">
                                    <input type="text" placeholder="Search..." class="form-control mt-0">
                                    <a href="" class="active">
                                        <i class="fa fa-search"></i>
                                    </a>
                                </form>
                            </li>

                            <li>
                                <a class="profile-pic" href="#">
                                    <img width="36px" height="30px" src="https://banner2.cleanpng.com/20190716/gxo/kisspng-user-profile-computer-icons-system-administrator-i-5d2dbe8f6be133.6663683015632789914419.jpg" alt="user-img" 
                                         class="img-circle"><span class="text-white font-medium">Admin</span></a>
                            </li>

                        </ul>
                    </div>
                </nav>
            </header>

             <jsp:include page="/views/elements/admin_sidebar.jsp"/>

            <div class="page-wrapper">
                <div class="page-breadcrumb bg-white">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <h4 class="page-title">Product</h4>
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
                </div>
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="white-box">
                                <div style="display: flex; justify-content: space-between">
                                    <form id="f4" action="./showProductAdmin">
                                        <select onchange="changeCategory()" class="input-select" name="cid">
                                            <option value="0" >All Categories</option>
                                            <c:forEach  items="${listCategory}" var="c">
                                                <option ${requestScope.cid==c.id ?"selected":""} value="${c.id}">${c.name.toUpperCase()}</option>
                                            </c:forEach>
                                        </select>
                                    </form>
                                    <form action="./searchProductAdmin" method="get">
                                        <input style="display: none" name="cid" value="${requestScope.cid}" />
                                        <input style="padding:5px 10px;" type="text" value="${requestScope.search}"   placeholder="Search..." name="search"/> 
                                        <button style="padding: 5px 10px" type="submit">Search</button>
                                    </form>

                                </div>
                                <div class="table-responsive">
                                    <table class="table text-nowrap">
                                        <thead>
                                            <tr>
                                                <th class="border-top-0">Id</th>
                                                <th class="border-top-0">Code</th>
                                                <th class="border-top-0">Name</th>
                                                <th class="border-top-0">Quantity</th>
                                                <th class="border-top-0">Image</th>
                                                <th class="border-top-0">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:if test="${requestScope.cid==0}">
                                                <c:forEach items="${requestScope.listAllProduct}" var="p">
                                                    <tr>
                                                        <td>${p.id}</td>
                                                        <td>${p.code}</td>
                                                        <td>${p.name}</td>
                                                        <td>${p.quantity}</td>
                                                        <td><img height="40px" width="40px" src="${p.imageProduct.get(0).img}"/></td>
                                                        <td style="display:flex; justify-content: center"><button style="margin-right:10px"  ><a href="updateProduct?id=${p.id}">Edit</a></button>  <button onclick="doDelete('${p.id}')" >Delete</button></td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${requestScope.cid!=0}">
                                                <c:forEach items="${requestScope.listAllProductByCategory}" var="p">
                                                    <tr>
                                                        <td>${p.id}</td>
                                                        <td>${p.code}</td>
                                                        <td>${p.name}</td>
                                                        <td>${p.quantity}</td>
                                                        <td> <img  height="40px" width="40px" src="${p.imageProduct.get(0).img}"/></td>
                                                        <td style="display:flex; justify-content: center">  <button style="margin-right:10px"><a href="updateProduct?id=${p.id}">Edit</a></button>  <button onclick="doDelete('${p.id}')" >Delete</button></td>

                                                    </tr>           
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${requestScope.seach!=null ||requestScope.search!='' }">
                                                <c:forEach items="${requestScope.listSearchAdmin}" var="p">
                                                    <tr>
                                                        <td>${p.id}</td>
                                                        <td>${p.code}</td>
                                                        <td>${p.name}</td>
                                                        <td>${p.quantity}</td>
                                                        <td> <img  height="40px" width="40px" src="${p.imageProduct.get(0).img}"/></td>
                                                        <td style="display:flex; justify-content: center">  
                                                            <button style="margin-right:10px"><a href="updateProduct?id=${p.id}">Edit</a></button>  
                                                            <button onclick="doDelete('${p.id}')" >Delete</button>

                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="store-filter clearfix">  
                        <c:if test="${requestScope.cid==0 }">
                            <span class="store-qty">Total: ${size} products</span>
                        </c:if>
                        <c:if test="${requestScope.cid!=0 }">
                            <span class="store-qty">Total: ${sizeCate} products</span>
                        </c:if>
                        <ul class="store-pagination">
                            <c:if test="${requestScope.cid==0 }">
                                <c:forEach begin="${0}" end="${requestScope.num-1}" var="i" >
                                    <li><a class="${i==requestScope.page ?"activePaging":""}"href="showProductAdmin?cid=${requestScope.cid}&page=${i}">${i+1}</a></li> 
                                    </c:forEach>    
                                </c:if>
                                <c:if test="${requestScope.cid!=0 && (requestScope.sid==0 || requestScope.sid==null)}">
                                    <c:forEach begin="${0}" end="${requestScope.numCate-1}" var="i" >
                                    <li><a class="${i==requestScope.page ?"activePaging":""}"href="showProductAdmin?cid=${requestScope.cid}&page=${i}">${i+1}</a></li> 
                                    </c:forEach>    
                                </c:if>
                        </ul>
                    </div>
                </div>

            </div>
        </div>
        <script src="${path}/assets/js/jquery.min.js"></script>

        <script src="${path}/assets/js/custom.js"></script>
        <script>
                                                            function changeCategory() {
                                                                document.getElementById("f4").submit();
                                                            }

                                                            function doDelete(id) {
                                                                if (confirm("Ban co muon xoa san pham " + id)) {
                                                                    window.location = "deleteProduct?id=" + id;
                                                                }
                                                            }
        </script>
    </body>
</html>
