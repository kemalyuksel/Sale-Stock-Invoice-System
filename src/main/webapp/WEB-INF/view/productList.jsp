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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" rel="stylesheet" type="text/css" />
    <title>Products</title>
</head>
<body>

<nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0">
    <a class="navbar-brand col-sm-3 col-md-2 mr-0 text-center lead" href="#">Stock / Sale / Invoice System</a>

    <form>
        <input class="form-control form-control-dark w-100"
               type="text" name="q" id="keyword" size="500" value="${q}" required placeholder="Search">
    </form>

    <ul class="navbar-nav px-3">
        <li class="nav-item text-nowrap">
            <a class="nav-link lead" href="/logout">Logout</a>
        </li>
    </ul>
</nav>


<div class="container-fluid">
    <div class="row">


        <jsp:include page="partial/sidebar.jsp">
            <jsp:param name="title" value="Main title" />
        </jsp:include>


        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                <h1 class="lead">Products</h1>
            </div>

            <a href="/product/addProduct" class="btn btn-success btn-sm mb-2"> <i class="fa fa-plus"></i>&nbsp;Add Product</a>

            <div class="row">
                <div class="col-md-12">
                    <table class="table ">
                        <thead class="thead-dark">
                        <tr>
                            <th>Product</th>
                            <th>ProductName</th>
                            <th>ProductCode</th>
                            <th>ProductBrand</th>
                            <th>ProductPrice</th>
                            <th>ProductStock</th>
                            <th>Options</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${products}" var="product">
                        <tr>
                            <td><img src="/resources/img/${product.photoUrl}" width="50" height="50" alt=""></td>
                            <td>${product.name}</td>
                            <td> #${product.code}</td>
                            <td><strong>${product.brand}</strong></td>
                            <td> ${product.price} &#8378;</td>


                            <c:if test="${product.quantity >= 10}">
                                <td><span class="badge p-1" style="background-color: #007F00;color: white"> ${product.quantity} </span></td>
                            </c:if>
                            <c:if test="${product.quantity < 10}">
                                <td><span class="badge badge-danger p-1"> ${product.quantity} </span></td>
                            </c:if>



                            <td>
                                <div class="btn-group" role="group" aria-label="Basic example">
                                    <a href="/product/updateProduct/${product.id}"  type="button" class="btn btn-info btn-sm"><i class="fa fa-edit"></i></a>
                                    <a href="/product/deleteAll/${product.id}" class="btn btn-danger btn-sm "><i class="fa fa-trash"></i></a>
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