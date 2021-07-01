<!DOCTYPE html>
<html lang="en">
<#include "base.ftlh">
<#macro title>Магазин</#macro>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shop</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="../../css/main/base.css">
    <link rel="stylesheet" href="../../css/main/shop.css">
    <style>
        .shop-label {
            font-size: xx-large;
            margin-bottom: 1em;
        }

        .balance {
            display: contents;
            float: left;
            margin-right: 2em;
        }

        .products {
            margin-bottom: 5em;
        }

        .product-list {
            width: inherit;
            height: 24em;
            margin-bottom: 2em;
        }

        .product {
            display: inline-block;
            width: 14em;
            height: inherit;
            margin-left: 1.5em;
            background-color: white;
            box-shadow: 0 0 1px rgba(0, 0, 0, 0.5);
        }

        .product-image {
            height: 12em;
            width: 11em;
            margin-left: auto;
            margin-right: auto;
            margin-top: 1em;
        }

        .product-name, .product-description {
            text-align: center;
        }

        .product-description {
            margin-top: 1em;
        }

        .actions {
            margin-right: 0.7em;
            margin-top: 0.8em;
        }

        .buy-button {
            float: right;
        }

        .product-img {
            width: inherit;
            height: inherit;
        }

        .product-price {
            margin-top: 0.5em;
        }
    </style>
</head>
<#macro content>
<body>
    <div class="container">
        <div class="shop-label">  
            <div class="balance">
                Баланс: ${user.balance}
            </div>
        </div>
        <#if products??>
            <div class="products">
                <div class="product-list">
                    <#list products as product>
                        <form class="product" action="/shop/${product.id}", method="post">
                            <div class="product-name">
                                ${product.title}
                            </div>
                            <div class="product-description">
                                ${product.description}
                                    <div class="product-price">
                                        Цена: ${product.price}
                                    </div>
                            </div>
                            <#if forbidden_prod_id??>
                                <#if forbidden_prod_id == product.id>
                                    Недостаточно средств
                                </#if>
                            </#if>
                            <div class="actions">
                                <button type="submit" class="btn btn-primary buy-button">Купить</button>
                            </div>
                        </form>
                    </#list>
                </div>
            </#if>
        </div>
    </div>
</body>
</#macro>
</html>