<#include "base.ftlh">
<#import "spring.ftl" as spring>
<#macro title>Task</#macro>
<#macro content>

<h1>Задачи</h1>
<p><a href="/profile">Профиль</a></p>
<#list tasks as task>
    <form action="/tasks/${task.id}" method="post">
        <h1>${task.title}</h1>
        <p>${task.description}</p>
        <p>${task.reward}</p>
        <p>
            <input type="submit" value="Взять">
        </p>
    </form>
</#list>
Категории:
<#list categories as ctg>
    <p><a href="/tasks/${ctg}">${ctg}</a></p>
</#list>
    <p><a href="/tasks/add">Добавить задачи</a></p>
</#macro>