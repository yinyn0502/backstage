
<html>
<head>
    <title>退换货管理</title>
<#include "../../ahead.ftl">
<#include "../../treeview.ftl" >
<#include "../../treetable.ftl" >
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        function page(n,s){
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        };


        /**
         * 激活tab选项卡并使用ajax异步加载内容
         * @param {Object} tabsId
         * @param {Object} url
         */
        function showTabs(tabsId,url) {
            alert("showTabs:"+tabsId+",url:"+url);
            $("a[href='#"+tabsId+"']").tab('show');
            var $tabContent = $('#'+tabsId);
            if($tabContent.length < 100) {
                $tabContent.load(url);
                console.info(tabsId + ' load done!');
            }
        }

        var tabsData = [{
            "id" : "home",
            "url" : "/order/return/tabs?queryType=1"
        },{
            "id" : "pendingAudit",
            "url" : "/order/return/tabs?queryType=2"
        },{
            "id" : "returnConfirm",
            "url" : "/order/return/tabs?queryType=3"
        },{
            "id" : "refundConfirm",
            "url" : "/order/return/tabs?queryType=0"
        }];



        $(tabsData).each(function(){
            //console.info(this.id + "--->" + this.url);
            $("a[href='#"+this.id+"']").bind('click',{
                id : this.id,
                url : this.url
            },tabsHandler);
        });
        function tabsHandler(event) {
            var data = event.data;
            showTabs(data.id,data.url);
            return false; //阻止默认a标签响应
        }

    </script>
<body class="gray-bg">
<div class="wrapper wrapper-content">
<script>
    window.onload=function() {
        $("#homeTab").click();
    }
    $(function () {
        $(".queryTab").click(function () {
            var url = $(this).data("url");
            var tab = $(this).data("tab");
            var html = "<iframe src= "+url+" frameborder=no width=100% height=100%></iframe>";
            $("#myTabContent").html(html);
        });
    });



</script>

    <ul id="myTab" class="nav nav-tabs">
        <li class="active">
            <a data-tab="#home" id="homeTab" data-toggle="tab" data-url="/order/return/tabs?queryType=1" class="queryTab">待审核(<#if totalCount1??>${totalCount1}<#else>0</#if>)</a></li>
        <li><a data-tab="#pendingAudit" data-toggle="tab" data-url="/order/return/tabs?queryType=2" class="queryTab">待收货(<#if totalCount2??>${totalCount2}<#else>0</#if>)</a></li>
        <li><a data-tab="#returnConfirm" data-toggle="tab" data-url="/order/return/tabs?queryType=3" class="queryTab">待确认退款(<#if totalCount3??>${totalCount3}<#else>0</#if>)</a></li>
        <li><a data-tab="#refundConfirm" data-toggle="tab" data-url="/order/return/tabs?queryType=0" class="queryTab">全部(<#if totalCount0??>${totalCount0}<#else>0</#if>)</a></li>

    </ul>
    <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in active" id="home">

        </div>
        <div class="tab-pane fade" id="pendingAudit">

        </div>
        <div class="tab-pane fade" id="returnConfirm">

        </div>
        <div class="tab-pane fade" id="refundConfirm">

        </div>
    </div>



</div>
</body>
</html>










