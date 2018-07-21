<html>
<head>
    <title>用户管理</title>
    <meta name="decorator" content="default"/>
<#include "../../ahead.ftl">
<#include "../../treeview.ftl" >
<#include "../../treetable.ftl" >
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
            $("#no").focus();
            validateForm = $("#inputForm").validate({
                rules: {
                    loginName:
                            {remote: "/sys/user/checkLoginName?oldLoginName=" + encodeURIComponent('<#if user.loginName??>${user.loginName}</#if>')}//设置了远程验证，在初始化时必须预先调用一次。
                },
                messages: {
                    loginName: {remote: "用户登录名已存在"},
                    confirmNewPassword: {equalTo: "输入与上面相同的密码"}
                },
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

            //在ready函数中预先调用一次远程校验函数，是一个无奈的回避案。(刘高峰）
            //否则打开修改对话框，不做任何更改直接submit,这时再触发远程校验，耗时较长，
            //submit函数在等待远程校验结果然后再提交，而layer对话框不会阻塞会直接关闭同时会销毁表单，因此submit没有提交就被销毁了导致提交表单失败。
            $("#inputForm").validate().element($("#loginName"));

        });


    </script>
</head>
<body class="hideScroll">
<form id="inputForm" modelAttribute="user" action="/sys/user/save" method="post" class="form-horizontal">
    <input name="id" type="hidden" value="<#if user.id??>${user.id}</#if>"/>
    <#if message??>${message}</#if>
    <table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
        <tbody>
        <tr>
            <td class="width-15 active">	<label class="pull-right"><font color="red">*</font>登录名：</label></td>
            <td class="width-35">
                <input name="loginName" htmlEscape="false" maxlength="50" class="form-control required" <#if user.loginName??>value="${user.loginName}"</#if>/></td>

        <#--<input id="nameImage" name="photo" htmlEscape="false" maxlength="255" class="input-xlarge"/>-->
                <#--<sys:ckfinder input="nameImage" type="images" uploadPath="/photo" selectMultiple="false" maxWidth="100" maxHeight="100"/>-->
            </td>
            <td  class="width-15"  class="active">	<label class="pull-right"><font color="red">*</font>归属公司:</label></td>
            <td class="width-35">

               <#-- <sys:treeselect id="company" name="company.id" value="${user.company.id}" labelName="company.name" labelValue="${user.company.name}"
                                                 title="公司" url="/sys/office/treeData?type=1" cssClass="form-control required"/>-->

                   <input id="companyId" name="companyId" class="form-control required" type="hidden" <#if user.companyId??>value="${user.companyId}"<#else>value="1"</#if>/>
                   <div class="input-group">
                       <input id="companyName" name="company.name" readonly="readonly"  type="text" <#if user.company.name??>value="${user.company.name}" </#if> data-msg-required=""
                              class="form-control required" style=""/>
                       <span class="input-group-btn">
	       		 <button type="button"  id="companyButton" class="btn   btn-primary  "><i class="fa fa-search"></i>
	             </button>
       		 </span>

                   </div>
                   <label id="companyName-error" class="error" for="companyName" style="display:none"></label>
                   <script type="text/javascript">
                       $("#companyButton, #companyName").click(function(){
                           // 是否限制选择，如果限制，设置为disabled
                           if ($("#companyButton").hasClass("disabled")){
                               return true;
                           }
                           // 正常打开
                           top.layer.open({
                               type: 2,
                               area: ['300px', '420px'],
                               title:"选择公司",
                               ajaxData:{selectIds: $("#companyId").val()},
                               content: "/tag/treeselect?url="+encodeURIComponent("/sys/office/treeData?type=1")+"&module=&checked=&extId=&isAll=" ,
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
                                   $("#companyId").val(ids.join(",").replace(/u_/ig,""));
                                   $("#companyName").val(names.join(","));
                                   $("#companyName").focus();
                                   top.layer.close(index);
                               },
                               cancel: function(index){ //或者使用btn2
                                   //按钮【按钮二】的回调
                               }
                           });

                       });
                   </script>


            </td>
        </tr>

        <tr>
            <td class="active"><label class="pull-right"><font color="red">*</font>归属部门:</label></td>
            <td>
                <#--<sys:treeselect id="office" name="office.id" value="${user.office.id}" labelName="office.name" labelValue="${user.office.name}"
                                title="部门" url="/sys/office/treeData?type=2" cssClass="form-control required" notAllowSelectParent="true"/>-->

                    <input id="officeId" name="officeId" class="form-control required" type="hidden" <#if user.officeId??>value="${user.officeId}"</#if>"/>
                    <div class="input-group">
                        <input id="officeName" name="office.name" readonly="readonly"  type="text" <#if user.office.name??>value="${user.office.name}"</#if>" data-msg-required=""
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
                                title:"选择部门",
                                ajaxData:{selectIds: $("#officeId").val()},
                                content: "/tag/treeselect?url="+encodeURIComponent("/sys/office/treeData?type=2")+"&module=&checked=&extId=&isAll=" ,
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
                                    $("#officeId").val(ids.join(",").replace(/u_/ig,""));
                                    //alert( $("#officeId").val());
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
            <td class="active"><label class="pull-right"><font color="red">*</font>工号:</label></td>
            <td><input name="no" htmlEscape="false" maxlength="50" class="form-control required" <#if user.no??>value="${user.no}"</#if>/></td>
        </tr>

        <tr>
            <td class="active"><label class="pull-right"><font color="red">*</font>姓名:</label></td>
            <td><input name="name" htmlEscape="false" maxlength="50" class="form-control required" <#if user.name??>value="${user.name}"</#if>/></td>
          <#--  <td class="active"><label class="pull-right"><font color="red">*</font>登录名:</label></td>
            <td><input id="oldLoginName" name="oldLoginName" type="hidden" value="${user.loginName}">
                <form:input path="loginName" htmlEscape="false" maxlength="50" class="form-control required userName" value="${user.loginName}"/></td>-->
        </tr>


        <tr>
            <td class="active"><label class="pull-right"><#if user.id??><font color="red">*</font></#if>密码:</label></td>
            <td><input id="newPassword" name="newPassword" type="password" value="" maxlength="50" minlength="3" class="form-control <#if user.id??>'required'<#else>''</#if>"/>
<#if user.id??><span class="help-inline">若不修改密码，请留空。</span></#if></td>
            <td class="active"><label class="pull-right"><#if user.id??><font color="red">*</font></#if>确认密码:</label></td>
            <td><input id="confirmNewPassword" name="confirmNewPassword" type="password"  class="form-control <#if user.id??>'required'<#else>''</#if>" value="" maxlength="50" minlength="3" equalTo="#newPassword"/></td>
        </tr>

        <tr>
            <td class="active"><label class="pull-right">邮箱:</label></td>
            <td><input name="email" htmlEscape="false" maxlength="100" class="form-control email" <#if user.email??>value="${user.email}"</#if>/></td>
            <td class="active"><label class="pull-right">电话:</label></td>
            <td><input name="phone" htmlEscape="false" maxlength="100" class="form-control" <#if user.phone??>value="${user.phone}"</#if></td>
        </tr>

        <tr>
            <td class="active"><label class="pull-right">手机:</label></td>
            <td><input name="mobile" htmlEscape="false" maxlength="100" class="form-control" <#if user.mobile??>value="${user.mobile}"</#if>/></td>
            <td class="active"><label class="pull-right">是否允许登录:</label></td>
            <td><select name="loginFlag"  class="form-control">
               <#-- <form:options items="fns:getDictList('yes_no')" itemLabel="label" itemValue="value" htmlEscape="false"/>
            </form:select>-->

               <#if yesList??>
                   <#list yesList as dict>
                       <#if dict??>
                       <option <#if dict.value??>value="${dict.value}"</#if> <#if user.loginFlag??&&user.loginFlag==dict.value>selected</#if> ><#if dict.label??>${dict.label}</#if>
                        </#if>
                   </option>
                   </#list>
               </#if>

            </td>
        </tr>

        <tr>
            <td class="active"><label class="pull-right">用户类型:</label></td>
            <td><select name="userType"  class="form-control">

            <#if userTypeList??>
                <#list userTypeList as dict>
                    <#if dict??>
                    <option <#if dict.value??>value="${dict.value}"</#if> <#if user.userType??&&user.userType==dict.value>selected</#if> ><#if dict.label??>${dict.label}</#if>
                        </#if>
                </option>
                </#list>
            </#if>

                <#--<form:option value="" label="请选择"/>
                <form:options items="fns:getDictList('sys_user_type')" itemLabel="label" itemValue="value" htmlEscape="false"/>-->
            </select></td>
            <td class="active"><label class="pull-right"><font color="red">*</font>用户角色:</label></td>
            <td>
            <#if user.roleList??>

                    <#list user.roleList as userrole>
                    ${userrole.name! } <br />
                    </#list>
               <br />
            </#if>

            <#--<#list allRoles as role>
                <#if user.roleList??>
                    <input type="checkbox" id="roleIdList${role_index}" name="roleIdList" value="${role.id! }" class="i-checks required"
                        <#list user.roleList as userrole>
                           <#if role.id==userrole.id>checked="checked"</#if>
                        </#list>
                    >${role.name! } <br />
                </#if>
            </#list>-->

                <input type="hidden" name="_roleIdList" value="on"/>
                <label id="roleIdList-error" class="error" for="roleIdList"></label>



              <#--  <form:checkboxes path="roleIdList" items="${allRoles}" itemLabel="name" itemValue="id" htmlEscape="false" cssClass="i-checks required"/>
                <label id="roleIdList-error" class="error" for="roleIdList"></label>-->
            </td>
        </tr>

        <tr>
            <td class="active"><label class="pull-right">备注:</label></td>
            <td><textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="form-control"><#if user.remarks??>${user.remarks}</#if></textarea></td>
            <td class="active"><label class="pull-right"></label></td>
            <td></td>
        </tr>

        <#if user.id??>
            <tr>
                <td class=""><label class="pull-right">创建时间:</label></td>
                <td><span class="lbl">${user.createDate?string("yyyy-MM-dd HH:mm:ss")} </span></td>
                <td class=""><label class="pull-right">最后登陆:</label></td>
                <td><span class="lbl">IP: <#if user.loginIp??>${user.loginIp}</#if>&nbsp;&nbsp;&nbsp;&nbsp;时间<#if user.loginDate??>${user.loginDate?string("yyyy-MM-dd HH:mm:ss")}</#if></span></td>
            </tr>
        <intput type="hidden" name="createBy" value="${user.createBy}"/>
               <intput type="hidden" name="createDate" value="${user.createDate?string("yyyy-MM-dd HH:mm:ss")}"/>
        <intput type="hidden" name="delFlag" value="${user.delFlag}"/>

        </#if>



</form>
</body>
</html>