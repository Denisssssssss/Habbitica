<html>
<#import "spring.ftl" as spring>
<head>
    <title>Sign in</title>
    <script type="text/javascript" src="../js/main.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/auth/signin.css">
    <meta http-equiv="Content-type" content="text/html" charset="utf-8">

    <style>
        /*Обнуление*/
        * {
            padding: 0;
            margin: 0;
            border: 0;
        }

        *, *:before, *:after {
            box-sizing: border-box;
        }

        :focus, :active {
            outline: none;
        }

        a:focus, a:active {
            outline: none;
        }

        nav, footer, header, aside {
            display: block;
        }

        html, body {
            height: 100%;
            width: 100%;
            font-size: 100%;
            line-height: 1;
            font-size: 14px;
            -ms-text-size-adjust: 100%;
            -moz-text-size-adjust: 100%;
            -webkit-text-size-adjust: 100%;
        }

        input, button, textarea {
            font-family: inherit;
        }

        input::-ms-clear {
            display: none;
        }

        button {
            cursor: pointer;
        }

        button::-moz-focus-inner {
            padding: 0;
            border: 0;
        }

        a, a:visited {
            text-decoration: none;
        }

        a:hover {
            text-decoration: none;
        }

        ul li {
            list-style: none;
        }

        img {
            vertical-align: top;
        }

        h1, h2, h3, h4, h5, h6 {
            font-size: inherit;
            font-weight: 400;
        }

        /*--------------------*/

        .wrapper {
            font-family: 'Montserrat', sans-serif;
        }

        .container {
            max-width: 1140px;
            margin: 0 auto;
        }

        .content {
        }

        .header {
            padding: 10px 0;
            background-color: rgba(246, 243, 234, 0.3);
        }

        .header__row {
            display: flex;
            justify-content: space-between;
        }

        .logo {
            display: flex;
            justify-content: space-between;
            width: 200px;

        }

        .logo__list a {
            font-size: 36px;
            color: #1a1a1a;
            font-weight: 400;
            line-height: 1.4;
        }

        .menu {
        }

        .menu__list {
            display: flex;
            justify-content: space-between;
            width: 700px;
        }

        .menu__element a {
            color: #1a1a1a;
            font-size: 18px;
            font-weight: 500;
            line-height: 2.8;
            transition: 0.7s;
        }

        .menu__element a:hover {
            color: #000;
        }



        .footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            margin: 0 auto;

        }

        .first-footer {
            padding: 70px 0;
            background-color: #fff;
        }

        .footer__list {
            display: flex;
            justify-content: space-between;
        }

        .footer__elements {
        }

        .footer__elements-title {
            font-size: 36px;
            font-weight: 900;
            text-transform: uppercase;
            color: #217ca3;
        }

        .footer__elements-logo {
            padding: 30px 0;
        }

        .footer__elements-logo-name {
            font-size: 36px;
            color: #1a1a1a;
            font-weight: 400;
            line-height: 1.4;
        }

        .footer__elements-text {
            width: 400px;
            font-weight: 400;
            line-height: 1.5;
            font-size: 16px;
            color: #1a1a1a;
            opacity: 75%;
        }

        .footer__contacts {
        }

        .footer__elements-description {
            width: 400px;
            font-weight: 400;
            line-height: 1.5;
            font-size: 16px;
            color: #1a1a1a;
            opacity: 75%;
            padding: 30px 0;
        }

        .footer__contacts-address {
            font-size: 16px;
            line-height: 1.4;
            color: #1a1a1a;
        }

        .footer__contacts-time {
            font-size: 16px;
            line-height: 1.4;
            color: #1a1a1a;
        }

        .footer__links {
            display: flex;
            justify-content: space-between;
            width: 120px;
            margin-top: 20px;
        }

        .footer__links-element a img {
            width: 20px;
            height: 20px;
        }

        .footer__button {
            width: 120px;
            text-align: center;
            padding: 10px 0;
            background-color: #9d6cd9;
            margin-top: 25px;
            border-radius: 30px;
            transition: 0.7s;
        }

        .footer__button:hover {
            background-color: #8e5acd;
            width: 150px;
        }

        .footer__button-content {
            color: #1a1a1a;
            font-weight: 700;
        }

        .second-footer {
            background-color: #1a1a1a;
            color: #fff;
            font-size: 16px;
            text-align: center;
            padding: 15px;
        }

        .signIn {
            text-align: center;
            font-size: 150%;
        }
    </style>
</head>
<body>
<div class="wrapper">

    <div class="content">

        <div class="header">
            <div class="container">
                <div class="header__row">
                    <ul class="logo">
                        <li class="logo__list"><a href="/">Habbitica</a></li>
                    </ul>
                    <div class="menu">
                        <ul class="menu__list">
                            <li class="menu__element"><a href="/">Главная</a></li>
                            <li class="menu__element"><a href="/profile">Личный Кабинет</a></li>
                            <li class="menu__element"><a href="/shop">Кошелек</a></li>
                            <li class="menu__element"><a href="/achievements">Достижения</a></li>
                            <li class="menu__element"><a href="/friends">Друзья</a></li>
                            <li class="menu__element"><a href="/signIn">Вход</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </div>

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
                    <@spring.formInput "userForm.email" 'placeholder="Почта"'/>
                </div>
                <div class="form-group">
                    <@spring.formPasswordInput "userForm.password" 'placeholder="Пароль"'/>
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
    <!--div class="signIn">
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
    </div-->
    <footer class="footer">
        <#if first_footer??>
            <div class="first-footer">
                <div class="container">
                    <ul class="footer__list">
                        <li class="footer__elements">
                            <div class="footer__elements-title">О Нас</div>
                            <div class="footer__elements-logo">
                                <div class="footer__elements-logo-name">Habbitica</div>
                            </div>
                            <p class="footer__elements-text">*Описание проекта*</p>
                        </li>
                        <li class="footer__elements">
                            <div class="footer__elements-title">Контакты</div>
                            <p class="footer__elements-description">Есть вопрос? Свяжитесь с нами через социальные сети
                                или
                                почту!</p>
                            <div class="footer__contacts">
                                <div class="footer__contacts-address">Казань, Россия</div>
                                <ul class="footer__links">
                                    <li class="footer__links-element"><a href=""><img src="../img/vk.png" alt=""></a>
                                    </li>
                                    <li class="footer__links-element"><a href=""><img src="../img/instagram.png" alt=""></a>
                                    </li>
                                    <li class="footer__links-element"><a href=""><img src="../img/twitter (1).png"
                                                                                      alt=""></a></li>
                                    <li class="footer__links-element"><a href=""><img
                                                    src="../static/img/facebook (1).png" alt=""></a>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </#if>
        <div class="second-footer">Copyright ©2021 All rights reserved</div>
    </footer>
</div>
</body>
</html>