<#include "base.ftlh">
<#import "spring.ftl" as spring>
<#macro title>Sent requests</#macro>
<#macro head>
    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
            crossorigin="anonymous">
    </script>
    <link rel="stylesheet" , href="../css/style.css">
</#macro>
<#macro content>
<h1>Sent requests</h1>

<div>
    <table id="table">
        <#if requests?has_content>
            <caption>Sent requests</caption>
            <tr>
                <th>Username</th>
            </tr>
            <#list requests as s>
                <tr>
                    <td>${s.getUsername()}</td>
                </tr>
            </#list>
        </#if>
    </table>
</div>
<p><a href="/friends/incoming">Incoming requests</a></p>
<p><a href="/friends">Friends</a></p>
</#macro>