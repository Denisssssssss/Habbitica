<html>
<#import "spring.ftl" as spring>
<head>
    <title>Регистрация</title>
</head>
<body>
<@spring.bind "userForm"/>
<form method="post" action="/signUp">
    <#--    <input type='hidden' value='${_csrf.token}' name='${_csrf.parameterName}'/>-->
    <div class="container">
        <p>Please fill in this form to create an account</p>

        <label>Email</label>
        <@spring.formInput "userForm.email"/>

        <label>Password</label>
        <@spring.formPasswordInput "userForm.password"/>

        <label>Username</label>
        <@spring.formInput "userForm.username"/>

        <#if invalid_email??>
            Email занят
        </#if>

        <#if invalid_password??>
            Слабый пароль
        </#if>

        <input type="submit" value="Enter">
    </div>
    <div class="container signin">
        <p>Уже есть аккаунт? <a href="/signIn">Войти</a>.</p>
    </div>
</form>
</body>
</html>