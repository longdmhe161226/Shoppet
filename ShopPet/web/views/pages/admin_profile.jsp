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
        <title>Profile Admin</title>
    </head>
    <body>
        <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
             data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
            <!-- ============================================================== -->
            <!-- Topbar header - style you can find in pages.scss -->
            <!-- ============================================================== -->
            <header class="topbar" data-navbarbg="skin5">
                <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                    <img style="margin-left:100px" height="50px" src="${path}/assets/img/logonew.png" alt="homepage" />

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
                <!-- ============================================================== -->
                <div class="container-fluid">
                    <!-- ============================================================== -->
                    <!-- Start Page Content -->
                    <!-- ============================================================== -->
                    <!-- Row -->
                    <div class="row">
                        <!-- Column -->
                        
                        <!-- Column -->
                        <!-- Column -->
                        <div class="col-lg-8 col-xlg-9 col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <form  class="form-horizontal form-material">
                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Full Name </label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="text" placeholder="${c.firstName} ${c.lastName}" readonly=""
                                                       class="form-control p-0 border-0"> </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Gender: <c:choose>
                                                    <c:when test="${c.gender}">
                                                        Male
                                                    </c:when>
                                                    <c:otherwise>
                                                        Female
                                                    </c:otherwise>
                                                </c:choose></label>

                                        </div>
                                        <div class="form-group mb-4">
                                            <label for="example-email" class="col-md-12 p-0">Email</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="email" placeholder="${c.email}" readonly=""
                                                       class="form-control p-0 border-0" name="example-email"
                                                       id="example-email">
                                            </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label for="example-email" class="col-md-12 p-0">Date of Birth</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="datetime" value="${c.birthOfDate}" readonly=""
                                                       class="form-control p-0 border-0"/> 
                                            </div>
                                        </div>


                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Phone No</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="text" placeholder="${c.phone}" readonly=""
                                                       class="form-control p-0 border-0">
                                            </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label class="col-sm-12">Address: ${c.address}</label>
                                        </div>
                                        <div id="active-toggle" class="form-group mb-4 activeee">
                                            <input type="hidden" name="active" value="${customer.getAccount().id}" />
                                            <input type="checkbox" class="switch-toggle" name="active" 
                                                   <c:if test="${c.getAccount().deactive_at==null}">
                                                       checked
                                                   </c:if> 
                                                   />
                                        </div>
                                        <div id="reason-wrapper" class="form-group mb-4" <c:if test="${c.getAccount().deactive_at==null}">
                                             style="display: none"
                                            </c:if> >
                                            <label class="col-md-12 p-0">Reason Deactive</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <textarea 
                                                    rows="5" class="form-control p-0 border-0" name="reason" placeholder="Fill deactive reason">${c.getAccount().deactive_reason}</textarea>
                                            </div>
                                        </div>
                                        <input type="hidden" name="id" value="${c.getAccount().id}" />


                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
         <script>
            const activeToggle = document.querySelector('#active-toggle input[type="checkbox"]');
            const reasonWrapper = document.querySelector('#reason-wrapper');
            var i = 0;
            activeToggle.addEventListener('change', (event) => {
                if (event.target.checked) {
                    reasonWrapper.style.display = 'none';
//                    i++;
                } else {
                    reasonWrapper.style.display = 'block';
//                    i++;

                }
            });
        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                // Lắng nghe sự kiện khi textarea thay đổi
                $('textarea[name="reason"]').on('change', function () {
                    var reason = $(this).val();
                    var active = 'off';
                    var id = $('input[name="id"]').val();

                    // Gửi dữ liệu lên server bằng Ajax
                    $.ajax({
                        url: 'profile',
                        type: 'POST',
                        data: {
                            reason: reason,
                            id: id, active: active
                        },
                        success: function (response) {
                            console.log(response);
                        },
                        error: function (xhr, status, error) {
                            console.error(xhr.responseText);
                        }
                    });
                });
                $('input[name="active"]').on('change', function () {
                    if ($(this).is(':checked')) {
                        // Lấy giá trị của input checkbox "active"
                        var reason = '';
                        var active = 'on';
                        var id = $('input[name="id"]').val();
                        // Gửi dữ liệu lên server bằng Ajax
                        $.ajax({
                            url: 'profile',
                            type: 'POST',
                            data: {
                                reason: reason,
                                id: id, active: active
                            },
                            success: function (response) {
                                console.log(response);
                            },
                            error: function (xhr, status, error) {
                                console.error(xhr.responseText);
                            }
                        });
                    }
                });
            });

        </script>

        <script src="${path}/assets/js/jquery.min.js"></script>

        <script src="${path}/assets/js/custom.js"></script>
    </body>
</html>
