<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/invoice.css">
    <title>Invoice #${bill.billNo}</title>
</head>
<body>


               <div class="m-3"> <a href="/" >Return to Shop</a></div>
                <div class="invoice-box mt-2">
                    <table cellpadding="0" cellspacing="0">
                        <tr class="top">
                            <td colspan="2">
                                <table>
                                    <tr>
                                        <td class="title">
                                            <img src="/resources/img/icon.jpg" style="width:50%; max-width:300px;">
                                        </td>
                                        <td>
                                            Invoice Number: # <b>${bill.billNo}</b> <br>
                                            Created Date: <fmt:formatDate type = "both" timeZone="GMT-8" value = "${bill.created}" /> <br>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr class="information">
                            <td colspan="2">
                                <table>
                                    <tr>
                                        <td>
                                            ${bill.user.address}<br>
                                        </td>
                                        <td>

                                            <b>${bill.user.name} ${bill.user.surname}</b><br>
                                                <b>Phone : </b>${bill.user.phoneNo} <br>
                                            <b>Email :</b> ${bill.user.mail}
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr class="heading">
                            <td>
                                Payment Method
                            </td>
                            <td>
                                Cash #
                            </td>
                        </tr>
                        <tr class="details">
                            <td>
                                Cash
                            </td>
                            <td>
                                ${bill.totalPrice} &#8378;
                            </td>
                        </tr>
                        <tr class="heading">
                            <td>
                                Products
                            </td>
                            <td>
                                Price
                            </td>
                        </tr>

                        <c:if test="${bill.products != null}">
                            <c:forEach items="${bill.products}" var="product">
                                <tr class="item">
                                    <td>
                                        <b class="mr-2">#${product.code}</b>  ${product.brand} ${product.name}
                                    </td>
                                    <td>
                                            ${product.price} &#8378;
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>



                        <tr class="total">
                            <td></td>
                            <td>
                                Total: ${bill.totalPrice} &#8378;
                            </td>
                        </tr>
                    </table>
                </div>













<jsp:include page="partial/footer.jsp">
    <jsp:param name="title" value="Main title" />
</jsp:include>

</body>
</html>