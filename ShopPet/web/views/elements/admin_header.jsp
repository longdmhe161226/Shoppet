<%-- 
    Document   : admin_header
    Created on : Mar 16, 2023, 3:41:09 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
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
                   <a class="profile-pic" href="${path}/ShopPet/logout">
                      <span class="text-white font-medium">Logout</span></a>
                </li>

            </ul>
        </div>
    </nav>
</header>
