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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/imask/3.4.0/imask.min.js"></script>
    <style>
        .payment-title {
            width: 100%;
            text-align: center;
        }

        .form-container .field-container:first-of-type {
            grid-area: name;
        }

        .form-container .field-container:nth-of-type(2) {
            grid-area: number;
        }

        .form-container .field-container:nth-of-type(3) {
            grid-area: expiration;
        }

        .form-container .field-container:nth-of-type(4) {
            grid-area: security;
        }

        .field-container input {
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        .field-container {
            position: relative;
        }

        .form-container {
            display: grid;
            grid-column-gap: 10px;
            grid-template-columns: auto auto;
            grid-template-rows: 90px 90px 90px;
            grid-template-areas: "name name""number number""expiration security";
            max-width: 400px;
            padding: 20px;
            color: #707070;
        }

        label {
            padding-bottom: 5px;
            font-size: 13px;
        }

        input {
            margin-top: 3px;
            padding: 15px;
            font-size: 16px;
            width: 100%;
            border-radius: 3px;
            border: 1px solid #dcdcdc;
        }

        .ccicon {
            height: 38px;
            position: absolute;
            right: 6px;
            top: calc(50% - 17px);
            width: 60px;
        }

        /* CREDIT CARD IMAGE STYLING */
        .preload * {
            -webkit-transition: none !important;
            -moz-transition: none !important;
            -ms-transition: none !important;
            -o-transition: none !important;
        }

        .container {
            width: 100%;
            max-width: 400px;
            max-height: 251px;
            height: 54vw;
            padding: 20px;
        }

        #ccsingle {
            position: absolute;
            right: 15px;
            top: 20px;
        }

        #ccsingle svg {
            width: 100px;
            max-height: 60px;
        }

        .creditcard svg#cardfront,
        .creditcard svg#cardback {
            width: 100%;
            -webkit-box-shadow: 1px 5px 6px 0px black;
            box-shadow: 1px 5px 6px 0px black;
            border-radius: 22px;
        }

        #generatecard {
            cursor: pointer;
            float: right;
            font-size: 12px;
            color: #fff;
            padding: 2px 4px;
            background-color: #909090;
            border-radius: 4px;
            cursor: pointer;
            float: right;
        }

        /* CHANGEABLE CARD ELEMENTS */
        .creditcard .lightcolor,
        .creditcard .darkcolor {
            -webkit-transition: fill .5s;
            transition: fill .5s;
        }

        .creditcard .lightblue {
            fill: #03A9F4;
        }

        .creditcard .lightbluedark {
            fill: #0288D1;
        }

        .creditcard .red {
            fill: #ef5350;
        }

        .creditcard .reddark {
            fill: #d32f2f;
        }

        .creditcard .purple {
            fill: #ab47bc;
        }

        .creditcard .purpledark {
            fill: #7b1fa2;
        }

        .creditcard .cyan {
            fill: #26c6da;
        }

        .creditcard .cyandark {
            fill: #0097a7;
        }

        .creditcard .green {
            fill: #66bb6a;
        }

        .creditcard .greendark {
            fill: #388e3c;
        }

        .creditcard .lime {
            fill: #d4e157;
        }

        .creditcard .limedark {
            fill: #afb42b;
        }

        .creditcard .yellow {
            fill: #ffeb3b;
        }

        .creditcard .yellowdark {
            fill: #f9a825;
        }

        .creditcard .orange {
            fill: #ff9800;
        }

        .creditcard .orangedark {
            fill: #ef6c00;
        }

        .creditcard .grey {
            fill: #bdbdbd;
        }

        .creditcard .greydark {
            fill: #616161;
        }

        /* FRONT OF CARD */
        #svgname {
            text-transform: uppercase;
        }

        #cardfront .st2 {
            fill: #FFFFFF;
        }

        #cardfront .st3 {
            font-family: 'Source Code Pro', monospace;
            font-weight: 600;
        }

        #cardfront .st4 {
            font-size: 54.7817px;
        }

        #cardfront .st5 {
            font-family: 'Source Code Pro', monospace;
            font-weight: 400;
        }

        #cardfront .st6 {
            font-size: 33.1112px;
        }

        #cardfront .st7 {
            opacity: 0.6;
            fill: #FFFFFF;
        }

        #cardfront .st8 {
            font-size: 24px;
        }

        #cardfront .st9 {
            font-size: 36.5498px;
        }

        #cardfront .st10 {
            font-family: 'Source Code Pro', monospace;
            font-weight: 300;
        }

        #cardfront .st11 {
            font-size: 16.1716px;
        }

        #cardfront .st12 {
            fill: #4C4C4C;
        }

        /* BACK OF CARD */
        #cardback .st0 {
            fill: none;
            stroke: #0F0F0F;
            stroke-miterlimit: 10;
        }

        #cardback .st2 {
            fill: #111111;
        }

        #cardback .st3 {
            fill: #F2F2F2;
        }

        #cardback .st4 {
            fill: #D8D2DB;
        }

        #cardback .st5 {
            fill: #C4C4C4;
        }

        #cardback .st6 {
            font-family: 'Source Code Pro', monospace;
            font-weight: 400;
        }

        #cardback .st7 {
            font-size: 27px;
        }

        #cardback .st8 {
            opacity: 0.6;
        }

        #cardback .st9 {
            fill: #FFFFFF;
        }

        #cardback .st10 {
            font-size: 24px;
        }

        #cardback .st11 {
            fill: #EAEAEA;
        }

        #cardback .st12 {
            font-family: 'Rock Salt', cursive;
        }

        #cardback .st13 {
            font-size: 37.769px;
        }

        /* FLIP ANIMATION */
        .container {
            perspective: 1000px;
        }

        .creditcard {
            width: 100%;
            max-width: 400px;
            -webkit-transform-style: preserve-3d;
            transform-style: preserve-3d;
            transition: -webkit-transform 0.6s;
            -webkit-transition: -webkit-transform 0.6s;
            transition: transform 0.6s;
            transition: transform 0.6s, -webkit-transform 0.6s;
            cursor: pointer;
        }

        .creditcard .front,
        .creditcard .back {
            position: absolute;
            width: 100%;
            max-width: 400px;
            -webkit-backface-visibility: hidden;
            backface-visibility: hidden;
            -webkit-font-smoothing: antialiased;
            color: #47525d;
        }

        .creditcard .back {
            -webkit-transform: rotateY(180deg);
            transform: rotateY(180deg);
        }

        .creditcard.flipped {
            -webkit-transform: rotateY(180deg);
            transform: rotateY(180deg);
        }
    </style>
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
                <a class="nav-link text-white" href="">Cart</a>
            </li>
        </ul>
    </div>

    <div class="col-md-2 offset-md-3 text-white" style="height:50px; width:140px; text-align:center">
        <div style="position:absolute; top:50%; left:50%; margin-top:-12px; margin-left:25px">
            <ul class="navbar-nav" style="width: 100px">
                <li class="offset-md-1" style="width: 100px">
                    <p>Total price:</p>
                </li>
            </ul>
        </div>
    </div>

    <div class="col-md-1">
        <ul class="navbar-nav">
            <li class="offset-md-1">
                <span class="badge badge-pill badge-warning">${sessionScope.cart.getTotalPrice()}$</span>
            </li>
        </ul>
    </div>

    <div class="col-md-auto">
        <a href="${contextPath}/user/show" class="header-cart-btn cart-toggle">
            <button type="submit" style="width: 90px;height: 40px"
                    class="btn btn-dark">${sessionScope.user.getName()}
            </button>
        </a>
    </div>

    <div class="col-md-1">
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

    <c:if test="${not empty cart}">
        <c:forEach items="${cart.getProducts()}" var="product">
            <div class="row">
                <div class="card w-35 m-1 bg-dark text-white" type="cart" style="width:650px">
                    <span class="border border-primary">
                        <div class="row no-gutters">
                             <div class="col-4">
                                <img class="img-fluid" style="width:650px;height:200px"
                                     src="${contextPath}/images/products/${product.getImage_path()}"
                                     alt="Card image" style="width: 100%">
                             </div>
                                 <div class="col-8">
                                     <div class="card-body">
                                    <h4 class="card-title">${product.getName()}</h4>
                                    <p class="card-text">${product.getDescription()}</p>
                                      <h4 class="card-title">Price: ${product.getPrice()}$</h4>
                                     <a href="${contextPath}/cart/remove?id=${product.getId()}">
                                       <button type="submit" style="width: 180px"
                                               class="btn btn-primary">Delete product</button>
                                     </a>
                                     </div>
                                  </div>
                        </div>
                    </span>
                </div>
            </div>
        </c:forEach>
    </c:if>
    <div class="row">
        <div class="card w-35 m-1 bg-warning" type="cart" style="width:650px">
            <div class="row no-gutters">
                <div class="col-8">
                    <h1>Total price: ${sessionScope.cart.getTotalPrice()}$</h1>
                </div>
                <div class="col-4">
                    <button type="button" style="width: 180px;margin-top:5px"
                            class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">Order
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Модальное окно -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Payment Information</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <%--------------------------------------------------------------------------%>
                <div class="container preload">
                    <div class="creditcard">
                        <div class="front">
                            <div id="ccsingle"></div>
                            <svg version="1.1" id="cardfront" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink"
                                 x="0px" y="0px" viewBox="0 0 750 471" style="enable-background:new 0 0 750 471;"
                                 xml:space="preserve">
        <g id="Front">
            <g id="CardBackground">
                <g id="Page-1_1_">
                    <g id="amex_1_">
                        <path id="Rectangle-1_1_" class="lightcolor grey" d="M40,0h670c22.1,0,40,17.9,40,40v391c0,22.1-17.9,40-40,40H40c-22.1,0-40-17.9-40-40V40
                      C0,17.9,17.9,0,40,0z"/>
                    </g>
                </g>
                <path class="darkcolor greydark"
                      d="M750,431V193.2c-217.6-57.5-556.4-13.5-750,24.9V431c0,22.1,17.9,40,40,40h670C732.1,471,750,453.1,750,431z"/>
            </g>
            <text transform="matrix(1 0 0 1 60.106 295.0121)" id="svgnumber" class="st2 st3 st4">0123 4567 8910
                1112
            </text>
            <text transform="matrix(1 0 0 1 54.1064 428.1723)" id="svgname" class="st2 st5 st6">JOHN DOE</text>
            <text transform="matrix(1 0 0 1 54.1074 389.8793)" class="st7 st5 st8">cardholder name</text>
            <text transform="matrix(1 0 0 1 479.7754 388.8793)" class="st7 st5 st8">expiration</text>
            <text transform="matrix(1 0 0 1 65.1054 241.5)" class="st7 st5 st8">card number</text>
            <g>
                <text transform="matrix(1 0 0 1 574.4219 433.8095)" id="svgexpire" class="st2 st5 st9">01/23</text>
                <text transform="matrix(1 0 0 1 479.3848 417.0097)" class="st2 st10 st11">VALID</text>
                <text transform="matrix(1 0 0 1 479.3848 435.6762)" class="st2 st10 st11">THRU</text>
                <polygon class="st2" points="554.5,421 540.4,414.2 540.4,427.9 		"/>
            </g>
            <g id="cchip">
                <g>
                    <path class="st2" d="M168.1,143.6H82.9c-10.2,0-18.5-8.3-18.5-18.5V74.9c0-10.2,8.3-18.5,18.5-18.5h85.3
                  c10.2,0,18.5,8.3,18.5,18.5v50.2C186.6,135.3,178.3,143.6,168.1,143.6z"/>
                </g>
                <g>
                    <g>
                        <rect x="82" y="70" class="st12" width="1.5" height="60"/>
                    </g>
                    <g>
                        <rect x="167.4" y="70" class="st12" width="1.5" height="60"/>
                    </g>
                    <g>
                        <path class="st12" d="M125.5,130.8c-10.2,0-18.5-8.3-18.5-18.5c0-4.6,1.7-8.9,4.7-12.3c-3-3.4-4.7-7.7-4.7-12.3
                      c0-10.2,8.3-18.5,18.5-18.5s18.5,8.3,18.5,18.5c0,4.6-1.7,8.9-4.7,12.3c3,3.4,4.7,7.7,4.7,12.3
                      C143.9,122.5,135.7,130.8,125.5,130.8z M125.5,70.8c-9.3,0-16.9,7.6-16.9,16.9c0,4.4,1.7,8.6,4.8,11.8l0.5,0.5l-0.5,0.5
                      c-3.1,3.2-4.8,7.4-4.8,11.8c0,9.3,7.6,16.9,16.9,16.9s16.9-7.6,16.9-16.9c0-4.4-1.7-8.6-4.8-11.8l-0.5-0.5l0.5-0.5
                      c3.1-3.2,4.8-7.4,4.8-11.8C142.4,78.4,134.8,70.8,125.5,70.8z"/>
                    </g>
                    <g>
                        <rect x="82.8" y="82.1" class="st12" width="25.8" height="1.5"/>
                    </g>
                    <g>
                        <rect x="82.8" y="117.9" class="st12" width="26.1" height="1.5"/>
                    </g>
                    <g>
                        <rect x="142.4" y="82.1" class="st12" width="25.8" height="1.5"/>
                    </g>
                    <g>
                        <rect x="142" y="117.9" class="st12" width="26.2" height="1.5"/>
                    </g>
                </g>
            </g>
        </g>
                                <g id="Back">
                                </g>
      </svg>
                        </div>
                        <div class="back">
                            <svg version="1.1" id="cardback" xmlns="http://www.w3.org/2000/svg"
                                 xmlns:xlink="http://www.w3.org/1999/xlink"
                                 x="0px" y="0px" viewBox="0 0 750 471" style="enable-background:new 0 0 750 471;"
                                 xml:space="preserve">
        <g id="Front">
            <line class="st0" x1="35.3" y1="10.4" x2="36.7" y2="11"/>
        </g>
                                <g id="Back">
                                    <g id="Page-1_2_">
                                        <g id="amex_2_">
                                            <path id="Rectangle-1_2_" class="darkcolor greydark" d="M40,0h670c22.1,0,40,17.9,40,40v391c0,22.1-17.9,40-40,40H40c-22.1,0-40-17.9-40-40V40
                  C0,17.9,17.9,0,40,0z"/>
                                        </g>
                                    </g>
                                    <rect y="61.6" class="st2" width="750" height="78"/>
                                    <g>
                                        <path class="st3" d="M701.1,249.1H48.9c-3.3,0-6-2.7-6-6v-52.5c0-3.3,2.7-6,6-6h652.1c3.3,0,6,2.7,6,6v52.5
              C707.1,246.4,704.4,249.1,701.1,249.1z"/>
                                        <rect x="42.9" y="198.6" class="st4" width="664.1" height="10.5"/>
                                        <rect x="42.9" y="224.5" class="st4" width="664.1" height="10.5"/>
                                        <path class="st5"
                                              d="M701.1,184.6H618h-8h-10v64.5h10h8h83.1c3.3,0,6-2.7,6-6v-52.5C707.1,187.3,704.4,184.6,701.1,184.6z"/>
                                    </g>
                                    <text transform="matrix(1 0 0 1 621.999 227.2734)" id="svgsecurity" class="st6 st7">
                                        985
                                    </text>
                                    <g class="st8">
                                        <text transform="matrix(1 0 0 1 518.083 280.0879)" class="st9 st6 st10">security
                                            code
                                        </text>
                                    </g>
                                    <rect x="58.1" y="378.6" class="st11" width="375.5" height="13.5"/>
                                    <rect x="58.1" y="405.6" class="st11" width="421.7" height="13.5"/>
                                    <text transform="matrix(1 0 0 1 59.5073 228.6099)" id="svgnameback"
                                          class="st12 st13">John Doe
                                    </text>
                                </g>
      </svg>
                        </div>
                    </div>
                </div>
                <div class="form-container">
                    <div class="field-container">
                        <label for="name">Name</label>
                        <input id="name" maxlength="20" type="text">
                    </div>
                    <div class="field-container">
                        <label for="cardnumber">Card Number</label><span id="generatecard">generate random</span>
                        <input id="cardnumber" type="text" pattern="[0-9]*" inputmode="numeric">
                        <svg id="ccicon" class="ccicon" width="750" height="471" viewBox="0 0 750 471" version="1.1"
                             xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">

                        </svg>
                    </div>
                    <div class="field-container">
                        <label for="expirationdate">Expiration (mm/yy)</label>
                        <input id="expirationdate" type="text" pattern="[0-9]*" inputmode="numeric">
                    </div>
                    <div class="field-container">
                        <label for="securitycode">Security Code</label>
                        <input id="securitycode" type="text" pattern="[0-9]*" inputmode="numeric">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <a href="${contextPath}/cart/order">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal2">Pay
                    </button>
                </a>
            </div>
        </div>
    </div>
</div>

<script>
    window.onload = function () {

        const name = document.getElementById('name');
        const cardnumber = document.getElementById('cardnumber');
        const expirationdate = document.getElementById('expirationdate');
        const securitycode = document.getElementById('securitycode');
        const output = document.getElementById('output');
        const ccicon = document.getElementById('ccicon');
        const ccsingle = document.getElementById('ccsingle');
        const generatecard = document.getElementById('generatecard');


        let cctype = null;

        //Mask the Credit Card Number Input
        var cardnumber_mask = new IMask(cardnumber, {
            mask: [{
                mask: '0000 000000 00000',
                regex: '^3[47]\\d{0,13}',
                cardtype: 'american express'
            },
                {
                    mask: '0000 0000 0000 0000',
                    regex: '^(?:6011|65\\d{0,2}|64[4-9]\\d?)\\d{0,12}',
                    cardtype: 'discover'
                },
                {
                    mask: '0000 000000 0000',
                    regex: '^3(?:0([0-5]|9)|[689]\\d?)\\d{0,11}',
                    cardtype: 'diners'
                },
                {
                    mask: '0000 0000 0000 0000',
                    regex: '^(5[1-5]\\d{0,2}|22[2-9]\\d{0,1}|2[3-7]\\d{0,2})\\d{0,12}',
                    cardtype: 'mastercard'
                },
                // {
                //     mask: '0000-0000-0000-0000',
                //     regex: '^(5019|4175|4571)\\d{0,12}',
                //     cardtype: 'dankort'
                // },
                // {
                //     mask: '0000-0000-0000-0000',
                //     regex: '^63[7-9]\\d{0,13}',
                //     cardtype: 'instapayment'
                // },
                {
                    mask: '0000 000000 00000',
                    regex: '^(?:2131|1800)\\d{0,11}',
                    cardtype: 'jcb15'
                },
                {
                    mask: '0000 0000 0000 0000',
                    regex: '^(?:35\\d{0,2})\\d{0,12}',
                    cardtype: 'jcb'
                },
                {
                    mask: '0000 0000 0000 0000',
                    regex: '^(?:5[0678]\\d{0,2}|6304|67\\d{0,2})\\d{0,12}',
                    cardtype: 'maestro'
                },
                // {
                //     mask: '0000-0000-0000-0000',
                //     regex: '^220[0-4]\\d{0,12}',
                //     cardtype: 'mir'
                // },
                {
                    mask: '0000 0000 0000 0000',
                    regex: '^4\\d{0,15}',
                    cardtype: 'visa'
                },
                {
                    mask: '0000 0000 0000 0000',
                    regex: '^62\\d{0,14}',
                    cardtype: 'unionpay'
                },
                {
                    mask: '0000 0000 0000 0000',
                    cardtype: 'Unknown'
                }
            ],
            dispatch: function (appended, dynamicMasked) {
                var number = (dynamicMasked.value + appended).replace(/\D/g, '');

                for (var i = 0; i < dynamicMasked.compiledMasks.length; i++) {
                    let re = new RegExp(dynamicMasked.compiledMasks[i].regex);
                    if (number.match(re) != null) {
                        return dynamicMasked.compiledMasks[i];
                    }
                }
            }
        });

        //Mask the Expiration Date
        var expirationdate_mask = new IMask(expirationdate, {
            mask: 'MM{/}YY',
            groups: {
                YY: new IMask.MaskedPattern.Group.Range([0, 99]),
                MM: new IMask.MaskedPattern.Group.Range([1, 12]),
            }
        });

        //Mask the security code
        var securitycode_mask = new IMask(securitycode, {
            mask: '0000',
        });

        // SVGICONS
        let amex = `      `;
        let visa = `         `;
        let diners = `       `;
        let discover = `      `;
        let jcb = `                      `;
        let maestro = `            `;
        let mastercard = `            `;
        let unionpay = `            `;

        let amex_single = ``;
        let visa_single = ``;
        let diners_single = ``;
        let discover_single = ``;
        let jcb_single = ``;
        let maestro_single = `         `;
        let mastercard_single = `         `;
        let unionpay_single = `           `;

        //define the color swap function
        const swapColor = function (basecolor) {
            document.querySelectorAll('.lightcolor')
                .forEach(function (input) {
                    input.setAttribute('class', '');
                    input.setAttribute('class', 'lightcolor ' + basecolor);
                });
            document.querySelectorAll('.darkcolor')
                .forEach(function (input) {
                    input.setAttribute('class', '');
                    input.setAttribute('class', 'darkcolor ' + basecolor + 'dark');
                });
        };


        //pop in the appropriate card icon when detected
        cardnumber_mask.on("accept", function () {
            console.log(cardnumber_mask.masked.currentMask.cardtype);
            switch (cardnumber_mask.masked.currentMask.cardtype) {
                case 'american express':
                    ccicon.innerHTML = amex;
                    ccsingle.innerHTML = amex_single;
                    swapColor('green');
                    break;
                case 'visa':
                    ccicon.innerHTML = visa;
                    ccsingle.innerHTML = visa_single;
                    swapColor('lime');
                    break;
                case 'diners':
                    ccicon.innerHTML = diners;
                    ccsingle.innerHTML = diners_single;
                    swapColor('orange');
                    break;
                case 'discover':
                    ccicon.innerHTML = discover;
                    ccsingle.innerHTML = discover_single;
                    swapColor('purple');
                    break;
                case ('jcb' || 'jcb15'):
                    ccicon.innerHTML = jcb;
                    ccsingle.innerHTML = jcb_single;
                    swapColor('red');
                    break;
                case 'maestro':
                    ccicon.innerHTML = maestro;
                    ccsingle.innerHTML = maestro_single;
                    swapColor('yellow');
                    break;
                case 'mastercard':
                    ccicon.innerHTML = mastercard;
                    ccsingle.innerHTML = mastercard_single;
                    swapColor('lightblue');

                    break;
                case 'unionpay':
                    ccicon.innerHTML = unionpay;
                    ccsingle.innerHTML = unionpay_single;
                    swapColor('cyan');
                    break;
                default:
                    ccicon.innerHTML = '';
                    ccsingle.innerHTML = '';
                    swapColor('grey');
                    break;
            }

        });


        //Generate random card number from list of known test numbers
        const randomCard = function () {
            let testCards = [
                '4000056655665556',
                '5200828282828210',
                '371449635398431',
                '6011000990139424',
                '30569309025904',
                '3566002020360505',
                '6200000000000005',
                '6759649826438453',
            ];
            let randomNumber = Math.floor(Math.random() * testCards.length);
            cardnumber_mask.unmaskedValue = testCards[randomNumber];
        }
        generatecard.addEventListener('click', function () {
            randomCard();
        });


        // CREDIT CARD IMAGE JS
        document.querySelector('.preload').classList.remove('preload');
        document.querySelector('.creditcard').addEventListener('click', function () {
            if (this.classList.contains('flipped')) {
                this.classList.remove('flipped');
            } else {
                this.classList.add('flipped');
            }
        })

        //On Input Change Events
        name.addEventListener('input', function () {
            if (name.value.length == 0) {
                document.getElementById('svgname').innerHTML = 'John Doe';
                document.getElementById('svgnameback').innerHTML = 'John Doe';
            } else {
                document.getElementById('svgname').innerHTML = this.value;
                document.getElementById('svgnameback').innerHTML = this.value;
            }
        });

        cardnumber_mask.on('accept', function () {
            if (cardnumber_mask.value.length == 0) {
                document.getElementById('svgnumber').innerHTML = '0123 4567 8910 1112';
            } else {
                document.getElementById('svgnumber').innerHTML = cardnumber_mask.value;
            }
        });

        expirationdate_mask.on('accept', function () {
            if (expirationdate_mask.value.length == 0) {
                document.getElementById('svgexpire').innerHTML = '01/23';
            } else {
                document.getElementById('svgexpire').innerHTML = expirationdate_mask.value;
            }
        });

        securitycode_mask.on('accept', function () {
            if (securitycode_mask.value.length == 0) {
                document.getElementById('svgsecurity').innerHTML = '985';
            } else {
                document.getElementById('svgsecurity').innerHTML = securitycode_mask.value;
            }
        });

        //On Focus Events
        name.addEventListener('focus', function () {
            document.querySelector('.creditcard').classList.remove('flipped');
        });

        cardnumber.addEventListener('focus', function () {
            document.querySelector('.creditcard').classList.remove('flipped');
        });

        expirationdate.addEventListener('focus', function () {
            document.querySelector('.creditcard').classList.remove('flipped');
        });

        securitycode.addEventListener('focus', function () {
            document.querySelector('.creditcard').classList.add('flipped');
        });
    };
</script>
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