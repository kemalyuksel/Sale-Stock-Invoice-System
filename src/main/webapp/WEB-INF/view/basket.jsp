<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/dashbord.css">
    <link rel="stylesheet" href="/resources/css/basket.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css" rel="stylesheet" type="text/css" />
    <title>myCart</title>
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