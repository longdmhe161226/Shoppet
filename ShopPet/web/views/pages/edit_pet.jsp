<%-- 
    Document   : admin_productList
    Created on : Mar 4, 2023, 11:55:16 PM
    Author     : khuat
--%>

<%-- 
    Document   : admin_profile
    Created on : Mar 4, 2023, 11:51:32 PM
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
        <title>Add Pet</title>
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
                                        <form action="./updatePet" method="post" 
                                              
                                              class="form-horizontal">
                                            <input style="display:none" value="${requestScope.id}" name="id" />
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="text-input" class=" form-control-label">Name
                                                        Pet</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="text-input" name="name" value="${p.name}"
                                                           placeholder="Enter Name" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="email-input" class=" form-control-label">Code
                                                        Pet</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="email-input" name="code" value="${p.code}"
                                                           placeholder="Enter Code" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="password-input"
                                                           class=" form-control-label">Price</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="password-input" name="price" value="${p.price}"
                                                           placeholder="Enter price" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="password-input"
                                                           class=" form-control-label">Quantity</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="number" id="password-input" name="quantity" value="${p.quantity}"
                                                           placeholder="Enter quantity" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="password-input" class=" form-control-label">Date Of
                                                        Birth</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="date" id="password-input" name="dob" value="${p.getPet().get(0).getDob()}"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="password-input"
                                                           class=" form-control-label">Origin</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="password-input"
                                                           placeholder="Enter Origin" name="origin" value="${p.getOrigin().get(0).getRegion()}"
                                                           class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="password-input" class=" form-control-label">Health
                                                        Status</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="password-input" name="healthStatus" value="${p.getPet().get(0).getHealthStatus()}"
                                                           placeholder="Enter Health" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Gender</label>
                                                </div>
                                                <div class="col col-md-9">
                                                    <div class="">
                                                        <label for="inline-radio1" class="form-check-label ">
                                                            <input type="radio" id="inline-radio1" name="gender"  ${p.getPet().get(0).isGender()==true?'checked':''}
                                                                   value="1" class="form-check-input">Male
                                                        </label>
                                                        <label for="inline-radio2" class="form-check-label ">
                                                            <input type="radio" id="inline-radio2" name="gender" ${p.getPet().get(0).isGender()==false?'checked':''}
                                                                   value="0" class="form-check-input">Female
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="password-input" class=" form-control-label">Weight
                                                    </label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="password-input" name="weight" value="${p.getPet().get(0).getWeight()}"
                                                           placeholder="Enter Weight" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="password-input" class=" form-control-label">Color
                                                    </label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="password-input" name="color" value="${p.getPet().get(0).getColor()}"
                                                           placeholder="Enter Color" class="form-control">
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Vaccinated</label>
                                                </div>
                                                <div class="col col-md-9">
                                                    <div class="">
                                                        <label class="form-check-label ">
                                                            <input type="radio" id="inline-radio1" name="vaccinated" ${p.getPet().get(0).isVaccinated()==true?'checked':''}
                                                                   value="1" class="form-check-input">
                                                            Yes
                                                        </label>

                                                        <label class="form-check-label ">

                                                            <input type="radio" id="inline-radio2" name="vaccinated" ${p.getPet().get(0).isVaccinated()==false?'checked':''}
                                                                   value="0" class="form-check-input">
                                                            No
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="password-input" class=" form-control-label">Identify
                                                    </label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <input type="text" id="password-input" name="identification" value="${p.getPet().get(0).getIdentification()}"
                                                           placeholder="Enter Identify" class="form-control">
                                                </div>
                                            </div>

                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="textarea-input"
                                                           class=" form-control-label">Description</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <textarea name="description" id="textarea-input" rows="9"
                                                              placeholder="Description..."
                                                              class="form-control">${p.getDescription()}</textarea>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label class=" form-control-label">Category</label>
                                                </div>
                                                <div class="col col-md-9">
                                                    <div>
                                                        <label  class="form-check-label ">
                                                            <input disabled=true type="radio"  onChange="changeCategory()"  name="category" ${p.getSubCategorys().get(0).getCategories().get(0).getId()==1 ?"checked":""}
                                                                   value="1" class="form-check-input">Dog
                                                        </label>
                                                        <label   class="form-check-label ">
                                                            <input disabled=true type="radio" onChange="changeCategory()"  name="category" ${p.getSubCategorys().get(0).getCategories().get(0).getId()==2 ?"checked":""}
                                                                   value="2" class="form-check-input">Cat
                                                        </label>

                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row form-group">
                                                <div class="col col-md-3">
                                                    <label for="select"
                                                           class=" form-control-label">SubCategory</label>
                                                </div>
                                                <div class="col-12 col-md-9">
                                                    <c:if test="${p.getSubCategorys().get(0).getCategories().get(0).getId()==1}">
                                                        <select name="subId" id="categoryDog" class="form-control">
                                                            <option value="0">Please select</option>
                                                            <c:forEach items="${requestScope.listSubCategoryDog}" var="c">
                                                                <option  ${p.getSubCategorys().get(0).getId()==c.id?'selected':''} value="${c.id}">${c.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </c:if>
                                                    <c:if test="${p.getSubCategorys().get(0).getCategories().get(0).getId()==2}">
                                                        <select  name="subId" id="categoryCat" class="form-control">
                                                            <option value="0">Please select</option>
                                                            <c:forEach items="${requestScope.listSubCategoryCat}" var="c">
                                                                <option  ${p.getSubCategorys().get(0).getId()==c.id? 'selected':''} value="${c.id}">${c.name}</option>
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
                                                           value="${p.getImageProduct().get(0).getImg()}"
                                                           class="form-control-file">
                                                </div>
                                            </div>
                                            <div class="card-footer d-flex justify-content-end">
                                                <button type="submit" class="btn btn-primary btn-lg">
                                                    <i class="fa fa-dot-circle-o"></i> Submit
                                                </button>
                                                <button style="margin-left:20px" type="reset" class="btn btn-danger btn-lg">
                                                    <i class="fa fa-ban"></i> Reset
                                                </button>
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

        <script src="${path}/assets/js/jquery.min.js"></script>

        <script src="${path}/assets/js/custom.js"></script>
        
    </body>
</html>
