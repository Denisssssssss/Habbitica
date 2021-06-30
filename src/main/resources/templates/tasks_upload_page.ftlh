<#include "base.ftlh">
<#import "spring.ftl" as spring>
<#macro title>Task</#macro>
<#macro content>
<h1>Задачи</h1>
<p><a href="/profile">Профиль</a></p>
<@spring.bind "taskForm"/>
<form action="/tasks/add" method="post">
    <#--    <input type='hidden' value='${_csrf.token}' name='${_csrf.parameterName}'/>-->
    <@spring.formTextarea "taskForm.title" 'placeholder="Название"'/>
    <@spring.formTextarea "taskForm.description" 'placeholder="Описание"'/>
    <@spring.formTextarea "taskForm.reward" 'placeholder="Награда"'/>
    <@spring.formTextarea "taskForm.category" 'placeholder="Категория"'/>
    <input type="submit" value="Enter">
</form>
</#macro>