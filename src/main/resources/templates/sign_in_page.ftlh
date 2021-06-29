<html>
<#import "spring.ftl" as spring>
<head>
    <title>Вход</title>
    <script type="text/javascript" src="../js/main.js"></script>
</head>
<body>
<@spring.bind "userForm"/>
<form method="post" action="/signIn">
    <#--    <input type='hidden' value='${_csrf.token}' name='${_csrf.parameterName}'/>-->
    <div class="container">
        <p>Make sure your account is confirmed!</p>
        <label>Email</label>
        <@spring.formInput "userForm.email"/>
        <label>Password</label>
        <@spring.formPasswordInput "userForm.password"/>
        <input type="submit" value="Enter">
    </div>
    <div class="container signin">
        <p>Еще нет аккаунта? <a href="/signUp">Регистрация</a>.</p>
    </div>
</form>
</body>
</html>