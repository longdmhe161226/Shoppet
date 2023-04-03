<%-- 
    Document   : navigation
    Created on : Feb 22, 2023, 10:59:28 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="categories" value="${sessionScope.categories}" />
<c:set var="url" value="${pageContext.request.requestURL}" />
<!-- NAVIGATION -->
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li <c:if test="${fn:containsIgnoreCase(url,'home')}">
                            class="active"
                        </c:if>
                            ><a href="${path}/home">HOME</a>
                </li>
                <li <c:if test="${fn:containsIgnoreCase(url,'store') && param.cid==null}">
                            class="active"
                        </c:if>
                            ><a href="${path}/store">STORE</a>
                </li>
                
                    <c:forEach items="${categories}" var="c">
                    <li 
                        <c:if test="${c.id == param.cid}">
                            class="active"
                        </c:if>
                        ><a href="${path}/store?cid=${c.id}">${c.name.toUpperCase()}</a></li>
                    </c:forEach>
            </ul>
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->