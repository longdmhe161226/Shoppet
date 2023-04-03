<%-- Document : home.jsp Created on : Feb 17, 2023, 8:21:31 AM Author : khuat --%>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="currentPage" value="${requestScope.currentPage}" />
<c:set var="queryString" value="${requestScope.queryString}" />
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Detail Page</title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <script src="${path}/assets/js/all.js"></script>
        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/bootstrap.min.css" />

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/slick.css" />
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/slick-theme.css" />

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/nouislider.min.css" />

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="${path}/assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
              integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="${path}/assets/css/style.css" />
        <style>
            .abc{
                font-weight: 500;
                min-height: 20px;
                padding-left: 20px;
                margin-bottom: 5px;
                cursor: pointer;
            }
            .transparent {
                background-color: transparent;
            }
        </style>
    </head>
    <!-- HEADER -->
    <jsp:include page="/views/elements/header.jsp"/>
    <!-- /HEADER -->

    <!-- NAVIGATION -->
    <jsp:include page="/views/elements/navigation.jsp"></jsp:include>
        <!-- NAVIGATION -->

        <!--	 BREADCRUMB 
                <div id="breadcrumb" class="section">
                         container 
                        <div class="container">
                                 row 
                                <div class="row">
                                        <div class="col-md-12">
                                                <ul class="breadcrumb-tree">
                                                        <li><a href="#">Home</a></li>
                                                        <li><a href="#">All Categories</a></li>
                                                        <li><a href="#">Accessories</a></li>
                                                        <li class="active">Headphones (227,490 Results)</li>
                                                </ul>
                                        </div>
                                </div>
                                 /row 
                        </div>
                         /container 
                </div>
                 /BREADCRUMB -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- ASIDE -->
                    <div id="aside" class="col-md-3">
                        <!-- aside Widget -->
                        <div class="aside">
                            <h3 class="aside-title">Categories</h3>
                            <div class="checkbox-filter">
                                <form id="f1" action="./filterCategory" >
                                <c:if test="${requestScope.cid!=0 || (requestScope.subIdFilter!=0 &&requestScope.subIdFilter!=null) }">
                                    <input style="display:none" type="text" name="cid" value="${requestScope.cid}" />
                                    <c:forEach items="${requestScope.listNameSub}" var="c" >
                                        <div class="input-checkbox">
                                            <input ${requestScope.sid ==c.id ?"checked":""} type="radio" onchange="changeCategory()" name="subCategory" value="${c.id}"  id="category-2">
                                            <label for="category-1">
                                                <span></span>
                                                ${c.name.toUpperCase()}
                                            </label>
                                        </div>
                                    </c:forEach>
                                </c:if>

                                <c:if test="${requestScope.cid==0 }">
                                    <c:forEach items="${requestScope.listCategory}" var="c" >
                                        <div class="input-checkbox">
                                            <input  type="radio" onchange="changeCategory()" name="cid" value="${c.id}" id="category-1">
                                            <label for="category-1">
                                                <span></span>
                                                ${c.name.toUpperCase()}
                                            </label>
                                        </div>
                                    </c:forEach>
                                </c:if>

                            </form>

                        </div>
                    </div>
                    <!-- /aside Widget -->

                    <!-- aside Widget -->
                    <%--<c:if test="${check==true|| colorFilter!=null || cid==0 ||(check==true &&cidFilter!=0)}">--%>
                    <div class="aside">
                        <h3 class="aside-title">Color</h3>
                        <div class="checkbox-filter">
                            <form id="f3" action="./filterColor">
                                <input style="display:none" type="text" name="cid" value="${requestScope.cid}" />
                                <input $"{c=='black'?'checked':''}"  type="checkbox"  name="color" value="black" id="category-1">
                                <label for="category-1">
                                    <span class="abc" >Black</span>
                                </label>
                                <br/>
                                <br/>
                                <input   type="checkbox"  name="color" value="white" id="category-1">
                                <label for="category-1">
                                    <span class="abc" >White</span>
                                </label>
                                <br/>
                                <br/>
                                <input  type="checkbox"  name="color" value="yellow" id="category-1">
                                <label for="category-1">
                                    <span class="abc" >Yellow</span>
                                </label>
                                <br/>
                                <br/>
                                <input  type="checkbox" name="color" value="orange" id="category-1">
                                <label for="category-1">
                                    <span class="abc" >Orange</span>
                                </label>
                                <br/>
                                <br/>
                                <input  type="checkbox"  name="color" value="silver" id="category-1">
                                <label for="category-1">
                                    <span class="abc" >Silver</span>
                                </label>
                                <br/>
                                <br/>
                                <input  type="checkbox" name="color" value="gloden" id="category-1">
                                <label for="category-1">
                                    <span class="abc">Golden</span>
                                </label>
                                <br/>
                                <br/>
                                <button class="btn btn-danger" type="submit"> Filter</button>
                            </form>
                        </div>
                    </div>
                    <%--</c:if>--%>
                    <!-- /aside Widget -->

                    <!-- aside Widget -->
                </div>
                <!-- /ASIDE -->

                <!-- STORE -->
                <div id="store" class="col-md-9">
                    <!-- store top filter -->
                    <div class="store-filter clearfix">
                        <div class="store-sort">
                            <form id="f2" action="./sortPrice">
                                <label>
                                    <input style="display:none" type="text" name="cid" value="${requestScope.cid}" />
                                    <select class="input-select" name="sort_price" onchange="changePrice()">
                                        <option ${requestScope.sortPrice=="0" ?"selected":""} value="0">Sort By Price</option>
                                        <option ${requestScope.sortPrice=="1" ?"selected":""} value="1">Low To High</option>
                                        <option ${requestScope.sortPrice=="-1" ?"selected":""} value="-1">High To Low</option>
                                    </select>
                                </label>
                            </form>
                        </div>
                        <!--                        <div class="store-sort">
                                                    <form action="./searchProduct" >
                                                        <input style="display:none" type="text" name="cid" value="${requestScope.cid}" />
                                                        <div style="display:flex; justify-content: center">
                                                            <input type="text" class="form-control" value="${requestScope.search}" name="search" placeholder="Search by name, origin">
                                                            <button class="btn btn-danger" type="submit"> Search</button>
                                                        </div>
                                                    </form>
                                                </div>-->
                    </div>
                    <!-- /store top filter -->

                    <!-- store products -->
                    <div class="row">
                        <c:if test="${requestScope.cid==0}">
                            <c:forEach items="${requestScope.listAllProduct}" var="c">
                                <!-- product -->
                                <div class="col-md-4 col-xs-6  <c:if test="${c.quantity <= 0}">transparent</c:if>">
                                    <a href="${path}/product/product-detail?id=${c.id}">
                                        <div class="product">
                                            <div class="product-img">
                                                <img src="${c.imageProduct[0].img}" alt="">
                                                <div class="product-label">
                                                    <c:if test="${c.quantity <= 0}">
                                                        <span class="new" >Sold</span>
                                                    </c:if>

                                                </div>
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category">${c.subCategorys[0].name}</p>
                                                <h3 class="product-name"><a href="${path}/product/product-detail?id=${c.id}">${c.name}>y</a></h3>
                                                <h4 class="product-price">${c.price} </h4>
                                                <div class="product-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                            </div>


                                            <div class="add-to-cart">
                                                <c:if test="${c.quantity > 0}">
                                                    <button class="add-to-cart-btn" onclick="addCartAllJs('${path}', '${c.id}', 1)"><i class="fa fa-shopping-cart"></i> add to
                                                        cart</button>
                                                    </c:if>
                                            </div>
                                        </div>
                                        </a>
                                            </div>
                                            <!-- /product -->
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${requestScope.cid!=0}">
                                        <c:forEach items="${requestScope.listAllProductByCategory}" var="c">
                                            <!-- product -->
                                            <div class="col-md-4 col-xs-6 <c:if test="${c.quantity <= 0}">transparent</c:if>">
                                                <a href="${path}/product/product-detail?id=${c.id}">
                                                    <div class="product">
                                                        <div class="product-img">
                                                            <img src="${c.imageProduct[0].img}" alt="">
                                                            <c:if test="${c.quantity <= 0}">
                                                                <span class="new">Sold</span>
                                                            </c:if>
                                                        </div>
                                                        <div class="product-body">
                                                            <p class="product-category">${c.subCategorys[0].name}</p>
                                                            <h3 class="product-name"><a href="${path}/product/product-detail?id=${c.id}">${c.name}</a></h3>
                                                            <h4 class="product-price">${c.price} </h4>
                                                            <div class="product-rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                        </div>
                                                            <c:if test="${c.quantity > 0}">
                                                                <div class="add-to-cart">
                                                                    <button class="add-to-cart-btn" onclick="addCartAllJs('${path}', '${c.id}', 1)"><i class="fa fa-shopping-cart"></i> add to
                                                                        cart</button>
                                                                </div>
                                                            </c:if>
                                                       
                                                    </div>
                                                </a>
                                            </div>

                                            <!-- /product -->
                                        </c:forEach>
                                    </c:if>
                                    <!--sort--> 
                                    <c:if test="${requestScope.sortPrice!=null}">
                                        <c:forEach items="${requestScope.listSort}" var="c">
                                            <!-- product -->
                                            <div class="col-md-4 col-xs-6 <c:if test="${c.quantity <= 0}">transparent</c:if>">
                                                <a href="${path}/product/product-detail?id=${c.id}">
                                                    <div class="product">
                                                        <div class="product-img">
                                                            <img src="${c.imageProduct[0].img}" alt="">
                                                            <div class="product-label">
                                                                <c:if test="${c.quantity <= 0}">
                                                                    <span class="new">Sold</span>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                        <div class="product-body">
                                                            <p class="product-category">${c.subCategorys[0].name}</p>
                                                            <h3 class="product-name"><a href="#">${c.name}</a></h3>
                                                            <h4 class="product-price">${c.price} </h4>
                                                            <div class="product-rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                            </div>
                                                        </div>
                                                        <div class="add-to-cart">
                                                            <c:if test="${c.quantity >  0}">
                                                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to
                                                                    cart</button>
                                                                </c:if>

                                                        </div>
                                                    </div>
                                                    </a>
                                                        </div>

                                                        <!-- /product -->
                                                    </c:forEach>
                                                </c:if>
                                                <c:if test="${requestScope.colorFilter!=null}">
                                                    <c:forEach items="${requestScope.listFilter}" var="c">
                                                        <!-- product -->
                                                        <div class="col-md-4 col-xs-6 <c:if test="${c.quantity <= 0}">transparent</c:if>">
                                                            <a href="${path}/product/product-detail?id=${c.id}">
                                                                <div class="product">
                                                                    <div class="product-img">
                                                                        <img src="${c.imageProduct[0].img}" alt=""/>
                                                                        <div class="product-label">
                                                                            <c:if test="${c.quantity <= 0}">
                                                                                <span class="new">Sold</span>
                                                                            </c:if>
                                                                        </div>
                                                                    </div>
                                                                    <div class="product-body">
                                                                        <p class="product-category">${c.subCategorys[0].name}</p>
                                                                        <h3 class="product-name"><a href="#">${c.name}</a></h3>
                                                                        <h4 class="product-price">${c.price} </h4>
                                                                        <div class="product-rating">
                                                                            <i class="fa fa-star"></i>
                                                                            <i class="fa fa-star"></i>
                                                                            <i class="fa fa-star"></i>
                                                                            <i class="fa fa-star"></i>
                                                                            <i class="fa fa-star"></i>
                                                                        </div>
                                                                    </div>
                                                                    <div class="add-to-cart">
                                                                        <c:if test="${c.quantity > 0}">
                                                                             <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to
                                                                            cart</button>
                                                                        </c:if>
                                                                       
                                                                    </div>
                                                                </div>
                                                                </a>
                                                                    </div>

                                                                    <!-- /product -->
                                                                </c:forEach>
                                                            </c:if>
                                                            <c:if test="${requestScope.cid!=0 ||requestScope.sid!=0}">
                                                                <c:forEach items="${requestScope.listFilterCategory}" var="c">
                                                                    <!-- product -->
                                                                    <div class="col-md-4 col-xs-6 <c:if test="${c.quantity <= 0}">transparent</c:if>">
                                                                        <a href="${path}/product/product-detail?id=${c.id}">
                                                                            <div class="product">
                                                                                <div class="product-img">
                                                                                    <img src="${c.imageProduct[0].img}" alt="">
                                                                                    <div class="product-label">
                                                                                        <c:if test="${c.quantity <= 0}">
                                                                                            <span class="new">Sold</span>
                                                                                        </c:if>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="product-body">
                                                                                    <p class="product-category">${c.subCategorys[0].name}</p>
                                                                                    <h3 class="product-name"><a href="#">${c.name}</a></h3>
                                                                                    <h4 class="product-price">${c.price} </h4>
                                                                                    <div class="product-rating">
                                                                                        <i class="fa fa-star"></i>
                                                                                        <i class="fa fa-star"></i>
                                                                                        <i class="fa fa-star"></i>
                                                                                        <i class="fa fa-star"></i>
                                                                                        <i class="fa fa-star"></i>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="add-to-cart">
                                                                                    
                                                                                    <c:if test="${c.quantity >  0}">
                                                                                         <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to
                                                                                        cart</button>
                                                                                        
                                                                                    </c:if>
                                                                                   
                                                                                </div>
                                                                            </div>
                                                                            <a>
                                                                                </div>

                                                                                <!-- /product -->
                                                                            </c:forEach>
                                                                        </c:if>
                                                                        <c:if test="${requestScope.search!=null}">
                                                                            <c:forEach items="${requestScope.listSearch}" var="c">
                                                                                <!-- product -->
                                                                                <div class="col-md-4 col-xs-6 <c:if test="${c.quantity <= 0}">transparent</c:if>">
                                                                                    <a href="${path}/product/product-detail?id=${c.id}">
                                                                                        <div class="product">
                                                                                            <div class="product-img">
                                                                                                <img src="${c.imageProduct[0].img}" alt="">
                                                                                                <div class="product-label">
                                                                                                    <c:if test="${c.quantity <= 0}">
                                                                                                        <span class="new">Sold</span>
                                                                                                    </c:if>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="product-body">
                                                                                                <p class="product-category">${c.subCategorys[0].name}</p>
                                                                                                <h3 class="product-name"><a href="#">${c.name}</a></h3>
                                                                                                <h4 class="product-price">${c.price} </h4>
                                                                                                <div class="product-rating">
                                                                                                    <i class="fa fa-star"></i>
                                                                                                    <i class="fa fa-star"></i>
                                                                                                    <i class="fa fa-star"></i>
                                                                                                    <i class="fa fa-star"></i>
                                                                                                    <i class="fa fa-star"></i>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="add-to-cart">
                                                                                                <c:if test="${c.quantity >  0}">
                                                                                                    
                                                                                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to
                                                                                                        cart</button>
                                                                                                </c:if>
                                                                                                
                                                                                            </div>
                                                                                        </div>
                                                                                        <a>
                                                                                            </div>

                                                                                            <!-- /product -->
                                                                                        </c:forEach>
                                                                                    </c:if>
                                                                                    <c:if test="${requestScope.listFilter.size()==0}">
                                                                                        NO PRODUCT
                                                                                    </c:if>



                                                                                    </div>



                                                                                    <!-- /store products -->

                                                                                    <!-- store bottom filter -->
                                                                                    <c:if test="${requestScope.colorFilter==null}">
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
                                                                                                        <li><a class="${i==requestScope.page ?"activePaging":""}"href="store?cid=${requestScope.cid}&page=${i}">${i+1}</a></li> 
                                                                                                        </c:forEach>    
                                                                                                    </c:if>
                                                                                                    <c:if test="${requestScope.cid!=0 && (requestScope.sid==0 || requestScope.sid==null)}">
                                                                                                        <c:forEach begin="${0}" end="${requestScope.numCate-1}" var="i" >
                                                                                                        <li><a class="${i==requestScope.page ?"activePaging":""}"href="store?cid=${requestScope.cid}&page=${i}">${i+1}</a></li> 
                                                                                                        </c:forEach>    
                                                                                                    </c:if>
                                                                                            </ul>
                                                                                        </div>
                                                                                    </c:if>
                                                                                    </div>
                                                                                    <!-- /store bottom filter -->
                                                                                    </div>
                                                                                    <!-- /STORE -->
                                                                                    </div>
                                                                                    <!-- /row -->
                                                                                    </div>
                                                                                    <!-- /container -->
                                                                                    </div>
                                                                                    <!-- /SECTION -->
                                                                                    <!-- FOOTER -->
                                                                                    <!-- FOOTER -->
                                                                                    <jsp:include page="/views/elements/footer.jsp"/>
                                                                                    <!-- /FOOTER -->


                                                                                    <jsp:include page="/views/elements/baseJs.jsp" />
                                                                                    <!-- /FOOTER -->
                                                                                    <script>
                                                                                        function changeCategory() {
                                                                                            document.getElementById("f1").submit();
                                                                                        }
                                                                                        function changePrice() {
                                                                                            document.getElementById("f2").submit();
                                                                                        }
                                                                                        function filterColor() {
                                                                                            document.getElementById("f3").submit();
                                                                                        }
                                                                                    </script>
                                                                                    </html>