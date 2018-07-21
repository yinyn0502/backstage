<tr>
    <td colspan="5">
        共<#if pageInfo3.total??>${pageInfo3.total}<#else>0</#if>条记录 共<#if pageInfo3.pages??>${pageInfo3.pages}<#else>0</#if>页 每页显示<#if pageInfo3.pageSize??>${pageInfo3.pageSize}<#else>0</#if>条
        当前第<#if pageInfo3.pageNum??>${pageInfo3.pageNum}<#else>0</#if>页&nbsp;
    <#if pageInfo3.prePage??&&pageInfo3.prePage==0>
        &lt&lt首页&nbsp;&lt上一页&nbsp;
    <#else>
        <#if isparam??&&isparam="1">
            <a href="${pathurl}&&pageNum=${pageInfo3.firstPage}&pageSize=${pageInfo3.pageSize}">&lt&lt首页&nbsp;</a>&nbsp;
            <a href="${pathurl}&&pageNum=${pageInfo3.prePage}&pageSize=${pageInfo3.pageSize}" />&lt上一页</a>
        <#else>
            <a href="${pathurl}?&pageNum=${pageInfo3.firstPage}&pageSize=${pageInfo3.pageSize}">&lt&lt首页&nbsp;</a>&nbsp;
            <a href="${pathurl}?&pageNum=${pageInfo3.prePage}&pageSize=${pageInfo3.pageSize}" />&lt上一页</a>
        </#if>
    </#if>
        &nbsp;||&nbsp;

    <#if pageInfo3.nextPage??&&pageInfo3.nextPage==0>
        &nbsp;下一页&gt&nbsp;尾页&gt&gt
    <#else>
        <#if isparam??&&isparam="1">

            <a href="${pathurl}&&pageNum=${pageInfo3.nextPage}&pageSize=${pageInfo3.pageSize}">下一页&gt&nbsp;</a>&nbsp;
            <a href="${pathurl}&&pageNum=${pageInfo3.lastPage}&pageSize=${pageInfo3.pageSize}" />末页&gt&gt</a>
        <#else>
            <a href="${pathurl}?&pageNum=${pageInfo3.nextPage}&pageSize=${pageInfo3.pageSize}">下一页&gt&nbsp;</a>&nbsp;
            <a href="${pathurl}?&pageNum=${pageInfo3.lastPage}&pageSize=${pageInfo3.pageSize}" />末页&gt&gt</a>
        </#if>
    </#if>
        &nbsp;
    <#if pageInfo3.navigatepageNums??>
        <SELECT name="indexChange" id="indexChange"
                onchange="getCurrentPage(this.value);">
            <#list pageInfo3.navigatepageNums as p>
                <option value="${p_index+1}" <#if pageInfo3.pageNum==p_index+1>selected = "selected"</#if>>第${p_index+1}页</option>
            </#list>
        </SELECT>
    </#if>
        &nbsp;
        每页显示:<select name="everyPage" id="everyPage" onchange="setEveryPage(this.value);">
        <option value="5" <#if pageInfo3.pageSize==5>selected = "selected"</#if>>5</option>
        <option value="10" <#if pageInfo3.pageSize==10>selected = "selected"</#if>>10</option>
        <option value="20" <#if pageInfo3.pageSize==20>selected = "selected"</#if>>20</option>
        <option value="50" <#if pageInfo3.pageSize==50>selected = "selected"</#if>>50</option>
        <option value="100" <#if pageInfo3.pageSize==100>selected = "selected"</#if>>100</option>
        <option value="500" <#if pageInfo3.pageSize==500>selected = "selected"</#if>>500</option>
        <option value="1000" <#if pageInfo3.pageSize==1000>selected = "selected"</#if>>1000</option>
    </select>
    </td>
</tr>
<div style='display: none'>
    <a class=listlink id="indexPageHref" href='#'></a>
</div>
<script>
    function getCurrentPage(index){
        var a = document.getElementById("indexPageHref");
    <#if pageInfo3.pageSize??&&isparam??&&isparam=="1">
        a.href = '${pathurl}&pageSize=${pageInfo3.pageSize}&pageNum='+index;
    <#else>
        a.href = '${pathurl}?pageSize=${pageInfo3.pageSize}&pageNum='+index;
    </#if>
        a.setAttribute("onclick",'');
        a.click("return false");
    }
    function setEveryPage(everyPage){
        var a = document.getElementById("indexPageHref");
        var currentPage = document.getElementById('indexChange').value;
    <#if pageInfo3??&&isparam??&&isparam=="1">
        a.href = '${pathurl}&pageSize='+everyPage+'&pageNum='+${pageInfo3.pageNum};
    <#else>
        a.href = '${pathurl}?pageSize='+everyPage+'&pageNum='+${pageInfo3.pageNum};
    </#if>
        a.setAttribute("onclick",'');
        a.click("return false");
    }

</script>