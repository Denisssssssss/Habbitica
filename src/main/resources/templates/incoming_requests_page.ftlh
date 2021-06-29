<html>
<head>
    <title>Incoming requests</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
            crossorigin="anonymous">
    </script>
    <link rel="stylesheet" , href="../css/style.css">
</head>
<body>
<h1>Incoming requests</h1>

<div>
    <table id="table">
        <#if requests?has_content>
            <caption>Incoming requests</caption>
            <tr>
                <th>Username</th>
            </tr>
            <#list requests as s>
                <tr>
                    <td>${s.getUsername()}</td>
                    <td><a href="/profile/${s.getId()}">Add to friends</a></td>
                </tr>

            </#list>
        </#if>
    </table>
</div>
<p><a href="/friends/sent">Pending requests</a></p>
<p><a href="/friends">Friends</a></p>
</body>
</html>