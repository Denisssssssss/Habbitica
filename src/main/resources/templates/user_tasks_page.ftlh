<!DOCTYPE html>
<html lang="en">
<#import "spring.ftl" as spring>
<head>
    <meta charset="UTF-8">
    <title>Профиль</title>
    <style>
        h1 {
            font-size: 150%;
        }
    </style>
</head>
<body>
<h1>Мои задачи</h1>
<#list tasks as task>
    <form action="/profile/tasks/${task.id}" method="post">
        <h1>${task.title}</h1>
        <p>${task.description}</p>
        <p>${task.reward}</p>
        <p>
            <input type="submit" value="Завершить">
        </p>
    </form>
</#list>
<h1>
    <p><a href="/tasks">Другие задачи</a></p>
</h1>
</body>
</html>