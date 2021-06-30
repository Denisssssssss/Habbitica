<!DOCTYPE html>
<html lang="en">
<#import "spring.ftl" as spring>
<head>
    <meta charset="UTF-8">
    <title>Транзакции</title>
    <style>
        h1 {
            font-size: 150%;
        }
    </style>
</head>
<body>
<h1>Транзакции</h1>
<p><a href="/profile">Профиль</a></p>
<#list transactions as transaction>
    <p>${transaction.date}</p>
    <p>${transaction.target}</p>
    <p>${transaction.value}</p>
</#list>
</body>
</html>