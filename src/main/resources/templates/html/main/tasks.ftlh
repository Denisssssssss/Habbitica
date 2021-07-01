<!DOCTYPE html>
<html lang="en">
<#include "base.ftlh">
<#macro title>Задачи</#macro>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tasks</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/main/base.css">
    <link rel="stylesheet" href="../../css/main/tasks.css">
    <style>
        .tasks-container {
            width: 100%;
            min-height: 1em;
            background-color: inherit;
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
    <body>
    <div class="container">
        <div class="row">
            <div class="col">
            </div>
            <div class="col-6">
                <div class="label achievements">
                    Все задания
                </div>
                <div class="tasks-container">
                    <#list tasks as task>
                        <form action="/tasks/${task.id}" method="post">
                            <div class="task">
                                <div class="task-option task-category">
                                    ${task.title}
                                </div>
                                <div class="task-option task-description">
                                    ${task.description}
                                </div>
                                <div class="task-option task-reward">
                                    ${task.reward}
                                </div>
                                <div class="task-option task-actions">
                                    <button type="submit" class="btn btn-primary buy-button">Взять</button>
                                </div>
                            </div>
                        </form>
                    </#list>
                </div>
                <div class="label achievement-categories">
                    Категории
                </div>
                <div class="categories">
                    <#list categories as ctg>
                        <p><a href="/tasks/${ctg}">${ctg}</a></p>
                    </#list>
                </div>
            </div>
            <div class="col">

            </div>
        </div>
    </div>
    </body>
</#macro>
</html>