<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="partial/topbar.jsp">
    <jsp:param name="title"  value="AdminHome" />
</jsp:include>

<link rel="stylesheet" href="/resources/css/basket.css">

<jsp:include page="partial/headClose.jsp">
    <jsp:param name="title" value="myCart" />
</jsp:include>



<div class="container-fluid">
    <div class="row">


        <jsp:include page="partial/sidebar.jsp">
            <jsp:param name="title" value="Main title" />
        </jsp:include>


        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">

            <div class="row">

                    <div class="cart_section">
                        <div class="container-fluid" style="margin-top: -50px;">
                            <div class="row">
                                <div class="col-lg-10 offset-lg-1">
                                    <div class="cart_container">
                                        <div class="cart_title">Shopping Cart<small> <b class="ml-3"> (  ${fn:length(basketProducts)} products in your cart )</b> </small></div>
                                        <div class="cart_items mt-4">
                                            <ul class="cart_list">
                                                <c:forEach items="${basketProducts}" var="product">
                                                    <li class="cart_item clearfix">
                                                        <div class="cart_item_image"><img src="/resources/img/${product.photoUrl}" alt=""></div>
                                                        <div class="cart_item_info d-flex flex-md-row flex-column justify-content-between">

                                                            <div class="cart_item_name cart_info_col">
                                                                <div class="cart_item_title">Product Name</div>
                                                                <div class="cart_item_text">${product.name}</div>
                                                            </div>

                                                            <div class="cart_item_total cart_info_col">
                                                                <div class="cart_item_title">Product Brand</div>
                                                                <div class="cart_item_text text-left">${product.brand} </div>
                                                            </div>

                                                            <div class="cart_item_total cart_info_col">
                                                                <div class="cart_item_title">Product Price</div>
                                                                <div class="cart_item_text">${product.price} &#x20BA;</div>
                                                            </div>

                                                            <div class="cart_item_total cart_info_col">
                                                                <a href="/user/deleteItem/${product.id}" class="cart_item_title text-danger">Remove</a>
                                                            </div>

                                                        </div>
                                                    </li>
                                                </c:forEach>
                                            </ul>
                                        </div>
                                        <div class="order_total">
                                            <div class="order_total_content text-md-right">
                                                <div class="order_total_title">Order Total :</div>
                                                <div class="order_total_amount"><b>${totalPrice} &#x20BA;</b></div>
                                            </div>
                                        </div>
                                        <c:if test="${not empty basketProducts}">
                                            <div class="cart_buttons">

                                                <a href="/user/destroy" type="button" class="button cart_button_clear">Delete Cart</a>
                                                <a href="/user/sellProduct" type="button" class="button cart_button_checkout">Confirm Order</a> </div>
                                        </c:if>



                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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