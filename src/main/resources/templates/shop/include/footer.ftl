<div class="footer">
    <!--
       新手指南  特设服务 支付方式 配送方式
    -->
    <div class="service clearfix">
        <dl>
            <dt class="icon1">新手指南</dt>
            <dd>
                <a href="#">购物流程</a>
            </dd>
            <dd>
                <a href="#">会员注册</a>
            </dd>
            <dd>
                <a href="#">购买宝贝</a>
            </dd>
            <dd>
                <a href="#">支付货款</a>
            </dd>
            <dd>
                <a href="#">用户协议</a>
            </dd>
        </dl>
        <dl>
            <dt class="icon2">特色服务</dt>
            <dd>
                <a href="#">购物流程</a>
            </dd>
            <dd>
                <a href="#">会员注册</a>
            </dd>
            <dd>
                <a href="#">购买宝贝</a>
            </dd>
            <dd>
                <a href="#">支付货款</a>
            </dd>
            <dd>
                <a href="#">用户协议</a>
            </dd>
        </dl>
        <dl>
            <dt class="icon3">支付方式</dt>
            <dd>
                <a href="#">购物流程</a>
            </dd>
            <dd>
                <a href="#">会员注册</a>
            </dd>
            <dd>
                <a href="#">购买宝贝</a>
            </dd>
            <dd>
                <a href="#">支付货款</a>
            </dd>
            <dd>
                <a href="#">用户协议</a>
            </dd>
        </dl>
        <dl>
            <dt class="icon4">配送方式</dt>
            <dd>
                <a href="#">购物流程</a>
            </dd>
            <dd>
                <a href="#">会员注册</a>
            </dd>
            <dd>
                <a href="#">购买宝贝</a>
            </dd>
            <dd>
                <a href="#">支付货款</a>
            </dd>
            <dd>
                <a href="#">用户协议</a>
            </dd>
        </dl>
        <div class="qrCode">
            <img src="/shop/default/images/qr_code.gif" alt="官方微信"/>
            官方微信
        </div>
    </div>


    <!--
       关于我们 & 友情链接
    -->
    <div class="bottom">
        <div class="bottomNav">
            <ul>
                <@navigation_list position = 2>
                    <#list navigations as navigation>
                        <li>
                            <a href="${navigation.url}"<#if navigation.isBlankTarget> target="_blank"</#if>>${navigation.name}</a>
                            <#if navigation_has_next>|</#if>
                        </li>
                    </#list>
                </@navigation_list>
            </ul>
        </div>


        <div class="info">
            <p>沪ICP备10000000号</p>
            <p>Copyright © 2005-2020 乐购商城 版权所有</p>
            <ul>
                <@friend_link_list type=1>
                    <#list friendLinkList as friendLink>
                        <li>
                            <a href="${friendLink.url}">
                                <img src="${friendLink.logo}"
                                     alt="${friendLink.name}"/>
                            </a>
                        </li>
                    </#list>
                </@friend_link_list>
            </ul>
        </div>
    </div>

</div>