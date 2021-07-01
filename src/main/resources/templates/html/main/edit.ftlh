<!DOCTYPE html>
<html lang="en">
<#include "base.ftlh">
<#macro title>Профиль</#macro>
<#macro content>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/main/base.css">

    <style>
        #settings-container {
            margin-top: 2em;
            width: 100%;
            min-height: 4em;
            text-align: center;

        }

        #settings-block {
            background-color: white;
            border-radius: 1em;
            display: inline-block;
            width: 60%;
            min-height: 5em;
            border: 1px solid rgb(151, 151, 151);
        }

        #choose-setting-container {
            width: 100%;
            height: 6em;
            text-align: center;
        }

        #settings-variants {
            display: flex;
            margin-top: 1em;
            width: 20%;
            height: 4em;
            margin-left: 14%;
        }

        .settings-variant {
            display: flex;
            height: 3.5em;
            margin-top: 0.25em;
            width: 3.5em;
            margin-left: 1.5em;
            text-align: center;
            color: #6b6b6b;
        }

        .settings-variant:hover {
            margin-top: 0;
            color: mediumpurple;
        }

        #profile-settings-variant {
            margin-top: 0;
            color: mediumpurple;
        }

        .settings-change-block {
            display: none;
        }

        #settings-options {
            display: inline-block;
            width: 90%;
            min-height: 5em;
            margin-top: 1em;
            margin-bottom: 1em;
            text-align: center;
        }

        .settings-option{
            display: inline-block;
            margin-top: 0.2em;
            margin-bottom: 0.2em;
            border-bottom: 2px solid rgb(41, 116, 255);
            min-height: 3em;
            width: 86%;
        }

        .settings-option-info {
            margin-top: 0.75em;
            margin-bottom: 0.7em;
        }

        .settings-option-descr {
            display: inline-flex;
            margin-right: 2em;
            margin-left: 2em;
            font-size: 16px;
            font-size: 1vw;
        }

        .settings-option-descr.label{
            width: 10%;
        }
        .settings-option-descr.description{
            width: 40%;
        }

        .settings-option-descr.right-control{
            width: 12%;
        }

        #security-settings-container {
            display: none;
        }
    </style>
</head>

<body>

<!--nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <a class="navbar-brand" href="#">Habbitica</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
        aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="myprofile.ftlh">Главная</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="myprofile.ftlh">Личный кабинет</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="shop.ftlh">Кошелек</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="goals.ftlh">Достижения</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="friends.ftlh">Друзья</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../auth/signin.ftlh">Вход</a>
            </li>
        </ul>
    </div>
</nav-->

<div class="settings-block">
    <div id="settings-container">
        <div id="settings-block">
            <div id="settings-options">
                <div id="profile-settings-container">
                    <form method="POST" enctype="multipart/form-data" id="change-avatar-super-form"
                          action="/profile/settings">
                        <div class="settings-option" id="change-avatar-option">
                            <div class="settings-option-info">
                                <div class="settings-option-descr label">
                                    Аватар
                                </div>
                                <div class="settings-option-descr description">
                                    <input name='image' type="file">
                                </div>
                                <div>
                                    <input type="text" name="username" placeholder="${user.username}">
                                </div>
                                    <div class="settings-option-descr right-control">
                                        <input type="submit" value="Изменить">
                                    </div>
                                </div>
                            </div>
                        </form>
                        </div>
                    </div>
        </div>
    </div>
</div>

<footer class="footer">
    <div class="second-footer">Copyright ©2021 All rights reserved</div>
</footer>
</body>

</html>
</#macro>