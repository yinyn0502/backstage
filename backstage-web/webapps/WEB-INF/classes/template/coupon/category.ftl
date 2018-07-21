
	<#include "../ahead.ftl">
	<#include "../treeview.ftl" >
	<#include "../treetable.ftl" >
	<script type="text/javascript">

	  	var validateForm;
		function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
		  if(validateForm.form()){
			  $("#inputForm").submit();
			  closeTip();
			  return true;
		  }

		  return false;
		}
			
		$(document).ready(function(){
			$("#name").focus();
			validateForm = $("#inputForm").validate({
				submitHandler: function(form){
					var ids = [], nodes = tree.getCheckedNodes(true);
					for(var i=0; i<nodes.length; i++) {
						ids.push(nodes[i].id);
					}
					$("#menuIds").val(ids);
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

			var setting = {check:{enable:true,nocheckInherit:true},view:{selectedMulti:false},
					data:{simpleData:{enable:true}},callback:{beforeClick:function(id, node){
						tree.checkNode(node, !node.checked, true, true);
						return false;
					}}};
			
			// 用户-菜单
			var zNodes=[
					<#list menuList as menu>{id:"${menu.id}", pId:"<#if menu.parentId??>${menu.parentId}<#else>0</#if>", name:"<#if menu.name??>${menu.name}<#else>'权限列表'</#if>"},
		            </#list>];
			// 初始化树结构
			var tree = $.fn.zTree.init($("#menuTree"), setting, zNodes);
			// 不选择父节点
			tree.setting.check.chkboxType = { "Y" : "ps", "N" : "s" };
			// 默认选择节点

            var ids = "roleMenuIds".split(",");
			for(var i=0; i<ids.length; i++) {
				var node = tree.getNodeByParam("id", ids[i]);
				try{tree.checkNode(node, true, false);}catch(e){}
			}
			// 默认展开全部节点
			tree.expandAll(true);
		
		});
		
	</script>


	<#--<form id="inputForm" modelAttribute="role" action="/sys/role/save" method="post" class="form-horizontal">
		<input name="id" type="hidden" value="${role.id}"/>
		<input  name="officeId" type="hidden" value="${role.officeId}">
		<input  name="office.name" type="hidden" value="${role.office.name}">
		<input  name="name" type="hidden" value="${role.name}">
		<input  name="oldName" type="hidden" value="${role.name}">
		<input  name="enname" type="hidden" value="${role.enname}">
		<input  name="oldEnname" type="hidden" value="${role.enname}">
		<input  name="roleType" type="hidden" value="${role.roleType}">
		&lt;#&ndash;<input  name="sysData" type="hidden" value="role.sysData">&ndash;&gt;
		<input  name="useable" type="hidden" value="${role.useable}">
		<input  name="dataScope" type="hidden" value="${role.dataScope}">
		<input  name="remarks" type="hidden" value="${role.remarks}">
        <input  name="delFlag" type="hidden" value="${role.delFlag}">
        <input  name="createBy" type="hidden" <#if role.createBy??>value="${role.createBy}"</#if>>
        <input  name="creteDate" type="hidden"  <#if role.createDate??>value="${role.createDate?string("yyyy-MM-dd HH:mm:ss")}"</#if>>
		<div id="menuTree" class="ztree" style="margin-top:3px;float:left;"></div>
		<input id="menuIds" name="menuIds" type="hidden" value=""/>
		<input id="officeIds" name="officeIds" type="hidden" value=""/>
	</form>-->
    <div id="menuTree" class="ztree" style="margin-top:3px;float:left;"></div>
