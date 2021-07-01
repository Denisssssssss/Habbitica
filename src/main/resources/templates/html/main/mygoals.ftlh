<!DOCTYPE html>
<html lang="en">
<#include "base.ftlh">
<#macro title>Личные достижения</#macro>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Goals</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/main/base.css">
    <link rel="stylesheet" href="../../css/main/mygoals.css">
    <style>
        .label {
            width: 100%;
            font-size: xx-large;
            margin-bottom: 1em;
            text-align: center;

        }

        .achievement-image {
            width: 4em;
            height: 4em;
        }

        .achievement-image img{
            height: inherit;
            width: inherit;
            object-fit: cover;
        }

        .achievement-name {
            width: 8em;
        }

        .achievement-description {
            width: 20em;
        }

        .achievement-reward {
            width: 6em;
        }

        .label.achievement-categories {
            margin-top: 2em;
        }

        .categories {
            text-align: center;
            font-size: x-large;
        }

        .categories a {
            text-decoration: none;
        }
    </style>
</head>

<#macro content>
    <body>
    <div class="container">
        <div class="row">
            <div class="col">
            </div>
            <div class="col-6">
                <div class="label achievements">
                    Достижения
                </div>
                <table>
                    <#list achievements as ach>
                        <tr>
                            <td class="achievement-image"><img src="${ach.path}"></td>
                            <td class="achievement-name">${ach.title}</td>
                            <td class="achievement-description">${ach.description}</td>
                            <td class="achievement-reward">${ach.reward}</td>
                        </tr>
                    </#list>
                </table>
            </div>
            <div class="col">

            </div>
        </div>
    </div>
    </body>
</#macro>
</html>