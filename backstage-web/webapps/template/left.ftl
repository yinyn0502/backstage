
<!-- 本页面涉及的js函数，都在head.jsp页面中     -->
<div id="sidebar" class="menu-min">

    <div id="sidebar-shortcuts">

        <div id="sidebar-shortcuts-large">

            <#--<button class="btn btn-small btn-success" onclick="changeMenu();" title="切换菜单"><i class="icon-pencil"></i></button>

            <button class="btn btn-small btn-info" title="UI实例" onclick="window.open('<%=basePathl%>static/UI_new');"><i class="icon-eye-open"></i></button>

            <button class="btn btn-small btn-warning" title="数据字典" id="adminzidian" onclick="zidian();"><i class="icon-book"></i></button>

            <button class="btn btn-small btn-danger" title="菜单管理" id="adminmenu" onclick="menu();"><i class="icon-folder-open"></i></button>
-->
        </div>

        <div id="sidebar-shortcuts-mini">
           <#-- <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>-->
        </div>

    </div><!-- #sidebar-shortcuts -->


    <ul class="nav nav-list">

        <li class="active" id="fhindex">
            <a href="/index"><i class="icon-dashboard"></i><span>后台首页</span></a>
        </li>


    <#if menuList??>
    <#list menuList as menu>
        <li id="lm${menu.menuId }">
            <a style="cursor:pointer;" class="dropdown-toggle" >
                <#if menu.menuIcon??>
                <i class="${menu.menuIcon}"></i>
                <#else>
                    <span class="glyphicon glyphicon-glass"></span>
                </#if>
                <span>${menu.menuName }</span>
                <b class="arrow icon-angle-down"></b>
            </a>
            <ul class="submenu">
                <#if menu.subMenu??>
                    <#list menu.subMenu as sub>
                                <li><a href="${sub.menuUrl}"><i class="fa-list"></i>${sub.menuName }</a></li>
                    </#list>
                </#if>
            </ul>
        </li>
    </#list>
    </#if>
    </ul><!--/.nav-list-->

    <div id="sidebar-collapse"><i class="icon icon-double-angle-left"></i></div>

</div><!--/#sidebar-->

