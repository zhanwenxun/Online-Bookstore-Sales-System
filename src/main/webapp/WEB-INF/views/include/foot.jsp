<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>昌航书店</title>
    <link href="${cp}/css/bootstrap.min.css" rel="stylesheet">
    <link href="${cp}/css/style.css" rel="stylesheet">
    <link href="${cp}/css/footer_150526.css" rel="stylesheet" type="text/css">


    <script src="${cp}/js/bootstrap.min.js"></script>
    <script src="${cp}/js/main.js"></script>
</head>

<body>
    <!-- 页脚 -->
    <div class="footer" dd_name="页尾">
        <div class="footer_pic_new">
            <div class="footer_pic_new_inner">
                <a name="foot_1" href="http://help.dangdang.com/details/page13" target="_blank" class="footer_pic01"><span>正规渠道正品保障</span></a>
                <a name="foot_2" class="footer_pic02" href="http://help.dangdang.com/details/page21" target="_blank"><span>放心购物货到付款</span></a>
                <a name="foot_3" class="footer_pic03" href="http://help.dangdang.com/details/page16" target="_blank"><span>150城市次日送达</span></a>
                <a name="foot_4" class="footer_pic04" href="http://help.dangdang.com/details/page28" target="_blank"><span>上门退换 购物无忧</span></a>
            </div>
        </div>
        <div class="public_footer_new">
            <div class="footer_sort footer_nvice">
                <span class="f_title">购物指南</span>
                <ul>
                    <li><a name="foot_gouwu" href="http://help.dangdang.com/details/page2" target="_blank" class="main" rel="nofollow">购物流程</a></li>
                    <li><a name="foot_jifen" href="http://help.dangdang.com/details/page6" target="_blank" rel="nofollow">发票制度</a></li>
                    <li><a name="foot_fapiao" href="http://safe.dangdang.com" target="_blank" rel="nofollow">账户管理</a></li>
                    <li><a name="foot_mydangdang" href="http://help.dangdang.com/details/page8" target="_blank" rel="nofollow">会员优惠</a></li>
                </ul>
            </div>
            <div class="footer_sort footer_pay">
                <span class="f_title">支付方式</span>
                <ul>
                    <li><a name="foot_tuihuanhuoliucheng" href="http://help.dangdang.com/details/page237" target="_blank" rel="nofollow">货到付款</a></li>
                    <li><a name="foot_tuihuanhuo" href="http://help.dangdang.com/details/page22" target="_blank" rel="nofollow">网上支付</a></li>
                    <li><a name="foot_huanhuo" href="http://help.dangdang.com/details/page24" target="_blank" rel="nofollow">礼品卡支付</a></li>
                    <li><a name="foot_tuihuo" href="http://help.dangdang.com/details/page23" target="_blank" rel="nofollow">银行转帐</a></li>
                </ul>
            </div>
            <div class="footer_sort footer_characteristic">
                <span class="f_title">订单服务</span>
                <ul>
                    <li><a name="foot_jifen" href="http://help.dangdang.com/details/page400" target="_blank" class="main" rel="nofollow">配送服务查询</a></li>
                    <li><a name="foot_lipinka" href="http://help.dangdang.com/details/page4" target="_blank" rel="nofollow">订单状态说明</a></li>
                    <li><a name="foot_ershoushu" href="http://myhome.dangdang.com/myOrder" target="_blank" rel="nofollow">自助取消订单</a></li>
                    <li><a name="foot_shouji" href="http://myhome.dangdang.com/myOrder" target="_blank" rel="nofollow">自助修改订单</a></li>
                </ul>
            </div>
            <div class="footer_sort footer_distribution">
                <span class="f_title">配送方式</span>
                <ul>
                    <li><a name="foot_huodaofukuan" href="http://help.dangdang.com/details/page232" target="_blank" class="main" rel="nofollow">当日递</a></li>
                    <li><a name="foot_yinhangzhuanzhang" href="http://help.dangdang.com/details/page233" target="_blank" class="main" rel="nofollow">次日达</a></li>
                    <li><a name="foot_dangdanglijuan" href="http://help.dangdang.com/details/page500" target="_blank" rel="nofollow">订单自提</a></li>
                    <li><a name="foot_dangdanglijuan" href="http://help.dangdang.com/details/page20" target="_blank" rel="nofollow">验货与签收</a></li>
                </ul>
            </div>
            <div class="footer_sort footer_help">
                <span class="f_title">退换货</span>
                <ul>
                    <li><a name="foot_faq" href="http://help.dangdang.com/details/page28" target="_blank" rel="nofollow">退换货服务查询</a></li>
                    <li><a name="foot_zhaohuimima" href="http://return.dangdang.com/reverseapplyselect.aspx" target="_blank" rel="nofollow">自助申请退换货</a></li>
                    <li><a name="foot_huikuandan" href="http://return.dangdang.com/reverseapplylist.aspx" target="_blank" rel="nofollow">退换货进度查询</a></li>
                    <li><a name="foot_tuiding" href="http://help.dangdang.com/details/page31" target="_blank" rel="nofollow">退款方式和时间</a></li>
                </ul>
            </div>
            <div class="footer_sort footer_shangjia">
                <span class="f_title">商家服务</span>
                <ul>

                    <li><a name="foot_zhaohuimima" href="http://shop.dangdang.com/shangjia" target="_blank" rel="nofollow">商家中心</a></li>
                    <li><a name="foot_huikuandan" href="http://outlets.dangdang.com/merchants_cooperation" target="_blank" rel="nofollow">运营服务</a></li>
                    <li><a name="foot_tuiding" href="http://outlets.dangdang.com/merchants_outlets" target="_blank" rel="nofollow">加入尾品汇</a></li>
                </ul>
            </div>
        </div>
        <div class="footer_nav_box">
            <div class="footer_nav"><a href="http://t.dangdang.com/companyInfo" target="_blank" rel="nofollow">公司简介</a><span class="sep">|</span><a

                    href="http://zhaopin.dangdang.com" target="_blank">诚聘英才</a><span class="sep">|</span><a

                    href="http://union.dangdang.com/" target="_blank">网站联盟</a><span

                    class="sep">|</span><a href="http://outlets.dangdang.com/merchants_open" target="_blank">当当招商</a><span class="sep">|</span><a

                    href="http://giftcard.dangdang.com/giftcardCompany" target="_blank" rel="nofollow">机构销售</a><span class="sep">|</span><a

                    href="http://static.dangdang.com/topic/744/200778.shtml" target="_blank">手机当当</a><span class="sep">|</span><a href="http://blog.dangdang.com/" target="_blank">官方

                Blog</a>
                <span class="sep">|</span><div class="footer_hot_search"><a href="http://www.dangdang.com/sales/brands/" target="_blank" class="footer_a" id="hot_search" onmouseover="showghotsearch('hot_search','hot_search_content')" onmouseout="hidehotsearch('hot_search','hot_search_content');">热词搜索</a><div class="pos_a_box" style="display: none;" id="hot_search_content" onmouseover="showghotsearch('hot_search','hot_search_content')" onmouseout="hidehotsearch('hot_search','hot_search_content');">
                    <a href="http://www.dangdang.com/sales/brands/a-1.html" target="_blank" >A</a><a href="http://www.dangdang.com/sales/brands/b-1.html" target="_blank" >B</a><a href="http://www.dangdang.com/sales/brands/c-1.html" target="_blank" >C</a><a href="http://www.dangdang.com/sales/brands/d-1.html" target="_blank" >D</a><a href="http://www.dangdang.com/sales/brands/e-1.html" target="_blank" >E</a><a href="http://www.dangdang.com/sales/brands/f-1.html" target="_blank" >F</a><a href="http://www.dangdang.com/sales/brands/g-1.html" target="_blank" >G</a>
                    <a href="http://www.dangdang.com/sales/brands/h-1.html" target="_blank" >H</a><a href="http://www.dangdang.com/sales/brands/i-1.html" target="_blank" >I</a><a href="http://www.dangdang.com/sales/brands/j-1.html" target="_blank" >J</a><a href="http://www.dangdang.com/sales/brands/k-1.html" target="_blank" >K</a><a href="http://www.dangdang.com/sales/brands/l-1.html" target="_blank" >L</a><a href="http://www.dangdang.com/sales/brands/m-1.html" target="_blank" >M</a><a href="http://www.dangdang.com/sales/brands/n-1.html" target="_blank" >N</a>
                    <a href="http://www.dangdang.com/sales/brands/o-1.html" target="_blank" >O</a><a href="http://www.dangdang.com/sales/brands/p-1.html" target="_blank" >P</a><a href="http://www.dangdang.com/sales/brands/q-1.html" target="_blank" >Q</a><a href="http://www.dangdang.com/sales/brands/r-1.html" target="_blank" >R</a><a href="http://www.dangdang.com/sales/brands/s-1.html" target="_blank" >S</a><a href="http://www.dangdang.com/sales/brands/t-1.html" target="_blank" >T</a><a href="http://www.dangdang.com/sales/brands/u-1.html" target="_blank" >U</a>
                    <a href="http://www.dangdang.com/sales/brands/v-1.html" target="_blank" >V</a><a href="http://www.dangdang.com/sales/brands/w-1.html" target="_blank" >W</a><a href="http://www.dangdang.com/sales/brands/x-1.html" target="_blank" >X</a><a href="http://www.dangdang.com/sales/brands/y-1.html" target="_blank" >Y</a><a href="http://www.dangdang.com/sales/brands/z-1.html" target="_blank" >Z</a><a href="http://www.dangdang.com/sales/brands/other-1.html" target="_blank" >0-9</a>
                    <i></i></div></div>
                <script>
                    var setTo = null;
                    function showghotsearch(){
                        clearTimeout(setTo);
                        document.getElementById("hot_search_content").style.display="block";
                    }
                    function hidehotsearch(){
                        setTo = setTimeout(function(){
                            document.getElementById("hot_search_content").style.display="none";
                        },100)
                    }
                </script>
            </div>
        </div>
    </div>
    </div>
    <div id="footer_end"></div>
</body>
</html>