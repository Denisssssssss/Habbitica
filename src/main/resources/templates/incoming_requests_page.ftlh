<#include "base.ftlh">
<#macro title>Incoming requests</#macro>
<head>
    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
            crossorigin="anonymous">
    </script>
    <link rel="stylesheet" , href="../css/style.css">
    <style>
        .tasks-container {
            width: 100%;
            min-height: 1em;
            background-color: inherit;
            text-align: center;
        }

        .task {
            width: inherit;
            min-height: 3em;
            background-color: #7bb3fd;
            margin-bottom: 2em;
        }

        .task-option {
            display: inline-flex;
            margin-left: 1em;
            margin-top: 0.3em;
            text-align: center;
        }

        .task-category {
            min-width: 6em;
        }

        .task-description {
            min-width: 20em;
        }

        .task-reward {
            min-width: 3.6em;
        }

        .label {
            width: 100%;
            font-size: xx-large;
            margin-bottom: 1em;
            text-align: center;
        }

        .label a {
            text-decoration: none;
        }

        .label {
            width: 100%;
            font-size: xx-large;
            margin-bottom: 1em;
            text-align: center;

        }

        .achievement-image {
            width: 4em;
            height: 4em;
        }

        .achievement-image img {
            height: inherit;
            width: inherit;
            object-fit: cover;
        }

        .achievement-name {
            width: 8em;
        }

        .achievement-description {
            width: 20em;
        }

        .achievement-reward {
            width: 6em;
        }

        .label.achievement-categories {
            margin-top: 2em;
        }

        .categories {
            text-align: center;
            font-size: x-large;
        }

        .categories a {
            text-decoration: none;
        }
    </style>
</head>
<#macro content>
    <div>
        <#if requests?has_content>
            <div class="container">
                <div class="row">
                    <div class="col">
                    </div>
                    <div class="col-6">
                        <div class="label achievements">
                            Входящие заявки
                        </div>
                        <div class="tasks-container">
                            <#list requests as r>
                                <form action="/friends/add/${r.id}" method="get">
                                    <div class="task">
                                        <div class="task-option task-category">
                                            ${r.getUsername()}
                                        </div>
                                        <div class="task-option task-actions">
                                            <button type="submit" class="btn btn-primary buy-button">Добавить</button>
                                        </div>
                                    </div>
                                </form>
                            </#list>
                        </div>
                        <div class="label achievement-categories">
                            <a href="/friends/sent">Исходящие заявки</a>
                        </div>
                        <div class="col">
                        </div>
                    </div>
                </div>
            </div>
        </#if>
    </div>
</#macro>