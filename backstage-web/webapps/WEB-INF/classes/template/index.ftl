
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="renderer" content="webkit">
    <title>宠物网集成系统</title>

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
                        <img alt="image" class="rounded-circle" style="width: 133px;margin-left: -18px;border-radius: 50%!important" src="img/profile_small.png">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="block m-t-xs font-bold">当前登录人：${currentUser.loginName}</span>
                        </a>
                        <label style="margin-bottom: 0px;margin-top: 15px;">
                            <a href="/logout" style="color: red;font-size: 14px;">安全退出</a>
                        </label>
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
                <ul class="nav navbar-top-links navbar-right">
                    <li class="dropdown">
                    </li>
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
        </div>
        <div class="row J_mainContent" id="content-main">
            <iframe class="J_iframe" name="iframe0" width="100%" height="100%" src="/home" frameborder="0" data-id="/home" seamless></iframe>
        </div>
        <div class="footer">
            <div class="pull-left"><a href="http://www.ueater.com">http://www.chongwuweb.com</a> &copy; 2018-2028</div>
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

<!--webscoket接口  -->
<script src="/static/layer-v2.3/layim/layui/layui.js"></script>

<script src="/static/layer-v2.3/layim/layim.js"></script>
</html>