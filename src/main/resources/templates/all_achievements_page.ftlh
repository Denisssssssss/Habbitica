<!DOCTYPE html>
<html lang="en">
<#import "spring.ftl" as spring>
<head>
    <meta charset="UTF-8">
    <title>Achievements</title>
    <style>
        h1 {
            font-size: 150%;
        }
    </style>
</head>
<body>
<h1>Достижения</h1>
<p><a href="/profile">Профиль</a></p>
<#list achievements as ach>
        <h1>${ach.title}</h1>
        <p>${ach.description}</p>
        <p>${ach.reward}</p>
</#list>
Категории:
<#list categories as ctg>
    <p><a href="/achievements/${ctg}">${ctg}</a></p>
</#list>
</body>
</html>