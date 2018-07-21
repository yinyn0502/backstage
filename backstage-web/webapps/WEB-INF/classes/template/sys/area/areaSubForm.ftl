<html>
<head>
    <title>区域管理</title>
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
<form id="inputForm" modelAttribute="area" action="/sys/area/subsave" method="post" class="form-horizontal">
    <input name="id" <#if area.id??>value="${area.id}"</#if> type="hidden"/>

    <input name="parentId" id="areaId" <#if area.parentId??>value="${area.parentId}"</#if> type="text"/>
    message
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td  class="width-15 active"><label class="pull-right">上级区域:</label></td>
            <td class="width-35" >
            <#-- <sys:treeselect id="area" name="parent.id" value="${area.parent.id}" labelName="parent.name" labelValue="${area.parent.name}"
                                               title="区域" url="/sys/area/treeData" extId="${area.id}" cssClass="form-control m-s" allowClear="true"/>-->

                <input id="parentId" name="parentId" class="form-control m-s" type="hidden" <#if area.id??>value="${area.id}"</#if>/>
                <input id="parentIds" name="parentIds" class="form-control m-s" type="hidden" <#if area.parentIds??>value="${area.parentIds}" </#if>/>
                <input id="sort" name="sort" class="form-control m-s" type="hidden" value="30"/>
                <input id="delFlag" name="delFlag" class="form-control m-s" type="hidden" <#if area.delFlag??>value="${area.delFlag}"</#if>/>

                <div class="input-group">
                <#if area??>
                    <input id="areaName" name="parent.name" readonly="readonly"  type="text" <#if area.name??>value="${area.name}"</#if> data-msg-required=""
                           class="form-control m-s" style=""/>
                </#if>
                    <span class="input-group-btn">
	       		 <button type="button"  id="areaButton" class="btn   btn-primary  "><i class="fa fa-search"></i>
	             </button>
       		 </span>

                </div>
                <label id="areaName-error" class="error" for="areaName" style="display:none"></label>
                <script type="text/javascript">
                    $("#areaButton, #areaName").click(function(){
                        // 是否限制选择，如果限制，设置为disabled
                        if ($("#areaButton").hasClass("disabled")){
                            return true;
                        }
                        // 正常打开
                        top.layer.open({
                            type: 2,
                            area: ['300px', '420px'],
                            title:"选择区域",
                            ajaxData:{selectIds: $("#areaId").val()},
                            content: "/tag/treeselect?url="+encodeURIComponent("/sys/area/treeData")+"&module=&checked=&extId=${area.id}&isAll=" ,
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
                                $("#areaId").val(ids.join(",").replace(/u_/ig,""));
                                $("#areaName").val(names.join(","));
                                $("#areaName").focus();
                                top.layer.close(index);
                            },
                            cancel: function(index){ //或者使用btn2
                                //按钮【按钮二】的回调
                            }
                        });

                    });
                </script>


            </td>
            <td  class="width-15 active"><label class="pull-right">区域名称:</label></td>
            <td  class="width-35" ><input name="name" htmlEscape="false" maxlength="50" class="form-control required" <#if area.name??>value="${area.name}"</#if>/></td>
        </tr>
        <tr>
            <td  class="width-15 active"><label class="pull-right"><font color="red">*</font>区域编码:</label></td>
            <td class="width-35" ><input name="code" htmlEscape="false" maxlength="50" class="form-control" <#if area.code??>value="${area.code}"</#if>/></td>
            <td  class="width-15 active"><label class="pull-right">区域类型:</label></td>
            <td  class="width-35" >

                <select  name="type" class="form-control">

                <#if dictList??>
                    <#list dictList as dict>
                        <#if dict??>
                        <option <#if dict.value??>value="${dict.value}"</#if> <#if area.type??&&area.type==dict.value>selected</#if> ><#if dict.label??>${dict.label}</#if>
                        </#if>
                    </option>
                    </#list>
                </#if>
                </select>


            </td>
        </tr>
        <tr>
            <td  class="width-15 active"><label class="pull-right">备注:</label></td>
            <td class="width-35" >

                <textarea name="remarks" htmlEscape="false" rows="3" maxlength="200" class="form-control"><#if area.remarks??>${area.remarks}</#if></textarea>

            </td>
            <td  class="width-15 active"><label class="pull-right"></label></td>
            <td  class="width-35" ></td>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>