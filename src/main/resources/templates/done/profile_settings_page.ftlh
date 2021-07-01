<#include "base.ftlh">
<#import "spring.ftl" as spring>
<#macro title>Profile</#macro>
<#macro content>
<h1>Настройки</h1>
<form enctype="multipart/form-data" method="post" action="/profile/settings">
    <p><input type="file" name="image">
        <input type="text" name="username" placeholder="${user.username}">
        <input type="submit" value="Добавить">
    </p>
</form>
</#macro>