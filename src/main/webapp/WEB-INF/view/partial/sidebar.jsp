<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>




<c:if test="${pageContext.request.userPrincipal.name eq 'admin'}">
    <nav class="col-md-2 d-none d-md-block bg-light sidebar">
        <div class="sidebar-sticky">
            <ul class="nav flex-column">

                <h5 class="text-center"><i class="fas fa-user"></i> <sec:authentication property="principal.username"/></h5>

                <li class="nav-item">
                    <a class="nav-link" href="/admin/adminHome">
                        <span data-feather="home"></span>
                        Home
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/">
                        <span data-feather="shopping-bag"></span>
                        Store
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/product/products">
                        <span data-feather="layers"></span>
                        Stocks
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/customers">
                        <span data-feather="users"></span>
                        Customers
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/bill/bills">
                        <span data-feather="bar-chart-2"></span>
                        Bills
                    </a>
                </li>

            </ul>


        </div>
    </nav>

</c:if>

<c:if test="${pageContext.request.userPrincipal.name != 'admin'}">
<nav class="col-md-2 d-none d-md-block bg-light sidebar">
    <div class="sidebar-sticky">
        <ul class="nav flex-column">

            <h5 class="text-center"><i class="fas fa-user"></i> <sec:authentication property="principal.username"/></h5>

            <li class="nav-item">
                <a class="nav-link" href="/">
                    <span data-feather="home"></span>
                    Home
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/orderList/">
                    <span data-feather="shopping-bag"></span>
                    Orders
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/user/myBasket/">
                    <span data-feather="shopping-cart"></span>
                    Cart
                </a>
            </li>

        </ul>

    </div>
</nav>
</c:if>



