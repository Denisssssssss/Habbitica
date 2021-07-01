<#include "base.ftlh">
<#import "spring.ftl" as spring>
<#macro title>Магазин</#macro>
<#macro content>
<h1>Магазин</h1>
<p><a href="/profile">Профиль</a></p>
<p>Баланс: ${user.balance}</p>
<#list products as product>
    <form action="/shop/${product.id}" method="post">
        <h1>${product.title}</h1>
        <p>${product.description}</p>
        <p>${product.price}</p>
        <#if forbidden_prod_id??>
            Недостаточно средств
        </#if>
        <p>
            <input type="submit" value="Купить">
        </p>
    </form>
</#list>
</#macro>