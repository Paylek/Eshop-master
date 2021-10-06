<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        .warning {
            color: red; /* Цвет символа */
            font-size: 120%; /* Размер шрифта */
        }
    </style>

</head>
<body>

<div class="container">
    <div class="col-md-8 offset-md-4" style="margin-top:40px">
        <p class="warning">${warning}</p>
        <h2>Login</h2>
        <p>Please, enter your login and password</p>
        <form name="myForm" onsubmit="return validateform()" method="POST" action="/user/login/"
              class="needs-validation" novalidate>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" class="form-control w-25" id="email" placeholder="Enter email" name="email"
                       pattern="[^@\s]+@[^@\s]+\.[^@\s]+"
                       required>
                <div class="invalid-feedback">Please check your email.</div>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" class="form-control w-25" id="password" placeholder="Enter password"
                       name="password" required>
                <div class="invalid-feedback" id="p1">Please check your password.</div>

            </div>
            <a href="${contextPath}/user/login">
                <button type="submit" class="btn btn-success" style="width: 180px">Log in</button>
            </a>
        </form>
        <br>
        <a href="${contextPath}/registration">
            <button type="submit" class="btn btn-warning" style="width: 180px">Sign up</button>
        </a>
    </div>
</div>
<script>
    function validateform() {
        var name = document.myForm.email.value;
        var password = document.myForm.password.value;
        if (name == null || name == "") {
            alert("Email can't be blank");
            return false;
        } else if (password.length < 4) {
            alert("Password must be at least 4 symbols including one number,one uppercase and lowercase letter.");
            return false;
        }
        var atposition = name.indexOf("@");
        var dotposition = name.lastIndexOf(".");
        if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= name.length) {
            alert("Please enter a valid e-mail address");
            return false;
        }
    }


    // Disable form submissions if there are invalid fields
    (function () {
        'use strict';
        window.addEventListener('load', function () {
            // Get the forms we want to add validation styles to
            var forms = document.getElementsByClassName('needs-validation');
            // Loop over them and prevent submission
            var validation = Array.prototype.filter.call(forms, function (form) {
                form.addEventListener('submit', function (event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>
</body>
</html>
