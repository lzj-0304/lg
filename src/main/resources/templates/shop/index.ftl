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
    <div class="row">
        <!--
            商品分类数据节点展示
               实现思路
                   1.查询根节点(6类)  grade=0
                       循环输出li标签
                   2.根据根节点id 查询每个分类一级节点 grade=1
                   3.根据根节点查询品牌节点
                   4.根据一级节点查询二级节点
        -->
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
        <div class="span3">
            <div id="newArticle" class="newArticle">
                <ul class="tab">
                    <li>
                        <a href="/shop/article/list/1.jhtml" target="_blank">商城动态</a>
                    </li>
                    <li>
                        <a href="/shop/article/list/2.jhtml" target="_blank">活动促销</a>
                    </li>
                </ul>
                <ul class="tabContent">
                    <li>
                        <a href="http://localhost:8080/shop/article/content/201908/1/1.html" title="亚洲将有望成为全球最大电商市场"
                           target="_blank">亚洲将有望成为全球最大电商市场</a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/article/content/201908/2/1.html" title="2015年我国移动支付或突破4万亿元"
                           target="_blank">2015年我国移动支付或突破4万亿元</a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/article/content/201908/3/1.html"
                           title="2015年我国移动电商交易规模或将超千亿" target="_blank">2015年我国移动电商交易规模或将超千亿</a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/article/content/201908/4/1.html"
                           title="2014我国网络购物交易规模2.8万亿 增48%" target="_blank">2014我国网络购物交易规模2.8万亿 增48%</a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/article/content/201908/5/1.html" title="中国消费者奢侈品消费76％在境外"
                           target="_blank">中国消费者奢侈品消费76％在境外</a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/article/content/201908/6/1.html"
                           title="中国网民接近6.5亿 较2013年增加3000万" target="_blank">中国网民接近6.5亿 较2013年增加3000万</a>
                    </li>
                </ul>
                <ul class="tabContent hidden">
                    <li>
                        <a href="http://localhost:8080/shop/article/content/201908/9/1.html" title="狂欢节活动"
                           target="_blank">狂欢节活动</a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/article/content/201908/10/1.html" title="手机全场低至9.5折"
                           target="_blank">手机全场低至9.5折</a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/article/content/201908/11/1.html" title="劲爆限时抢购"
                           target="_blank">劲爆限时抢购</a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/article/content/201908/12/1.html" title="家电狂降五折起"
                           target="_blank">家电狂降五折起</a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/article/content/201908/13/1.html" title="年终排行榜盛惠"
                           target="_blank">年终排行榜盛惠</a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/article/content/201908/14/1.html" title="将限量”温情”带回家"
                           target="_blank">将限量”温情”带回家</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>


    <!--
       热门商品
    -->
    <@product_category_root_List  count=6>
        <#list productCategoryRootList as productCategoryRoot>
            <@goods_list productCategoryId=productCategoryRoot.id tag=3 count=10>
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
                                            <a href="/shop/goods/list/${productCategoryParen}.html">${productCategoryParen.name}</a>
                                        </dd>
                                    </#list>
                                </@product_category_parent_List>
                            </dl>

                            <!--分栏广告位展示-->
                            <div>
                                <a href="#">
                                    <img src="http://image.demo.shopxx.net/4.0/201501/7a9dcaf7-5575-4166-af36-b61736e4b3e6.jpg"
                                         alt="iPhone6" title="iPhone6"/>
                                </a>
                            </div>
                            <ul>
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
                                                    <strong>${currency(goods.price, true)}</strong>
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
                                                    <strong>${currency(goods.price, true)}</strong>
                                                </a>
                                            </li>
                                        </#if>
                                    </#list>
                                </#if>

                            </ul>
                        </div>
                    </div>
                </div>
            </@goods_list>
        </#list>
    </@product_category_root_List>






    <#--
    <div class="row">
        <div class="span12">
            <div class="hotGoods">
                <dl class="title2">
                    <dt>
                        <a href="/shop/goods/list/2.jhtml">电脑办公</a>
                    </dt>
                    <dd>
                        <a href="/shop/goods/list/14.jhtml">电脑整机</a>
                    </dd>
                    <dd>
                        <a href="/shop/goods/list/15.jhtml">电脑配件</a>
                    </dd>
                    <dd>
                        <a href="/shop/goods/list/16.jhtml">电脑外设</a>
                    </dd>
                    <dd>
                        <a href="/shop/goods/list/17.jhtml">网络设备</a>
                    </dd>
                    <dd>
                        <a href="/shop/goods/list/18.jhtml">办公打印</a>
                    </dd>
                    <dd>
                        <a href="/shop/goods/list/19.jhtml">办公文仪</a>
                    </dd>
                    <dd>
                        <a href="/shop/goods/list/20.jhtml">办公耗材</a>
                    </dd>
                </dl>
                <div>
                    <a href="#">
                        <img src="http://image.demo.shopxx.net/4.0/201501/68068b35-dd61-4ea9-96f9-6945c8a05d55.jpg"
                             alt="苹果配件" title="苹果配件"/>
                    </a>
                </div>
                <ul>
                    <li>
                        <a href="http://localhost:8080/shop/goods/content/201908/26.html" title="苹果 MacBook Air MD711CH"
                           target="_blank">
                            <div>
                                <span title="苹果 MacBook Air MD711CH">苹果 MacBook Air MD711CH</span>
                                <em title="超长电池使用时间，强劲性能">超长电池使用时间，强劲性</em>
                            </div>
                            <strong>￥5800.00</strong>
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/0eb9dcf8-57fe-499a-aa59-73bfb8f4c1cb-thumbnail.jpg"/>
                        </a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/goods/content/201908/27.html" title="苹果 MacBook Pro MGXA2CH"
                           target="_blank">
                            <div>
                                <span title="苹果 MacBook Pro MGXA2CH">苹果 MacBook Pro MGXA2CH</span>
                                <em title="绚丽夺目，超强性能表现">绚丽夺目，超强性能表现</em>
                            </div>
                            <strong>￥13800.00</strong>
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/ee8f0d59-a38f-4e7b-8972-53a4f0349d24-thumbnail.jpg"/>
                        </a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/goods/content/201908/28.html" title="华硕 TP500LN"
                           target="_blank">
                            <div>
                                <span title="华硕 TP500LN">华硕 TP500LN</span>
                                <em title="工艺精湛，360度自由翻转">工艺精湛，360度自由翻转</em>
                            </div>
                            <strong>￥6800.00</strong>
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/9da8b878-da95-4d48-9f0b-c6562dd8793a-thumbnail.jpg"/>
                        </a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/goods/content/201908/29.html" title="三星 NP930X5J"
                           target="_blank">
                            <div>
                                <span title="三星 NP930X5J">三星 NP930X5J</span>
                                <em title="轻薄设计，强劲续航">轻薄设计，强劲续航</em>
                            </div>
                            <strong>￥12000.00</strong>
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/bf15b3cc-77fd-44b8-b5ca-6ef070cc6d8d-thumbnail.jpg"/>
                        </a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/goods/content/201908/30.html" title="三星 NP455R4J"
                           target="_blank">
                            <div>
                                <span title="三星 NP455R4J">三星 NP455R4J</span>
                                <em title="2G独立显卡，时尚轻薄">2G独立显卡，时尚轻薄</em>
                            </div>
                            <strong>￥2800.00</strong>
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/03c8560a-bac4-473d-b46f-387a927b3218-thumbnail.jpg"/>
                        </a>
                    </li>
                    <li class="low">
                        <a href="http://localhost:8080/shop/goods/content/201908/31.html" title="苹果 iPad Air MD785CH"
                           target="_blank">
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/7ebc7264-e5e6-4681-a80b-6cdbd90272cc-thumbnail.jpg"/>
                            <span title="苹果 iPad Air MD785CH">苹果 iPad Air MD785CH</span>
                            <strong>￥2880.00</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="http://localhost:8080/shop/goods/content/201908/32.html" title="苹果 iPad mini ME279CH"
                           target="_blank">
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/5c5195a8-4861-4161-a9f5-9ecbb0a70596-thumbnail.jpg"/>
                            <span title="苹果 iPad mini ME279CH">苹果 iPad mini ME279CH</span>
                            <strong>￥2200.00</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="http://localhost:8080/shop/goods/content/201908/33.html" title="苹果 iPad Air2 MH0W2CH"
                           target="_blank">
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/5f7ffbaf-2e87-42c4-9039-0fe47fb630b2-thumbnail.jpg"/>
                            <span title="苹果 iPad Air2 MH0W2CH">苹果 iPad Air2 MH0W2CH</span>
                            <strong>￥3600.00</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="http://localhost:8080/shop/goods/content/201908/34.html" title="苹果 iPad mini3 MGY92CH"
                           target="_blank">
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/62142fec-eae0-4881-abc6-04ecb2afcbad-thumbnail.jpg"/>
                            <span title="苹果 iPad mini3 MGY92CH">苹果 iPad mini3 MGY92CH</span>
                            <strong>￥2888.00</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="http://localhost:8080/shop/goods/content/201908/35.html" title="三星 Galaxy Tab3 T311"
                           target="_blank">
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/8d6f7b24-95fe-4c09-b85f-56568019e1d2-thumbnail.jpg"/>
                            <span title="三星 Galaxy Tab3 T311">三星 Galaxy Tab3 T311</span>
                            <strong>￥2600.00</strong>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="span12">
            <div class="hotGoods">
                <dl class="title3">
                    <dt>
                        <a href="/shop/goods/list/3.jhtml">家用电器</a>
                    </dt>
                    <dd>
                        <a href="/shop/goods/list/21.jhtml">生活电器</a>
                    </dd>
                    <dd>
                        <a href="/shop/goods/list/22.jhtml">厨卫电器</a>
                    </dd>
                    <dd>
                        <a href="/shop/goods/list/23.jhtml">个护健康</a>
                    </dd>
                    <dd>
                        <a href="/shop/goods/list/24.jhtml">五金家装</a>
                    </dd>
                    <dd>
                        <a href="/shop/goods/list/25.jhtml">大家电</a>
                    </dd>
                </dl>
                <div>
                    <a href="#">
                        <img src="http://image.demo.shopxx.net/4.0/201501/001b365f-b2ec-428e-a8cf-c544c32a0fad.jpg"
                             alt="腊八节促销" title="腊八节促销"/>
                    </a>
                </div>
                <ul>
                    <li>
                        <a href="http://localhost:8080/shop/goods/content/201908/36.html" title="飞利浦 55PFL3045"
                           target="_blank">
                            <div>
                                <span title="飞利浦 55PFL3045">飞利浦 55PFL3045</span>
                                <em title="经典大屏，飞常完美">经典大屏，飞常完美</em>
                            </div>
                            <strong>￥3899.00</strong>
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/8384ad7b-a5e3-4ad1-96b8-bc2d9e924087-thumbnail.jpg"/>
                        </a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/goods/content/201908/37.html" title="东芝 42L1353C"
                           target="_blank">
                            <div>
                                <span title="东芝 42L1353C">东芝 42L1353C</span>
                                <em title="三维色彩管理，高还原色彩细节">三维色彩管理，高还原色彩</em>
                            </div>
                            <strong>￥2599.00</strong>
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/f8a42d04-c91b-473b-8549-606208b3dcb9-thumbnail.jpg"/>
                        </a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/goods/content/201908/38.html" title="东芝 55L3305CS"
                           target="_blank">
                            <div>
                                <span title="东芝 55L3305CS">东芝 55L3305CS</span>
                                <em title="享受澎湃画质，打造全高清3D盛宴">享受澎湃画质，打造全高清</em>
                            </div>
                            <strong>￥4988.00</strong>
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/726126d6-2cc4-4e19-86f5-9688beb88042-thumbnail.jpg"/>
                        </a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/goods/content/201908/39.html" title="索尼 KDL-60WM15B"
                           target="_blank">
                            <div>
                                <span title="索尼 KDL-60WM15B">索尼 KDL-60WM15B</span>
                                <em title="动人影音，智能娱乐">动人影音，智能娱乐</em>
                            </div>
                            <strong>￥6888.00</strong>
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/c54c97fe-017e-4363-99d5-4a263407e02d-thumbnail.jpg"/>
                        </a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/goods/content/201908/40.html" title="索尼 KDL-50W700B"
                           target="_blank">
                            <div>
                                <span title="索尼 KDL-50W700B">索尼 KDL-50W700B</span>
                                <em title="新升级智能娱乐功能">新升级智能娱乐功能</em>
                            </div>
                            <strong>￥4688.00</strong>
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/eee0bfc5-d5f6-48c4-aa75-73fb709d824b-thumbnail.jpg"/>
                        </a>
                    </li>
                    <li class="low">
                        <a href="http://localhost:8080/shop/goods/content/201908/41.html" title="格力 KFR-26GW FNDe-A3"
                           target="_blank">
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/91c37add-33fb-44bc-ac8c-b3387c5b73fb-thumbnail.jpg"/>
                            <span title="格力 KFR-26GW FNDe-A3">格力 KFR-26GW FNDe-A3</span>
                            <strong>￥2999.00</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="http://localhost:8080/shop/goods/content/201908/42.html" title="格力 KF-23GW Ga-3"
                           target="_blank">
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/d7630e6b-b206-4655-b5a8-da424d9a39d2-thumbnail.jpg"/>
                            <span title="格力 KF-23GW Ga-3">格力 KF-23GW Ga-3</span>
                            <strong>￥2380.00</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="http://localhost:8080/shop/goods/content/201908/43.html" title="格力 KFR-26GW FNBa-A3"
                           target="_blank">
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/f052efce-8045-4db7-bed2-1343823a7b53-thumbnail.jpg"/>
                            <span title="格力 KFR-26GW FNBa-A3">格力 KFR-26GW FNBa-A3</span>
                            <strong>￥3690.00</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="http://localhost:8080/shop/goods/content/201908/44.html" title="美的 KFR-35GWBP3DN1Y"
                           target="_blank">
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/b03f83e2-357a-4991-b894-a361d20386a7-thumbnail.jpg"/>
                            <span title="美的 KFR-35GWBP3DN1Y">美的 KFR-35GWBP3DN1Y</span>
                            <strong>￥2399.00</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="http://localhost:8080/shop/goods/content/201908/45.html" title="美的 KFR-32GWDY-IF"
                           target="_blank">
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/acef11f4-93cf-44e7-b5f8-7b156f2b1809-thumbnail.jpg"/>
                            <span title="美的 KFR-32GWDY-IF">美的 KFR-32GWDY-IF</span>
                            <strong>￥2399.00</strong>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>-->
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
