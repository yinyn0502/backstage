<html>
<head>
    <title>push详情</title>
    <#include "../ahead.ftl">
    <#include "../treeview.ftl" >
    <#include "../treetable.ftl" >
    <meta name="decorator" content="default"/>
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content">
    <div class="ibox">
        <div class="ibox-title">
            <h3>push详情</h3>
            <div class="ibox-tools">
                <a class="collapse-link">
                    <i class="fa fa-chevron-up"></i>
                </a>
                <a class="dropdown-toggle" data-toggle="dropdown" href="form_basic.html#">
                    <i class="fa fa-wrench"></i>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#">选项1</a>
                    </li>
                    <li><a href="#">选项2</a>
                    </li>
                </ul>
                <a class="close-link">
                    <i class="fa fa-times"></i>
                </a>
            </div>
        </div>
        <div class="ibox-content">
            <form id="inputForm" modelAttribute="modifyDTO" action="/member/modify" method="post" class="form-horizontal">
                <!-- push详情 -->
                <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
                    <tbody>
                        <#if messageBatch?? >
                            <thead>
                                <tr>
                                    <td  class="width-15 active"><label class="pull-left">推送标题:</label></td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">
                                            <#if messageBatch.title?? >
                                                 ${messageBatch.title}
                                            </#if>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="width-15 active"><label class="pull-left">推送内容:</label></td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">
                                            <#if messageBatch.content?? >
                                                 ${messageBatch.content}
                                            </#if>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="width-15 active"><label class="pull-left">文案链接:</label></td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">
                                            <#if messageBatch.targetValue?? >
                                                 ${messageBatch.targetValue}
                                            </#if>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="width-15 active"><label class="pull-left">文案类型:</label></td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">
                                            <#if messageBatch.businessTypeValue?? >
                                                 ${messageBatch.businessTypeValue}
                                            </#if>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="width-15 active"><label class="pull-left">目标人群:</label></td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">
                                          <#if messageBatch.targets?? >
                                              ${messageBatch.targets}
                                          </#if>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="width-15 active"><label class="pull-left">目标设备:</label></td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">
                                            <#if messageBatch.appTypeValue?? >
                                                 ${messageBatch.appTypeValue}
                                            </#if>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td  class="width-15 active"><label class="pull-left">发送时间:</label></td>
                                    <td  class="width-15 active">
                                        <label class="pull-left">
                                            <#if messageBatch.sendTime?? >
                                                 ${messageBatch.sendTime}
                                            </#if>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="width-15 active"><label class="pull-left">分设备统计数据:</label></td>
                                </tr>
                                <tr>
                                    &nbsp;&nbsp;<td colspan="2" class="width-15 active"><label class="pull-left">IOS&nbsp;&nbsp;
                                    推送设备数:
                                        <#if messageBatch.iosSendTotal?? >
                                             ${messageBatch.iosSendTotal}
                                        </#if>
                                        &nbsp;&nbsp;
                                    到达设备数:
                                    <#if messageBatch.iosArriveAppCount?? >
                                         ${messageBatch.iosArriveAppCount}
                                    </#if>
                                    &nbsp;&nbsp;
                                    到达率:
                                    <#if messageBatch.iosArriveAppRate?? >
                                         ${messageBatch.iosArriveAppRate}
                                    </#if>
                                    &nbsp;&nbsp;
                                    点击数:
                                    <#if messageBatch.iosClickCount?? >
                                         ${messageBatch.iosClickCount}
                                    </#if>
                                    &nbsp;&nbsp;
                                    点击率:
                                    <#if messageBatch.iosClickRate?? >
                                         ${messageBatch.iosClickRate}
                                    </#if>
                                    &nbsp;&nbsp;
                                    </label></td>
                                </tr>
                                <tr>
                                    &nbsp;&nbsp;<td colspan="2" class="width-15 active"><label class="pull-left">安卓&nbsp;&nbsp;
                                    推送设备数:
                                    <#if messageBatch.androidSendTotal?? >
                                         ${messageBatch.androidSendTotal}
                                    </#if>
                                    &nbsp;&nbsp;
                                    到达设备数:
                                    <#if messageBatch.androidArriveAppCount?? >
                                         ${messageBatch.androidArriveAppCount}
                                    </#if>
                                    &nbsp;&nbsp;
                                    到达率:
                                    <#if messageBatch.androidArriveAppRate?? >
                                         ${messageBatch.androidArriveAppRate}
                                    </#if>
                                    &nbsp;&nbsp;
                                    点击数:
                                    <#if messageBatch.androidClickCount?? >
                                         ${messageBatch.androidClickCount}
                                    </#if>
                                    &nbsp;&nbsp;
                                    点击率:
                                    <#if messageBatch.androidClickRate?? >
                                         ${messageBatch.androidClickRate}
                                    </#if>
                                    &nbsp;&nbsp;
                                    </label></td>
                                </tr>
                            </thead>
                        </#if>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>
