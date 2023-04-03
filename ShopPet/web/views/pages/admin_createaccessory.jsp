<%-- 
    Document   : admin_createaccessory
    Created on : Mar 5, 2023, 3:14:08 PM
    Author     : khuat
--%>

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
        <link href="${path}/assets/css/style.min.css" rel="stylesheet">
        <title>Add Accessory </title>
    </head>
    <body>
        <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
             data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">

            <header class="topbar" data-navbarbg="skin5">
                <nav class="navbar top-navbar navbar-expand-md navbar-dark">
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
                            <h4 class="page-title">ADD ACCESSORY</h4>
                        </div>
                        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                            <div class="d-md-flex">
                                <ol class="breadcrumb ms-auto">
                                    <li><a href="./addPetAdmin" 
                                           class="btn btn-danger  d-none d-md-block pull-right ms-3 hidden-xs hidden-sm waves-effect waves-light text-white">
                                            ADD PET</a></li>
                                    <li><a href="./addAccessoryAdmin"
                                           class="btn btn-danger  d-none d-md-block pull-right ms-3 hidden-xs hidden-sm waves-effect waves-light text-white">

                                            ADD ACCESSORY</a></li>
                                </ol>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="container-fluid">
                    <div class="main-content">
                        <div class="section__content section__content--p30">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-body card-block">
                                                <form action="./addAccessoryAdmin" method="post">
                                                    <div>
                                                        <div class="row form-group">
                                                            <div class="col col-md-3">
                                                                <label  class=" form-control-label">Name
                                                                    Product</label>
                                                            </div>
                                                            <div class="col-12 col-md-9">
                                                                <input type="text"  value="${p.name}" name="name"
                                                                       placeholder="Enter Name" class="form-control"/>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col col-md-3">
                                                                <label  class=" form-control-label">Code
                                                                    Product</label>
                                                            </div>
                                                            <div class="col-12 col-md-9">
                                                                <input type="text"  value="${p.code}" name="code"
                                                                       placeholder="Enter Code" class="form-control"/>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col col-md-3">
                                                                <label 
                                                                    class=" form-control-label">Price</label>
                                                            </div>
                                                            <div class="col-12 col-md-9">
                                                                <input type="text"  value="${p.price}" name="price"
                                                                       placeholder="Enter price" class="form-control"/>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col col-md-3">
                                                                <label for="password-input"
                                                                       class=" form-control-label">Quantity</label>
                                                            </div>
                                                            <div class="col-12 col-md-9">
                                                                <input type="number"  value="${p.quantity}" name="quantity"
                                                                       placeholder="Enter quantity" class="form-control"/>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col col-md-3">
                                                                <label for="password-input"
                                                                       class=" form-control-label">Origin</label>
                                                            </div>
                                                            <div class="col-12 col-md-9">
                                                                <input type="text" 
                                                                       placeholder="Enter Origin" name="origin" value="${p.origin.region}"
                                                                       class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col col-md-3">
                                                                <label for="textarea-input"
                                                                       class=" form-control-label">Description</label>
                                                            </div>
                                                            <div class="col-12 col-md-9">
                                                                <textarea name="description" id="textarea-input" rows="9" value="${p.description}"
                                                                          placeholder="Description..." class="form-control"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col col-md-3">
                                                                <label class=" form-control-label">Category</label>
                                                            </div>
                                                            <div class="col col-md-9">
                                                                <div class="">
                                                                    <label  class="form-check-label ">
                                                                        <input type="radio" ${p.getSubCategorys().get(0).getCategories().get(0).getId()==3 ?"checked":""}   onChange="changeCategory()"  name="category"
                                                                               value="1" class="form-check-input">Accessory
                                                                    </label>
                                                                    <label   class="form-check-label ">
                                                                        <input type="radio"  ${p.getSubCategorys().get(0).getCategories().get(0).getId()==4 ?"checked":""} onChange="changeCategory()"  name="category"
                                                                               value="2" class="form-check-input">Food
                                                                    </label>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col col-md-3">
                                                                <label for="select" class=" form-control-label">SubCategory</label>
                                                            </div>
<!--                                                            <div class="col-12 col-md-9">
                                                                <select  name="subId" id="categoryAccessory" class="form-control">
                                                                    <option value="0">Please select</option>
                                                                    <c:forEach items="${requestScope.listSubCategoryAccessory}" var="c">
                                                                        <option ${p.getSubCategorys().get(0).getId()==c.id?'selected':''} value="${c.id}">${c.name} </option>
                                                                    </c:forEach>
                                                                </select>
                                                                <select style="display:none"  name="subId" id="categoryFood" class="form-control">
                                                                    <option value="0">Please select</option>
                                                                    <c:forEach items="${requestScope.listSubCategoryFood}" var="c">
                                                                        <option ${p.getSubCategorys().get(0).getId()==c.id?'selected':''} value="${c.id}">${c.name} </option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>-->
                                                            <div class="col-12 col-md-9">
                                                            <select name="subId"  class="form-control">
                                                                <option value="0">Please select</option>
                                                                <div id="categoryAccessory">
                                                                    <c:forEach items="${requestScope.listSubCategoryAccessory}" var="c">
                                                                        <option value="${c.id}">${c.name}</option>
                                                                    </c:forEach>
                                                                </div>
                                                                <div style="display:none" id="categoryFood">
                                                                    <c:forEach items="${requestScope.listSubCategoryFood}" var="c1">
                                                                        <option value="${c1.id}">${c1.name}</option>
                                                                    </c:forEach>
                                                                    </dv>
                                                            </select>
                                                        </div>
                                                        </div>

                                                        <div class="row form-group">
                                                            <div class="col col-md-3">
                                                                <label for="file-multiple-input"
                                                                       class=" form-control-label">Img Url</label>
                                                            </div>
                                                            <div class="col-12 col-md-9">
                                                                <input type="text" id="file-multiple-input"
                                                                       name="imgUrl" 
                                                                       class="form-control-file">
                                                            </div>
                                                        </div>
                                                        <div class="card-footer d-flex justify-content-end">
                                                            <button type="submit" class="btn btn-primary btn-lg">
                                                                <i class="fa fa-dot-circle-o"></i> Submit
                                                            </button>
                                                            <button style="margin-left:20px" type="reset" class="btn btn-danger btn-lg">
                                                                <i class="fa fa-ban"></i> Reset
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="${path}/assets/js/jquery.min.js"></script>

        <script src="${path}/assets/js/custom.js"></script>
        <script>
                                                                            function changeCategory() {
                                                                                let categoryAccessory = document.querySelector("#categoryAccessory");
                                                                                let categoryFood = document.querySelector("#categoryFood");
                                                                                let selectedRadio = document.querySelector('input[name="category"]:checked');
                                                                                if (selectedRadio) {
                                                                                    if (selectedRadio.value == 1) {
                                                                                        categoryAccessory.style.display = 'block';
                                                                                        categoryFood.style.display = 'none';
                                                                                    } else {
                                                                                        categoryFood.style.display = 'block';
                                                                                        categoryAccessory.style.display = 'none';
                                                                                    }
                                                                                }
                                                                            }


        </script>
    </body>
</html>
