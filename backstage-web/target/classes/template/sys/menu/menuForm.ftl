<html>
<head>
    <title>菜单管理</title>
    <meta name="decorator" content="default"/>
    <#include "../../ahead.ftl">
    <#include "../../treetable.ftl">
    <script type="text/javascript">
        var validateForm;
        function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
            if(validateForm.form()){
                $("#inputForm").submit();
                return true;
            }
            return false;
        }
        $(document).ready(function() {
            $("#name").focus();
            validateForm = $("#inputForm").validate({
                submitHandler: function(form){
                    loading('正在提交，请稍等...');
                    form.submit();
                    closeTip();
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
        });

    </script>
</head>
<body class="hideScroll">
<form id="inputForm" modelAttribute="menu" action="/sys/menu/save" method="post" class="form-horizontal">
    <input type="hidden" name="id" <#if menu.id??>value="${menu.id}"</#if>/>

    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td  class="width-15 active"><label class="pull-right">上级菜单:</label></td>
            <td class="width-35" >
               <#-- <sys:treeselect id="menu" name="parent.id" value="${menu.parentId}" labelName="parent.name" labelValue="${menu.parent.name}"
                                                  title="菜单" url="/sys/menu/treeData" extId="${menu.id}" cssClass="form-control required"/>-->

                   <input id="menuId" name="parentId" class="form-control required" type="hidden" value="${menu.parentId}"/>
                   <div class="input-group">
                       <input id="menuName" name="parent.name" readonly="readonly"  type="text" value="${menu.parent.name}" data-msg-required=""
                              class="form-control required" style=""/>
                       <span class="input-group-btn">
	       		 <button type="button"  id="menuButton" class="btn   btn-primary  "><i class="fa fa-search"></i>
	             </button>
                           <script type="text/javascript">
	$("#menuButton, #menuName").click(function(){
        // 是否限制选择，如果限制，设置为disabled
        if ($("#menuButton").hasClass("disabled")){
            return true;
        }
        // 正常打开
        top.layer.open({
            type: 2,
            area: ['300px', '420px'],
            title:"选择菜单",
            ajaxData:{selectIds: $("#menuId").val()},
            content: "/tag/treeselect?url="+encodeURIComponent("/sys/menu/treeData")+"&module=&checked=&extId=<#if menu.id??>${menu.id}</#if>&isAll=&selectIds="+$("#menuId").val() ,
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
                $("#menuId").val(ids.join(",").replace(/u_/ig,""));
                $("#menuName").val(names.join(","));
                $("#menuName").focus();
                top.layer.close(index);
            },
            cancel: function(index){ //或者使用btn2
                //按钮【按钮二】的回调
            }
        });

    });
</script>
       		 </span>

                   </div>
                   <label id="menuName-error" class="error" for="menuName" style="display:none"></label>

                   <input type="hidden" name="parentIds" <#if menu.parentIds??> value="${menu.parentIds}"</#if>>

            </td>
            <td  class="width-15 active"><label class="pull-right"><font color="red">*</font> 名称:</label></td>
            <td  class="width-35" ><input name="name" value="<#if menu.name??>${menu.name}</#if>" maxlength="50" class="required form-control "/></td>
        </tr>
        <tr>
            <td  class="width-15 active"><label class="pull-right">链接:</label></td>
            <td class="width-35" ><input name="href" ，，<#if menu.href??>value="${menu.href}"</#if> maxlength="2000" class="form-control "/>
                <span class="help-inline">点击菜单跳转的页面</span></td>
            <td  class="width-15 active"><label class="pull-right">目标:</label></td>
            <td  class="width-35" ><input name="target" htmlEscape="false" maxlength="10" class="form-control" <#if menu.target??>value="${menu.target}"</#if>/>
                <span class="help-inline">链接打开的目标窗口，默认：mainFrame</span></td>
        </tr>
        <tr>
            <td  class="width-15 active"><label class="pull-right">图标:</label></td>
            <td class="width-35" >
                <input name="icon" <#if menu.icon??>value="${menu.icon}"</#if> maxlength="2000" class="form-control "/>
               <#-- <sys:iconselect id="icon" name="icon" value="${menu.icon}"/>-->
            </td>
            <td  class="width-15 active"><label class="pull-right">排序:</label></td>
            <td  class="width-35" ><input name="sort" <#if menu.sort??>value="${menu.sort}"</#if> maxlength="50" class="required digits form-control "/>
                <span class="help-inline">排列顺序，升序。</span></td>
        </tr>
        <tr>
            <td  class="width-15 active"><label class="pull-right">可见:</label></td>
            <td class="width-35" ><input id="isShow1" name="isShow" class="required i-checks " type="radio" value="1" <#if menu.isShow??&&menu.isShow='1'>checked="checked"</#if>/><label for="isShow1">显示</label></span><span><input id="isShow2" name="isShow" class="required i-checks " type="radio" value="0" <#if menu.isShow??&&menu.isShow='0'>checked="checked"</#if>/><label for="isShow2">隐藏</label>
                <span class="help-inline">该菜单或操作是否显示到系统菜单中</span></td>
            <td  class="width-15 active"><label class="pull-right">权限标识:</label></td>
            <td  class="width-35" ><input name="permission" <#if menu.permission??>value="${menu.permission}"</#if> maxlength="100" class="form-control "/>
                <span class="help-inline">控制器中定义的权限标识，如：@RequiresPermissions("权限标识")</span></td>
        </tr>
        <tr>
            <td  class="width-15 active"><label class="pull-right">备注:</label></td>
            <td class="width-35" ><textarea name="remarks" htmlEscape="false" rows="3" maxlength="200" class="form-control "><#if menu.remarks??>${menu.remarks}</#if></textarea></td>
            <td  class="width-15 active"><label class="pull-right"></label></td>
            <td  class="width-35" ></td>



        </tr>
        </tbody>
    </table>
</form>
</body>
</html>