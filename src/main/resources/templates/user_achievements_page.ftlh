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
<h1>Мои достижения</h1>
<#list achievements as achievement>
    <form action="/profile/achievements" method="get">
        <h1>${achievement.title}</h1>
        <p>${achievement.description}</p>
    </form>
    <div class="back">
        <a href="/profile">Профиль</a>
    </div>
</#list>
</body>
</html>