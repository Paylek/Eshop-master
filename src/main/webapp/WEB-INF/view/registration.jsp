<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Bootstrap</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        * {
            box-sizing: border-box;
        }

        .input-container {
            display: -ms-flexbox; /* IE10 */
            display: flex;
            width: 100%;
            margin-bottom: 15px;
        }

        .icon {
            padding: 10px;
            background: forestgreen;
            color: white;
            min-width: 50px;
            text-align: center;
        }

        .input-field {
            width: 100%;
            padding: 10px;
            outline: none;
        }

        .input-field:focus {
            border: 2px solid dodgerblue;
        }

        /* Set a style for the submit button */
        .btn {
            background-color: forestgreen;
            color: white;
            padding: 15px 20px;
            border: none;
            cursor: pointer;
            width: 100%;
            opacity: 0.9;
        }

        .btn:hover {
            opacity: 1;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="col-md-8 offset-md-4" style="margin-top:40px">
        <h2>User Registration Form</h2>
        <p>Please, enter your information</p>
        <form method="POST" action="/registration/add/user/" name="regForm" onsubmit="return validateform()"
              class="needs-validation" novalidate>

            <div class="form-group">
                <div class="input-container">
                    <i class="fa fa-user icon"></i>
                    <input type="text" class="form-control w-25" id="name" placeholder="Name" name="name"
                           pattern="^[a-zA-Z]+$"
                           required>
                </div>
            </div>
            <div class="invalid-feedback">Please check your name.</div>
            <div class="form-group">
                <div class="input-container">
                    <i class="fa fa-user icon"></i>
                    <input type="text" class="form-control w-25" id="surname" placeholder="Surname" name="surname"
                           pattern="^[a-zA-Z]+$"
                           required>
                </div>
                <div class="invalid-feedback">Please check your surname.</div>
            </div>
            <div class="form-group">
                <div class="input-container">
                    <i class="fa fa-envelope icon"></i>
                    <input type="email" class="form-control w-25" id="email" placeholder="Email" name="email"
                           pattern="[^@\s]+@[^@\s]+\.[^@\s]+"
                           required>
                </div>
                <div class="invalid-feedback">Please check your email.</div>
            </div>
            <div class="form-group">
                <div class="input-container">
                    <i class="fa fa-calendar icon"></i>
                    <input type="date" class="form-control w-25" id="birthday" placeholder="Birthdate" name="birthday"
                           value="2015-12-31" min="1950-01-01" max="2015-12-31"
                           required>
                </div>
                <div class="invalid-feedback">Please check your birthdate.</div>
            </div>
            <div class="form-group">
                <div class="input-container">
                    <i class="fa fa-key icon"></i>
                    <input type="password" class="form-control w-25" id="password" placeholder="Password"
                           name="password"
                           pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,6}"
                           required>
                </div>
                <div class="invalid-feedback">Please check your password.</div>
            </div>
            <div class="form-group">
                <div class="input-container">
                    <i class="fa fa-key icon"></i>
                    <input type="password" class="form-control w-25" id="password2" placeholder="Confirm password"
                           name="password2"
                           pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{4,6}"
                           required>
                </div>
                <input type="checkbox" onclick="myFunction()">Show Password</input>
                <div class="invalid-feedback">Please check your password.</div>
            </div>
            <a href="${contextPath}/registration/add/user">
                <button type="submit" class="btn btn-success" style="width: 230px;height: 50px">Sign in</button>
            </a>
        </form>
    </div>
</div>
<script>
    function myFunction() {
        var x = document.getElementById("password2");
        var y = document.getElementById("password");
        if (x.type === "password" && y.type === "password") {
            x.type = "text";
            y.type = "text";
        } else {
            x.type = "password";
            y.type = "password";
        }
    }
    function hasNumbers(t)
    {
        var regex = /\d/g;
        return regex.test(t);
    }


    function validateform() {
        var firstpassword = document.regForm.password.value;
        var secondpassword = document.regForm.password2.value;
        var name = document.regForm.name.value;
        var surName = document.regForm.surname.value;
        var email = document.regForm.email.value;
        var password = document.regForm.password.value;
        var atposition = email.indexOf("@");
        var dotposition = email.lastIndexOf(".");

        if (name == null || name == "") {
            alert("Name can't be blank");
            return false;
        }else if (hasNumbers(name)) {
            alert("It should be one word without numbers");
            return false;
        }else if (hasNumbers(surName)) {
            alert("It should be one word without numbers");
            return false;
        }else if (surName == null || surName == "") {
            alert("Name can't be blank");
            return false;
        }else if (email == null || email == "") {
            alert("Email can't be blank");
            return false;
        } else if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= email.length) {
            alert("Email must have format sometext@mail.ru");
            return false;
        } else if (password.length < 4) {
            alert("Password must be at least 4 symbols including one number,one uppercase and lowercase letter.");
            return false;
        }else if (firstpassword == secondpassword) {
            return true;
        } else {
            alert("password must be equals!");
            return false;
        }

        var atposition = email.indexOf("@");
        var dotposition = email.lastIndexOf(".");
        if (atposition < 1 || dotposition < atposition + 2 || dotposition + 2 >= email.length) {
            alert("Please enter a valid e-mail address");
            return false;
        }
    }
</script>
<script>
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
