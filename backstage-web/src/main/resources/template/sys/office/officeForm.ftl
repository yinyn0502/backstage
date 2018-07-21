<html>
<head>
    <title>机构管理</title>
<#include "../../ahead.ftl">
<#include "../../treetable.ftl">
    <meta name="decorator" content="default"/>
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
<form id="inputForm" action="/sys/office/save" method="post" class="form-horizontal">
    <input type="hidden" name="id" <#if office.id??>value="${office.id}"</#if>/>

    <input type="hidden" name="parentIds"  <#if office.parentIds??> value="${office.parentIds}" </#if>/>
    <input type="hidden" name="sort" <#if office.sort??>value="${office.sort}"</#if>/>
    <input type="hidden" name="areaId"<#if office.areaId??> value="${office.areaId}"</#if>/>
    <input type="hidden" name="delFlag" <#if office.delFlag??>value="${office.delFlag}"</#if>/>
<#if message??>${message}</#if>

    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td class="width-15 active"><label class="pull-right">上级机构:</label></td>
            <td class="width-35">

            <#--  <sys:treeselect id="office" name="parent.id" value="${office.parent.id}" labelName="parent.name" labelValue="${office.parent.name}"
                                               title="机构" url="/sys/office/treeData" extId="${office.id}"  cssClass="form-control" allowClear="${office.currentUser.admin}"/>

-->


                <input id="officeId" name="parentId" class="form-control" type="hidden" <#if office.parentId??>value="${office.parentId}"</#if>/>
                <div class="input-group">
                <#-- <input id="officeName" name="parent.name" readonly="readonly"  type="text" value="" data-msg-required=""
                        class="form-control" style="" value="${office.name}"/>-->
                <#if office.parent??>
                    <input id="officeName" name="parent.name" readonly="readonly"  type="text" <#if office.parent.name??>value="${office.parent.name}"</#if> data-msg-required=""
                           class="form-control m-s" style=""/>
                </#if>
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
                            content: "/tag/treeselect?url="+encodeURIComponent("/sys/office/treeData")+"&module=&checked=&extId=<#if office.id??>${office.id}</#if>&isAll=" ,
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
            <td  class="width-15"  class="active"><label class="pull-right"><font color="red">*</font>归属区域:</label></td>
            <td class="width-35">
            <#-- <sys:treeselect id="area" name="area.id" value="${office.area.id}" labelName="area.name" labelValue="${office.area.name}"
                                              title="区域" url="/sys/area/treeData" cssClass="form-control required"/>-->

                <input id="areaId" name="areaId" class="form-control required" type="hidden" <#if office.areaId??>value="${office.areaId}"</#if>/>
                <div class="input-group">
                <#if office.area??>
                    <input id="areaName" name="area.name" readonly="readonly"  type="text" value="${office.area.name}" data-msg-required=""
                           class="form-control required" style=""/>
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
                            content: "/tag/treeselect?url="+encodeURIComponent("/sys/area/treeData")+"&module=&checked=&extId=<#if office.areaId??>${office.areaId}</#if>&isAll=" ,
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
                </script></td>

            </td>
        </tr>
        <tr>
            <td class="width-15 active"><label class="pull-right"><font color="red">*</font>机构名称:</label></td>
            <td class="width-35"><input name="name" htmlEscape="false" maxlength="50" class="form-control required" <#if office.name??>value="${office.name}"/></#if></td>
            <td  class="width-15"  class="active"><label class="pull-right">机构编码:</label></td>
            <td class="width-35"><input name="code" htmlEscape="false" maxlength="50" class="form-control" <#if office.code??> value="${office.code}" </#if>/></td>
        </tr>
        <tr>
            <td class="width-15 active"><label class="pull-right">机构类型:</label></td>
            <td class="width-35"><select name="type" class="form-control">
            <#if dictList??>
                <#list dictList as dict>
                    <#if dict??>
                    <option <#if dict.value??>value="${dict.value}"</#if> <#if office.type??&&office.type==dict.value>selected</#if> ><#if dict.label??>${dict.label}</#if>
                        </#if>
                </option>
                </#list>
            </#if>

            </select></td>
            <td  class="width-15"  class="active"><label class="pull-right">机构级别:</label></td>
            <td class="width-35"><select name="grade" class="form-control">
            <#if gradeList??>
                <#list gradeList as dict>
                    <#if dict??>
                    <option <#if dict.value??>value="${dict.value}"</#if> <#if office.grade??&&office.grade==dict.value>selected</#if> ><#if dict.label??>${dict.label}</#if>
                        </#if>
                </option>
                </#list>
            </#if>
            </select></td>
        </tr>
        <tr>
            <td class="width-15 active"><label class="pull-right">是否可用:</label></td>
            <td class="width-35"><select name="useable" class="form-control">
            <#if yesList??>
                <#list yesList as dict>
                    <#if dict??>
                    <option <#if dict.value??>value="${dict.value}"</#if> <#if office.useable??&&office.useable==dict.value>selected</#if> ><#if dict.label??>${dict.label}</#if>
                        </#if>
                </option>
                </#list>
            </#if>
            </select>
                <span class="help-inline">“是”代表此账号允许登陆，“否”则表示此账号不允许登陆</span></td>

            <td class="width-15 active"><label class="pull-right">邮政编码:</label></td>
            <td class="width-35"><input name="zipCode" htmlEscape="false" maxlength="50" cssClass="form-control" <#if office.zipCode??> value="${office.zipCode}"</#if>/></td>
        <#--<td class="width-15"  class="active"><label class="pull-right">主负责人:</label></td>
         <td class="width-35">
             &lt;#&ndash;<sys:treeselect id="primaryPerson" name="primaryPerson.id" value="${office.primaryPerson.id}" labelName="office.primaryPerson.name" labelValue="${office.primaryPerson.name}"
                                              title="用户" url="/sys/office/treeData?type=3" cssClass="form-control" allowClear="true" notAllowSelectParent="true"/></td>&ndash;&gt;



          <input id="primaryPersonId" name="primaryPerson.id" class="form-control" type="hidden" value=""/>
          <div class="input-group">
              <input id="primaryPersonName" name="office.primaryPerson.name" readonly="readonly"  type="text" value="" data-msg-required=""
                     class="form-control" style=""/>
              <span class="input-group-btn">
                <button type="button"  id="primaryPersonButton" class="btn   btn-primary  "><i class="fa fa-search"></i>
             </button>
            </span>

          </div>
          <label id="primaryPersonName-error" class="error" for="primaryPersonName" style="display:none"></label>
          <script type="text/javascript">
              $("#primaryPersonButton, #primaryPersonName").click(function(){
                  // 是否限制选择，如果限制，设置为disabled
                  if ($("#primaryPersonButton").hasClass("disabled")){
                      return true;
                  }
                  // 正常打开
                  top.layer.open({
                      type: 2,
                      area: ['300px', '420px'],
                      title:"选择用户",
                      ajaxData:{selectIds: $("#primaryPersonId").val()},
                      content: "/tag/treeselect?url="+encodeURIComponent("/sys/office/treeData?type=${office.type}")+"&module=&checked=&extId=&isAll=" ,
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
                              if (nodes[i].isParent){
                                  //top.$.jBox.tip("不能选择父节点（"+nodes[i].name+"）请重新选择。");
                                  //layer.msg('有表情地提示');
                                  top.layer.msg("不能选择父节点（"+nodes[i].name+"）请重新选择。", {icon: 0});
                                  return false;
                              }//
                              ids.push(nodes[i].id);
                              names.push(nodes[i].name);//
                              break; // 如果为非复选框选择，则返回第一个选择
                          }
                          $("#primaryPersonId").val(ids.join(",").replace(/u_/ig,""));
                          $("#primaryPersonName").val(names.join(","));
                          $("#primaryPersonName").focus();
                          top.layer.close(index);
                      },
                      cancel: function(index){ //或者使用btn2
                          //按钮【按钮二】的回调
                      }
                  });

              });
          </script>
     </tr>-->
        <#--<tr>
            <td class="width-15 active"><label class="pull-right">副负责人:</label></td>
            <td class="width-35"><sys:treeselect id="deputyPerson" name="deputyPerson.id" value="${office.deputyPerson.id}" labelName="office.deputyPerson.name" labelValue="${office.deputyPerson.name}"
                                                 title="用户" url="/sys/office/treeData?type=3" cssClass="form-control" allowClear="true" notAllowSelectParent="true"/></td>
            <td class="width-15"  class="active"><label class="pull-right">联系地址:</label></td>
            <td class="width-35"><form:input path="address" htmlEscape="false" maxlength="50" cssClass="form-control" /></td>
        </tr>-->
        <#--  <tr>
              <td class="width-15 active"><label class="pull-right">邮政编码:</label></td>
              <td class="width-35"><form:input path="zipCode" htmlEscape="false" maxlength="50" cssClass="form-control" /></td>
              <td  class="width-15" class="active"><label class="pull-right">负责人:</label></td>
              <td class="width-35"><form:input path="master" htmlEscape="false" maxlength="50" cssClass="form-control" /></td>
          </tr>-->

        <tr>
            <td class="width-15 active"><label class="pull-right">电话:</label></td>
            <td class="width-35"><input name="phone" htmlEscape="false" maxlength="50" cssClass="form-control" <#if office.phone??>value="${office.phone}"</#if>/></td>
            <td  class="width-15"  class="active"><label class="pull-right">传真:</label></td>
            <td class="width-35"><input name="fax" htmlEscape="false" maxlength="50" cssClass="form-control" <#if office.fax??>value="${office.fax}"</#if>/></td>
        </tr>
        <tr>
            <td class="width-15 active"><label class="pull-right">邮箱:</label></td>
            <td class="width-35"><input name="email" htmlEscape="false" maxlength="50" cssClass="form-control" <#if office.email??>value="${office.email}"</#if>/></td>
            <td  class="width-15" class="active"><label class="pull-right">备注:</label></td>
            <td class="width-35"><textarea name="remarks" htmlEscape="false" rows="3" maxlength="200" class="form-control"><#if office.remarks??>value="${office.remarks}"</#if></textarea></td>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>