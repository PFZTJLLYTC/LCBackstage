<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <title>连城管理系统</title>
    <meta content="这是一个 index 页面" name="description">
    <meta content="index" name="keywords">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta content="webkit" name="renderer">
    <meta content="no-siteapp" http-equiv="Cache-Control"/>
    <link href="../../img/LC.png" rel="icon" type="image/png">
    <link href="../../img/app-icon72x72@2x.png" rel="apple-touch-icon-precomposed">
    <meta content="Amaze UI" name="apple-mobile-web-app-title"/>
    <link href="../../css/amazeui.min.css" rel="stylesheet"/>
    <link href="../../css/message_box.css" rel="stylesheet">
    <link href="../../css/admin.css" rel="stylesheet">
    <script src="../../js/jquery.min.js"></script>
    <script src="../../js/app.js"></script>
    <script src="../../js/message_box.js"></script>
</head>

<body>
<header class="am-topbar admin-header">
    <div class="am-topbar-brand"><img src="../../img/page.png"></div>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">

            <li class="am-dropdown tognzhi" data-am-dropdown>
                <button class="am-btn am-btn-primary am-dropdown-toggle am-btn-xs am-radius am-icon-bell-o"
                        data-am-dropdown-toggle> 消息管理
                    <span class="am-badge am-badge-danger am-round">${allMessages}</span>
                </button>
                <ul class="am-dropdown-content">


                    <li class="am-dropdown-header">所有消息都在这里</li>
                    <#--                    <li><a href="/manager/order/findByStatus?status=0">未处理订单 <span class="am-badge am-badge-danger am-round">6</span></a>-->
                    <#--                    </li>-->
                    <li><a href="/manager/order/findByStatus?status=0">未处理订单 <span class="am-badge am-badge-danger am-round">${orderMessages}</span></a></li>
                    <li><a href="/manager/driver/findByStatus?status=-1">待审核司机申请<span class="am-badge am-badge-danger am-round">${driverMessages}</span></a></li>
                </ul>
            </li>

            <li class="kuanjie">

                <a href="/manager/personalInfo">个人中心</a>
                <a href="/manager/goContactAndHelp">系统设置</a>
            </li>



            <li class="am-hide-sm-only" style="float: right;"><a href="javascript:" id="admin-fullscreen"><span
                            class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
        </ul>
    </div>
</header>

<div class="am-cf admin-main">

    <div class="nav-navicon admin-main admin-sidebar">


        <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"> 欢迎系统管理员：${name}</div>
        <div class="sideMenu">
            <h3 class="am-icon-flag"><em></em> <a href="#">订单管理</a></h3>
            <ul>
                <li><a href="/manager/order/allOrders">所有订单列表</a></li>
                <li><a href="/manager/order/findByStatus?status=0">待处理订单</a></li>
                <li><a href="/manager/order/findByStatus?status=1">进行中订单</a></li>
                <li><a href="/manager/order/findByStatus?status=2">已完成订单</a></li>
            </ul>
            <h3 class="am-icon-users"><em></em> <a href="#"> 司机管理</a></h3>
            <ul>
                <li><a href="/manager/driver/allDrivers">司机列表</a></li>
                <li><a href="/manager/driver/findByStatus?status=-1">审核中司机</a></li>
                <li><a href="/manager/driver/findByStatus?status=1">在路上司机</a></li>
                <li><a href="/manager/driver/findByStatus?status=0">休息中司机</a></li>
                <li><a href="/manager/driver/findByStatus?status=2">待出行司机</a></li>
                <li><a href="/manager/driver/goToAddDriver">增加司机</a></li>
            </ul>
            <h3 class="am-icon-gears"><em></em> <a href="#">其他</a></h3>
            <ul>
                <li><a href="/manager/goContactAndHelp">推送与设置</a></li>
                <li><a href="/manager/personalInfo">个人中心</a></li>
            </ul>
        </div>
        <!-- sideMenu End -->

        <script type="text/javascript">
            jQuery(".sideMenu").slide({
                titCell: "h3", //鼠标触发对象
                targetCell: "ul", //与titCell一一对应，第n个titCell控制第n个targetCell的显示隐藏
                effect: "slideDown", //targetCell下拉效果
                delayTime: 300, //效果时间
                triggerTime: 150, //鼠标延迟触发时间（默认150）
                defaultPlay: true,//默认是否执行效果（默认true）
                returnDefault: false //鼠标从.sideMen移走后返回默认状态（默认false）
            });
        </script>


    </div>

    <div class=" admin-content">

        <div class="daohang">
            <ul>
                <li>
                    <button class="am-btn am-btn-default am-radius am-btn-xs" type="button"> <a href="/manager/goIndex">首页</a>
                </li>
            </ul>


        </div>


        <div class="admin-biaogelist">

            <div class="listbiaoti am-cf">
                <ul class="am-icon-flag on">订单管理</ul>
                <dl class="am-icon-home" style="float: right;"> 当前位置： <a href="/manager/goIndex">首页</a>>进行中订单</dl>
            </div>

            <div class="am-btn-toolbars am-btn-toolbar am-kg am-cf">
                <ul>
                    <li>
                        <div class="am-btn-group am-btn-group-xs">
                            <select data-am-selected="{btnWidth: 90, btnSize: 'sm', btnStyle: 'default'}">
                                <option value="b">所有订单</option>
                                <#--                                <option value="count">乘客数量</option>-->
                                <option value="dname">司机名</option>
                                <option value="unum">用户号码</option>
                                <option value="dnum">司机号码</option>
                            </select>
                        </div>
                    </li>
                    <li style="margin-right: 0;">
                        <span class="tubiao am-icon-calendar"></span>
                        <input class="am-form-field am-input-sm am-input-zm  am-icon-calendar" data-am-datepicker="{theme: 'success',}"
                               placeholder="创建日期" readonly type="text"/>
                    </li>
                    <li style="margin-left: -4px;">
                        <span class="tubiao am-icon-calendar"></span>
                        <input class="am-form-field am-input-sm am-input-zm  am-icon-calendar" data-am-datepicker="{theme: 'success',}"
                               placeholder="修改日期" readonly type="text"/>
                    </li>
                    <li><input class="am-form-field am-input-sm am-input-xm" placeholder="左侧选择搜索方式" type="text"/></li>
                    <li>
                        <button class="am-btn am-radius am-btn-xs am-btn-success" style="margin-top: -1px;"
                                type="button">搜索
                        </button>
                    </li>
                </ul>
            </div>


            <form class="am-form am-g">
                <table class="am-table am-table-bordered am-table-radius am-table-striped" width="100%">
                    <thead>
                    <tr class="am-success">
<#--                        <th class="table-check"><input type="checkbox"/></th>-->
<#--                        <th class="table-title">订单编号</th>-->
                        <th class="table-type">乘客数量</th>
                        <th class="table-type">用户电话</th>
                        <th class="table-type">乘车方向</th>
                        <th class="table-type">预约时间</th>
                        <th class="table-type">详细地址</th>
                        <th class="table-type">司机名</th>
                        <th class="table-type">司机电话</th>
                        <th class="table-type">车牌号</th>
                        <th class="table-type">备注</th>
                        <th class="table-author am-hide-sm-only">订单状态</th>
                        <th class="table-date am-hide-sm-only">日期</th>
<#--                        <th class="table-date am-hide-sm-only">修改日期</th>-->
                        <th class="table-type">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <#if orders??>
                        <#list orders.content as order>
                            <tr>
<#--                                <td>${order.orderId}</td>-->
                                <td>${order.userCount}</td>
                                <td>${order.userPhone}</td>
                                <td>${order.lineName}</td>
                                <td>${order.time?default("/")}</td>
                                <td>${order.detailAddress?default("/")}</td>
                                <td>${order.driverName}</td>
                                <td>${order.dnum}</td>
                                <td>${order.carNum}</td>
                                <td>${order.remark?default("/")}</td>
                                <td class="am-hide-sm-only">进行中</td>
                                <td class="am-hide-sm-only">${order.date}</td>
<#--                                <td class="am-hide-sm-only">${order.updateTime}</td>-->
                                <td><button class="am-btn am-btn-danger am-round am-btn-xs am-icon-plus" type="button" onclick="confirmCancelOrder(${order.orderId})"><#--<a href="/manager/order/cancel?orderId=${order.orderId}">--> 取消订单</a></button> </td>
                            </tr>
                        </#list>
                    </#if>
                    </tbody>
                </table>
                <ul class="am-pagination am-fr">
                    <#if currentPage lte 1>
                        <li class="am-disabled"><a href="#">«</a></li>
                    <#else>
                        <li class="am-active"><a href="/manager/order/findByStatus?page=${currentPage-1}&size=${size}&status=1">«</a></li>
                    </#if>
                    <#list 1..orders.getTotalPages() as index >
                        <#if currentPage == index >
                            <li class="am-disabled"><a href="#">${index}</a></li>
                        <#else>
                            <li class="am-active"><a href="/manager/order/findByStatus?page=${index}&size=${size}&status=1">${index}</a></li>
                        </#if>
                    </#list>
                    <#if currentPage gte orders.getTotalPages()>
                        <li class="am-disabled"><a href="#">»</a></li>
                    <#else>
                        <li class="am-active"><a href="/manager/order/findByStatus?page=${currentPage+1}&size=${size}&status=1">»</a></li>
                    </#if>

                </ul>

            </form>


            <div class="foods">
                <ul>
                    版权所有@2019.
                </ul>
                <dl>
                    <a class="am-icon-btn am-icon-arrow-up" href="" title="返回头部"></a>
                </dl>
            </div>
        </div>
    </div>
</div>

<div id="comfirmBox" class="my-mode">
    <div >是否取消这个订单，此操作将通知相关人员</div>
</div>


<#--播放音乐-->
<audio id="notice" loop="loop">
    <#--    待添加-->
    <source src = "/mp3/song.mp3" type="audio/mpeg" />
</audio>

<script>
    var websocket = null;
    if('WebSocket' in window){
        // 第一个试试看
        websocket = new WebSocket("ws://49.234.98.50/webSocket/"+${name});
    }else {
        alert("该浏览器不支持websocket");
    }
    websocket.onopen = function (event) {
        console.log('建立连接');
    }
    websocket.onclose = function (event) {
        console.log('连接关闭');
    }
    websocket.onmessage = function (event) {
        console.log('收到消息：'+ event.data);
        //弹窗提醒，播放音乐
        //jquery弹窗，懒得写了
        //play
        document.getElementById('notice').play();

        // document.getElementById('notice').pause();点击某属性后暂停
    }
    websocket.onerror = function (event) {
        alert('websocket通信发生错误！');
    }
    window.onbeforeunload = function (ev) { websocket.close(); }

    function confirmCancelOrder(tocancel) {
        message_box.showMode("comfirmBox", "警告", function () {
            var url = "cancel?orderId="+tocancel;
            window.location.href=url;
        },function() {
            console.log('取消操作');
        });

    }
</script>

<!--[if lt IE 9]>
<script src="../../js/message_box.js"></script>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="../../js/polyfill/rem.min.js"></script>
<script src="../../js/polyfill/respond.min.js"></script>
<script src="../../js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="../../js/amazeui.min.js"></script>
<!--<![endif]-->


</body>
</html>
