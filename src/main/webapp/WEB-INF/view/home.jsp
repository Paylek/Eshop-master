<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Categories</title>
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
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle text-white bg-dark" data-toggle="dropdown"
                   href="">Categories</a>
                <div class="dropdown-menu">
                    <c:forEach items="${categories}" var="category">
                        <a class="dropdown-item"
                           href="${contextPath}/category/page?id=${category.getId()}&pageNum=0&size=2">${category.getName()}</a>
                    </c:forEach>
                </div>
            </li>
        </ul>
    </div>

    <div class="col-md-auto offset-md-5">
        <form class="form-inline" method="GET" action="/search/filter">
            <input type="hidden" name="size" value="5">
            <input type="hidden" name="pageNum" value="0"/>
            <input class="form-control mr-md-2" id="searchHome" type="text" placeholder="Search" style="width: 250px" name="search">
            <a href="${contextPath}/search/filter">
                <button id="sub" class="btn btn-success" type="submit">Search</button>
            </a>
        </form>
        <script>
            $('#sub').on('click', function () {
                let searchHome = document.getElementById("searchHome");
                sessionStorage.setItem("input3", searchHome.value);
            });
        </script>
    </div>
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
    <c:if test="${not empty categories}">
        <div class="row">
            <c:forEach items="${categories}" var="category">
                <div class="card w-40 m-2 text-center" type="category" style="width:400px">
                    <div class="card-body">
                        <img class="img-fluid" style="width:300px;height:200px"
                             src="${contextPath}/images/${category.getImage_path()}"
                             alt="Card image" style="width: 100%">
                        <a href="${contextPath}/category/page?id=${category.getId()}&pageNum=0&size=2">
                            <button type="submit" style="width: 210px;margin-top:20px"
                                    class="btn btn-warning stretched-link"><strong>${category.getName()}</strong>
                            </button>
                        </a>
                    </div>
                </div>
            </c:forEach>
        </div>
    </c:if>
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
