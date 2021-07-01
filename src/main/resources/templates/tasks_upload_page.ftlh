<#include "base.ftlh">
<#macro title>Task</#macro>
<#macro content>
<h1>Задачи</h1>
<p><a href="/profile">Профиль</a></p>
<form action="/tasks/add" method="post">
    <input type="text" name="title" placeholder="Название"/>
    <input type="text" name="description" placeholder="Описание"/>
    <input type="text" name="reward" placeholder="Награда"/>
    <input type="text" name="category" placeholder="Категория"/>
    <input type="submit" value="Enter">
</form>
</#macro>