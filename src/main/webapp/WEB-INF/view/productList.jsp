<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/dashbord.css">
    <title>Document</title>
</head>
<body>

<jsp:include page="partial/topbar.jsp">
    <jsp:param name="title" value="Main title" />
</jsp:include>


<div class="container-fluid">
    <div class="row">


        <jsp:include page="partial/sidebar.jsp">
            <jsp:param name="title" value="Main title" />
        </jsp:include>


        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                <h1 class="lead">Ürünler</h1>
                <a href="/product/addProduct" class="btn btn-success btn-sm">Yeni Ürün Ekle</a>
            </div>

            <div class="row">

                <div class="col-md-12">
                    <table class="table ">
                        <thead class="thead-dark">
                        <tr>
                            <th>Ürün</th>
                            <th>Ürün Adı</th>
                            <th>Ürün Kodu</th>
                            <th>Ürün Marka</th>
                            <th>Ürü Fiyat</th>
                            <th>Ürün Stok</th>
                            <th>İşlem</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${products}" var="product">
                        <tr>
                            <td><img src="/resources/img/${product.photoUrl}" width="50" height="50" alt=""></td>
                            <td>${product.name}</td>
                            <td> #${product.code}</td>
                            <td><strong>${product.brand}</strong></td>
                            <td> ${product.price} TL</td>

                            <c:if test="${product.quantity == 0}">
                                <td><span class="badge badge-danger">Stokta Yok</span></td>
                            </c:if>
                            <c:if test="${product.quantity > 0}">
                                <td><span class="badge badge-success"> ${product.quantity} </span></td>
                            </c:if>



                            <td  style="width: 20%">
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <a href="/product/updateProduct/${product.id}"  type="button" class="btn btn-info btn-sm">Güncelle</a>
                                    <a href="/product/delete/${product.id}" type="button" class="btn btn-danger btn-sm">Adet Sil</a>
                                    <a href="/product/deleteAll/${product.id}" type="button" class="btn btn-warning btn-sm text-white">Tümünü Sil</a>
                                </div>
                            </td>
                        </tr>
                        </c:forEach>



                        </tbody>

                    </table>
                </div>



            </div>
        </main>
    </div>
</div>







<jsp:include page="partial/footer.jsp">
    <jsp:param name="title" value="Main title" />
</jsp:include>

</body>
</html>