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
        -->
        <div class="span2">
            <div id="productCategoryMenu" class="productCategoryMenu">
                <ul>
                    <li>
                        <div class="item">
                            <div>
                                <a href="/shop/goods/list/7.jhtml">
                                    <strong>手机通讯</strong>
                                </a>
                                <a href="/shop/goods/list/8.jhtml">
                                    <strong>手机配件</strong>
                                </a>
                                <a href="/shop/goods/list/9.jhtml">
                                    <strong>摄影摄像</strong>
                                </a>
                            </div>
                            <div>
                                <a href="/shop/brand/content/1.jhtml">苹果</a>
                                <a href="/shop/brand/content/2.jhtml">三星</a>
                                <a href="/shop/brand/content/3.jhtml">索尼</a>
                                <a href="/shop/brand/content/4.jhtml">华为</a>
                            </div>
                        </div>
                        <div class="menu">
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/7.jhtml">手机通讯</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/41.jhtml">手机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/42.jhtml">对讲机</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/8.jhtml">手机配件</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/43.jhtml">手机电池</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/44.jhtml">移动电源</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/45.jhtml">充电器</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/46.jhtml">手机耳机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/47.jhtml">手机贴膜</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/48.jhtml">手机保护套</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/9.jhtml">摄影摄像</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/49.jhtml">数码相机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/50.jhtml">单反相机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/51.jhtml">数码摄像机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/52.jhtml">拍立得</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/53.jhtml">镜头</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/54.jhtml">户外器材</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/10.jhtml">数码配件</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/55.jhtml">存储卡</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/56.jhtml">读卡器</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/57.jhtml">数码贴膜</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/58.jhtml">充电器</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/59.jhtml">相机包</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/60.jhtml">滤镜</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/11.jhtml">智能设备</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/61.jhtml">智能手环</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/62.jhtml">智能手表</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/63.jhtml">智能眼镜</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/64.jhtml">智能配饰</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/65.jhtml">智能家居</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/66.jhtml">健康监测</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/12.jhtml">时尚影音</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/67.jhtml">MP3/MP4</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/68.jhtml">收录音机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/69.jhtml">数码相框</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/70.jhtml">耳机耳麦</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/71.jhtml">录音笔</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/72.jhtml">音箱</a>
                                </dd>
                            </dl>
                            <dl class="clearfix last">
                                <dt>
                                    <a href="/shop/goods/list/13.jhtml">电子教育</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/73.jhtml">电子词典</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/74.jhtml">学生平板</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/75.jhtml">复读机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/76.jhtml">点读机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/77.jhtml">早教机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/78.jhtml">学习机</a>
                                </dd>
                            </dl>
                            <div class="auxiliary">
                                <div>
                                    <strong>推荐品牌</strong>
                                    <a href="/shop/brand/content/1.jhtml">苹果</a>
                                    <a href="/shop/brand/content/2.jhtml">三星</a>
                                    <a href="/shop/brand/content/3.jhtml">索尼</a>
                                    <a href="/shop/brand/content/4.jhtml">华为</a>
                                    <a href="/shop/brand/content/5.jhtml">魅族</a>
                                    <a href="/shop/brand/content/6.jhtml">佳能</a>
                                    <a href="/shop/brand/content/7.jhtml">尼康</a>
                                    <a href="/shop/brand/content/8.jhtml">松下</a>
                                </div>
                                <div>
                                    <strong>热点促销</strong>
                                    <a href="/shop/promotion/content/1.jhtml" title="iPhone促销专场">
                                        <img src="http://image.demo.shopxx.net/4.0/201501/0a1ceb47-f51c-4dfb-9d51-cb723c2f8e78.jpg"
                                             alt="iPhone促销专场"/>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item">
                            <div>
                                <a href="/shop/goods/list/14.jhtml">
                                    <strong>电脑整机</strong>
                                </a>
                                <a href="/shop/goods/list/15.jhtml">
                                    <strong>电脑配件</strong>
                                </a>
                                <a href="/shop/goods/list/16.jhtml">
                                    <strong>电脑外设</strong>
                                </a>
                            </div>
                            <div>
                                <a href="/shop/brand/content/9.jhtml">戴尔</a>
                                <a href="/shop/brand/content/10.jhtml">惠普</a>
                                <a href="/shop/brand/content/11.jhtml">华硕</a>
                                <a href="/shop/brand/content/12.jhtml">微星</a>
                            </div>
                        </div>
                        <div class="menu">
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/14.jhtml">电脑整机</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/79.jhtml">笔记本</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/80.jhtml">超极本</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/81.jhtml">游戏本</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/82.jhtml">平板电脑</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/83.jhtml">台式机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/84.jhtml">服务器</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/15.jhtml">电脑配件</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/85.jhtml">CPU</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/86.jhtml">主板</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/87.jhtml">硬盘</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/88.jhtml">内存</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/89.jhtml">机箱</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/90.jhtml">显示器</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/16.jhtml">电脑外设</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/91.jhtml">移动硬盘</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/92.jhtml">U盘</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/93.jhtml">鼠标</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/94.jhtml">键盘</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/95.jhtml">摄像头</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/96.jhtml">手写板</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/17.jhtml">网络设备</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/97.jhtml">路由器</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/98.jhtml">交换机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/99.jhtml">网卡</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/100.jhtml">网络存储</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/101.jhtml">3G/4G上网</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/102.jhtml">网络盒子</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/18.jhtml">办公打印</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/103.jhtml">打印机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/104.jhtml">扫描仪</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/105.jhtml">传真机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/106.jhtml">一体机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/107.jhtml">投影机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/108.jhtml">考勤机</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/19.jhtml">办公文仪</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/109.jhtml">办公文具</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/110.jhtml">办公用纸</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/111.jhtml">财务用品</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/112.jhtml">学生文具</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/113.jhtml">文件管理</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/114.jhtml">计算器</a>
                                </dd>
                            </dl>
                            <dl class="clearfix last">
                                <dt>
                                    <a href="/shop/goods/list/20.jhtml">办公耗材</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/115.jhtml">硒鼓</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/116.jhtml">墨粉</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/117.jhtml">墨盒</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/118.jhtml">色带</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/119.jhtml">纸类</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/120.jhtml">刻录光盘</a>
                                </dd>
                            </dl>
                            <div class="auxiliary">
                                <div>
                                    <strong>推荐品牌</strong>
                                    <a href="/shop/brand/content/9.jhtml">戴尔</a>
                                    <a href="/shop/brand/content/10.jhtml">惠普</a>
                                    <a href="/shop/brand/content/11.jhtml">华硕</a>
                                    <a href="/shop/brand/content/12.jhtml">微星</a>
                                    <a href="/shop/brand/content/13.jhtml">宏碁</a>
                                    <a href="/shop/brand/content/14.jhtml">联想</a>
                                    <a href="/shop/brand/content/15.jhtml">兄弟</a>
                                    <a href="/shop/brand/content/16.jhtml">得力</a>
                                </div>
                                <div>
                                    <strong>热点促销</strong>
                                    <a href="/shop/promotion/content/2.jhtml" title="联想笔记本促销专场">
                                        <img src="http://image.demo.shopxx.net/4.0/201501/98229d3b-08b7-4888-a99e-cf21a2a03b65.jpg"
                                             alt="联想笔记本促销专场"/>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item">
                            <div>
                                <a href="/shop/goods/list/21.jhtml">
                                    <strong>生活电器</strong>
                                </a>
                                <a href="/shop/goods/list/22.jhtml">
                                    <strong>厨卫电器</strong>
                                </a>
                                <a href="/shop/goods/list/23.jhtml">
                                    <strong>个护健康</strong>
                                </a>
                            </div>
                            <div>
                                <a href="/shop/brand/content/17.jhtml">海尔</a>
                                <a href="/shop/brand/content/18.jhtml">美的</a>
                                <a href="/shop/brand/content/19.jhtml">格力</a>
                                <a href="/shop/brand/content/20.jhtml">海信</a>
                            </div>
                        </div>
                        <div class="menu">
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/21.jhtml">生活电器</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/121.jhtml">电风扇</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/122.jhtml">吸尘器</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/123.jhtml">饮水机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/124.jhtml">加湿器</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/125.jhtml">干衣机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/126.jhtml">电话机</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/22.jhtml">厨卫电器</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/127.jhtml">电饭煲</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/128.jhtml">微波炉</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/129.jhtml">电磁炉</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/130.jhtml">豆浆机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/131.jhtml">榨汁机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/132.jhtml">面包机</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/23.jhtml">个护健康</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/133.jhtml">剃须刀</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/134.jhtml">电吹风</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/135.jhtml">理发器</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/136.jhtml">体温计</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/137.jhtml">血压计</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/138.jhtml">血糖仪</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/24.jhtml">五金家装</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/139.jhtml">电动工具</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/140.jhtml">手动工具</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/141.jhtml">仪器仪表</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/142.jhtml">淋浴花洒</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/143.jhtml">厨卫五金</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/144.jhtml">家具五金</a>
                                </dd>
                            </dl>
                            <dl class="clearfix last">
                                <dt>
                                    <a href="/shop/goods/list/25.jhtml">大家电</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/145.jhtml">平板电视</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/146.jhtml">家庭影院</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/147.jhtml">洗衣机</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/148.jhtml">热水器</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/149.jhtml">冰箱</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/150.jhtml">空调</a>
                                </dd>
                            </dl>
                            <div class="auxiliary">
                                <div>
                                    <strong>推荐品牌</strong>
                                    <a href="/shop/brand/content/17.jhtml">海尔</a>
                                    <a href="/shop/brand/content/18.jhtml">美的</a>
                                    <a href="/shop/brand/content/19.jhtml">格力</a>
                                    <a href="/shop/brand/content/20.jhtml">海信</a>
                                    <a href="/shop/brand/content/21.jhtml">创维</a>
                                    <a href="/shop/brand/content/22.jhtml">先锋</a>
                                    <a href="/shop/brand/content/23.jhtml">夏普</a>
                                    <a href="/shop/brand/content/24.jhtml">九阳</a>
                                </div>
                                <div>
                                    <strong>热点促销</strong>
                                    <a href="/shop/promotion/content/3.jhtml" title="平板电视促销专场">
                                        <img src="http://image.demo.shopxx.net/4.0/201501/2b71bacf-bd18-46fb-adab-072dd544ed66.jpg"
                                             alt="平板电视促销专场"/>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item">
                            <div>
                                <a href="/shop/goods/list/26.jhtml">
                                    <strong>品质男装</strong>
                                </a>
                                <a href="/shop/goods/list/27.jhtml">
                                    <strong>时尚女装</strong>
                                </a>
                                <a href="/shop/goods/list/28.jhtml">
                                    <strong>精品内衣</strong>
                                </a>
                            </div>
                            <div>
                                <a href="/shop/brand/content/25.jhtml">耐克</a>
                                <a href="/shop/brand/content/26.jhtml">特步</a>
                                <a href="/shop/brand/content/27.jhtml">安踏</a>
                                <a href="/shop/brand/content/28.jhtml">劲霸</a>
                            </div>
                        </div>
                        <div class="menu">
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/26.jhtml">品质男装</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/151.jhtml">衬衫</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/152.jhtml">T恤</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/153.jhtml">夹克</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/154.jhtml">针织衫</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/155.jhtml">羊绒衫</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/156.jhtml">羽绒服</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/27.jhtml">时尚女装</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/157.jhtml">衬衫</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/158.jhtml">T恤</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/159.jhtml">风衣</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/160.jhtml">连衣裙</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/161.jhtml">牛仔裤</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/162.jhtml">休闲裤</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/28.jhtml">精品内衣</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/163.jhtml">文胸</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/164.jhtml">女式内裤</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/165.jhtml">男式内裤</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/166.jhtml">保暖内衣</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/167.jhtml">秋衣秋裤</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/168.jhtml">塑身美体</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/29.jhtml">精品男鞋</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/169.jhtml">正装鞋</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/170.jhtml">休闲鞋</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/171.jhtml">运动鞋</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/172.jhtml">凉鞋</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/173.jhtml">拖鞋</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/174.jhtml">男靴</a>
                                </dd>
                            </dl>
                            <dl class="clearfix last">
                                <dt>
                                    <a href="/shop/goods/list/30.jhtml">潮流女鞋</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/175.jhtml">高跟鞋</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/176.jhtml">休闲鞋</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/177.jhtml">运动鞋</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/178.jhtml">凉鞋</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/179.jhtml">拖鞋</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/180.jhtml">女靴</a>
                                </dd>
                            </dl>
                            <div class="auxiliary">
                                <div>
                                    <strong>推荐品牌</strong>
                                    <a href="/shop/brand/content/25.jhtml">耐克</a>
                                    <a href="/shop/brand/content/26.jhtml">特步</a>
                                    <a href="/shop/brand/content/27.jhtml">安踏</a>
                                    <a href="/shop/brand/content/28.jhtml">劲霸</a>
                                    <a href="/shop/brand/content/29.jhtml">柒牌</a>
                                    <a href="/shop/brand/content/30.jhtml">杉杉</a>
                                    <a href="/shop/brand/content/31.jhtml">红豆</a>
                                    <a href="/shop/brand/content/32.jhtml">婷美</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item">
                            <div>
                                <a href="/shop/goods/list/31.jhtml">
                                    <strong>面部护肤</strong>
                                </a>
                                <a href="/shop/goods/list/32.jhtml">
                                    <strong>身体护肤</strong>
                                </a>
                                <a href="/shop/goods/list/33.jhtml">
                                    <strong>口腔护理</strong>
                                </a>
                            </div>
                            <div>
                                <a href="/shop/brand/content/33.jhtml">薇姿</a>
                                <a href="/shop/brand/content/34.jhtml">美即</a>
                                <a href="/shop/brand/content/35.jhtml">多芬</a>
                                <a href="/shop/brand/content/36.jhtml">沙宣</a>
                            </div>
                        </div>
                        <div class="menu">
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/31.jhtml">面部护肤</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/181.jhtml">清洁</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/182.jhtml">护肤</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/183.jhtml">面膜</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/184.jhtml">剃须</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/185.jhtml">化妆水</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/186.jhtml">套装</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/32.jhtml">身体护肤</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/187.jhtml">沐浴</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/188.jhtml">润肤</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/189.jhtml">颈部</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/190.jhtml">手足</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/191.jhtml">塑形</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/192.jhtml">美胸</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/33.jhtml">口腔护理</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/193.jhtml">牙膏</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/194.jhtml">牙粉</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/195.jhtml">牙刷</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/196.jhtml">牙线</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/197.jhtml">漱口水</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/198.jhtml">套装</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/34.jhtml">洗发护发</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/199.jhtml">洗发</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/200.jhtml">护发</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/201.jhtml">染发</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/202.jhtml">造型</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/203.jhtml">假发</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/204.jhtml">套装</a>
                                </dd>
                            </dl>
                            <dl class="clearfix last">
                                <dt>
                                    <a href="/shop/goods/list/35.jhtml">香水彩妆</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/205.jhtml">香水</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/206.jhtml">底妆</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/207.jhtml">腮红</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/208.jhtml">眼部</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/209.jhtml">唇部</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/210.jhtml">美甲</a>
                                </dd>
                            </dl>
                            <div class="auxiliary">
                                <div>
                                    <strong>推荐品牌</strong>
                                    <a href="/shop/brand/content/33.jhtml">薇姿</a>
                                    <a href="/shop/brand/content/34.jhtml">美即</a>
                                    <a href="/shop/brand/content/35.jhtml">多芬</a>
                                    <a href="/shop/brand/content/36.jhtml">沙宣</a>
                                    <a href="/shop/brand/content/37.jhtml">欧莱雅</a>
                                    <a href="/shop/brand/content/38.jhtml">美宝莲</a>
                                    <a href="/shop/brand/content/39.jhtml">妮维雅</a>
                                    <a href="/shop/brand/content/40.jhtml">海飞丝</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item last">
                            <div>
                                <a href="/shop/goods/list/36.jhtml">
                                    <strong>家纺布艺</strong>
                                </a>
                                <a href="/shop/goods/list/37.jhtml">
                                    <strong>家居照明</strong>
                                </a>
                                <a href="/shop/goods/list/38.jhtml">
                                    <strong>家装建材</strong>
                                </a>
                            </div>
                            <div>
                                <a href="/shop/brand/content/41.jhtml">欧普</a>
                                <a href="/shop/brand/content/42.jhtml">公牛</a>
                                <a href="/shop/brand/content/43.jhtml">妙洁</a>
                                <a href="/shop/brand/content/44.jhtml">中宇</a>
                            </div>
                        </div>
                        <div class="menu">
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/36.jhtml">家纺布艺</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/211.jhtml">被子</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/212.jhtml">毯子</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/213.jhtml">凉席</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/214.jhtml">蚊帐</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/215.jhtml">床垫</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/216.jhtml">布艺</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/37.jhtml">家居照明</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/217.jhtml">台灯</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/218.jhtml">吊灯</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/219.jhtml">壁灯</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/220.jhtml">射灯</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/221.jhtml">吸顶灯</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/222.jhtml">落地灯</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/38.jhtml">家装建材</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/223.jhtml">开关</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/224.jhtml">插座</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/225.jhtml">电线</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/226.jhtml">转换插头</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/227.jhtml">电工电料</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/228.jhtml">监控安防</a>
                                </dd>
                            </dl>
                            <dl class="clearfix">
                                <dt>
                                    <a href="/shop/goods/list/39.jhtml">生活日用</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/229.jhtml">收纳用品</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/230.jhtml">晴雨用具</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/231.jhtml">浴室用品</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/232.jhtml">针织用品</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/233.jhtml">净化除味</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/234.jhtml">驱蚊驱虫</a>
                                </dd>
                            </dl>
                            <dl class="clearfix last">
                                <dt>
                                    <a href="/shop/goods/list/40.jhtml">清洁用品</a>
                                </dt>
                                <dd>
                                    <a href="/shop/goods/list/235.jhtml">纸品湿巾</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/236.jhtml">衣物洗护</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/237.jhtml">皮具护理</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/238.jhtml">居家清洁</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/239.jhtml">清洁工具</a>|
                                </dd>
                                <dd>
                                    <a href="/shop/goods/list/240.jhtml">驱虫用品</a>
                                </dd>
                            </dl>
                            <div class="auxiliary">
                                <div>
                                    <strong>推荐品牌</strong>
                                    <a href="/shop/brand/content/41.jhtml">欧普</a>
                                    <a href="/shop/brand/content/42.jhtml">公牛</a>
                                    <a href="/shop/brand/content/43.jhtml">妙洁</a>
                                    <a href="/shop/brand/content/44.jhtml">中宇</a>
                                    <a href="/shop/brand/content/45.jhtml">多喜爱</a>
                                    <a href="/shop/brand/content/46.jhtml">北极绒</a>
                                    <a href="/shop/brand/content/47.jhtml">恒源祥</a>
                                    <a href="/shop/brand/content/48.jhtml">富安娜</a>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>


        <!--
            轮询图片
        -->
        <div class="span10">
            <div id="slider" class="slider">
                <a href="/shop/promotion/content/2.jhtml">
                    <img src="http://image.demo.shopxx.net/4.0/201501/7a09df9e-3f64-4670-82c2-87f3fd0bec0b.jpg"
                         alt="联想笔记本专场" title="联想笔记本专场"/>
                </a>
                <a href="#">
                    <img src="http://image.demo.shopxx.net/4.0/201501/313597c4-10be-41a6-8827-9b75889ad88a.jpg"
                         alt="苹果产品专场" title="苹果产品专场"/>
                </a>
                <a href="#">
                    <img src="http://image.demo.shopxx.net/4.0/201501/f675047e-91ec-46ac-a718-6c003fc9b901.jpg"
                         alt="情人节专场" title="情人节专场"/>
                </a>
            </div>
        </div>
    </div>
    <!--
       手机平板 移动电源广告位 +商品动态&活动促销
    -->
    <div class="row">
        <div class="span9">
            <div class="hotAd">
                <ul>
                    <li>
                        <a href="#">
                            <img src="http://image.demo.shopxx.net/4.0/201501/b31c243d-9f9e-4799-8f7e-b68803ce8a6a.jpg"
                                 alt="华为荣耀" title="华为荣耀"/>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="http://image.demo.shopxx.net/4.0/201501/9370250c-8b01-472e-8e68-13ab7d10ff7c.jpg"
                                 alt="移动电源" title="移动电源"/>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="http://image.demo.shopxx.net/4.0/201501/0b8d7827-ac10-4045-9840-432e7cf2254e.jpg"
                                 alt="平板电脑" title="平板电脑"/>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <img src="http://image.demo.shopxx.net/4.0/201501/1a7358bc-bb8e-4c1a-af0d-8d651d24b61c.jpg"
                                 alt="智能电视" title="智能电视"/>
                        </a>
                    </li>
                </ul>
            </div>
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
    <div class="row">
        <div class="span12">
            <div class="middleAd">
                <a href="#">
                    <img src="http://image.demo.shopxx.net/4.0/201501/073cbb0f-1d00-4ebc-bded-72abbe6830d0.jpg"
                         width="1190" height="110" alt="蓝牙音箱" title="蓝牙音箱"/>
                </a>
            </div>
        </div>
    </div>
    <!--
       热门商品
    -->
    <div class="row">
        <div class="span12">
            <div class="hotGoods">
                <dl class="title1">
                    <dt>
                        <a href="/shop/goods/list/1.jhtml">手机数码</a>
                    </dt>
                    <dd>
                        <a href="/shop/goods/list/7.jhtml">手机通讯</a>
                    </dd>
                    <dd>
                        <a href="/shop/goods/list/8.jhtml">手机配件</a>
                    </dd>
                    <dd>
                        <a href="/shop/goods/list/9.jhtml">摄影摄像</a>
                    </dd>
                    <dd>
                        <a href="/shop/goods/list/10.jhtml">数码配件</a>
                    </dd>
                    <dd>
                        <a href="/shop/goods/list/11.jhtml">智能设备</a>
                    </dd>
                    <dd>
                        <a href="/shop/goods/list/12.jhtml">时尚影音</a>
                    </dd>
                    <dd>
                        <a href="/shop/goods/list/13.jhtml">电子教育</a>
                    </dd>
                </dl>
                <div>
                    <a href="#">
                        <img src="http://image.demo.shopxx.net/4.0/201501/7a9dcaf7-5575-4166-af36-b61736e4b3e6.jpg"
                             alt="iPhone6" title="iPhone6"/>
                    </a>
                </div>
                <ul>
                    <li>
                        <a href="http://localhost:8080/shop/goods/content/201908/1.html" title="苹果 iPhone 5s"
                           target="_blank">
                            <div>
                                <span title="苹果 iPhone 5s">苹果 iPhone 5s</span>
                                <em title="铝金属外壳，64位智能手机，畅享3G/4G网络">铝金属外壳，64位智能手机</em>
                            </div>
                            <strong>￥4200.00</strong>
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/e39f89ce-e08a-4546-8aee-67d4427e86e2-thumbnail.jpg"/>
                        </a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/goods/content/201908/2.html" title="苹果 iPhone 6"
                           target="_blank">
                            <div>
                                <span title="苹果 iPhone 6">苹果 iPhone 6</span>
                                <em title="至大至薄，强劲动力">至大至薄，强劲动力</em>
                            </div>
                            <strong>￥5200.00</strong>
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/d7f59d79-1958-4059-852c-0d6531788b48-thumbnail.jpg"/>
                        </a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/goods/content/201908/3.html" title="三星 G3818"
                           target="_blank">
                            <div>
                                <span title="三星 G3818">三星 G3818</span>
                                <em title="时尚便携，畅享3G网络">时尚便携，畅享3G网络</em>
                            </div>
                            <strong>￥1200.00</strong>
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/031e30a4-6237-4650-a14c-5132aa126acd-thumbnail.jpg"/>
                        </a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/goods/content/201908/4.html" title="三星 Galaxy S5 G9009W"
                           target="_blank">
                            <div>
                                <span title="三星 Galaxy S5 G9009W">三星 Galaxy S5 G9009W</span>
                                <em title="IP67级防尘防水，超级续航，电力持久">IP67级防尘防水，超级续航</em>
                            </div>
                            <strong>￥3800.00</strong>
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/10ac8459-4110-47df-80f9-3a7d0486dd30-thumbnail.jpg"/>
                        </a>
                    </li>
                    <li>
                        <a href="http://localhost:8080/shop/goods/content/201908/5.html" title="华为 Ascend G7"
                           target="_blank">
                            <div>
                                <span title="华为 Ascend G7">华为 Ascend G7</span>
                                <em title="一体化设计，尖端工艺">一体化设计，尖端工艺</em>
                            </div>
                            <strong>￥1900.00</strong>
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/198bc691-83e8-42f5-9595-5a54367911c3-thumbnail.jpg"/>
                        </a>
                    </li>
                    <li class="low">
                        <a href="http://localhost:8080/shop/goods/content/201908/21.html" title="佳能 IXUS 155"
                           target="_blank">
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/44cbbe8b-dcae-46d1-9606-746455b61905-thumbnail.jpg"/>
                            <span title="佳能 IXUS 155">佳能 IXUS 155</span>
                            <strong>￥899.00</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="http://localhost:8080/shop/goods/content/201908/22.html" title="佳能 IXUS 265"
                           target="_blank">
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/b773a9c1-8fef-4e48-ba82-ef433924b712-thumbnail.jpg"/>
                            <span title="佳能 IXUS 265">佳能 IXUS 265</span>
                            <strong>￥999.00</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="http://localhost:8080/shop/goods/content/201908/23.html" title="三星 WB35F"
                           target="_blank">
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/842d4ce2-18dc-4065-9eef-dad06da9bef4-thumbnail.jpg"/>
                            <span title="三星 WB35F">三星 WB35F</span>
                            <strong>￥899.00</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="http://localhost:8080/shop/goods/content/201908/24.html" title="三星 WB351F"
                           target="_blank">
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/8f5b4f02-f716-4737-afa6-70606793ffc5-thumbnail.jpg"/>
                            <span title="三星 WB351F">三星 WB351F</span>
                            <strong>￥1500.00</strong>
                        </a>
                    </li>
                    <li class="low">
                        <a href="http://localhost:8080/shop/goods/content/201908/25.html" title="索尼 DSC-W810"
                           target="_blank">
                            <img src="/shop/upload/image/blank.gif"
                                 data-original="http://image.demo.shopxx.net/4.0/201501/e44bc02b-e142-4fce-b88e-02b4ee8f392e-thumbnail.jpg"/>
                            <span title="索尼 DSC-W810">索尼 DSC-W810</span>
                            <strong>￥699.00</strong>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
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
    </div>
    <!--
       热门品牌
    -->
    <div class="row">
        <div class="span12">
            <div class="hotBrand">
                <ul class="clearfix">
                    <li>
                        <a href="/shop/brand/content/1.jhtml" title="苹果">
                            <img src="http://image.demo.shopxx.net/4.0/201501/a8275260-f9fa-4e20-8173-35b755fabb14.gif"
                                 alt="苹果"/>
                        </a>
                    </li>
                    <li>
                        <a href="/shop/brand/content/2.jhtml" title="三星">
                            <img src="http://image.demo.shopxx.net/4.0/201501/8aa08a42-f5b3-4f52-bea0-5ee8bd123b0c.gif"
                                 alt="三星"/>
                        </a>
                    </li>
                    <li>
                        <a href="/shop/brand/content/3.jhtml" title="索尼">
                            <img src="http://image.demo.shopxx.net/4.0/201501/dd75c116-51a7-4fbd-b014-6cf4bedcd0bb.gif"
                                 alt="索尼"/>
                        </a>
                    </li>
                    <li>
                        <a href="/shop/brand/content/4.jhtml" title="华为">
                            <img src="http://image.demo.shopxx.net/4.0/201501/2a5efa56-c4cd-4984-b11a-d56cadca6cff.gif"
                                 alt="华为"/>
                        </a>
                    </li>
                    <li>
                        <a href="/shop/brand/content/5.jhtml" title="魅族">
                            <img src="http://image.demo.shopxx.net/4.0/201501/72657c6c-d279-4952-ac20-1abcff776b07.gif"
                                 alt="魅族"/>
                        </a>
                    </li>
                    <li>
                        <a href="/shop/brand/content/6.jhtml" title="佳能">
                            <img src="http://image.demo.shopxx.net/4.0/201501/081d4e29-b631-4a49-8672-792a1308ce97.gif"
                                 alt="佳能"/>
                        </a>
                    </li>
                    <li>
                        <a href="/shop/brand/content/7.jhtml" title="尼康">
                            <img src="http://image.demo.shopxx.net/4.0/201501/5bd8bec2-f2df-4c84-937a-6eead637abd4.gif"
                                 alt="尼康"/>
                        </a>
                    </li>
                    <li>
                        <a href="/shop/brand/content/8.jhtml" title="松下">
                            <img src="http://image.demo.shopxx.net/4.0/201501/e921d086-358d-4610-9a53-b46a551b6557.gif"
                                 alt="松下"/>
                        </a>
                    </li>
                    <li>
                        <a href="/shop/brand/content/9.jhtml" title="戴尔">
                            <img src="http://image.demo.shopxx.net/4.0/201501/1ff77e2d-6190-4fea-9e12-be75d2d4ce83.gif"
                                 alt="戴尔"/>
                        </a>
                    </li>
                    <li>
                        <a href="/shop/brand/content/10.jhtml" title="惠普">
                            <img src="http://image.demo.shopxx.net/4.0/201501/271e4fc7-4451-488b-9d10-a7f80b41d719.gif"
                                 alt="惠普"/>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<#include "include/footer.ftl">
</body>
</html>
