<%-- 
    Document   : blank
    Created on : Feb 22, 2023, 11:14:23 AM
    Author     : ADMIN
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>Blank Template</title>

        <!--public link-->
        <jsp:include page="/views/elements/baseCss.jsp"/>
        
        <!--Privtate link-->
        <link type="text/css" rel="stylesheet" href="css/cart.css" />

</head>

<body>
	<!-- HEADER -->
        <jsp:include page="/views/elements/header.jsp"/>
	<!-- /HEADER -->

	<!-- NAVIGATION -->
        <jsp:include page="/views/elements/navigation.jsp"></jsp:include>
	<!-- /NAVIGATION -->

	<!-- BREADCRUMB -->
        <jsp:include page="/views/elements/breadcrumb.jsp"/>
	<!-- /BREADCRUMB -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
                            
                            content here
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	

	<!-- FOOTER -->
        <jsp:include page="/views/elements/footer.jsp"/>
	<!-- /FOOTER -->

        <jsp:include page="/views/elements/baseJs.jsp" />

</body>

</html>
