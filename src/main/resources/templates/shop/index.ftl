<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>SHOP++商城 - Powered By SHOP++</title>
    <meta name="author" content="SHOP++ Team"/>
    <meta name="copyright" content="SHOP++"/>
    <meta name="keywords" content="SHOP++商城"/>
    <meta name="description" content="SHOP++商城"/>
    <link href="/shop/favicon.ico" rel="icon" type="image/x-icon"/>
    <link href="/shop/default/slider/slider.css" rel="stylesheet" type="text/css"/>
    <link href="/shop/default/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="/shop/default/css/index.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/shop/default/js/jquery.js"></script>
    <script type="text/javascript" src="/shop/default/js/jquery.tools.js"></script>
    <script type="text/javascript" src="/shop/default/js/jquery.lazyload.js"></script>
    <script type="text/javascript" src="/shop/default/slider/slider.js"></script>
    <script type="text/javascript" src="/shop/default/js/common.js"></script>
    <style type="text/css">
        .header {
            margin-bottom: 0px;
        }
    </style>
    <script type="text/javascript">
        $().ready(function () {

            var $productCategoryMenuItem = $("#productCategoryMenu li");
            var $slider = $("#slider");
            var $newArticleTab = $("#newArticle ul.tab");
            var $hotGoodsImage = $("div.hotGoods img");

            $productCategoryMenuItem.hover(
                function () {
                    $(this).children("div.menu").show();
                }, function () {
                    $(this).children("div.menu").hide();
                }
            );

            $slider.nivoSlider({
                effect: "random",
                animSpeed: 1000,
                pauseTime: 6000,
                controlNav: true,
                keyboardNav: false,
                captionOpacity: 0.4
            });

            $newArticleTab.tabs("ul.tabContent", {
                tabs: "li",
                event: "mouseover"
            });

            $hotGoodsImage.lazyload({
                threshold: 100,
                effect: "fadeIn",
                skip_invisible: false
            });

        });
    </script>
</head>
<body>
<script type="text/javascript">
    $().ready(function () {

        var $headerName = $("#headerName");
        var $headerLogin = $("#headerLogin");
        var $headerRegister = $("#headerRegister");
        var $headerLogout = $("#headerLogout");
        var $goodsSearchForm = $("#goodsSearchForm");
        var $keyword = $("#goodsSearchForm input");
        var defaultKeyword = "商品搜索";

        var username = getCookie("username");
        var nickname = getCookie("nickname");
        if ($.trim(nickname) != "") {
            $headerName.text(nickname).show();
            $headerLogout.show();
        } else if ($.trim(username) != "") {
            $headerName.text(username).show();
            $headerLogout.show();
        } else {
            $headerLogin.show();
            $headerRegister.show();
        }

        $keyword.focus(function () {
            if ($.trim($keyword.val()) == defaultKeyword) {
                $keyword.val("");
            }
        });

        $keyword.blur(function () {
            if ($.trim($keyword.val()) == "") {
                $keyword.val(defaultKeyword);
            }
        });

        $goodsSearchForm.submit(function () {
            if ($.trim($keyword.val()) == "" || $keyword.val() == defaultKeyword) {
                return false;
            }
        });

    });
</script>

<!--
   header 区域
       注册+登录+搜索+商品分类、首页、手机数码等菜单
-->
<#include  "include/header.ftl">

<div class="container index">
    <!--
            商品分类数据节点展示
               实现思路
                   1.查询根节点(6类)  grade=0
                       循环输出li标签
                   2.根据根节点id 查询每个分类一级节点 grade=1
                   3.根据根节点查询品牌节点
                   4.根据一级节点查询二级节点
        -->
    <div class="row">

        <div class="span2">
            <div id="productCategoryMenu" class="productCategoryMenu">
                <ul>
                    <@product_category_root_List  count=6>
                        <#list productCategoryRootList as productCategoryRoot>
                            <li>
                                <div class="item<#if !productCategoryRoot_has_next> last</#if>">
                                    <@product_category_parent_List parentId=productCategoryRoot.id  count=3>
                                        <div>
                                            <#list productCategoryParentList as productCategoryParen>
                                                <a href="/shop/goods/list/${productCategoryParen.id}.html">
                                                    <strong>${productCategoryParen.name}</strong>
                                                </a>
                                            </#list>
                                        </div>
                                    </@product_category_parent_List>
                                    <@brand_list productCategoryId=productCategoryRoot.id count=4>
                                        <div>
                                            <#list brandList as brand>
                                                <a href="/shop/brand/content/${brand.id}.html">${brand.name}</a>
                                            </#list>
                                        </div>
                                    </@brand_list>
                                </div>
                                <div class="menu">
                                    <@product_category_parent_List parentId=productCategoryRoot.id >
                                        <#list productCategoryParentList as productCategoryParen>
                                            <dl class="clearfix<#if !productCategoryParen_has_next> last</#if>">
                                                <dt>
                                                    <a href="/shop/goods/list/${productCategoryParen.id}.html">${productCategoryParen.name}</a>
                                                </dt>
                                                <@product_category_children_List parentId=productCategoryParen.id count=8>
                                                    <#list productCategoryChildrenList as productCategoryChildren>
                                                        <dd>
                                                            <a href="/shop/goods/list/${productCategoryChildren.id}.html">${productCategoryChildren.name}</a>|
                                                        </dd>
                                                    </#list>
                                                </@product_category_children_List>
                                            </dl>
                                        </#list>
                                    </@product_category_parent_List>
                                    <div class="auxiliary">
                                        <div>
                                            <strong>推荐品牌</strong>
                                            <!--
                                                推荐品牌
                                            -->
                                            <@brand_list productCategoryId=productCategoryRoot.id>
                                                <#if brandList??>
                                                    <#list brandList as brand>
                                                        <a href="/shop/brand/content/${brand}.html">${brand.name}</a>
                                                    </#list>
                                                </#if>
                                            </@brand_list>
                                        </div>
                                        <@promotion_List productCategoryId=productCategoryRoot.id>
                                            <div>
                                                <strong>热点促销</strong>
                                                <#list promotionList as promotion>
                                                    <a href="/shop/promotion/content/${promotion}.html"
                                                       title="${promotion.title}">
                                                        <img src="${promotion.image}"
                                                             alt="${promotion.title}"/>
                                                    </a>
                                                </#list>
                                            </div>
                                        </@promotion_List>
                                    </div>
                                </div>
                            </li>
                        </#list>
                    </@product_category_root_List>
                </ul>
            </div>
        </div>
        <!--
                轮询图片
           -->
        <div class="span10">
            <@ad_position position =1  type =1 />
        </div>
    </div>

    <!--
       手机平板 移动电源广告位 +商品动态&活动促销
    -->
    <div class="row">
        <div class="span9">
            <@ad_position position =2  type =1 />
        </div>

        <!--商品动态&活动促销-->
        <div class="span3">
            <div id="newArticle" class="newArticle">
                <ul class="tab">
                    <@article_category_list count=2>
                        <#list articleCategoryList as articleCategory>
                            <li>
                                <a href="/shop/article/list/${articleCategory.id}.html" target="_blank">${articleCategory.name}</a>
                            </li>
                        </#list>
                    </@article_category_list>
                </ul>
                <ul class="tabContent">
                    <@article_list articleCategoryId=articleCategoryList[0].id count=6>
                        <#list articleList as article>
                            <li>
                            <a href="/shop/article/content/201908/1/${article.id}.html" title="${article.title}"
                               target="_blank">${article.title}</a>
                        </li>
                        </#list>
                    </@article_list>
                </ul>
                <ul class="tabContent hidden">
                    <@article_list articleCategoryId=articleCategoryList[1].id count=6>
                        <#list articleList as article>
                            <li>
                                <a href="/shop/article/content/201908/1/${article.id}.html" title="${article.title}"
                                   target="_blank">${article.title}</a>
                            </li>
                        </#list>
                    </@article_list>
                </ul>
            </div>
        </div>
    </div>


    <!--
       热门商品
    -->
    <@product_category_root_List  count=3>
        <@ad_position position = 4 type=1>
            <#if adList??>
                <#assign aList = adList />
            </#if>
        </@ad_position>
        <#list productCategoryRootList as productCategoryRoot>
            <div class="row">
                <div class="span12">
                    <div class="hotGoods">
                        <dl class="title${productCategoryRoot_index +1 }">
                            <dt>
                                <a href="/shop/goods/list/${productCategoryRoot.id}.html">${productCategoryRoot.name}</a>
                            </dt>
                            <@product_category_parent_List parentId=productCategoryRoot.id >
                                <#list productCategoryParentList as productCategoryParen>
                                    <dd>
                                        <a href="/shop/goods/list/${productCategoryParen.id}.html">${productCategoryParen.name}</a>
                                    </dd>
                                </#list>
                            </@product_category_parent_List>
                        </dl>
                        <!--分栏广告位展示-->
                        <div>
                                <#assign ad = aList[productCategoryRoot_index]/>
                                <#if  ad.url??>
                                    <a href="${ad.url}">
                                        <img src="${ad.path}" alt="${ad.title}" title="${ad.title}"/>
                                    </a>
                                <#else>
                                    <img src="${ad.path}" alt="${ad.title}" title="${ad.title}"/>
                                </#if>
                        </div>


                        <ul>
                            <@goods_List productCategoryId=productCategoryRoot.id tag=3 count=10>
                                <#if goodsList??>
                                    <#list goodsList as goods>
                                        <#if goods_index<5>
                                            <li>
                                                <a href="/shop/goods/content/201908/${goods.id}.html"
                                                   title="${goods.name}" target="_blank">
                                                    <div>
                                                        <span title="${goods.name}">${goods.name}</span>
                                                        <em title="${goods.caption}">${goods.caption}</em>
                                                    </div>
                                                    <strong>${goods.price?string("#.00")}</strong>
                                                    <img src="/shop/upload/image/blank.gif"
                                                         data-original="${goods.image}"/>
                                                </a>
                                            </li>
                                        <#else>
                                            <li class="low">
                                                <a href="/shop/goods/content/201908/${goods.id}.html"
                                                   title="${goods.name}"
                                                   target="_blank">
                                                    <img src="/shop/upload/image/blank.gif"
                                                         data-original="${goods.image}"/>
                                                    <span title="${goods.name}">${goods.name}</span>
                                                    <strong>${goods.price?string("#.00")} </strong>
                                                </a>
                                            </li>
                                        </#if>
                                    </#list>
                                </#if>
                            </@goods_List>
                        </ul>
                    </div>
                </div>
            </div>
        </#list>
    </@product_category_root_List>


    <!--
       热门品牌
    -->
    <div class="row">
        <div class="span12">
            <div class="hotBrand">
                <ul class="clearfix">
                    <@brand_list count=10>
                        <#list brandList as brand>
                            <li>
                                <a href="/shop/brand/content/${brand.id}.html" title="${brand.name}">
                                    <img src="${brand.logo}" alt="${brand.name}"/>
                                </a>
                            </li>
                        </#list>
                    </@brand_list>
                </ul>
            </div>
        </div>
    </div>
</div>
<#include "include/footer.ftl">
</body>
</html>
