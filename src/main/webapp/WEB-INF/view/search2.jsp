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
                           href="${contextPath}/category?id=${category.getId()}">${category.getName()}</a>
                    </c:forEach>
                </div>
            </li>
        </ul>
    </div>

    <div class="col-md-auto offset-md-1" style="margin-top:0px">
        <input class="form-control mr-md-1" type="search" placeholder="Search" style="width: 580px"
               name="search" id="search">
    </div>
    <script>
        $('#search').change( function () {
            let inp = document.getElementById("inp2");
            inp.value = $(this).val();
            let form = document.getElementById("formToSend");
            form.submit();
        });
    </script>

    <div class="col-md-auto ">
        <button class="btn btn-success" type="submit">Search</button>
    </div>

    <div class="col-md-auto">
        <a href="${contextPath}/user/show" class="header-cart-btn cart-toggle">
            <button type="button" style="width: 90px;height: 40px"
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
    <form method="get" action="/search/filter" id="formToSend">
        <input type="hidden" name="size" value="5" id="inp3">
        <input type="hidden" name="pageNum" value="0" id="inp"/>
        <input type="hidden" name="search" value="" id="inp2"/>
        <div class="row">
            <div class="col-3 position-fixed">
                <%--                <form method="post" action="/search" id="filter2">--%>
                <h2>Filter</h2>
                <div class="form-group">
                    <label >Category select</label>
                    <select class="form-control" id="formControlSel" name="categorySearch" >
                        <option value="All">All</option>
                        <option value="Mobile phones">Mobile phones</option>
                        <option value="Laptops">Laptops</option>
                        <option value="Fridges">Fridges</option>
                        <option value="Cameras">Cameras</option>
                        <option value="GPS Navigators">GPS Navigators</option>
                        <option value="Cars">Cars</option>
                    </select>
                </div>
                <script>
                    $('select#formControlSel').on('change', function () {
                        localStorage.setItem('option2', this.value);
                    });
                </script>
                <label>Price</label>
                <div class="form-row">
                    <div class="col">
                        <input type="text" class="form-control" placeholder="From"
                               name="priceFrom" id="priceFrom">
                    </div>
                    <div class="col">
                        <input type="text" class="form-control" placeholder="To"
                               name="priceTo" id="priceTo">
                    </div>

                </div>
                <br>
                <a href="${contextPath}/search/filter">
                    <button id="sub" type="submit" class="btn btn-success" style="width: 120px;margin-left:190px">
                        Submit
                    </button>
                </a>

            </div>
        </div>
    </form>
    <div class="col-auto offset-md-5">
        <div class="row">
            <div class="col-sm-auto">
                <select class="form-control form-control-sm" id="selections" style="width: auto">
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="30">30</option>
                    <option value="50">50</option>
                    <option value="All">All</option>
                </select>
                <script>
                    $('select#selections').on('change', function () {
                        $('input[name="size"]').val(this.value);
                        localStorage.setItem('option1', this.value);
                        let form = document.getElementById("formToSend");
                        form.submit();
                    });

                </script>
            </div>

            <div class="col-sm-auto">
                <div class="form-group">
                    <nav aria-label="Search results pages">
                        <ul class="pagination pagination-sm">
                            <li class="page-item">
                                <a class="page-link"
                                   href="/search/filter?size=${size}&pageNum=<%=((Integer) session.getAttribute("pageNum") -1)<0?(Integer) session.getAttribute("pageNum"):(Integer) session.getAttribute("pageNum") -1 %>"
                                   aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>

                            <%
                                for (int i = 1; i <= (Integer) session.getAttribute("totalPages"); i++) {
                                    out.println("<li id=\"id" + i + "\" class=\"page-item\" value = \"" + (i - 1) + "\"><a class=\"page-link\" href=\"#\">" + i + "</a></li>");
                                }
                            %>
                            <script>

                                $('.pagination li').on('click', function () {
                                    let inp = document.getElementById("inp");
                                    inp.value = $(this).attr('value');
                                    $(this).addClass('active').siblings('li').removeClass('active');
                                    localStorage.setItem('idActive2', this.id);
                                    let form = document.getElementById("formToSend");
                                    form.submit();
                                });
                            </script>

                            <li class="next">
                                <a class="page-link"
                                   href="/search/filter?size=${size}&pageNum=<%=((Integer) session.getAttribute("pageNum") +1)>=(Integer) session.getAttribute("totalPages")?(Integer) session.getAttribute("pageNum"):(Integer) session.getAttribute("pageNum") +1 %>"
                                   aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                Показаны товары: <span>${first} - ${second} из ${totalElements} товаров </span>
            </div>
        </div>

        <c:if test="${not empty searchedList}">
            <c:forEach items="${searchedList}" var="product">
                <div class="row">
                    <div class="card w-35 m-1 bg-dark text-white center-block" type="product"
                         style="width:650px">
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
                                            <a href="${contextPath}/search/add?id=${product.getId()}">
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
</div>
<script>
    window.onload = function () {


        var select1 = document.getElementById("selections");
        var option1 = 0;
        for (var i = 0; i < select1.options.length; i++) {
            option1 = select1.options[i];
            if (option1.value == localStorage.getItem('option1')) {
                option1.setAttribute("selected1", true);
                option1.selected = true;
                console.log(option1.value);
            }
        }
        // --------------------------
        var select = document.getElementById("formControlSel");
        var option = "";
        for (var i = 0; i < select.options.length; i++) {
            option = select.options[i];
            if (option.value == localStorage.getItem('option2')) {
                option.setAttribute("selected", true);
                option.selected = true;
            }
        }
        // --------------------------

        if (localStorage.getItem('idActive2')) {
            $('.pagination li').siblings('li').removeClass('active');
            $("#" + localStorage.getItem('idActive2')).addClass('active');
        } else {
            $('#id1').addClass('active');
        }

        var input = document.getElementById("priceFrom");
        var input2 = document.getElementById("priceTo");
        var input3 = document.getElementById("search");

        if (localStorage.getItem("input")) {
            input.value = localStorage.getItem("input");
        }
        if (localStorage.getItem("input2")) {
            input2.value = localStorage.getItem("input2");
        }

        if (localStorage.getItem("input3")) {
            input3.value = localStorage.getItem("input3");
        }
        input.oninput = function () {
            localStorage.setItem("input", input.value);
        }
        input2.oninput = function () {
            localStorage.setItem("input2", input2.value);
        }
        input3.oninput = function () {
            localStorage.setItem("input3", input3.value);
        }

    }
</script>
</body>
</html>
