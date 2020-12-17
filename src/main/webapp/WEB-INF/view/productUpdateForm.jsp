<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <title>Kullanıcı Kayıt Formu</title>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>



<form:form class="form mx-auto w-50 mt-5" role="form" autocomplete="off" action="/product/updateProductPost/${updatedUser.id}"
           modelAttribute="updatedUser" method="post" >

    <h5>Ürün Ekle</h5>
    <a class="float-right" href="/product/products">Ürün Listesine Dön</a>

    <div class="form-group mt-3">
        <label > Id :</label>
        <form:input path="id" disabled="true" type="text" class="form-control" />
    </div>
    <div class="form-group mt-3">
        <label > Adı:</label>
        <form:input path="name" type="text" class="form-control" placeholder="Adı"/>
    </div>
    <div class="form-group">
        <label> Markası:</label>
        <form:input path="brand" type="text" class="form-control"  placeholder="Markası" required=""/>
    </div>
    <div class="form-group">
        <label>Kodu :</label>
        <form:input path="code" type="text" class="form-control"  placeholder="Kodu" required=""/>
    </div>

    <div class="form-group">
        <label>Fotoğraf :</label>
        <form:input path="photoUrl" type="text" class="form-control"  placeholder="Fotoğrafı" required=""/>
    </div>

    <div class="form-group">
        <label>Fiyat :</label>
        <form:input path="price" type="text" class="form-control"  placeholder="Fiyatı" required=""/>
    </div>

    <div class="form-group">
        <label>Adet :</label>
        <form:input path="quantity" type="text" class="form-control"  placeholder="Adeti" required=""/>
    </div>

    <div class="form-group">
        <button type="submit" class="btn btn-success btn-lg float-right">Ekle</button>
    </div>
</form:form>


<jsp:include page="partial/footer.jsp">
    <jsp:param name="title" value="Main title" />
</jsp:include>
</body>
</html>