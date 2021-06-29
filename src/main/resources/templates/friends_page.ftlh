<html>
<head>
    <title>Friends</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
            crossorigin="anonymous">
    </script>
    <link rel="stylesheet" , href="../css/style.css">
</head>
<body onload=>
<h1>Friends</h1>
<script>
    function renderTable(suggestions, table) {
        let innerHtml = '<tr>\n' +
            '    <th>Username</th>\n' +
            '</tr>';
        for (let i = 0; i < suggestions.length; i++) {
            innerHtml += '<tr>';
            innerHtml += '<td><p>' + suggestions[i]['id'] + suggestions[i]['username'] + '</p></td>';
            innerHtml += '</tr>'
        }

        table.html(innerHtml);
    }

    function search(username) {
        $.ajax({
                type: "GET",
                url: "/friends/search",
                success: function (response) {
                    renderTable(response.friends, $('#table'))
                },
                error: function (response) {
                    console.log(response)
                    console.log("error!")
                },
                dataType: "json",
                data: {
                    page: 0,
                    size: 100,
                    q: username
                }
            }
        )
    }


</script>
<div>
    <input type="text" id="username">
    <button onclick="search($('#username').val())">Search</button>
</div>
<div>
    <table id="friends_table">
        <#if friends?has_content>
            <caption>My friends</caption>
            <tr>
                <th>Username</th>
            </tr>
            <#list friends as s>
                <tr>
                    <td><a href="/profile/${s.getId()}">${s.getUsername()}</a></td>
                </tr>
            </#list>
        </#if>
    </table>
</div>
<div>
    <table id="table">
        <#if suggestions?has_content>
            <caption>Suggestions</caption>
            <tr>
                <th>Username</th>
            </tr>
            <#list suggestions as s>
                <tr>
                    <td><a href="/profile/${s.getId()}">${s.getUsername()}</a></td>
                </tr>
            </#list>
        </#if>
    </table>
</div>
<p><a href="/friends/sent">Pending requests</a></p>
<p><a href="/friends/incoming">Incoming requests</a></p>
</body>
</html>