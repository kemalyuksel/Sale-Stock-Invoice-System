<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<jsp:include page="partial/topbar.jsp">
    <jsp:param name="title"  value="Customers" />
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
                <h1 class="lead">Customers</h1>
            </div>

            <div class="row">

                <div class="col-md-12">
                    <table class="table ">
                        <thead class="thead-dark">
                        <tr>
                            <th>Customer</th>
                            <th>Customer FullName</th>
                            <th>Customer Username</th>
                            <th>Customer No</th>
                            <th>Customer Address</th>
                            <th>Customer Role</th>
                            <th>Customer Orders</th>
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
                                <td><a href="/user/customerBills/${customer.id}" class="btn btn-info btn-sm">Browse</a></td>
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