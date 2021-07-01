<!DOCTYPE html>
<html lang="en">
<#macro title>Вход</#macro>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=!, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <style>
        body {
            background-image: url("../../backgrounds/auth/auth.png");
        }

        #login-form {
            height: 35em;
            width: 20em;
            margin-left: auto;
            margin-right: auto;
            margin-top: 10%;
        }

        #login-form-header {
            text-align: center;
            color: black;
        }

        #account-creation-link {
            font-size: large;
            color: rgb(156, 210, 255);
        }

        #login-form-body {
            margin-top: 2em;
        }

        .form-control {
            height: 50px;
            padding-left: 20px;
            padding-right: 20px;
            color: rgb(0, 0, 0) !important;
            border-width: 1px;
            border-style: solid;
            border-color: transparent;
            border-image: initial;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 4px;
            transition: all 0.3s ease 0s;
            display: block;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1.5;
            padding: 0.375rem 0.75rem;
        }

        .form-control:hover, .form-control:focus {
            box-shadow: none;
            background: transparent;
            outline: none;
            border-color: rgba(255, 255, 255, 0.4);
        }

        .form-control::placeholder {
            color: black;
        }

        #sign-in-button {
            background-color: rgb(37, 131, 255);
        }

        #sign-in-button:active {
            background-color: rgb(14, 118, 255);
            border-color: rgb(14, 118, 255);

            box-shadow: 0 0 10px rgba(33, 137, 255, 0.5);
        }
        input {
            border: gray;
        }
    </style>
    <title>Вход</title>
</head>

<body>
    <div id="login-form">
        <div id="login-form-header">
            <h3>Нет аккаунта?
                <a id="account-creation-link" href="/signUp"> <br>Создать
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                        class="bi bi-arrow-right" viewBox="0 0 16 16">
                        <path fill-rule="evenodd"
                            d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z" />
                    </svg>
                </a>
            </h3>
        </div>

        <div id="login-form-body">
            <form method="POST">
                <div class="form-group">
                    <input type="text" name="email" class="form-control" placeholder="Почта" required="">
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="Пароль" required="">
                </div>

                <div class="form-group">
                    <button id="sign-in-button" type="submit"
                        class="form-control btn btn-primary submit px-3">Войти</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>