<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
            integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
        <link rel="stylesheet" href="${path}/assets/css/login.css">
        <title>Document</title>
    </head>

    <body>

        <section class="vh-100">
            <div class="container py-5 h-100">
                <div class="row d-flex align-items-center justify-content-center h-100">
                    <div class="col-md-8 col-lg-7 col-xl-6">
                        <img src="${path}/assets/img/login.webp" class="img-fluid" alt="Phone image">
                    </div>
                    
                    <div class="col-md-7 col-lg-5 col-xl-5 offset-xl-1">
                        <form action="${path}/login" method="post">
                            <h4 style="color: red;">${registerMsg}</h4>
                            <!-- username input -->
                            <div class="form-outline mb-4">
                                <input type="text" id="form1Example13" class="form-control form-control-lg"  name="username" value="${cookie.cusername.value}" required/>
                                <label class="form-label" for="form1Example13">Username</label>
                            </div>

                            <!-- Password input -->
                            <div class="form-outline mb-4">
                                <input type="password" id="form1Example23" class="form-control form-control-lg" name="password" value="${cookie.cpassword.value}" required/>
                                <label class="form-label" for="form1Example23">Password</label>
                            </div>

                            <div class="d-flex justify-content-around align-items-center mb-4">
                                <!-- Checkbox -->
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="form1Example3" ${(cookie.cremember.value eq 'on')?"checked":""}
                   name="remember"/>
                                    <label class="form-check-label" for="form1Example3"> Remember me </label>
                                </div>
                                <a href="${path}/forgot-password">Forgot password?</a>
                                 <a href="${path}/register">Register now !</a>
                            </div>
                            <c:if test="${requestScope.loginMsg != null}">
                                <h4 style="color: red;">${requestScope.loginMsg}</h4>
                            </c:if>
                                
                            <!-- Submit button -->
                           
                            <input type="submit" style="background-color:  #15161D;"
                                   class="btn btn-primary btn-lg btn-block" value="Login">

                        </form>
                        
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