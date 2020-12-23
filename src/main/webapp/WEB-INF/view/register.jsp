<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="/resources/css/login.css">
    <title>Register</title>
</head>
<body>

<style>

    .error {color: #ff0f49;list-style-type: circle}

</style>


<div class="sidenav">
    <div class="login-main-text">
        <h2 class="text-center title" >Stock/Sale/Invoice System</h2>
        <img src="/resources/img/logo.png" alt="">
    </div>
</div>
<div class="main">
    <div class="col-md-6 col-sm-12">
        <div class="login-form">


            <form:form id="form" method="post" action="/auth/register" modelAttribute="user" >

                <div class="form-group">
                    <label for="username">Username</label>
                    <form:input class="form-control" path="username"  placeholder="Username" id="username" />
                    <form:errors path="username" cssClass="error"/>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <form:password class="form-control" path="password" placeholder="Password" id="password" />
                    <form:errors path="password" cssClass="error" />
                </div>

                <div class="form-group">
                    <label for="username">Name</label>
                    <form:input class="form-control" path="name"  placeholder="Name" id="name" />
                    <form:errors path="name"  cssClass="error"/>
                </div>

                <div class="form-group">
                    <label for="password">Surname</label>
                    <form:input class="form-control" path="surname" placeholder="Surname" id="surname" />
                    <form:errors path="surname" cssClass="error"/>
                </div>

                <div class="form-group">
                    <label for="username">Address</label>
                    <form:input class="form-control" path="address"  placeholder="Address" id="address" />
                    <form:errors path="address" cssClass="error"/>
                </div>

                <div class="form-group">
                    <label for="password">Phone</label>
                    <form:input class="form-control" path="phoneNo" placeholder="Phone" id="phoneNo" />
                    <form:errors path="phoneNo" cssClass="error" />
                </div>

                <div class="form-group">
                    <label for="mail">Mail</label>
                    <form:input class="form-control"  path="mail" placeholder="user@gmail.com" id="mail" />
                    <form:errors path="mail" cssClass="error"/>
                </div>

                <button type="submit" class="btn btn-success">Submit</button>
                <a href="/auth/login" class="btn btn-info">Login</a>

            </form:form>




        </div>
    </div>
</div>







</body>
</html>