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
<#list achievements as achievement>
        <h1>${achievement.title}</h1>
        <p>${achievement.description}</p>
</#list>
<div class="back">
    <a href="/profile/${user.getId()}">Профиль</a>
</div>
</body>
</html>