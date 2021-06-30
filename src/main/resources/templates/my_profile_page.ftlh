<#include "base.ftlh">
<#import "spring.ftl" as spring>
<#macro title>Profile</#macro>
<#macro content>
    <h1>Profile</h1>
    <h2>${user.username}</h2>
    <img src="${user.path}" style="width:250px;height:250px" alt="${user.path}">
    <div class="container transactions">
        <p><a href="/profile/transactions" title="Мои транзакции">Транзакции</a>.</p>
    </div>
    <div class="container shop">
        <p><a href="/shop" title="Магазин">Магазин</a>.</p>
    </div>
    <div class="container my_tasks">
        <p><a href="/profile/tasks" title="Мои задания">Мои задачи</a>.</p>
    </div>
    <div class="container refactor">
        <p><a href="/profile/settings" title="Редактировать">Редактировать</a>.</p>
    </div>
    <div class="container my_achievements">
        <p><a href="/profile/achievements" title="Мои достижения">Мои достижения</a>.</p>
    </div>
    <div class="container my_friends">
        <p><a href="/friends" title="My friends">Мои друзья</a>.</p>
    </div>
</#macro>