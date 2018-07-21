<tr>
    <td colspan="5">
        共<#if pageInfo0.total??>${pageInfo0.total}<#else>0</#if>条记录 共<#if pageInfo0.pages??>${pageInfo0.pages}<#else>0</#if>页 每页显示<#if pageInfo0.pageSize??>${pageInfo0.pageSize}<#else>0</#if>条
        当前第<#if pageInfo0.pageNum??>${pageInfo0.pageNum}<#else>0</#if>页&nbsp;
    <#if pageInfo0.prePage??&&pageInfo0.prePage==0>
        &lt&lt首页&nbsp;&lt上一页&nbsp;
    <#else>
        <#if isparam??&&isparam="1">
            <a href="${pathurl}&&pageNum=${pageInfo0.firstPage}&pageSize=${pageInfo0.pageSize}&&queryType=0">&lt&lt首页&nbsp;</a>&nbsp;
            <a href="${pathurl}&&pageNum=${pageInfo0.prePage}&pageSize=${pageInfo0.pageSize}&&queryType=0" />&lt上一页</a>
        <#else>
            <a href="${pathurl}?&pageNum=${pageInfo0.firstPage}&pageSize=${pageInfo0.pageSize}&&queryType=0">&lt&lt首页&nbsp;</a>&nbsp;
            <a href="${pathurl}?&pageNum=${pageInfo0.prePage}&pageSize=${pageInfo0.pageSize}&&queryType=0" />&lt上一页</a>
        </#if>
    </#if>
        &nbsp;||&nbsp;

    <#if pageInfo0.nextPage??&&pageInfo0.nextPage==0>
        &nbsp;下一页&gt&nbsp;尾页&gt&gt
    <#else>
        <#if isparam??&&isparam="1">

            <a href="${pathurl}&&pageNum=${pageInfo0.nextPage}&pageSize=${pageInfo0.pageSize}&&queryType=0">下一页&gt&nbsp;</a>&nbsp;
            <a href="${pathurl}&&pageNum=${pageInfo0.lastPage}&pageSize=${pageInfo0.pageSize}&&queryType=0" />末页&gt&gt</a>
        <#else>
            <a href="${pathurl}?&pageNum=${pageInfo0.nextPage}&pageSize=${pageInfo0.pageSize}&&queryType=0">下一页&gt&nbsp;</a>&nbsp;
            <a href="${pathurl}?&pageNum=${pageInfo0.lastPage}&pageSize=${pageInfo0.pageSize}&&queryType=0" />末页&gt&gt</a>
        </#if>
    </#if>
        &nbsp;
    <#if pageInfo0.navigatepageNums??>
        <SELECT name="indexChange" id="indexChange"
                onchange="getCurrentPage(this.value);">
            <#list pageInfo0.navigatepageNums as p>
                <option value="${p_index+1}" <#if pageInfo0.pageNum==p_index+1>selected = "selected"</#if>>第${p_index+1}页</option>
            </#list>
        </SELECT>
    </#if>
        &nbsp;
        每页显示:<select name="everyPage" id="everyPage" onchange="setEveryPage(this.value);">
        <option value="5" <#if pageInfo0.pageSize==5>selected = "selected"</#if>>5</option>
        <option value="10" <#if pageInfo0.pageSize==10>selected = "selected"</#if>>10</option>
        <option value="20" <#if pageInfo0.pageSize==20>selected = "selected"</#if>>20</option>
        <option value="50" <#if pageInfo0.pageSize==50>selected = "selected"</#if>>50</option>
        <option value="100" <#if pageInfo0.pageSize==100>selected = "selected"</#if>>100</option>
        <option value="500" <#if pageInfo0.pageSize==500>selected = "selected"</#if>>500</option>
        <option value="1000" <#if pageInfo0.pageSize==1000>selected = "selected"</#if>>1000</option>
    </select>
    </td>
</tr>
<div style='display: none'>
    <a class=listlink id="indexPageHref" href='#'></a>
</div>
<script>
    function getCurrentPage(index){
        var a = document.getElementById("indexPageHref");
    <#if pageInfo0.pageSize??&&isparam??&&isparam=="1">
        a.href = '${pathurl}&pageSize=${pageInfo0.pageSize}&pageNum='+index;
    <#else>
        a.href = '${pathurl}?pageSize=${pageInfo0.pageSize}&pageNum='+index;
    </#if>
        a.setAttribute("onclick",'');
        a.click("return false");
    }
    function setEveryPage(everyPage){
        var a = document.getElementById("indexPageHref");
        var currentPage = document.getElementById('indexChange').value;
    <#if pageInfo0??&&isparam??&&isparam=="1">
        a.href = '${pathurl}&pageSize='+everyPage+'&pageNum='+${pageInfo0.pageNum};
    <#else>
        a.href = '${pathurl}?pageSize='+everyPage+'&pageNum='+${pageInfo0.pageNum};
    </#if>
        a.setAttribute("onclick",'');
        a.click("return false");
    }

</script>