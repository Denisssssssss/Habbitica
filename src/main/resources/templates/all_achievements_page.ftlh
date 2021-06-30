<#include "base.ftlh">
<#import "spring.ftl" as spring>
<#macro title>Profile</#macro>
<#macro content>
<h1>Достижения</h1>
<p><a href="/profile">Профиль</a></p>
<table>
    <#list achievements as ach>
        <tr>
            <td><img src="${ach.path}" style="width:25px;height:25px" alt="${ach.path}"></td>
            <td>${ach.title}</td>
            <td>${ach.description}</td>
            <td>${ach.reward}</td>
        </tr>
    </#list>
</table>
Категории:
<#list categories as ctg>
    <p><a href="/achievements/${ctg}">${ctg}</a></p>
</#list>
</#macro>