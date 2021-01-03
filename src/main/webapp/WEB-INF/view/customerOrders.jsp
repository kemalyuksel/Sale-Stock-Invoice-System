<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<jsp:include page="partial/topbar.jsp">
    <jsp:param name="title"  value="Orders" />
</jsp:include>


<jsp:include page="partial/headClose.jsp">
    <jsp:param name="title" value="myCart" />
</jsp:include>



<div class="container-fluid">
    <div class="row">


        <jsp:include page="partial/sidebar.jsp">
            <jsp:param name="title" value="Main title" />
        </jsp:include>


        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                <h1 class="lead">Orders</h1>
            </div>

            <div class="row">

                <div class="col-md-12">
                    <table class="table ">
                        <thead class="thead-dark">
                        <tr>
                            <th>Customer</th>
                            <th>Customer FullName</th>
                            <th>Invoice No</th>
                            <th>Products</th>
                            <th>Total Price</th>
                            <th>Options</th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach items="${orders}" var="order">
                            <tr>
                                <td><img src="/resources/img/customers/${order.user.photoUrl}" width="50" height="50" alt=""></td>
                                <td>${order.user.name} ${order.user.surname}</td>
                                <td>#${order.billNo}</td>
                                <td>
                                    <c:forEach items="${order.products}" var="product">
                                        ${product.brand}  ${product.name} |
                                    </c:forEach>
                                </td>
                                <td> ${order.totalPrice} &#x20BA;</td>
                                <td><a href="/user/invoice/${order.id}">Browse Invoice</a></td>

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

<script>
    $('#myModal').on('shown.bs.modal', function () {
        $('#myInput').trigger('focus')
    })
</script>


</body>
</html>