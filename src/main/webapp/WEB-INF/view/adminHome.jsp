<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="partial/topbar.jsp">
    <jsp:param name="title"  value="AdminHome" />
</jsp:include>

<link rel="stylesheet" href="/resources/css/store.css">

<jsp:include page="partial/headClose.jsp">
    <jsp:param name="title" value="Main title" />
</jsp:include>


<div class="container-fluid">
    <div class="row">


        <jsp:include page="partial/sidebar.jsp">
            <jsp:param name="title" value="Main title" />
        </jsp:include>


        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">
            <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pb-2 mb-3 border-bottom">
                <h1 class="lead">Home</h1>
            </div>


            <div class="row">
                <div class="col-xl-6 col-md-12">
                    <div class="card overflow-hidden">
                        <div class="card-content " style="background-color: #0e8ce4;color: white">
                            <div class="card-body cleartfix">
                                <div class="media align-items-stretch">
                                    <div class="align-self-center">
                                        <i class="icon-pencil primary font-large-2 mr-2"></i>
                                    </div>
                                    <div class="media-body">
                                        <h4><i class="fa fa-truck" aria-hidden="true"></i> Orders</h4>
                                        <span><a href="/bill/bills" class="text-dark">View orders</a></span>
                                    </div>
                                    <div class="align-self-center">
                                        <h1>${stats.totalOrders}</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-6 col-md-12">
                    <div class="card">
                        <div class="card-content" style="background-color: #0e8ce4;color: white">
                            <div class="card-body cleartfix">
                                <div class="media align-items-stretch">
                                    <div class="align-self-center">
                                        <i class="icon-speech warning font-large-2 mr-2"></i>
                                    </div>
                                    <div class="media-body">
                                        <h4><i class="fa fa-crop" aria-hidden="true"></i> Products</h4>
                                        <span><a href="/product/products" class="text-dark">View Products</a></span>
                                    </div>
                                    <div class="align-self-center">
                                        <h1>${stats.totalProducts}</h1>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row mt-5">

                <div class="col-xl-6 col-md-12">
                    <div class="card">
                        <div class="card-content" style="background-color:#0e8ce4 ;color: white">
                            <div class="card-body cleartfix">
                                <div class="media align-items-stretch">
                                    <div class="align-self-center">
                                        <h4><i class="fa fa-users" aria-hidden="true"></i> Customers</h4>
                                        <span><a href="/user/customers" class="text-dark">View Customers</a></span>
                                    </div>
                                    <div class="media-body">
                                        <h1 class="mr-2 float-right">${stats.totalCustomers}</h1>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="icon-wallet success font-large-2"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-xl-6 col-md-12">
                    <div class="card">
                        <div class="card-content" style="background-color: #007F00;color: white">
                            <div class="card-body cleartfix">
                                <div class="media align-items-stretch">
                                    <div class="align-self-center">
                                        <h4> <i class="fa fa-credit-card" aria-hidden="true"></i> Bank</h4>
                                    </div>
                                    <div class="media-body">
                                        <h1 class="mr-2 float-right">
                                            <fmt:formatNumber type="number" maxFractionDigits="2" value="${stats.totalPrice}"/>
                                            &#8378; </h1>
                                    </div>
                                    <div class="align-self-center">
                                        <i class="icon-heart danger font-large-2"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="alert alert-danger mt-5" role="alert">
               <h5 class="lead">Critical Stocks</h5>
            </div>

            <div class="row">

              <c:forEach items="${stats.criticalProducts}" var="product">
                  <div class="col-md-3">
                      <figure class="card card-product">
                          <div class="img-wrap  mb-2">
                              <span  class="float-right badge badge-primary">
                                  <a class="text-white" href="/product/updateProduct/${product.id}">Update</a>
                              </span>
                              <img src="/resources/img/${product.photoUrl}">
                          </div>
                          <span class="float-right badge badge-warning p-2" style="padding: 5px"> Last ${product.quantity} Product</span>
                          <figcaption class="info-wrap">
                              <h6 class="title text-dots">${product.brand} ${product.name}</h6>
                              <p>${product.description}</p>
                              <div class="action-wrap">
                                  <div class="price-wrap h5">
                                      <span class="price-new">${product.price} &#x20BA;</span>
                                  </div>
                              </div>
                          </figcaption>
                      </figure>
                  </div>
              </c:forEach>


            </div>


        </main>
    </div>
</div>



<jsp:include page="partial/footer.jsp">
    <jsp:param name="title" value="Main title" />
</jsp:include>

</body>
</html>