
<input id="${id}Id" name="${name}" class="${cssClass}" type="hidden" value="${value}"/>
<div class="input-group">
    <input id="${id}Name" name="${labelName}" ${allowInput?'':'readonly="readonly"'}  type="text" value="${labelValue}" data-msg-required="${dataMsgRequired}"
           class="${cssClass}" style="${cssStyle}"/>
    <span class="input-group-btn">
	       		 <button type="button"  id="${id}Button" class="btn <c:if test="${fn:contains(cssClass, 'input-sm')}"> btn-sm </c:if><c:if test="${fn:contains(cssClass, 'input-lg')}"> btn-lg </c:if>  btn-primary ${disabled} ${hideBtn ? 'hide' : ''}"><i class="fa fa-search"></i>
        </button> 
       		 </span>

</div>
<label id="${id}Name-error" class="error" for="${id}Name" style="display:none"></label>
<script type="text/javascript">
    $("#${id}Button, #${id}Name").click(function(){
        // 是否限制选择，如果限制，设置为disabled
        if ($("#${id}Button").hasClass("disabled")){
            return true;
        }
        // 正常打开	
        top.layer.open({
            type: 2,
            area: ['300px', '420px'],
            title:"选择${title}",
            ajaxData:{selectIds: $("#${id}Id").val()},
            content: "/tag/treeselect?url="+encodeURIComponent("${url}")+"&module=${module}&checked=${checked}&extId=${extId}&isAll=${isAll}" ,
            btn: ['确定', '关闭']
            ,yes: function(index, layero){ //或者使用btn1
                var tree = layero.find("iframe")[0].contentWindow.tree;//h.find("iframe").contents();
                var ids = [], names = [], nodes = [];
                if ("${checked}" == "true"){
                    nodes = tree.getCheckedNodes(true);
                }else{
                    nodes = tree.getSelectedNodes();
                }
                for(var i=0; i<nodes.length; i++) {//<c:if test="${checked && notAllowSelectParent}">
                    if (nodes[i].isParent){
                        continue; // 如果为复选框选择，则过滤掉父节点
                    }//</c:if><c:if test="${notAllowSelectRoot}">
                    if (nodes[i].level == 0){
                        //top.$.jBox.tip("不能选择根节点（"+nodes[i].name+"）请重新选择。");
                        top.layer.msg("不能选择根节点（"+nodes[i].name+"）请重新选择。", {icon: 0});
                        return false;
                    }//</c:if><c:if test="${notAllowSelectParent}">
                    if (nodes[i].isParent){
                        //top.$.jBox.tip("不能选择父节点（"+nodes[i].name+"）请重新选择。");
                        //layer.msg('有表情地提示');
                        top.layer.msg("不能选择父节点（"+nodes[i].name+"）请重新选择。", {icon: 0});
                        return false;
                    }//</c:if><c:if test="${not empty module && selectScopeModule}">
                    if (nodes[i].module == ""){
                        //top.$.jBox.tip("不能选择公共模型（"+nodes[i].name+"）请重新选择。");
                        top.layer.msg("不能选择公共模型（"+nodes[i].name+"）请重新选择。", {icon: 0});
                        return false;
                    }else if (nodes[i].module != "${module}"){
                        //top.$.jBox.tip("不能选择当前栏目以外的栏目模型，请重新选择。");
                        top.layer.msg("不能选择当前栏目以外的栏目模型，请重新选择。", {icon: 0});
                        return false;
                    }//</c:if>
                    ids.push(nodes[i].id);
                    names.push(nodes[i].name);//<c:if test="${!checked}">
                    break; // 如果为非复选框选择，则返回第一个选择  </c:if>
                }
                $("#${id}Id").val(ids.join(",").replace(/u_/ig,""));
                $("#${id}Name").val(names.join(","));
                $("#${id}Name").focus();
                top.layer.close(index);
            },
            cancel: function(index){ //或者使用btn2
                //按钮【按钮二】的回调
            }
        });

    });
</script>