<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <title>Update Product</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>



<form:form class="form mx-auto w-50 mb-5 mt-5" role="form" autocomplete="off" action="/product/updateProductPost/${updatedProduct.id}"
           modelAttribute="updatedProduct" method="post" >


    <div style="margin-top: -30px;">
        <img src="/resources/img/${updatedProduct.photoUrl}" class="rounded mx-auto d-block " width="175" height="175" alt="">
        <h5 class="text-center mt-3 "> ${updatedProduct.brand} ${updatedProduct.name} </h5>
        <hr>
    </div>

    <a class="float-right" href="/product/products">Return to Products</a>
    <h5>Update Product</h5>
    <div class="form-group">
        <label > Id :</label>
        <form:input path="id" disabled="true" type="text" class="form-control" />
    </div>
    <div class="form-group">
        <label > Product Name:</label>
        <form:input path="name" type="text" class="form-control" placeholder="Name"/>
    </div>
    <div class="form-group">
        <label> Product Brand:</label>
        <form:input path="brand" type="text" class="form-control"  placeholder="Brand" required=""/>
    </div>
    <div class="form-group">
        <label> Product Code :</label>
        <form:input path="code" type="text" class="form-control"  placeholder="Code" required=""/>
    </div>

    <div class="form-group">
        <label> Product Photo :</label>
        <form:input path="photoUrl" type="text" class="form-control"  placeholder="Photo" required=""/>
    </div>


    <div class="form-group">
        <label> Product Description :</label>
        <form:input path="description" type="text" class="form-control"  placeholder="Description" required=""/>
    </div>

    <div class="form-group">
        <label> Product Price :</label>
        <form:input path="price" type="text" class="form-control"  placeholder="Price" required=""/>
    </div>


    <div class="form-group">
        <label> Product Quantity :</label>
        <form:input path="quantity" type="text" class="form-control"  placeholder="Quantity" required=""/>
    </div>

    <div class="form-group">
        <button type="submit" class="btn btn-success btn-sm float-right">Update Product</button>
    </div>
</form:form>


<jsp:include page="partial/footer.jsp">
    <jsp:param name="title" value="Main title" />
</jsp:include>
</body>
</html>