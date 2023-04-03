<%-- Document : register.jsp Created on : Feb 14, 2023, 1:51:29 PM Author : FPT SHOP PCC Hai Hau --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
              integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
              crossorigin="anonymous">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${path}/assets/css/register.css">
        <title>Register</title>
    </head>


    <body>

        <section class="h-100">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col">
                        <div class="card card-registration my-4">
                            <div class="row g-0">
                                <div class="col-xl-6 d-none d-xl-block">
                                    <img src="assets/img/register.jpg" alt="Sample photo" class="img-fluid"
                                         style="border-top-left-radius: .25rem; border-bottom-left-radius: .25rem;" />
                                </div>
                                <div class="col-xl-6">
                                    <div class="card-body p-md-5 text-black">
                                        <h3 class="mb-5 text-uppercase">Registration form</h3>
                                        <form action="${path}/register" method="POST">
                                            <div class="form-outline mb-4">
                                                <input type="text" id="form3Example9" name="username" required
                                                       class="form-control form-control-lg" />
                                                <label class="form-label" for="form3Example9">Username</label>
                                                <h5 style="color: red;">${msu}</h5>

                                            </div>
                                            <div class="form-outline mb-4">
                                                <input type="password" id="form3Example9" name="password" required
                                                       class="form-control form-control-lg" />
                                                <label class="form-label" for="form3Example9">Password</label>
                                            </div>
                                            <div class="form-outline mb-4">
                                                <input type="password" id="form3Example9" name="cfpassword" required
                                                       class="form-control form-control-lg" />
                                                <label class="form-label" for="form3Example9">Confirm
                                                    Password</label>
                                                <h5 style="color: red;">${ms}</h5>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <input type="text" id="form3Example1m" name="firstName"
                                                               required class="form-control form-control-lg" />
                                                        <label class="form-label" for="form3Example1m">First
                                                            name</label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <input type="text" id="form3Example1n" name="lastName"
                                                               required class="form-control form-control-lg" />
                                                        <label class="form-label" for="form3Example1n">Last
                                                            name</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <input type="text" id="form3Example1m1" name="phone"
                                                               required class="form-control form-control-lg" />
                                                        <label class="form-label"
                                                               for="form3Example1m1">Phone</label>
                                                        <h5 style="color: red;">${phonems}</h5>

                                                    </div>
                                                </div>
                                                <div class="col-md-6 mb-4">
                                                    <div class="form-outline">
                                                        <input type="date" id="form3Example1n1"
                                                               name="birth_of_date" required
                                                               class="form-control form-control-lg" />
                                                        <label class="form-label"
                                                               for="form3Example1n1">Dob</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-outline mb-4">
                                                <input type="text" id="form3Example8" name="email" required
                                                       class="form-control form-control-lg" />
                                                <label class="form-label" for="form3Example8">Email</label>
                                                <h5 style="color: red;">${mse} </h5>

                                            </div>

                                            <div class="form-outline mb-4">
                                                <input type="text" id="form3Example8" name="address" required
                                                       class="form-control form-control-lg" />
                                                <label class="form-label" for="form3Example8">Address</label>
                                            </div>

                                            <div class="d-md-flex justify-content-start align-items-center mb-4 py-2"
                                                 required>

                                                <label class="mb-0 me-4">Gender: </label>

                                                <div class="form-check form-check-inline mb-0 me-4">
                                                    <input class="form-check-input" type="radio" name="gender"
                                                           required id="femaleGender" value="Female" />
                                                    <label class="form-check-label"
                                                           for="femaleGender">Female</label>
                                                </div>

                                                <div class="form-check form-check-inline mb-0 me-4">
                                                    <input class="form-check-input" type="radio" name="gender"
                                                           required id="maleGender" value="Male" />
                                                    <label class="form-check-label"
                                                           for="maleGender">Male</label>
                                                </div>



                                            </div>




                                            <div class="d-flex justify-content-end pt-3">
                                                <a href="register"><button type="button"
                                                                           class="btn btn-light btn-lg">Reset all</button></a>
                                                <button type="submit"
                                                        style="background-color: #15161D; color: white;"
                                                        class="btn btn-warning btn-lg ms-2">Submit
                                                    form</button>



                                            </div>

                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
                integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
                integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
                integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
        crossorigin="anonymous"></script>
    </body>

</html>