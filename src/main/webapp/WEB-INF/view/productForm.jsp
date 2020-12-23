<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="en">
<head>
    <title>Add Product</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>

<style>

    .error {color: #ff0f49;list-style-type: circle}

</style>


<form:form class="form mx-auto w-50 mt-5" role="form" autocomplete="off" action="/product/createProductPost"
           modelAttribute="product" method="post" >

    <h5>Add Product</h5>
    <div class="alert alert-danger" role="alert">
        If the item code is available (existing product), it just increases the item quantity.
    </div>
    <a class="float-right" href="/product/products">Return to Products</a>


    <div class="form-group mt-3">
        <label> Product Name:</label>
        <form:input path="name" type="text" class="form-control" placeholder="Name"/>
        <form:errors path="name" cssClass="error" />
    </div>
    <div class="form-group">
        <label> Product Brand:</label>
        <form:input path="brand" type="text" class="form-control"  placeholder="Brand" required=""/>
        <form:errors path="brand" cssClass="error" />
    </div>
    <div class="form-group">
        <label> Product Code :</label>
        <form:input path="code" type="text" class="form-control"  placeholder="Code" required=""/>
        <form:errors path="code" cssClass="error" />
    </div>

    <div class="form-group">
        <label> Product Photo :</label>
        <form:input path="photoUrl" type="text" class="form-control"  placeholder="Photo" required=""/>
        <form:errors path="photoUrl" cssClass="error" />
    </div>

    <div class="form-group">
        <label> Product Description :</label>
        <form:input path="description" type="text" class="form-control"  placeholder="Description" required=""/>
        <form:errors path="description" cssClass="error" />
    </div>

    <div class="form-group">
        <label> Product Price :</label>
        <form:input  path="price" type="text" class="form-control"  placeholder="Price" required=""/>
        <form:errors path="price" cssClass="error" />
    </div>

    <div class="form-group">
        <button type="submit" class="btn btn-success btn-sm float-right">Add Product</button>
    </div>
</form:form>


<jsp:include page="partial/footer.jsp">
    <jsp:param name="title" value="Main title" />
</jsp:include>
</body>
</html>