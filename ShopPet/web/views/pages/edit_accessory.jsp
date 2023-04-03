<%-- 
    Document   : edit_accessory
    Created on : Mar 14, 2023, 10:26:29 AM
    Author     : khuat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${path}/assets/css/style.min.css" rel="stylesheet">
        <title>Edit Accessory</title>
    </head>
    <body>
        <div class="container-fluid">
                    <div class="main-content">
                        <div class="section__content section__content--p30">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-body card-block">
                                                <form action="./updateAccessory" method="post">
                                                    <input style="display:none" value="${requestScope.id}" name="id" />
                                                    <div>
                                                        <div class="row form-group">
                                                            <div class="col col-md-3">
                                                                <label  class=" form-control-label">Name
                                                                    Product</label>
                                                            </div>
                                                            <div class="col-12 col-md-9">
                                                                <input type="text"  value="${p.name}" name="name"
                                                                       placeholder="Enter Name" class="form-control"/>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col col-md-3">
                                                                <label  class=" form-control-label">Code
                                                                    Product</label>
                                                            </div>
                                                            <div class="col-12 col-md-9">
                                                                <input type="text"  value="${p.code}" name="code"
                                                                       placeholder="Enter Code" class="form-control"/>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col col-md-3">
                                                                <label 
                                                                    class=" form-control-label">Price</label>
                                                            </div>
                                                            <div class="col-12 col-md-9">
                                                                <input type="text"  value="${p.price}" name="price"
                                                                       placeholder="Enter price" class="form-control"/>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col col-md-3">
                                                                <label for="password-input"
                                                                       class=" form-control-label">Quantity</label>
                                                            </div>
                                                            <div class="col-12 col-md-9">
                                                                <input type="number"  value="${p.quantity}" name="quantity"
                                                                       placeholder="Enter quantity" class="form-control"/>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col col-md-3">
                                                                <label for="password-input"
                                                                       class=" form-control-label">Origin</label>
                                                            </div>
                                                            <div class="col-12 col-md-9">
                                                                <input type="text" 
                                                                       placeholder="Enter Origin" name="origin" value="${p.getOrigin().get(0).getRegion()}"
                                                                       class="form-control">
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col col-md-3">
                                                                <label for="textarea-input"
                                                                       class=" form-control-label">Description</label>
                                                            </div>
                                                            <div class="col-12 col-md-9">
                                                                <textarea name="description" id="textarea-input" rows="9" 
                                                                          placeholder="Description..." class="form-control">${p.description}</textarea>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col col-md-3">
                                                                <label class=" form-control-label">Category</label>
                                                            </div>
                                                            <div class="col col-md-9">
                                                                <div class="">
                                                                    <label  class="form-check-label ">
                                                                        <input  disabled=true type="radio" ${p.getSubCategorys().get(0).getCategories().get(0).getId()==3 ?"checked":""}   onChange="changeCategory()"  name="category"
                                                                               value="1" class="form-check-input">Accessory
                                                                    </label>
                                                                    <label   class="form-check-label ">
                                                                        <input disabled=true type="radio"  ${p.getSubCategorys().get(0).getCategories().get(0).getId()==4 ?"checked":""} onChange="changeCategory()"  name="category"
                                                                               value="2" class="form-check-input">Food
                                                                    </label>

                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <div class="col col-md-3">
                                                                <label  class=" form-control-label">SubCategory</label>
                                                            </div>
                                                            <div class="col-12 col-md-9">
                                                                <c:if test="${p.getSubCategorys().get(0).getCategories().get(0).getId()==3}"> 
                                                                <select  name="subId" id="categoryAccessory" class="form-control">
                                                                    <option value="0">Please select</option>
                                                                    <c:forEach items="${requestScope.listSubCategoryAccessory}" var="c">
                                                                        <option ${p.getSubCategorys().get(0).getId()==c.id?'selected':''} value="${c.id}">${c.name} </option>
                                                                    </c:forEach>
                                                                </select>
                                                                </c:if>
                                                                <c:if test="${p.getSubCategorys().get(0).getCategories().get(0).getId()==4}">
                                                                <select  name="subId" id="categoryFood" class="form-control">
                                                                    <option value="0">Please select</option>
                                                                    <c:forEach items="${requestScope.listSubCategoryFood}" var="c">
                                                                        <option ${p.getSubCategorys().get(0).getId()==c.id?'selected':''} value="${c.id}">${c.name} </option>
                                                                    </c:forEach>
                                                                </select>
                                                                </c:if>
                                                            </div>
                                                        </div>

                                                        <div class="row form-group">
                                                            <div class="col col-md-3">
                                                                <label for="file-multiple-input"
                                                                       class=" form-control-label">Img Url</label>
                                                            </div>
                                                            <div class="col-12 col-md-9">
                                                                <input type="text" id="file-multiple-input"
                                                                       name="imgUrl" 
                                                                       class="form-control-file" value="${p.getImageProduct().get(0).getImg()}">
                                                            </div>
                                                        </div>
                                                        <div class="card-footer d-flex justify-content-end">
                                                            <button type="submit" class="btn btn-primary btn-lg">
                                                                <i class="fa fa-dot-circle-o"></i> Save
                                                            </button>
                                                            <button style="margin-left:20px" type="reset" class="btn btn-danger btn-lg">
                                                                <i class="fa fa-ban"></i> Reset
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
    </body>
</html>
