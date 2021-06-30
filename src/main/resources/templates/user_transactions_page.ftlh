<#include "base.ftlh">
<#import "spring.ftl" as spring>
<#macro title>Транзакции!</#macro>
<#macro content>
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
</#macro>