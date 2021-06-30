<!DOCTYPE html>
<html lang="en">
<#import "spring.ftl" as spring>
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <style>
        h1 {
            font-size: 150%;
        }
    </style>
</head>
<body>
<h1>Достижения ${user.getUsername()}</h1>
<table>
    <#list achievements as ach>
        <tr>
            <td><img src="${ach.path}" style="width:25px;height:25px" alt="${ach.path}"></td>
            <td>${ach.title}</td>
            <td>${ach.description}</td>
        </tr>
    </#list>
</table>
<div class="back">
    <a href="/profile/${user.getId()}">Профиль</a>
</div>
</body>
</html>