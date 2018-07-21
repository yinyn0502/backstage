<!DOCTYPE html>
<html lang="en">
<head>
    <base href="">


    <meta charset="utf-8" />
    <title>Header</title>
    <meta name="description" content="overview & stats" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script type="text/javascript" src="/static/js/jquery-1.7.2.js"></script>
<#include "../top.ftl">
    <script>

        //新增
        function add(){

            var diag = new top.Dialog();
            diag.Drag=true;
            diag.Title ="新增";
            diag.URL = 'user/goAddU.do';
            diag.Width = 225;
            diag.Height = 415;
            diag.CancelEvent = function(){ //关闭事件
                if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
                <#if page??>
                    alert(page.pageNum);
                <#else>
                    alert('error');
                </#if>

                }
                diag.close();
            };
            diag.show();
        }
    </script>
</head>
<body>

<div class="container-fluid" id="main-container">


    <div id="page-content" class="clearfix">

        <div class="row-fluid">


            <div class="row-fluid">


                <!-- 检索  -->
                <form action="user/list" method="post" name="userForm" id="userForm">
                    <table>
                        <tr>
                            <td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="USERNAME" value="" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
                            </td>
                            <td><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="最近登录开始"/></td>
                            <td><input class="span10 date-picker" name="lastLoginEnd" id="lastLoginEnd"  value="" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="最近登录结束"/></td>


                            <td>
                                <select class="selectpicker"  name="ROLE_ID" id="role_id" data-placeholder="请选择职位" style="vertical-align:top;width: 120px;">

                                    <option value="">全部</option>
                                    <#if roleList??>
                                    <#list roleList as role>
                                        <option value="${role.roleId }">${role.roleName }</option>
                                    </#list>
                                    </#if>
                                </select>
                            </td>

                                <td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();" title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
                                <td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="window.location.href='/user/listtabUsers.do';" title="切换模式"><i id="nav-search-icon" class="icon-exchange"></i></a></td>
                                <td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="icon-download-alt"></i></a></td>

                        </tr>
                    </table>
                    <!-- 检索  -->



                <form action="user/list" method="post" name="userForm" id="userForm">



                    <table id="table_report" class="table table-striped table-bordered table-hover">

                        <thead>
                        <tr>
                            <th class="center">
                                <label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
                            </th>
                            <th>序号</th>
                            <th>编号</th>
                            <th>用户名</th>
                            <th>姓名</th>
                            <th>职位</th>
                            <th><i class="icon-envelope"></i>邮箱</th>
                            <th><i class="icon-time hidden-phone"></i>最近登录</th>
                            <th>上次登录IP</th>
                            <th class="center">操作</th>
                        </tr>
                        </thead>

                        <tbody>

                        <!-- 开始循环 -->
                        <#if userList??>
                         <#list userList as user>

                                        <tr>

                                            <td class='center' style="width: 30px;"></td>

                                            <td>${user_index+1}</td>

                                            <td>${user.number}</td>

                                            <td>${user.username}</td>

                                            <td><a>${user.name}</a></td>
                                            <td>${user.roleId}</td>
                                            <td><a>${user.email}</a></td>
                                            <td>${user.lastLogin}</td>
                                            <td>${user.ip}</td>
                                            <td>
                                            <#if user.email??>
                                                <a title="发送电子邮件" class='btn btn-mini btn-info' onclick="sendEmail('${user.email }');"><i class="icon-envelope"></i></a>

                                            <#else>
                                                <a title="发送电子邮件" style="text-decoration:none;cursor:pointer;" onclick="#">${user.email }&nbsp;<i class="icon-envelope"></i></a>

                                            </#if>
                                                <#if user.phone??>
                                                    <a class='btn btn-mini btn-warning' title="发送短信" onclick="sendSms('${user.phone }');"><i class='icon-envelope'></i></a>
                                                <#else>
                                                    <a class='btn btn-mini btn-warning' title="发送短信" onclick="#"><i class='icon-envelope'></i></a>

                                                </#if>
                                                <#if user.userId??>
                                                    <a class='btn btn-mini btn-info' title="编辑" onclick="editUser('${user.userId }');"><i class='icon-edit'></i></a>
                                                <#else>
                                                    <a class='btn btn-mini btn-info' title="编辑" onclick="#"><i class='icon-edit'></i></a>

                                                </#if>
                                            </td>
                                        </tr>

                         </#list>
                            <#else>
                                <tr class="main_info">
                                    <td colspan="10" class="center">没有相关数据</td>
                                </tr>
                        </#if>





                        </tbody>
                    </table>

                    <div class="page-header position-relative">
                        <table style="width:100%;">
                            <tr>
                                <td style="vertical-align:top;">

                                        <a class="btn btn-small btn-success" onclick="add();">新增</a>

                                        <a title="批量发送电子邮件" class="btn btn-small btn-info" onclick="makeAll('确定要给选中的用户发送邮件吗?');"><i class="icon-envelope-alt"></i></a>


                                        <a title="批量发送短信" class="btn btn-small btn-warning" onclick="makeAll('确定要给选中的用户发送短信吗?');"><i class="icon-envelope"></i></a>


                                        <a title="批量删除" class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='icon-trash'></i></a>

                                </td>
                                <td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;"></div></td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>




            <!-- PAGE CONTENT ENDS HERE -->
        </div><!--/row-->

    </div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->

<!-- 返回顶部  -->
<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
    <i class="icon-double-angle-up icon-only"></i>
</a>

<!-- 引入 -->
<script type="text/javascript">window.jQuery || document.write("<script src='/static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
<script src="/static/js/bootstrap.min.js"></script>
<script src="/static/js/ace-elements.min.js"></script>
<script src="/static/js/ace.min.js"></script>

<script type="text/javascript" src="/static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
<script type="text/javascript" src="/static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
<script type="text/javascript" src="/static/js/bootbox.min.js"></script><!-- 确认窗口 -->
<!-- 引入 -->


<script type="text/javascript" src="/static/js/jquery.tips.js"></script><!--提示框-->
<script type="text/javascript">

    $(top.hangge());

    //检索
    function search(){
        top.jzts();
        $("#userForm").submit();
    }



</script>

<script type="text/javascript">

    $(function() {

        //日期框
        $('.date-picker').datepicker();

        //下拉框
        $(".chzn-select").chosen();
        $(".chzn-select-deselect").chosen({allow_single_deselect:true});

        //复选框
        $('table th input:checkbox').on('click' , function(){
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                    .each(function(){
                        this.checked = that.checked;
                        $(this).closest('tr').toggleClass('selected');
                    });

        });

    });




</body>
</html>