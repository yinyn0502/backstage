<html>
<head>
    <title>角色管理</title>

    <meta name="decorator" content="default"/>

    <!-- 引入jquery插件 -->
    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="/static/jquery/jquery-migrate-1.1.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/static/TableDnD/jquery.tablednd.js"></script>


    <!-- 引入依赖的第三方插件 -->
    <script src="/static/slimscroll/jquery.slimscroll.min.js"></script>



    <script src="/static/jquery-validation/1.14.0/jquery.validate.min.js" type="text/javascript"></script>
    <script src="/static/jquery-validation/1.14.0/localization/messages_zh.min.js" type="text/javascript"></script>
    <link href="/static/jquery-jbox/2.3/Skins/Bootstrap/jbox.min.css" rel="stylesheet" />
    <script src="/static/jquery-jbox/2.3/jquery.jBox-2.3.min.js" type="text/javascript"></script>
    <script src="/static/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/static/pace/pace.min.js"></script>
    <script src="/static/metisMenu/jquery.metisMenu.js"></script>
    <link href="/static/iCheck/custom.css" rel="stylesheet" />
    <script src="/static/iCheck/icheck.min.js"></script>
    <script src="/static/iCheck/icheck-init.js"></script>
    <link href="/static/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
    <script src="/static/dataTables/jquery.dataTables.js"></script>
    <script src="/static/dataTables/dataTables.bootstrap.js"></script>




    <!-- jeeplus -->
    <link href="/static/common/jeeplus.css" type="text/css" rel="stylesheet" />
    <script src="/static/common/jeeplus.js" type="text/javascript"></script>

    <!-- jquery ui -->
    <script src="/static/jquery-ui/jquery-ui.min.js"></script>

    <!-- 引入bootstrap插件 -->
    <!-- bootswatch主题效果不怎么好，停止切换，使用官网的默认版本，如果你想切换主题请访问http://bootswatch.com/下载最新版版主题，by刘高峰 -->
    <!--  <link href="/jeeplus/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />-->
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js"  type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />

    <!-- 引入layer插件 -->
    <script src="/static/layer-v2.3/layer/layer.js"></script>
    <script src="/static/layer-v2.3/layer/laydate/laydate.js"></script>

    <!--引入webuploader-->
    <link rel="stylesheet" type="text/css" href="/static/webuploader-0.1.5/webuploader.css">
    <script type="text/javascript" src="/static/webuploader-0.1.5/webuploader.js"></script>


    <!-- 引入自定义文件 -->
    <script src="/static/common/mustache.min.js" type="text/javascript"></script>
    <script src="/static/common/content.js" type="text/javascript"></script>
    <link href="/static/common/css/login.css" type="text/css" rel="stylesheet" />












    <meta name="decorator" content="default"/>
    <link href="/static/jquery-ztree/3.5.12/css/zTreeStyle/metro.css" rel="stylesheet" type="text/css"/>
    <script src="/static/jquery-ztree/3.5.12/js/jquery.ztree.all-3.5.min.js" type="text/javascript"></script>



    <script type="text/javascript">
        var validateForm;
        function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
            if(validateForm.form()){
                loading('正在提交，请稍等...');
                $("#inputForm").submit();
                closeTip();
                return true;
            }

            return false;
        }
        $(document).ready(function(){
            $("#name").focus();

            validateForm= $("#inputForm").validate({
                rules: {
                    name: {remote: "/sys/role/checkName?oldName=" + encodeURIComponent("<#if role.name??>${role.name}</#if>")},//设置了远程验证，在初始化时必须预先调用一次。
                    enname: {remote: "/sys/role/checkEnname?oldEnname=" + encodeURIComponent("<#if role.enname??>${role.enname}</#if>")}
                },
                messages: {
                    name: {remote: "角色名已存在"},
                    enname: {remote: "英文名已存在"}
                },
                submitHandler: function(form){
                    //var ids = [], nodes = tree.getCheckedNodes(true);
                    //for(var i=0; i<nodes.length; i++) {
                    //	ids.push(nodes[i].id);
                    //}
                    //$("#menuIds").val(ids);
                   /* var ids2 = [], nodes2 = tree2.getNodes(true);
                    for(var i=0; i<nodes2.length; i++) {
                        ids2.push(nodes2[i].id);
                    }
                    $("#officeIds").val(ids2);*/
                    //loading('正在提交，请稍等...');
                    form.submit();
                },
                errorContainer: "#messageBox",
                errorPlacement: function(error, element) {
                    $("#messageBox").text("输入有误，请先更正。");
                    if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
                        error.appendTo(element.parent().parent());
                    } else {
                        error.insertAfter(element);
                    }
                }
            });

            //在ready函数中预先调用一次远程校验函数，是一个无奈的回避案。(刘高峰）
            //否则打开修改对话框，不做任何更改直接submit,这时再触发远程校验，耗时较长，
            //submit函数在等待远程校验结果然后再提交，而layer对话框不会阻塞会直接关闭同时会销毁表单，因此submit没有提交就被销毁了导致提交表单失败。
            $("#inputForm").validate().element($("#name"));
            $("#inputForm").validate().element($("#enname"));

            var setting = {check:{enable:true,nocheckInherit:true},view:{selectedMulti:false},
                data:{simpleData:{enable:true}},callback:{beforeClick:function(id, node){
                    tree.checkNode(node, !node.checked, true, true);
                    return false;
                }}};


            // 用户-机构
            var zNodes2=[
            <#list officeList as office>
                {id:"${office.id}", <#if office.parentId??>pId:"${office.parentId}"<#else>pId:"0"</#if>, name:"<#if office.name??>${office.name}</#if>"},
            </#list>];
            // 初始化树结构
            var tree2 = $.fn.zTree.init($("#officeTree"), setting, zNodes2);
            // 不选择父节点
            tree2.setting.check.chkboxType = { "Y" : "ps", "N" : "s" };
            // 默认选择节点
            var ids2 = "".split(",");
            for(var i=0; i<ids2.length; i++) {
                var node = tree2.getNodeByParam("id", ids2[i]);
                try{tree2.checkNode(node, true, false);}catch(e){}
            }
            // 默认展开全部节点
            tree2.expandAll(true);
            // 刷新（显示/隐藏）机构
            refreshOfficeTree();
            $("#dataScope").change(function(){
                refreshOfficeTree();
            });
        });
        function refreshOfficeTree(){
            if($("#dataScope").val()==9){
                $("#officeTree").show();
            }else{
                $("#officeTree").hide();
            }
        }

    </script>

</head>
<body class="hideScroll">
<form id="inputForm" modelAttribute="role" autocomplete="off" action="/sys/role/save" method="post" class="form-horizontal" >
    <input name="id" type="hidden" <#if role.id??>value="${role.id}"</#if>/>
<#if message??>${message}</#if>
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td class="width-15 active"><label class="pull-right">归属机构:</label></td>
            <td class="width-35">
               <#-- <sys:treeselect id="office" name="office.id" <#if role.office.id??>value="${role.office.id}"</#if> labelName="office.name" labelValue="<#if role.office.name??>${role.office.name}</#if>"
                                                  title="机构" url="/sys/office/treeData" cssClass="form-control required"/>-->


                   <input id="officeId" name="officeId" class="form-control required" type="hidden" <#if role.officeId??>value="${role.officeId}"</#if>/>
                   <div class="input-group">
                       <input id="officeName" name="office.name" readonly="readonly"  type="text" <#if role.office.name??>value="${role.office.name}"</#if> data-msg-required=""
                              class="form-control required" style=""/>
                       <span class="input-group-btn">
	       		 <button type="button"  id="officeButton" class="btn   btn-primary  "><i class="fa fa-search"></i>
	             </button>
       		 </span>

                   </div>
                   <label id="officeName-error" class="error" for="officeName" style="display:none"></label>
                   <script type="text/javascript">
                       $("#officeButton, #officeName").click(function(){
                           // 是否限制选择，如果限制，设置为disabled
                           if ($("#officeButton").hasClass("disabled")){
                               return true;
                           }
                           // 正常打开
                           top.layer.open({
                               type: 2,
                               area: ['300px', '420px'],
                               title:"选择机构",
                               ajaxData:{selectIds: $("#officeId").val()},
                               content: "/tag/treeselect?url="+encodeURIComponent("/sys/office/treeData")+"&module=&checked=&extId=<#if role.officeId??>${role.officeId}</#if>&isAll=" ,
                               btn: ['确定', '关闭']
                               ,yes: function(index, layero){ //或者使用btn1
                                   var tree = layero.find("iframe")[0].contentWindow.tree;//h.find("iframe").contents();
                                   var ids = [], names = [], nodes = [];
                                   if ("" == "true"){
                                       nodes = tree.getCheckedNodes(true);
                                   }else{
                                       nodes = tree.getSelectedNodes();
                                   }
                                   for(var i=0; i<nodes.length; i++) {//
                                       ids.push(nodes[i].id);
                                       names.push(nodes[i].name);//
                                       break; // 如果为非复选框选择，则返回第一个选择
                                   }
                                   $("#officeId").val(ids.join(",").replace(/u_/ig,""));
                                   $("#officeName").val(names.join(","));
                                   $("#officeName").focus();
                                   top.layer.close(index);
                               },
                               cancel: function(index){ //或者使用btn2
                                   //按钮【按钮二】的回调
                               }
                           });

                       });
                   </script>

            </td>
            <td  class="width-15" class="active"><label class="pull-right"><font color="red">*</font>角色名称:</label></td>
            <td class="width-35"><input id="oldName" name="oldName" type="hidden" <#if role.name??>value="${role.name}"</#if>>
                <input name="name" maxlength="50" class="form-control required" type="text" <#if role.name??>value="${role.name}"</#if>></td>
        </tr>
        <tr>
            <td class="width-15 active"><label class="pull-right"><font color="red">*</font>英文名称:</label></td>
            <td class="width-35"><input id="oldEnname" name="oldEnname" type="hidden" <#if role.enname??>value="${role.enname}"</#if>>
                <input name="enname"  maxlength="50" class="form-control required" type="text" <#if role.enname??>value="${role.enname}"</#if>/></td>
            <td  class="width-15" class="active"><label class="pull-right">角色类型:</label></td>
            <td class="width-35">
                <select name="roleType" class="form-control ">
                    <option value="assignment" <#if role.roleType="assignment">selected</#if>>任务分配</option>
                    <option value="security-role" <#if role.roleType="security-role">selected</#if>>管理角色</option>
                    <option value="user" <#if role.roleType="user">selected</#if>>普通角色</option>
                </select>
                <span class="help-inline" title="activiti有3种预定义的组类型：security-role、assignment、user 如果使用Activiti Explorer，需要security-role才能看到manage页签，需要assignment才能claim任务">
						工作流组用户组类型（任务分配：assignment、管理角色：security-role、普通角色：user）</span></td>
        </tr>
        <tr>
            <td class="width-15 active"><label class="pull-right">是否系统数据:</label></td>
            <td class="width-35"><select name="sysData" class="form-control ">
            <#if yesList??>
                <#list yesList as dict>
                    <#if dict??>
                    <option <#if dict.value??>value="${dict.value}"</#if> <#if role.isSys??&&role.isSys==dict.value>selected</#if> ><#if dict.label??>${dict.label}</#if>
                        </#if>
                </option>
                </#list>
            </#if>

            </select>
                <span class="help-inline">“是”代表此数据只有超级管理员能进行修改，“否”则表示拥有角色修改人员的权限都能进行修改</span></td>
            <td  class="width-15" class="active"><label class="pull-right">是否可用</label></td>
            <td class="width-35"><select name="useable" class="form-control ">
            <#if yesList??>
                <#list yesList as dict>
                    <#if dict??>
                    <option <#if dict.value??>value="${dict.value}"</#if> <#if role.useable??&&role.useable==dict.value>selected</#if> ><#if dict.label??>${dict.label}</#if>
                        </#if>
                </option>
                </#list>
            </#if>
            </select>
                <span class="help-inline">“是”代表此数据可用，“否”则表示此数据不可用</span></td>
        </tr>
        <tr>
            <td class="width-15 active"><label class="pull-right">数据范围:</label></td>
            <td class="width-35"><select name="dataScope" class="form-control ">
            <#if dictList??>
                <#list dictList as dict>
                    <#if dict??>
                    <option <#if dict.value??>value="${dict.value}"</#if> <#if role.dataScope??&&role.dataScope==dict.value>selected</#if> ><#if dict.label??>${dict.label}</#if>
                        </#if>
                </option>
                </#list>
            </#if>

            </select>
                <span class="help-inline">特殊情况下，设置为“按明细设置”，可进行跨机构授权</span>
                <div class="controls">
                    <div id="officeTree" class="ztree" style="margin-top:3px;"></div>
                    <input type="hidden" name="officeIds"/>
                </div></td>
            <td class="width-15 active"><label class="pull-right">备注:</label></td>
            <td class="width-35"><textarea name="remarks" htmlEscape="false" rows="3" maxlength="200" class="form-control "><#if role.remarks??>${role.remarks}</#if></textarea></td>
        </tr>
        </tbody>
    </table>
    <form:hidden path="menuIds"/>
</form>
</body>
</html>