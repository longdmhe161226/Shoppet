<%-- 
    Document   : editprofile
    Created on : Feb 17, 2023, 7:57:18 AM
    Author     : FPT SHOP PCC Hai Hau
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="../assets/css/bootstrap.min.css" />

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="../assets/css/slick.css" />
        <link type="text/css" rel="stylesheet" href="../assets/css/slick-theme.css" />

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="../assets/css/nouislider.min.css" />

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="../assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
              integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="../assets/css/style.css" />
        <link rel="stylesheet" href="../assets/css/edit-profile.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    </head>




    <body>
        <!--<img src="../assets/img/login.jpg" alt="alt"/>-->

        <div class="container rounded bg-white mt-5 mb-5">
            <div class="row">
                <div style="margin-top:30px" class="col-md-8 border-right">
                    <div class="p-3 py-5">
                        <form action="${path}/customer/change-profile" method="POST" >
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h3 class="text-center">Profile Settings</h3>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-6"><label
                                        class="labels">FirstName</label>
                                    <input
                                        type="text" class="form-control"
                                        placeholder=" enter first name" name="firstName" value="${customer.firstName}" required> 
                                </div>
                                <div class="col-md-6"><label
                                        class="labels">LastName</label><input
                                            type="text" class="form-control" name="lastName" value="${customer.lastName}" required
                                        placeholder=" enter last name"></div>
                            </div>
                            <div class="row mt-3">
                                <div class="col-md-12"><label class="labels">Phone
                                        Number</label><input type="text" required
                                                         class="form-control"
                                                         placeholder="enter phone number" name="phone" value="${customer.phone}"></div>
                                <div class="col-md-12"><label class="labels">Date of Birth
                                    </label><input type="date" class="form-control" required
                                                   placeholder="enter date of birth" name="dob" value="${customer.birthOfDate}">
                                </div>
                                <div class="col-md-12"><label class="labels">Email
                                    </label><input type="text" class="form-control" required
                                                   placeholder="enter email " name="email" value="${customer.email}">
                                    <h6 style="color: red">${mse}</h6>
                                </div>
                                <div style="margin:10px 0" class="col-md-12"><label
                                        class="labels">Address</label><input type="text" required
                                        class="form-control"
                                        placeholder="enter address " name="address" value="${customer.address}"></div>
                                <div class="col-md-12"><label class="labels" >Gender</label>
                                    <input type="radio" value="1" name="gender" <c:if test="${customer.gender}" >checked </c:if> >Male
                                    <input type="radio" value="0" name="gender" <c:if test="${!customer.gender}" >checked </c:if> > Female

                                    </div>
                                </div>

                                <div style="margin-top:30px" class="mt-5 text-center">
                                    <button class="btn btn-primary " type="submit">Change
                                        Profile</button>


                                </div>
                            </form>
                        </div>
                    </div>
                    <div style="margin-top:30px" class="col-md-4 border-right">
                        <div class="p-3 py-5">
                            <form method="POST" action="${path}/account/change-password">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <h3 class="text-center">Account</h3>
                                </div>
                                <div class="row mt-3">


                                    <div class="col-md-12"><label class="labels">
                                            <p style="font-size: large">Username: ${acc.username}</p>
                                        Password
                                    </label><input type="text" class="form-control"
                                                   placeholder="enter old password" name="password" value="">
                                    <h6 style="color: red">${msop}</h6>

                                </div>
                                <div class="col-md-12"><label class="labels">New Password
                                    </label><input type="password" class="form-control"
                                                   placeholder="enter password " name="newpassword" value="">
                                </div>
                                <div class="col-md-12"><label
                                        class="labels">Confirm Password</label><input
                                        type="password" class="form-control"
                                        placeholder="enter confirm password " name="cfpassword" value="">
                                    <h6 style="color: red">${msp}</h6>

                                </div>
                                <h6 style="color: red">${sucs}</h6>

                            </div>
                            <div style="margin-top:30px" class="mt-5 text-center">
                                <button class="btn btn-primary " type="submit">Change
                                    Password</button>

                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
                integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
        crossorigin="anonymous"></script>
        <script src="../assets/js/jquery.min.js"></script>
        <script src="../assets/js/bootstrap.min.js"></script>
        <script src="../assets/js/slick.min.js"></script>
        <script src="../assets/js/nouislider.min.js"></script>
        <script src="../assets/js/jquery.zoom.min.js"></script>
        <script src="../assets/js/main.js"></script>
    </body>







</html>
