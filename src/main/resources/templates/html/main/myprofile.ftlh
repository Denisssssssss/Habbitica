<!DOCTYPE html>
<html lang="en">
<#include "base.ftlh">
<#macro title>Профиль</#macro>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/main/base.css">
    <link rel="stylesheet" href="../../css/main/index.css">
    <style>
        .user-info {
            width: 14em;
            background-color: white;
            min-height: 18em;
            display: inline-block;
            box-shadow: 0 0 1px rgba(0, 0, 0, 0.5);
        }

        .user-avatar {
            height: 14em;
            width: 12em;
            margin-left: auto;
            margin-right: auto;
            margin-top: 1em;
        }

        .user-name {
            width: 12em;
            margin-left: auto;
            margin-right: auto;
            min-height: 1.5em;
            margin-top: 1em;
            margin-bottom: 1em;
            text-align: center;
        }

        .avatar {
            width: inherit;
            height: inherit;
        }

        .mini-nav-panel {
            width: 9.4em;
            min-height: 1em;
            margin-top: 1.5em;
            text-align: center;
            font-size: x-large;
        }

        .mini-nav-option {
            width: inherit;
        }

        .mini-nav-option a {
            text-decoration: none;
        }
    </style>
</head>

<#macro content>
<body>
    <div class="container">
        <div class="row">
            <div class="col">
                <div class="user-info">
                    <div class="user-avatar">
                        <img src="${user.path}" class="avatar">
                    </div>
                    <div class="user-name">
                        ${user.username}
                    </div>
                </div>

                <div class="mini-nav-panel">
                    <div class="mini-nav-option">
                        <a href="/profile/transactions">Транзакции</a>
                    </div>
                    <div class="mini-nav-option">
                        <a href="/profile/tasks">Мои задачи</a>
                    </div>
                    <div class="mini-nav-option">
                        <a href="/profile/settings">Редактировать</a>
                    </div>
                    <div class="mini-nav-option">
                        <a href="/profile/achievements">Мои достижения</a>
                    </div>
                    <div class="mini-nav-option">
                        <a href="/friends">Мои друзья</a>
                    </div>
                </div>
            </div>
            <div class="col-6">
            </div>
            <div class="col">
            </div>
        </div>
    </div>

</body>
</#macro>
</html>