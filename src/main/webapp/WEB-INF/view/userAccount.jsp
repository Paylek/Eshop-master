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
            <li class="nav-item ">
                <a class="nav-link text-white" href="">My account</a>
            </li>

        </ul>
    </div>


    <div class="col-md-auto offset-md-3">
        <form class="form-inline" method="GET" action="/search/filter">
            <input type="hidden" name="size" value="5">
            <input type="hidden" name="pageNum" value="0"/>
            <input id="searchAccount" class="form-control mr-md-2" type="text" placeholder="Search" style="width: 250px" name="search">
            <a href="${contextPath}/search/filter">
                <button id="sub" class="btn btn-success" type="submit">Search</button>
            </a>
        </form>
    </div>
    <script>
        $('#sub').on('click', function () {
            let searchAccount = document.getElementById("searchAccount");
            sessionStorage.setItem("input3", searchAccount.value);
        });
    </script>
    <div class="col-md-auto ">
        <a href="${contextPath}/user/logout" class="header-cart-btn cart-toggle">
            <button type="submit" style="width: 90px;height: 40px"
                    class="btn btn-dark">Log out
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
        <div class="card w-100">
            <h5 class="card-header">
                My account
            </h5>
            <div class="card-body">
                <table class="table table-sm">
                    <thead class="thead-dark">
                    <tr>
                        <th>Firstname</th>
                        <th>Lastname</th>
                        <th>Birthdate</th>
                        <th>Email</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><h5><span class="badge badge badge-light">${user.getName()}</span></h5></td>
                        <td><h5><span class="badge badge badge-light">${user.getSurname()}</span></h5>
                        </td>
                        <td><h5><span class="badge badge badge-light">${user.getDateOfBirthday()}</span></h5>
                        </td>
                        <td><h5><span class="badge badge badge-light">${user.getEmail()}</span></h5>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <h5>
        History of purchase
    </h5>
    <c:if test="${not empty purchases}">
        <c:forEach items="${purchases}" var="purchase">
            <div class="row">
                <div class="card w-100">
                    <h6 class="card-header">
                        Number of order:${purchase.getId()}/ Date:${purchase.getDate()}
                    </h6>

                    <c:if test="${not empty purchase.getProducts()}">
                        <c:forEach items="${purchase.getProducts()}" var="product">
                            <div class="card w-35 m-1 bg-dark text-white" type="product" style="width:650px">
                    <span class="border border-primary">
                        <div class="row no-gutters">
                             <div class="col-4">
                                 <a href="${contextPath}/product?id=${product.getId()}&categoryId=${product.getCategory().getId()}">
                                <img class="img-fluid" style="width:650px;height:200px"
                                     src="${contextPath}/images/products/${product.getImage_path()}"
                                     alt="Card image" style="width: 100%">
                                 </a>
                             </div>
                                 <div class="col-8">
                                     <div class="card-body">
                                    <h4 class="card-title">${product.getName()}</h4>
                                    <p class="card-text">${product.getDescription()}</p>
                                      <h4 class="card-title">Price: ${product.getPrice()}$</h4>
                                    </div>
                                  </div>
                        </div>
                    </span>
                            </div>
                        </c:forEach>
                    </c:if>

                </div>

            </div>

        </c:forEach>
    </c:if>
</div>
</body>
</html>
