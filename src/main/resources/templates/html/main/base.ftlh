<!DOCTYPE html>
<html>

<head>

    <title><@title></@title></title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
          rel="stylesheet">
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
        h1 {
            font-size: 150%;
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
                            <#if user??>
                                <li class="menu__element"><a href="/signIn">Выход</a></li>
                            <#else>
                                <li class="menu__element"><a href="/signIn">Выход</a></li>
                            </#if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <@content></@content>

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
                        <p class="footer__elements-text">Приложение, предназначенное для выработки новых полезных привычек с элементами геймификации.</p>
                    </li>
                    <li class="footer__elements">
                        <div class="footer__elements-title">Контакты</div>
                        <div class="footer__contacts">
                            <div class="footer__contacts-address">Казань, Россия</div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="second-footer">Copyright ©2021 All rights reserved</div>
        </#if>
    </footer>

</div>

</body>

</html>