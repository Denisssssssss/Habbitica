<!DOCTYPE html>
<html lang="en">
<#include "base.ftlh">
<#macro title>Мои друзья</#macro>
<head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"
            crossorigin="anonymous">
    </script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Friends</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <style>
        .friends-list {
            text-align: center;
            background-color: #ffffff;
            box-shadow: 0 0 1px rgba(0, 0, 0, 0.5);
            width: 14em;
            min-height: 4em;
        }

        .search-form {
            display: flex;
        }

        .label {
            text-align: center;
            max-width: 7em;
            font-size: xx-large;
            margin-bottom: 1em;
        }

        .friend-info {
            text-align: center;
            margin-bottom: 1em;
        }

        #do-search {
            display: inline-block;
            height: 80px;
            width: 800px;
        }

        #find-user-input {
            height: 2em;
            font-size: large;
            margin-right: 0.5em;
        }

        #find-user-button {
            height: 2.2em;
            width: 2.2em;
            display: flex;
            border: none;
            background-color: inherit;
        }

        #find-user-button:hover {
            color: rgb(94, 188, 250);
        }

        .input-group {
            width: 80% !important;
        }

        .suggestions-list {
            width: 80%;
            min-height: 0em;
            background-color: #ffffff;
            box-shadow: 0 0 1px rgba(0, 0, 0, 0.5);
        }

        .user-info {
            text-align: center;
            margin-bottom: 1em;
        }

        .mini-nav-panel {
            text-align: center;
            width: 9.4em;
            min-height: 1em;
            margin-top: 1.5em;
            text-align: center;
            font-size: medium;
        }

        .mini-nav-option {
            text-align: center;
            width: inherit;
        }

        .mini-nav-option a {
            text-align: center;
            text-decoration: none;
        }
    </style>
</head>

<body onload=>
<#macro content>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js">

</script>
<script>
    function renderTable(suggestions, table) {
        let innerHtml = '<tr>\n' +
            '    <th>Username</th>\n' +
            '</tr>';
        for (let i = 0; i < suggestions.length; i++) {
            innerHtml += '<tr>';
            innerHtml += '<td><p><a href=/profile/' + suggestions[i]['id'] + '>' + suggestions[i]['username'] + '</a></p></td>';
            innerHtml += '</tr>'
        }

        table.html(innerHtml);
    }

    function test() {
        alert("func")
    }

    function search() {
        var query = document.getElementById('find-user-input').value;
        $.ajax({
                type: "POST",
                url: "/friends/search",
                success: function (response) {
                    $('#suggestions-list').empty()
                    for (let i = 0; i < response.users.length; i++) {
                        console.log(response.users[i]['username'])
                        $('#suggestions-list')
                            .append('<div class="user-info">' +
                                '<a href=/profile/' +
                                response.users[i]['id'] +
                                '>' +
                                response.users[i]['username'] + '</a>' +
                                '</div>'
                            )
                    }
                },
                error: function (response) {
                    console.log(response)
                    console.log("error!")
                },
                dataType: "json",
                data: {
                    page: 0,
                    size: 100,
                    q: query
                }
            }
        )
    }


</script>
<div class="container">
    <div class="row">
        <div class="col">
            <div class="label friends">
                Друзья
            </div>
            <div class="friends-list">
                <#if friends?has_content>
                    <#list friends as s>
                        <div class="friend-info">
                            <a href="/profile/${s.getId()}">${s.getUsername()}</a>
                        </div>
                    </#list>
                </#if>
                <div class="mini-nav-panel">
                    <div class="mini-nav-option">
                        <p><a href="/friends/sent">Исходящие заявки</a></p>
                    </div>
                    <div class="mini-nav-option">
                        <p><a href="/friends/incoming">Входящие заявки</a></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-6">
            <div class="label search-friends">
                <nobr>
                    Найти Друзей
                </nobr>
            </div>
            <form class="search-form">
                <div class="input-group mb-3">
                    <input name="login_or_name" id="find-user-input" type="text" class="form-control"
                           placeholder="Find someone..." aria-describedby="basic-addon1">
                </div>
                <button id="find-user-button" type="button" onclick="search().preventDefault()">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                         class="bi bi-search" viewBox="0 0 16 16">
                        <path
                                d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                    </svg>
                </button>
            </form>
            <table id="table">
            </table>
            <div class="label suggestions">
                Предложения
            </div>
            <div class="suggestions-list" id="suggestions-list">
                <#if suggestions?has_content>
                    <#list suggestions as s>
                        <div class="user-info">
                            <a href="/profile/${s.getId()}">${s.getUsername()}</a>
                        </div>
                    </#list>
                </#if>
            </div>

        </div>
        <div class="col">
        </div>
    </div>
</div>
</body>
</#macro>

</html>