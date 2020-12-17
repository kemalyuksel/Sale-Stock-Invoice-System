<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>




<c:if test="${pageContext.request.userPrincipal.name eq 'admin'}">
    <nav class="col-md-2 d-none d-md-block bg-light sidebar">
        <div class="sidebar-sticky">
            <ul class="nav flex-column">
                <li class="nav-item">
                    <a class="nav-link active" href="/">
                        <span data-feather="home"></span>
                        Anasayfa <span class="sr-only">(current)</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/product/products">
                        <span data-feather="layers"></span>
                        Stoklar
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/user/customers">
                        <span data-feather="users"></span>
                        Müşteriler
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/bill/bills">
                        <span data-feather="bar-chart-2"></span>
                        Faturalar
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
            <li class="nav-item">
                <a class="nav-link active" href="/">
                    <span data-feather="home"></span>
                    Anasayfa <span class="sr-only">(current)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/orderList/">
                    <span data-feather="shopping-cart"></span>
                    Siparişlerim
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/user/myBasket/">
                    <span data-feather="shopping-cart"></span>
                    Sepetim
                </a>
            </li>

        </ul>

    </div>
</nav>
</c:if>



