<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Product</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top no-gutters" style="height: 60px">

    <div class="col-md-auto">
        <img src="${contextPath}/images/logo/java1.jpg" alt="logo" style="width:70px;height: 50px">
    </div>

    <div class="col-md-auto">
        <ul class="nav text-white">
            <li class="nav-item">
                <a class="nav-link text-white" href="${contextPath}/home" data-toggle="tooltip"
                   data-placement="top" title="Back at Home page!">Home</a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle text-white bg-dark" data-toggle="dropdown"
                   href="#">Categories</a>
                <div class="dropdown-menu">
                    <c:forEach items="${categories}" var="category">
                        <a class="dropdown-item"
                           href="${contextPath}/category/page?id=${category.getId()}&pageNum=0&size=2">${category.getName()}</a>
                    </c:forEach>
                </div>
            </li>
            <li class="nav-item ">
                <a class="nav-link text-white" href="">/</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white"
                   href="${contextPath}/category/page?id=${category.getId()}&pageNum=0&size=2"><c:out
                        value="${category.getName()}"/></a>
            </li>

            <li class="nav-item ">
                <a class="nav-link text-white" href="">/</a>
            </li>
            <li class="nav-item">
                <a class="nav-link text-white" href=""><c:out value="${product.getName()}"/> </a>
            </li>
        </ul>
    </div>


    <div class="col-md-auto offset-md-2">
        <form class="form-inline" method="GET" action="/search/filter">
            <input type="hidden" name="size" value="5">
            <input type="hidden" name="pageNum" value="0"/>
            <input class="form-control mr-md-2" id="searchProduct" type="text" placeholder="Search" style="width: 250px" name="search">
            <a href="${contextPath}/search/filter">
                <button id="sub" class="btn btn-success" type="submit">Search</button>
            </a>
        </form>
    </div>
    <script>
        $('#sub').on('click', function () {
            let searchProduct = document.getElementById("searchProduct");
            sessionStorage.setItem("input3", searchProduct.value);
        });
    </script>
    <div class="col-md-auto ">
        <a href="${contextPath}/user/show" class="header-cart-btn cart-toggle">
            <button type="submit" style="width: 90px;height: 40px"
                    class="btn btn-dark">${sessionScope.user.getName()}
            </button>
        </a>
    </div>

    <div class="col-md-auto">
        <a href="${contextPath}/cart" class="header-cart-btn cart-toggle">
            <button type="submit" style="width: 120px;height: 40px"
                    class="btn btn-dark"><span class="icon icon-cart"><img
                    src="${contextPath}/images/logo/cart.png"
                    style="width:20px;height:19px"/></span>
                Cart <span class="badge badge-pill badge-warning">${sessionScope.cart.getProducts().size()}</span>
            </button>
        </a>
    </div>
</nav>
<div class="container-fluid" style="margin-top:80px">
    <div class="row">
        <div class="col-md-auto offset-md-3">
            <div class="card w-10 " type="product" style="width:500px;height: 700px">

                <img class="card-img-top" style="width:100%;height: 50%"
                     src="${contextPath}/images/products/${product.getImage_path()}"
                     alt="Card image">

                <div class="card-body">
                    <h4 class="card-title">${product.getName()}</h4>
                    <p class="card-text">${product.getDescription()}</p>
                    <div class="col-last offset-md-8">
                        <h4 class="card-title">Price: ${product.getPrice()}$</h4>
                        <a href="${contextPath}/product/add?id=${product.getId()}&categoryId=${category.getId()}">
                            <button type="submit" style="width: 120px"
                                    class="btn btn-primary">Add to cart
                            </button>
                        </a>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<script>
    window.onload = function () {
        if (sessionStorage.getItem('idActive')) {
            sessionStorage.setItem('idActive', "id1");
        }
        if (sessionStorage.getItem('idActive2')) {
            sessionStorage.setItem('idActive2', "id1");
        }
        if (sessionStorage.getItem('option')) {
            sessionStorage.setItem('option', "2");
        }
        if (sessionStorage.getItem('optionSelNumPage')) {
            sessionStorage.setItem('optionSelNumPage', "5");
        }
        if (sessionStorage.getItem("input")) {
            sessionStorage.setItem("input", "");
        }
        if (sessionStorage.getItem("input2")) {
            sessionStorage.setItem("input2", "");
        }
        if (sessionStorage.getItem("input3")) {
            sessionStorage.setItem("input3", "");
        }
        if (sessionStorage.getItem("optionCategSelect")) {
            sessionStorage.setItem('optionCategSelect', "All");
        }
    }
</script>
</body>
</html>
