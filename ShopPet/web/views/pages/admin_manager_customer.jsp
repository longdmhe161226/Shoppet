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
        <link href="${path}/assets/css/style.min.css?v=<?php echo time();?>" rel="stylesheet">
        <style>
            .submitt{
                display: none;
                border: 0.1em solid #ffffff;
                border-radius: 0.12em;
                box-sizing: border-box;
                text-decoration: none;
                font-family: "Roboto", sans-serif;
                font-weight: 300;
                color: #ffffff;
                text-align: center;
                transition: all 0.2s;
                background-color: #3e5569;
                height: 33px;

            }

            .submitt:hover {
                color: #3e5569;
                background-color: #ffffff;
            }
            .switch-toggle{
                width: 35px;
                height: 20px;
                appearance: none;
                background: #3e5569;
                border-radius: 10px;
                position: relative;
                box-shadow: inset 0px 0px 1px #636465;
            }

            .switch-toggle::before{
                content: "";
                width: 17px;
                height: 16px;
                position: absolute;
                background: #f8fbfc;
                border-radius: 50%;
                top: 2px;
                left: 2px;
                box-shadow: 0px 0px 2px #636465;
                transition: 0.33s;
            }
            .switch-toggle:checked{
                background: #83d8ff;
            }
            .switch-toggle:checked:before{
                left: 16px;
            }

            .input-reason {
                font-size: 12px;
            }

            .input-reason::value {
                transform: scale(0.8);
            }

        </style>
        <title>Product List</title>
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
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
<!--                <div class="page-breadcrumb bg-white">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <h4 class="page-title">Basic Table</h4>
                        </div>
                        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                            <div class="d-md-flex">
                                <ol class="breadcrumb ms-auto">
                                    <li><a href="#" class="fw-normal">Dashboard</a></li>
                                </ol>
                                <a href="https://www.wrappixel.com/templates/ampleadmin/" target="_blank"
                                   class="btn btn-danger  d-none d-md-block pull-right ms-3 hidden-xs hidden-sm waves-effect waves-light text-white">Upgrade
                                    to Pro</a>
                            </div>
                        </div>
                    </div>
                     /.col-lg-12 
                </div>-->

<div class="page-breadcrumb bg-white">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <h4 class="page-title">Account Manager</h4>
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
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Container fluid  -->
                <!-- ============================================================== -->
                <div class="container-fluid">
                    <!-- ============================================================== -->
                    <!-- Start Page Content -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="white-box">
<!--                                <h3 class="box-title">Basic Table</h3>
                                <p class="text-muted">Add class <code>.table</code></p>-->

                                <form action="" method="POST">
                                    <div class="table-responsive">
                                        <table class="table text-nowrap">
                                            <thead>
                                                <tr>
                                                    <th class="border-top-0">ID</th>
                                                    <th class="border-top-0">Username</th>
                                                    <th class="border-top-0"> Name</th>
                                                    <th class="border-top-0">email</th>
                                                    <th class="border-top-0"></th>
                                                    <th class="border-top-0"></th>
                                                    <th class="border-top-0"></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="customer" items="${requestScope.customers}">

                                                    <tr>
                                                        <td><a class="profile" href="./profile?id=${customer.id}" >${customer.id}</a></td>
                                                        <td><a   class="profile" href="./profile?id=${customer.id}" >${customer.getAccount().username}</a></td>
                                                        <td><a  class="profile" href="./profile?id=${customer.id}">${customer.firstName} ${customer.lastName} </a></td>
                                                        <td><a  class="profile" href="./profile?id=${customer.id}">${customer.email} </a></td>
                                                        <td>
                                                            <div  class="activeee"  >
                                                                <input type="hidden" name="active" value="${customer.getAccount().id}" />
                                                                <input  type="checkbox" class="switch-toggle" name="active" 
                                                                        <c:if test="${customer.getAccount().deactive_at==null}">
                                                                            checked
                                                                        </c:if> 
                                                                        />

                                                            </div>
                                                        </td>
                                                        <td class="reason" style="width: 266px;opacity: 0;">
                                                            <input type="hidden" name="reason" value="${customer.getAccount().id}" />
                                                            <input class="input-reason"  style="height: 22px;padding-left: 11px;width: 100%" type="text" name="reason" placeholder="Reason deactive :33" 
                                                                   value="${customer.getAccount().deactive_reason}"
                                                                   />
                                                        </td>
                                                        <td> <a href="./profile?id=${customer.id}"></a>  </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div style="padding-right: 29%;" >
                                            <button style="float: right;width: 80px;" type="submit" class="submitt"  type="submit"  >Submit</button>

                                        </div>

                                    </div>
                                </form>
                            </div>
                        </div>


                    </div>

                </div>
            </div>

        </div>

        <script>
            const submitBtn = document.querySelector('.submitt');
            const reason = document.querySelectorAll('.input-reason');

            const initialValues = [...reason].map((el) => el.value);

            reason.forEach(function (ok) {
                ok.addEventListener('change', function (event) {
                    const index = [...reason].indexOf(event.target);
                    if (initialValues[index] !== event.target.value) {
                        submitBtn.style.display = 'inline';
                    } else if (![...reason].some((el) => el.value !== initialValues[index])) {
                        submitBtn.style.display = 'none';
                    }
                });
            });

        </script>

        <script>
            //            const submitBtn = document.querySelector('.submitt');
            const switches = document.querySelectorAll('.switch-toggle');

            const initialSwitchValues = [];
            switches.forEach((s) => initialSwitchValues.push(s.checked));

            const updatedSwitchValues = [];

            switches.forEach(function (switchToggle) {
                switchToggle.addEventListener('change', function () {
                    updatedSwitchValues.length = 0; // clear the array
                    switches.forEach(function (toggle) {
                        updatedSwitchValues.push(toggle.checked);
                        console.log(initialSwitchValues, updatedSwitchValues);
                        if (initialSwitchValues.toString() === updatedSwitchValues.toString()) {
                            submitBtn.style.display = 'none';
                        } else {
                            submitBtn.style.display = 'inline';
                        }

                    });
                });
            });


        </script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
            $(document).ready(function () {
                $('input[type="checkbox"]').change(function () {
                    if (!this.checked) {
                        $(this).closest('tr').find('.reason').css('opacity', '1');
                    } else {
                        // Ngược lại, thay đổi opacity của phần tử reason của hàng tương ứng thành 0
                        $(this).closest('tr').find('.reason').css('opacity', '0');
                    }
                });
            });

        </script>

        <script>
            let checkboxes = document.querySelectorAll(".switch-toggle");

            for (let i = 0; i < checkboxes.length; i++) {
                if (!checkboxes[i].checked) {
                    checkboxes[i].parentNode.parentNode.nextElementSibling.style.opacity = "1";
                } else {
                    checkboxes[i].parentNode.parentNode.nextElementSibling.style.opacity = "0";
                }
            }

        </script>



        <script src="${path}/assets/js/jquery.min.js"></script>

        <script src="${path}/assets/js/custom.js"></script>

        <script src="https://kit.fontawesome.com/48fdf6fbf8.js" crossorigin="anonymous"></script>
        <!--<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>-->


    </body>
</html>
