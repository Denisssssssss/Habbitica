<!DOCTYPE html>
<html lang="en">
<#import "spring.ftl" as spring>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=!, initial-scale=1.0">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

    <link rel="stylesheet" href="../../css/auth/signin.css">
    <title>Вход</title>
</head>

<body>
    <div id="login-form">
        <div id="login-form-header">
            <h3>Нет аккаунта?
                <a id="account-creation-link" href="registration.html"> <br>Создать
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
                    <input type="text" name="email" class="form-control" placeholder="E-mail" required="">
                </div>
                <div class="form-group">
                    <input type="text" name="email" class="form-control" placeholder="Password" required="">
                </div>

                <div class="form-group">
                    <button id="sign-in-button" type="submit"
                        class="form-control btn btn-primary submit px-3">Войти</button>
                </div>
            </form>
            <@spring.bind "userForm"/>
            <form method="post" action="/signIn">
                <#--    <input type='hidden' value='${_csrf.token}' name='${_csrf.parameterName}'/>-->
                <div class="email">
                    <input
                    <@spring.formInput "userForm.email" 'placeholder="Почта"'/>
                </div>
                <div class="password">
                    <@spring.formPasswordInput "userForm.password" 'placeholder="Пароль"'/>
                </div>
                <div class="signInButton">
                    <input type="submit" value="Войти">
                </div>
                <div class="signInAccount">
                    <p>Еще не зарегистрированы? <a href="/signUp">Регистрация</a>.</p>
                </div>
            </form>
        </div>
    </div>
</body>

</html>