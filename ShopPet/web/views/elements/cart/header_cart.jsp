<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : header_cart
    Created on : Feb 12, 2023, 1:46:54 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:set var="cart" value="${sessionScope.shop_pet_cart}" />
<c:set var="cartPrice" value="${sessionScope.shop_pet_cart_totalPrice}" />
<!-- Cart -->
<head>
    <script type="text/javascript"  src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script>

        $(document).ready(function () {
        <c:if test="${sessionScope.oldCart!=null}">

        </c:if>
        <c:if test="${cart==null}">
            $.ajax({
                url: '${path}/cart',
                method: 'GET',
                success: function (data, textStatus, jqXHR) {

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("get cart status: " + JSON.stringify(textStatus) + "\n" + jqXHR.toString() + "\n\n" + errorThrown.toString());
                },
                complete: function (jqXHR, textStatus) {
//                    alert(JSON.stringify (jqXHR) + "\n\n" + JSON.stringify(textStatus));
                    location.reload();
                }
            })
        </c:if>

        }
        )

        function saveCart() {

            if (confirm('do you want to save your local Cart?')) {
                $.ajax({
                    url: '${path}/cart/local/save',
                    method: 'GET',
                    success: function (data, textStatus, jqXHR) {
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("get cart status: " + JSON.stringify(textStatus) + "\n" + jqXHR.toString() + "\n\n" + errorThrown.toString());
                    },
                    complete: function (jqXHR, textStatus) {
//                    alert(JSON.stringify (jqXHR) + "\n\n" + JSON.stringify(textStatus));
                    }
                });
            }
        }

        function addCart(product, quantity) {
            $.ajax({
                url: '${path}/cart/add',
                method: 'GET',
                data: {
                    product_id: product,
                    quantity: quantity
                },
                success: function (data, textStatus, jqXHR) {
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("get cart status: " + JSON.stringify(textStatus) + "\n" + jqXHR.toString() + "\n\n" + errorThrown.toString());
                },
                complete: function (jqXHR, textStatus) {
//                    alert(JSON.stringify (jqXHR) + "\n\n" + JSON.stringify(textStatus));
                }
            })

        }

        function clearCart(product) {
            $.ajax({
                url: '${path}/cart/clear',
                method: 'GET',
                data: {
                    product_id: product,
                },
                beforeSend: function (xhr) {
                    return confirm("do you want to delete item " + product)
                },
                success: function (data, textStatus, jqXHR) {

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("get cart status: " + JSON.stringify(textStatus) + "\n" + jqXHR.toString() + "\n\n" + errorThrown.toString());
                },
                complete: function (jqXHR, textStatus) {
//                    alert(JSON.stringify (jqXHR) + "\n\n" + JSON.stringify(textStatus));
                    location.reload();
                }
            })

        }
    </script>
</head>
<div class="dropdown">
    <a href="" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
        <i class="fa fa-shopping-cart"></i>
        <span>Your Cart</span>
        <c:if test="${cart.items.size()>0}">
            <div class="qty">${cart.items.size()}</div>    
        </c:if>

    </a>

    <div class="cart-dropdown">
        <div class="cart-list">
            <c:forEach var="item" items="${cart.items}">
                <div class="product-widget">
                    <div class="product-img">
                        <img src="${item.product.imageProduct[0].img}" onerror="()=>{this.src = '${path}/assets/img/product02.png}';" alt="">
                    </div>
                    <div class="product-body">
                        <h3 class="product-name"><a href="${path}/product/product-detail?id=${item.product.id}">${item.product.name}</a></h3>
                        <h4 class="product-price"><span class="qty">${item.quantity}x</span>${item.product.price}</h4>
                    </div>
                    <button class="delete" onclick="clearCart('${item.product.id}')"><i class="fa fa-close"></i></button>
                </div>
            </c:forEach>
            <div class="cart-summary">
                <small>${cart.items.size()} Item(s) selected</small>
                <h5>SUBTOTAL: $${cartPrice}</h5>
            </div>
            <div class="cart-btns">
                <a href="${path}/cart">View Cart</a>
                <a href="${path}/checkout">Checkout <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>
    </div>

    <!-- /Cart -->
