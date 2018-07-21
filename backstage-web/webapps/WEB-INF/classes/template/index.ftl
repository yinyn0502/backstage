
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>优集客</title>

<#include "ahead.ftl">
    <script src="/static/common/inspinia.js?v=3.2.0"></script>
    <script src="/static/common/contabs.js"></script>
    <meta name="keywords" content="主页">
    <meta name="description" content="主页">


</head>

<body class="fixed-sidebar full-height-layout gray-bg">
<div id="wrapper">
    <!--左侧导航开始-->
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="nav-close"><i class="fa fa-times-circle"></i>
        </div>
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <span><label style="color: red">当前用户:${currentUser.loginName}
                        </label>
                        </span>
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="clear">
                               <span class="block m-t-xs"><strong class="font-bold"></strong></span>
                               <span class="text-muted text-xs block"><b class="caret"></b></span>
                                </span>
                        </a>
                        <ul class="dropdown-menu animated fadeInRight m-t-xs">
                            <#--<li><a class="J_menuItem" href="/sys/user/imageEdit">修改头像</a>
                            </li>
                            <li><a class="J_menuItem" href="/sys/user/info">个人资料</a>
                            </li>
                            <li><a class="J_menuItem" href="/iim/contact/index">我的通讯录</a>
                            </li>
                            <li><a class="J_menuItem" href="/iim/mailBox/list">信箱</a>
                            </li>
                            <li class="divider"></li>
                            <li><a onclick="changeStyle()" href="#">切换到ACE模式</a>
                            </li>

                            <li class="divider"></li>-->
                            <li><a href="/logout">安全退出</a>
                            </li>
                        </ul>
                    </div>
                    <div class="logo-element">JP
                    </div>
                </li>



<#if menuList??>
    <#list menuList as m>


                <li><a href=""><i class="fa fa-cog"></i> <span
                        class="nav-label">${m.name}</span><span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
        <#if m.subSysMenu??>
            <#list m.subSysMenu as sub>
                <#if sub.id??>
                        <li><a class="J_menuItem" href="${sub.href}">
                            <i class="fa list-alt"></i> <span class="nav-label">${sub.name}</span></a></li>
                  </#if>
            </#list>
        </#if>
                    </ul></li>

</#list>
<#else>
</#if>


            </ul>
            <script>
                window.onload=function() {
                    function getElementByAttr(tag,attr,value)
                    {
                        var aElements=document.getElementsByTagName(tag);
                        var aEle=[];
                        for(var i=0;i<aElements.length;i++)
                        {
                            if(aElements[i].getAttribute(attr)==value)
                                aEle.push( aElements[i] );
                        }
                        return aEle;
                    }
                    var frame = getElementByAttr("a", "href", "/order/query/list")[0];
                    frame.onclick=function() {
                        getElementByAttr("iframe", "data-id", "/order/query/list")[0].contentWindow.location.reload(true);
                    };
                }
            </script>
        </div>
    </nav>
    <!--左侧导航结束-->
    <!--右侧部分开始-->
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <#--<div class="navbar-header"><a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
                    <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                        <div class="form-group">
                            <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search">
                        </div>
                    </form>
                </div>-->
                <ul class="nav navbar-top-links navbar-right">
                   <#-- <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-envelope"></i> <span class="label label-warning">noReadCount</span>
                        </a>
                        <ul class="dropdown-menu dropdown-messages">

                            <li>
                                <div class="text-center link-block">
                                    <a class="J_menuItem" href="/iim/mailBox/list?orderBy=sendtime desc">
                                        <i class="fa fa-envelope"></i> <strong> 查看所有邮件</strong>
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </li>-->
                    <li class="dropdown">
                       <#-- <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell"></i> <span class="label label-primary">count</span>
                        </a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>



                            </li>
                            <li class="divider"></li>
                            <li>
                                <div class="text-center link-block">
                                    您有 count 条未读消息 <a class="J_menuItem" href="/oa/oaNotify/self">
                                    <strong>查看所有 </strong>
                                    <i class="fa fa-angle-right"></i>
                                </a>
                                </div>
                            </li>
                        </ul>-->
                    </li>

                    <!-- 国际化功能预留接口 -->
                    <#--<li class="dropdown">
                        <a id="lang-switch" class="lang-selector dropdown-toggle" href="#" data-toggle="dropdown" aria-expanded="true">
								<span class="lang-selected">
										<img  class="lang-flag" src="/static/common/img/china.png" alt="中国">
										<span class="lang-id">中国</span>
										<span class="lang-name">中文</span>
									</span>
                        </a>

                        <!--Language selector menu&ndash;&gt;
                        <ul class="head-list dropdown-menu with-arrow">
                            <li>
                                <!--English&ndash;&gt;
                                <a class="lang-select">
                                    <img class="lang-flag" src="/static/common/img/china.png" alt="中国">
                                    <span class="lang-id">中国</span>
                                    <span class="lang-name">中文</span>
                                </a>
                            </li>
                            <li>
                                <!--English&ndash;&gt;
                                <a class="lang-select">
                                    <img class="lang-flag" src="/static/common/img/united-kingdom.png" alt="English">
                                    <span class="lang-id">EN</span>
                                    <span class="lang-name">English</span>
                                </a>
                            </li>
                            <li>
                                <!--France&ndash;&gt;
                                <a class="lang-select">
                                    <img class="lang-flag" src="/static/common/img/france.png" alt="France">
                                    <span class="lang-id">FR</span>
                                    <span class="lang-name">Français</span>
                                </a>
                            </li>
                            <li>
                                <!--Germany&ndash;&gt;
                                <a class="lang-select">
                                    <img class="lang-flag" src="/static/common/img/germany.png" alt="Germany">
                                    <span class="lang-id">DE</span>
                                    <span class="lang-name">Deutsch</span>
                                </a>
                            </li>
                            <li>
                                <!--Italy&ndash;&gt;
                                <a class="lang-select">
                                    <img class="lang-flag" src="/static/common/img/italy.png" alt="Italy">
                                    <span class="lang-id">IT</span>
                                    <span class="lang-name">Italiano</span>
                                </a>
                            </li>
                            <li>
                                <!--Spain&ndash;&gt;
                                <a class="lang-select">
                                    <img class="lang-flag" src="/static/common/img/spain.png" alt="Spain">
                                    <span class="lang-id">ES</span>
                                    <span class="lang-name">Español</span>
                                </a>
                            </li>
                        </ul>
                    </li>-->
                </ul>
            </nav>
        </div>
        <div class="row content-tabs">
            <button class="roll-nav roll-left J_tabLeft"><i class="fa fa-backward"></i>
            </button>
            <nav class="page-tabs J_menuTabs">
                <div class="page-tabs-content">
                    <a href="javascript:;" class="active J_menuTab" data-id="/home">首页</a>
                </div>
            </nav>
            <button class="roll-nav roll-right J_tabRight"><i class="fa fa-forward"></i>
            </button>
           <#-- <div class="btn-group roll-nav roll-right">
                <button class="dropdown J_tabClose"  data-toggle="dropdown">关闭操作<span class="caret"></span>

                </button>
                <ul role="menu" class="dropdown-menu dropdown-menu-right">
                    <li class="J_tabShowActive"><a>定位当前选项卡</a>
                    </li>
                    <li class="divider"></li>
                    <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                    </li>
                    <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                    </li>
                </ul>
            </div>
            <a href="/logout" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i> 退出</a>-->
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="/home" frameborder="0" data-id="/home" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-left"><a href="http://www.ueater.com">http://www.ueater.com</a> &copy; 2017-2027</div>
        </div>
    </div>
    <!--右侧部分结束-->


</div>
</body>

<!-- 语言切换插件，为国际化功能预留插件 -->
<script type="text/javascript">

    $(document).ready(function(){

        $("a.lang-select").click(function(){
            $(".lang-selected").find(".lang-flag").attr("src",$(this).find(".lang-flag").attr("src"));
            $(".lang-selected").find(".lang-flag").attr("alt",$(this).find(".lang-flag").attr("alt"));
            $(".lang-selected").find(".lang-id").text($(this).find(".lang-id").text());
            $(".lang-selected").find(".lang-name").text($(this).find(".lang-name").text());

        });


    });

    function changeStyle(){
        $.get('/theme/ace?url='+window.top.location.href,function(result){   window.location.reload();});
    }

</script>



<!-- 即时聊天插件  开始
<link href="/static/layer-v2.3/layim/layui/css/layui.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript">
    var currentId = '';
    var currentName = '';
    var currentFace ='';
    var url="";
    var static_url="/static";
    var wsServer = 'ws://'+window.document.domain+':8668';

</script>
-->
<!--webscoket接口  -->
<script src="/static/layer-v2.3/layim/layui/layui.js"></script>

<script src="/static/layer-v2.3/layim/layim.js"></script>
<!-- 即时聊天插件 结束 -->
<style>
    /*签名样式*/
    .layim-sign-box{
        width:95%
    }
    .layim-sign-hide{
        border:none;background-color:#F5F5F5;
    }
</style>

</html>