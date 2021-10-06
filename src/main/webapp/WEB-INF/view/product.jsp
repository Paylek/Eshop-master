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
    <script src="//raw.github.com/botmonster/jquery-bootpag/master/lib/jquery.bootpag.min.js"></script>
    <script src="//code.jquery.com/jquery-2.1.3.min.js"></script>
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
                <a class="nav-link text-white" href="">${category.getName()}</a>
            </li>
        </ul>
    </div>


    <div class="col-md-auto offset-md-3">
        <form class="form-inline" method="GET" action="/search/filter">
            <input type="hidden" name="size" value="5">
            <input type="hidden" name="pageNum" value="0"/>
            <input class="form-control mr-md-2" id="searchCategory" type="text" placeholder="Search" style="width: 250px" name="search">
            <a href="${contextPath}/search/filter">
                <button id="sub" class="btn btn-success" type="submit">Search</button>
            </a>
        </form>
    </div>
    <script>
        $('#sub').on('click', function () {
            let searchCategory = document.getElementById("searchCategory");
            sessionStorage.setItem("input3", searchCategory.value);
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
    <form method="get" action="/category/page" id="formToSend">
        <input name="size" type="hidden" value="2" id="size">
        <input name="id" type="hidden" value="${category.getId()}">
        <input type="hidden" name="pageNum" value="0" id="inp"/>
        <div class="row">
            <div class="col-sm-auto">
                <select class="form-control form-control-sm" id="selections" style="width: auto">
                    <option value="2">2</option>
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="30">30</option>
                    <option value="50">50</option>
                    <option value="All">All</option>
                </select>
                <script>
                    $('select#selections').on('change', function () {
                        $('input[id="size"]').val(this.value);
                        sessionStorage.setItem('option', this.value);
                        let form = document.getElementById("formToSend");
                        form.submit();
                    });
                </script>

            </div>
            <div class="col-sm-auto">
                <div class="form-group">
                    <nav aria-label="Search results pages">
                        <ul class="pagination pagination-sm">
                            <li class="page-item" id="prev">
                                <a class="page-link"
                                   href="/category/page?id=${category.getId()}&size=${size}&pageNum=<%=((Integer) request.getAttribute("pageNum") -1)<0?(Integer) request.getAttribute("pageNum"):(Integer) request.getAttribute("pageNum") -1 %>"
                                   aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>

                            <%
                                for (int i = 1; i <= (Integer) request.getAttribute("totalPages"); i++) {
                                    out.println("<li id=\"id" + i + "\" class=\"page-item\" value = \"" + (i - 1) + "\"><a class=\"page-link\" href=\"#\">" + i + "</a></li>");
                                }
                            %>

                            <li class="next" id="next">
                                <a class="page-link"
                                   href="/category/page?id=${category.getId()}&size=${size}&pageNum=<%=((Integer) request.getAttribute("pageNum") +1)>=(Integer) request.getAttribute("totalPages")?(Integer) request.getAttribute("pageNum"):(Integer) request.getAttribute("pageNum") +1 %>"
                                   aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <script>
                        window.onload = function () {
                            if (sessionStorage.getItem('idActive2')) {
                                sessionStorage.setItem('idActive2', "id1");
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

                            if (sessionStorage.getItem('idActive')) {
                                $('.pagination li').siblings('li').removeClass('active');
                                $("#" + sessionStorage.getItem('idActive')).addClass('active');
                            }

                            var select = document.getElementById("selections");
                            var option = 0;
                            for (var i = 0; i < select.options.length; i++) {
                                option = select.options[i];
                                if (option.value === sessionStorage.getItem('option')) {
                                    option.setAttribute("selected", true);
                                    option.selected = true;
                                    $('input[id="size"]').val(option.value)
                                    console.log(option.value);
                                }
                            }
                        }
                        $('.pagination li').on('click', function () {
                            if (this.id !== "prev" && this.id !== "next") {
                                let inp = document.getElementById("inp");
                                inp.value = $(this).attr('value');
                                $(this).addClass('active').siblings('li').removeClass('active');
                                sessionStorage.setItem('idActive', this.id);
                                let form = document.getElementById("formToSend");
                                form.submit();
                            } else if (this.id === "next") {
                                let currentPageId = sessionStorage.getItem('idActive');
                                let numIdNext = Number(currentPageId.substring(currentPageId.length - 1, currentPageId.length)) + 1;
                                let nextPageId = "id" + numIdNext;
                                if (numIdNext <=${totalPages}) {
                                    $('#' + nextPageId).addClass('active').siblings('li').removeClass('active');
                                    sessionStorage.setItem('idActive', nextPageId);
                                }
                            } else if (this.id === "prev") {
                                let currentPageId = sessionStorage.getItem('idActive');
                                let numIdNext = Number(currentPageId.substring(currentPageId.length - 1, currentPageId.length)) - 1;
                                let nextPageId = "id" + numIdNext;
                                if (numIdNext > 0) {
                                    $('#' + nextPageId).addClass('active').siblings('li').removeClass('active');
                                    sessionStorage.setItem('idActive', nextPageId);
                                }
                            }
                        });
                    </script>
                </div>
            </div>
        </div>
    </form>
    <div class="row">
        <div class="col-md-12">
            Показаны товары: <span>${first} - ${second} из ${totalElements} товаров </span>
        </div>
    </div>
    <c:if test="${not empty category.getProductList()}">
        <c:forEach items="${category.getProductList()}" var="product">
            <div class="row">
                <div class="card w-35 m-1 bg-dark text-white" type="product" style="width:650px">
                    <span class="border border-primary">
                        <div class="row no-gutters">
                             <div class="col-4">
                                 <a href="${contextPath}/product?id=${product.getId()}&categoryId=${category.getId()}">
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
                                    <a href="${contextPath}/category/add?id=${product.getId()}&categoryId=${category.getId()}&size=${size}&pageNum=${pageNum}">
                                         <button type="submit" style="width: 120px"
                                                 class="btn btn-primary">Add to cart</button>
                                    </a>
                                     </div>
                                  </div>
                        </div>
                    </span>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>

<script>
    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>

</body>
</html>
