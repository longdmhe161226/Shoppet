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
        <title>Add Pet</title>
        <style>
            .active{
                display: block;
            }
            .in-active{
                display: none;
            }
        </style>
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
                            <h4 class="page-title">ADD PET</h4>
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
                                                <form action="./addPetAdmin" method="post" 
                                                      class="form-horizontal">
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label for="text-input" class=" form-control-label">Name
                                                                Pet</label>
                                                        </div>
                                                        <div class="col-12 col-md-9">
                                                            <input type="text" id="text-input" name="name"
                                                                   placeholder="Enter Name" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label for="email-input" class=" form-control-label">Code
                                                                Pet</label>
                                                        </div>
                                                        <div class="col-12 col-md-9">
                                                            <input type="text" id="email-input" name="code"
                                                                   placeholder="Enter Code" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label for="password-input"
                                                                   class=" form-control-label">Price</label>
                                                        </div>
                                                        <div class="col-12 col-md-9">
                                                            <input type="text" id="password-input" name="price"
                                                                   placeholder="Enter price" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label for="password-input"
                                                                   class=" form-control-label">Quantity</label>
                                                        </div>
                                                        <div class="col-12 col-md-9">
                                                            <input type="number" id="password-input" name="quantity"
                                                                   placeholder="Enter quantity" class="form-control">
                                                        </div>
                                                    </div>
                                                    <!-- <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label for="disabled-input" class=" form-control-label">Disabled
                                                                Input</label>
                                                        </div>
                                                        <div class="col-12 col-md-9">
                                                            <input type="text" id="disabled-input" name="disabled-input"
                                                                placeholder="Disabled" disabled="" class="form-control">
                                                        </div>
                                                    </div> -->
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label for="password-input" class=" form-control-label">Date Of
                                                                Birth</label>
                                                        </div>
                                                        <div class="col-12 col-md-9">
                                                            <input type="date" id="password-input" name="dob"
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label for="password-input"
                                                                   class=" form-control-label">Origin</label>
                                                        </div>
                                                        <div class="col-12 col-md-9">
                                                            <input type="text" id="password-input"
                                                                   placeholder="Enter Origin" name="origin"
                                                                   class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label for="password-input" class=" form-control-label">Health
                                                                Status</label>
                                                        </div>
                                                        <div class="col-12 col-md-9">
                                                            <input type="text" id="password-input" name="healthStatus"
                                                                   placeholder="Enter Health" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label class=" form-control-label">Gender</label>
                                                        </div>
                                                        <div class="col col-md-9">
                                                            <div class="">
                                                                <label for="inline-radio1" class="form-check-label ">
                                                                    <input type="radio" id="inline-radio1" name="gender"
                                                                           value="1" class="form-check-input">Male
                                                                </label>
                                                                <label for="inline-radio2" class="form-check-label ">
                                                                    <input type="radio" id="inline-radio2" name="gender"
                                                                           value="0" class="form-check-input">Female
                                                                </label>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label for="password-input" class=" form-control-label">Weight
                                                            </label>
                                                        </div>
                                                        <div class="col-12 col-md-9">
                                                            <input type="text" id="password-input" name="weight"
                                                                   placeholder="Enter Weight" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label for="password-input" class=" form-control-label">Color
                                                            </label>
                                                        </div>
                                                        <div class="col-12 col-md-9">
                                                            <input type="text" id="password-input" name="color"
                                                                   placeholder="Enter Color" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label class=" form-control-label">Vaccinated</label>
                                                        </div>
                                                        <div class="col col-md-9">
                                                            <div class="">
                                                                <label class="form-check-label ">
                                                                    <input type="radio" id="inline-radio1" name="vaccinated"
                                                                           value="1" class="form-check-input">
                                                                    Yes
                                                                </label>

                                                                <label class="form-check-label ">

                                                                    <input type="radio" id="inline-radio2" name="vaccinated"
                                                                           value="0" class="form-check-input">
                                                                    No
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label for="password-input" class=" form-control-label">Identify
                                                            </label>
                                                        </div>
                                                        <div class="col-12 col-md-9">
                                                            <input type="text" id="password-input" name="identification"
                                                                   placeholder="Enter Identify" class="form-control">
                                                        </div>
                                                    </div>

                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label for="textarea-input"
                                                                   class=" form-control-label">Description</label>
                                                        </div>
                                                        <div class="col-12 col-md-9">
                                                            <textarea name="description" id="textarea-input" rows="9"
                                                                      placeholder="Description..."
                                                                      class="form-control"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label class=" form-control-label">Category</label>
                                                        </div>
                                                        <div class="col col-md-9">
                                                            <div>
                                                                <label  class="form-check-label ">
                                                                    <input type="radio"  onChange="changeCategory()"  name="category"
                                                                           value="1" class="form-check-input">Dog
                                                                </label>
                                                                <label   class="form-check-label ">
                                                                    <input type="radio" onChange="changeCategory()"  name="category"
                                                                           value="2" class="form-check-input">Cat
                                                                </label>

                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <div class="col col-md-3">
                                                            <label for="select"
                                                                   class=" form-control-label">SubCategory</label>
                                                        </div>
                                                        <div class="col-12 col-md-9">
                                                            <select name="subId"  class="form-control">
                                                                <option value="0">Please select</option>
                                                                <div id="categoryDog">
                                                                    <c:forEach items="${requestScope.listSubCategoryDog}" var="c">
                                                                        <option value="${c.id}">${c.name}</option>
                                                                    </c:forEach>
                                                                </div>
                                                                <div  id="categoryCat">
                                                                    <c:forEach items="${requestScope.listSubCategoryCat}" var="c1">
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
                                                                            let categoryDog = document.querySelector("#categoryDog");
                                                                            let categoryCat = document.querySelector("#categoryCat");
                                                                            let selectedRadio = document.querySelector('input[name="category"]:checked');
                                                                            if (selectedRadio) {
                                                                                if (selectedRadio.value == 1) {
                                                                                    categoryDog.classList.add('active');
                                                                                    categoryDog.classList.remove('in-active');
                                                                                    categoryCat.classList.add('in-active');
                                                                                    categoryCat.classList.remove('active');
                                                                                } else {
                                                                                    categoryCat.classList.add('active');
                                                                                    categoryCat.classList.remove('in-active');
                                                                                    categoryDog.classList.add('in-active');
                                                                                    categoryDog.classList.remove('active');
                                                                                }
                                                                            }
                                                                        }


        </script>
    </body>
</html>
