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
                <h1 class="lead">Müşteriler</h1>
            </div>

            <div class="row">

                <div class="col-md-12">
                    <table class="table ">
                        <thead class="thead-dark">
                        <tr>
                            <th>Müşteri</th>
                            <th>Müşteri Ad Soyad</th>
                            <th>Müşteri Kullanıcı Ad</th>
                            <th>Müşteri No</th>
                            <th>Müşteri Adres</th>
                            <th>Müşteri Rol</th>
                            <th>Müşteri Siparişler</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${customers}" var="customer">
                            <tr>
                                <td><img src="/resources/img/customers/${customer.photoUrl}" width="50" height="50" alt=""></td>
                                <td><strong>${customer.name} ${customer.surname}</strong> </td>
                                <td>${customer.username}</td>
                                <td>${customer.phoneNo}</td>
                                <td>${customer.address}</td>
                                <td>${customer.role.name}</td>
                                <td><a href="/user/customerBills/${customer.id}" class="btn btn-info btn-sm">GÖZAT</a></td>
                                <td></td>
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