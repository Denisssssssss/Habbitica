<!DOCTYPE html>
<html lang="en">
<#import "spring.ftl" as spring>
<head>
    <meta charset="UTF-8">
    <title>Профиль</title>
</head>
<body>
<h1>Настройки</h1>
<form enctype="multipart/form-data" method="post" action="/profile/settings">
    <p><input type="file" name="image">
        <input type="text" name="username" placeholder="${user.username}">
        <input type="submit" value="Добавить">
    </p>
</form>
</body>
</html>