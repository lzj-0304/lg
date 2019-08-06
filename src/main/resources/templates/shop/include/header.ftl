<div class="header">
    <div class="top">
        <div class="topNav">
            <ul class="left">
                <li>
                    <span>您好，欢迎来到乐购商城</span>
                    <span id="headerName" class="headerName">&nbsp;</span>
                </li>
                <li id="headerLogin" class="headerLogin">
                    <a href="/login">登录</a>|
                </li>
                <li id="headerRegister" class="headerRegister">
                    <a href="/register">注册</a>
                </li>
                <li id="headerLogout" class="headerLogout">
                    <a href="/exit">[退出]</a>
                </li>
            </ul>
            <ul class="right">
                <li>
                    <a href="/shop/member/index.jhtml">会员中心</a>|
                </li>
                <li>
                    <a href="/shop/article/list/3.jhtml">帮助中心</a>|
                </li>
                <li id="headerCart" class="headerCart">
                    <a href="/shop/cart/list.jhtml">购物车</a>
                    (<em></em>)
                </li>
            </ul>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="span3">
                <a href="/shop/">
                    <img src="/shop/default/images/logo.png" alt="SHOP++商城"/>
                </a>
            </div>
            <div class="span6">
                <div class="search">
                    <form id="goodsSearchForm" action="/shop/goods/search.jhtml" method="get">
                        <input name="keyword" class="keyword" value="商品搜索" autocomplete="off"
                               x-webkit-speech="x-webkit-speech" x-webkit-grammar="builtin:search" maxlength="30"/>
                        <button type="submit">&nbsp;</button>
                    </form>
                </div>
                <div class="hotSearch">
                    热门搜索:
                    <a href="/shop/goods/search.jhtml?keyword=%E8%8B%B9%E6%9E%9C">苹果</a>
                    <a href="/shop/goods/search.jhtml?keyword=%E4%B8%89%E6%98%9F">三星</a>
                    <a href="/shop/goods/search.jhtml?keyword=%E7%B4%A2%E5%B0%BC">索尼</a>
                    <a href="/shop/goods/search.jhtml?keyword=%E5%8D%8E%E4%B8%BA">华为</a>
                    <a href="/shop/goods/search.jhtml?keyword=%E9%AD%85%E6%97%8F">魅族</a>
                    <a href="/shop/goods/search.jhtml?keyword=%E4%BD%B3%E8%83%BD">佳能</a>
                    <a href="/shop/goods/search.jhtml?keyword=%E5%8D%8E%E7%A1%95">华硕</a>
                    <a href="/shop/goods/search.jhtml?keyword=%E7%BE%8E%E7%9A%84">美的</a>
                    <a href="/shop/goods/search.jhtml?keyword=%E6%A0%BC%E5%8A%9B">格力</a>
                </div>
            </div>
            <div class="span3">
                <div class="phone">
                    <em>服务电话</em>
                    800-8888888
                </div>
            </div>
        </div>
        <div class="row">
            <div class="span12">
                <dl class="mainNav">
                    <dt>
                        <a href="/shop/product_category.jhtml">所有商品分类</a>
                    </dt>

                    <@navigation_list position = 1>
                        <#list navigations as navigation>
                            <dd>
                                <a href="${navigation.url}">${navigation.name}</a>
                            </dd>
                        </#list>
                    </@navigation_list>
                </dl>
            </div>
        </div>
    </div>
</div>