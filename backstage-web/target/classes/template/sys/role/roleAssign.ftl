
<html>
<head>
	<title>分配角色</title>
	<meta name="decorator" content="default"/>
    <#include "../../ahead.ftl">
    <#include "../../treeview.ftl" >
    <#include "../../treetable.ftl" >
</head>
<body>
	
	<div class="wrapper wrapper-content">
	<div class="container-fluid breadcrumb">
		<div class="row-fluid span12">
			<span class="span4">角色名称: <b><#if role.name??>${role.name}</#if></b></span>
			<span class="span4">归属机构:<#if role.office.name??> ${role.office.name}</#if></span>
			<span class="span4">英文名称:<#if role.office.enname??>${role.enname}</#if></span>
		</div>
		<div class="row-fluid span8">
			<span class="span4">角色类型: <#if role.roleType??>${role.roleType}</#if></span>
			<c:set var="dictvalue" value="<#if role.roleType??>${role.dataScope}"</#if> scope="page" />
			<span class="span4">数据范围: <#list dictList as dict>
				<#if role.dataScope??&&role.dataScope==dict.value>${dict.label}</#if>
			</#list></span>
		</div>
	</div>
	<#if message??>${message}</#if>
	<div class="breadcrumb">
		<form id="assignRoleForm" action="/sys/role/assignrole/" method="post" class="hide">
			<input type="hidden" name="id" value="${role.id}"/>
			<input id="idsArr" type="hidden" name="idsArr" value=""/>
		</form>
		<button id="assignButton" type="submit"  class="btn btn-outline btn-primary btn-sm" title="添加人员"><i class="fa fa-plus"></i> 添加人员</button>
		<script type="text/javascript">
			$("#assignButton").click(function(){
				
		top.layer.open({
		    type: 2, 
		    area: ['800px', '600px'],
		    title:"选择用户",
	        maxmin: true, //开启最大化最小化按钮
		    content: "/sys/role/usertorole/${role.id}" ,
		    btn: ['确定', '关闭'],
		    yes: function(index, layero){
    	       var pre_ids = layero.find("iframe")[0].contentWindow.pre_ids;
				var ids = layero.find("iframe")[0].contentWindow.ids;
				if(ids[0]==''){
						ids.shift();
						pre_ids.shift();
					}
					if(pre_ids.sort().toString() == ids.sort().toString()){
						top.$.jBox.tip("未给角色【${role.name}】分配新成员！", 'info');
						return false;
					};
			    	// 执行保存
			    	//loading('正在提交，请稍等...');
			    	var idsArr = "";
			    	for (var i = 0; i<ids.length; i++) {
			    		idsArr = (idsArr + ids[i]) + (((i + 1)== ids.length) ? '':',');
			    		//alert(idsArr);
			    	}
			    	$('#idsArr').val(idsArr);
			    	$('#assignRoleForm').submit();
				    top.layer.close(index);

			  },
			  cancel: function(index){ 
    	       }
		}); 
			});
		</script>
	</div>
	<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
		<thead><tr><th>归属公司</th><th>归属部门</th><th>登录名</th><th>姓名</th><th>电话</th><th>手机</th><shiro:hasPermission name="sys:user:edit"><th>操作</th></shiro:hasPermission></tr></thead>
		<tbody>
		<#list userList as user>
			<tr>
				<td>优集客</td>
				<td><#if userOffice.name??>${userOffice.name}</#if></td>
				<td><a href="/sys/user/form/${user.id}">${user.loginName}</a></td>
				<td><#if user.name??>${user.name}</#if></td>
				<td><#if user.phone??>${user.phone}</#if></td>
				<td><#if user.mobile??>${user.mobile}</#if></td>
				<shiro:hasPermission name="sys:role:edit"><td>
					<a href="/sys/role/outrole?userId=${user.id}&roleId=${role.id}"
						onclick="return confirmx('确认要将用户<b>[${user.name}]</b>从<b>[${role.name}]</b>角色中移除吗？', this.href)">移除</a>
				</td></shiro:hasPermission>
			</tr>
		</#list>
		</tbody>
	</table>
	</div>
</body>
</html>
