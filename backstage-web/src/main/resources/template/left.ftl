
<!-- 本页面涉及的js函数，都在head.jsp页面中     -->
<div id="sidebar" class="menu-min">

    <div id="sidebar-shortcuts">

        <div id="sidebar-shortcuts-large">

            <button class="btn btn-small btn-success" onclick="changeMenu();" title="切换菜单"><i class="icon-pencil"></i></button>

            <button class="btn btn-small btn-info" title="UI实例" onclick="window.open('<%=basePathl%>static/UI_new');"><i class="icon-eye-open"></i></button>

            <button class="btn btn-small btn-warning" title="数据字典" id="adminzidian" onclick="zidian();"><i class="icon-book"></i></button>

            <button class="btn btn-small btn-danger" title="菜单管理" id="adminmenu" onclick="menu();"><i class="icon-folder-open"></i></button>

        </div>

        <div id="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>

    </div><!-- #sidebar-shortcuts -->


    <ul class="nav nav-list">

        <li class="active" id="fhindex">
            <a href="/index"><i class="icon-dashboard"></i><span>后台首页</span></a>
        </li>


    <#if menuList??>
    <#list menuList as menu>
        <li id="lm${menu.id }">
            <a style="cursor:pointer;" class="dropdown-toggle" >
                <#if menu.icon??>
                <i class="${menu.icon}"></i>
                <#else>
                    <span class="glyphicon glyphicon-glass"></span>
                </#if>
                <span>${menu.name }</span>
                <b class="arrow icon-angle-down"></b>
            </a>
            <ul class="submenu">
                <#if menu.subSysMenu??>
                    <#list menu.subSysMenu as sub>
                        <#if sub.id??>
                        <li id="z${sub.id }">
                            <a style="cursor:pointer;" target="mainFrame"  onclick="siMenu('z${sub.id }','lm${menu.id }','${sub.name }','${sub.href }')"><i class="icon-double-angle-right"></i>${sub.name }</a></li>

                        <#else>
                            <li><a href="javascript:void(0);"><i class="icon-double-angle-right"></i>${sub.name }</a></li>




                        </#if>
                    </#list>
                </#if>
            </ul>
        </li>
    </#list>
    </#if>
    </ul><!--/.nav-list-->

    <div id="sidebar-collapse"><i class="icon icon-double-angle-left"></i></div>

</div><!--/#sidebar-->


