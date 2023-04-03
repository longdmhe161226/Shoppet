<%-- 
    Document   : profile
    Created on : Feb 17, 2023, 8:54:53 AM
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
        <title>Profile</title>
        <style>
            body {
                background-color: #f2f2f2;
            }

            h1 {
                font-size: 28px;
                font-weight: bold;
                color: #333;
                text-align: center;
                margin-top: 30px;
                margin-bottom: 30px;
            }

            table {
                border-collapse: collapse;
                width: 60%;
                margin: 0 auto;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            }

            th, td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            th {
                background-color: #4CAF50;
                color: #fff;
            }

            td {
                font-size: 18px;
                color: #333;
            }

            .btn {
                background-color: #4CAF50;
                color: #fff;
                padding: 10px 15px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin: 20px auto;
                display: block;
                font-size: 16px;
            }

            .btn:hover {
                background-color: #3e8e41;
            }
        </style>
    </head>
    <body>
        <h1>Profile</h1>
        <table>
            <tr>
                <th>First Name</th>
                <td><c:out value="${customer.firstName} ${customer.lastName}" /></td>
            </tr>

            <tr>
                <th>Gender</th>
                <td>
                    <c:choose>
                        <c:when test="${customer.gender}">
                            Male
                        </c:when>
                        <c:otherwise>
                            Female
                        </c:otherwise>
                    </c:choose>
            </tr>
            <tr>
                <th>Address</th>
                <td>

                    <c:out value="${customer.address}" /></td>
            </tr>
            <tr>
                <th>Date of Birth</th>
                <td><fmt:formatDate value="${customer.birthOfDate}" pattern="dd/MM/yyyy" /></td>
            </tr>
            <tr>
                <th>Phone</th>
                <td><c:out value="${customer.phone}" /></td>
            </tr>
            <tr>
                <th>Create At</th>
                <td><fmt:formatDate value="${customer.getAccount().created_at}" pattern="dd/MM/yyyy" /></td>
            </tr>
        </table>
        <a href="${path}/customer/change-profile" class="btn">Edit Info</a>
        <a href="${path}/order/history" class="btn">View Your Order</a>
    </body>
</html>

