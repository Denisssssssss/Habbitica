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
<table>
    <#list transactions as transaction>
        <tr>
            <td>${transaction.date}</td>
            <td>${transaction.target}</td>
            <td>${transaction.value}</td>
        </tr>
    </#list>
</table>
</body>
</html>