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
    <meta content="no-siteapp" http-equiv="Cache-Control">
    <link href="http://127.0.0.1:8080/lc/img/LC.png" rel="icon" type="image/png">
    <link href="http://127.0.0.1:8080/lc/img/app-icon72x72@2x.png" rel="apple-touch-icon-precomposed">
    <meta content="Amaze UI" name="apple-mobile-web-app-title"/>
    <link href="../../static/css/amazeui.min.css" rel="stylesheet"/>
    <link href="../../static/css/admin.css" rel="stylesheet">
    <script src="../../static/js/jquery.min.js"></script>
    <script src="../../static/js/app.js"></script>
</head>

<body>
<header class="am-topbar admin-header">
    <div class="am-topbar-brand"> <img src="http://127.0.0.1:8080/lc/img/page.png" width="213" height="53" alt=""> </div>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
        <ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">

            <li class="am-dropdown tognzhi" data-am-dropdown>
                <button class="am-btn am-btn-primary am-dropdown-toggle am-btn-xs am-radius am-icon-bell-o"
                        data-am-dropdown-toggle> 消息管理<span class="am-badge am-badge-danger am-round">6</span></button>
                <ul class="am-dropdown-content">


                    <li class="am-dropdown-header">所有消息都在这里</li>
                    <li><a href="">未处理订单 <span class="am-badge am-badge-danger am-round">6</span></a>
                    </li>
                    <li><a href="#">未处理司机申请</a></li>
                    <li><a href="#">系统升级</a></li>
                </ul>
            </li>

            <li class="kuanjie">

                <a href="#">个人中心</a>
                <a href="#">系统设置</a>
            </li>

            <li class="soso">

                <p>

                    <select data-am-selected="{btnWidth: 70, btnSize: 'sm', btnStyle: 'default'}">
                        <option value="b">全部</option>
                        <option value="o">订单</option>
                        <option value="o">司机</option>

                    </select>

                </p>

                <p class="ycfg"><input class="am-form-field am-input-sm" placeholder="搜索" type="text"/></p>
                <p>
                    <button class="am-btn am-btn-xs am-btn-default am-xiao"><i class="am-icon-search"></i></button>
                </p>
            </li>


            <li class="am-hide-sm-only" style="float: right;"><a href="javascript:" id="admin-fullscreen"><span
                    class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
        </ul>
    </div>
</header>

<div class="am-cf admin-main">

    <div class="nav-navicon admin-main admin-sidebar">


        <div class="sideMenu am-icon-dashboard" style="color:#aeb2b7; margin: 10px 0 0 0;"> 欢迎系统管理员：<strong>${name}</strong></div>
        <div class="sideMenu">
            <h3 class="am-icon-flag"><em></em> <a href="#">订单管理</a></h3>
            <ul>
                <li><a href="">所有订单列表</a></li>
                <li><a href="">待处理订单</a></li>
                <li><a href="">进行中订单</a></li>
                <li><a href="">已完成订单</a></li>
            </ul>
            <h3 class="am-icon-users"><em></em> <a href="#"> 司机管理</a></h3>
            <ul>
                <li><a href="">司机列表</a></li>
                <li><a href="">审核中司机</a></li>
            </ul>
            <h3 class="am-icon-volume-up"><em></em> <a href="#">信息通知</a></h3>
            <ul>
                <li>站内消息 /留言</li>
            </ul>
            <h3 class="am-icon-gears"><em></em> <a href="#">系统设置</a></h3>
            <ul>
                <li>数据备份</li>
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
                returnDefault: true //鼠标从.sideMen移走后返回默认状态（默认false）
            });
        </script>


    </div>

    <div class=" admin-content">

        <div class="daohang">
            <ul>
                <li>
                    <button class="am-btn am-btn-default am-radius am-btn-xs" type="button"> 首页
                </li>
                <li>
                    <button class="am-btn am-btn-default am-radius am-btn-xs" type="button">订单管理<a
                            class="am-close am-close-spin" data-am-modal-close="" href="javascript: void(0)">×</a>
                    </button>
                </li>
                <li>
                    <button class="am-btn am-btn-default am-radius am-btn-xs" type="button">司机管理<a
                            class="am-close am-close-spin" data-am-modal-close="" href="javascript: void(0)">×</a>
                    </button>
                </li>
            </ul>


        </div>


        <div class="admin">


            <div class="admin-index">
                <dl data-am-scrollspy="{animation: 'slide-right', delay: 100}">
                    <dt class="qs"><i class="am-icon-users"></i></dt>
                    <dd>15</dd>
                    <dd class="f12">司机数量</dd>
                </dl>
                <dl data-am-scrollspy="{animation: 'slide-right', delay: 300}">
                    <dt class="cs"><i class="am-icon-area-chart"></i></dt>
                    <dd>110</dd>
                    <dd class="f12">今日载客人次</dd>
                </dl>
                <dl data-am-scrollspy="{animation: 'slide-right', delay: 600}">
                    <dt class="hs"><i class="am-icon-shopping-cart"></i></dt>
                    <dd>100</dd>
                    <dd class="f12">订单数量</dd>
                </dl>
                <dl data-am-scrollspy="{animation: 'slide-right', delay: 900}">
                    <dt class="ls"><i class="am-icon-cny"></i></dt>
                    <dd>550</dd>
                    <dd class="f12">预计收入</dd>
                </dl>
            </div>
            <div class="admin-biaoge">
                <div class="xinxitj">近日概括</div>
                <table class="am-table">
                    <thead>
                    <tr>
                        <th>日期</th>
                        <th>司机数量</th>
                        <th>今日载客人次</th>
                        <th>订单数量</th>
                        <th>预计收入</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>2019/1/19</td>
                        <td>15</td>
                        <td><a href="#">110</a></td>
                        <td>100</td>
                        <td> 550</td>
                    </tr>


                    </tbody>
                </table>

            </div>
            <div class="shuju">
                <div class="shujuone">
                    <dl>
                        <dt>全盘收入： 1356666</dt>
                        <dt>全盘支出： 5646465.98</dt>
                        <dt>全盘利润： 546464</dt>
                    </dl>
                    <ul>
                        <h2>26.83%</h2>
                        <li>全盘拨出</li>
                    </ul>
                </div>
                <div class="shujutow">
                    <dl>
                        <dt>全盘收入： 1356666</dt>
                        <dt>全盘支出： 5646465.98</dt>
                        <dt>全盘利润： 546464</dt>
                    </dl>
                    <ul>
                        <h2>26.83%</h2>
                        <li>全盘拨出</li>
                    </ul>
                </div>
                <div class="slideTxtBox">
                    <div class="hd">
                        <ul>
                            <li>其他信息</li>
                            <li>工作进度表</li>
                        </ul>
                    </div>
                    <div class="bd">
                        <ul>
                            <table class="am-table" width="100%">
                                <tbody>
                                <tr>
                                    <td align="center" width="7%">1</td>
                                    <td width="83%">工作进度名称</td>
                                    <td align="center" width="10%"><a href="#">10%</a></td>
                                </tr>
                                <tr>
                                    <td align="center">1</td>
                                    <td>工作进度名称</td>
                                    <td align="center"><a href="#">10%</a></td>
                                </tr>
                                <tr>
                                    <td align="center">1</td>
                                    <td>工作进度名称</td>
                                    <td align="center"><a href="#">10%</a></td>
                                </tr>
                                <tr>
                                    <td align="center">1</td>
                                    <td>工作进度名称</td>
                                    <td align="center"><a href="#">10%</a></td>
                                </tr>

                                <tr>
                                    <td align="center">1</td>
                                    <td>工作进度名称</td>
                                    <td align="center"><a href="#">10%</a></td>
                                </tr>

                                <tr>
                                    <td align="center">1</td>
                                    <td>工作进度名称</td>
                                    <td align="center"><a href="#">10%</a></td>
                                </tr>

                                <tr>
                                    <td align="center">1</td>
                                    <td>工作进度名称</td>
                                    <td align="center"><a href="#">10%</a></td>
                                </tr>


                                </tbody>
                            </table>
                        </ul>

                    </div>
                </div>
                <script type="text/javascript">jQuery(".slideTxtBox").slide();</script>


            </div>

            <div class="foods">
                <ul>版权所有@2019 .</dl>


            </div>


        </div>

    </div>


</div>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="../../static/js/polyfill/rem.min.js"></script>
<script src="../../static/js/polyfill/respond.min.js"></script>
<script src="../../static/js/amazeui.legacy.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="../../static/js/amazeui.min.js"></script>
<!--<![endif]-->


</body>
</html>