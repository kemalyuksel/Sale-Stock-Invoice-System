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
                <h1 class="lead">Sepetim</h1>
            </div>
           <h5>Sepet Tutarı : ${totalPrice} &#x20BA;</h5>
            <div class="row">
                <c:forEach items="${basketProducts}" var="product">
                    <div class="col-md-3">
                        <div class="card m-2 shadow-sm p-2" style="width: 18rem;border: none;">
                            <img class="card-img-top" src="/resources/img/${product.photoUrl}" width="150" height="250" alt="Card image cap">
                            <div class="card-body">
                                <h5 class="card-title">${product.brand} ${product.name}</h5>
                                <h5 class="float-right">${product.price} &#x20BA;</h5>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <c:if test="${not empty basketProducts}">

            <div class="float-left mt-5">
                <a href="/user/destroy" class="btn btn-warning">Sepeti Boşalt</a>
                <a href="/user/sellProduct" class="btn btn-success">Sepeti Onayla</a>
            </div>
            </c:if>
    </div>
    </main>
</div>
</div>







<jsp:include page="partial/footer.jsp">
    <jsp:param name="title" value="Main title" />
</jsp:include>

</body>
</html>