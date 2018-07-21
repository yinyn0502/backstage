<tr>
    <td colspan="5">
        共<#if pageInfo1.total??>${pageInfo1.total}<#else>0</#if>条记录 共<#if pageInfo1.pages??>${pageInfo1.pages}<#else>0</#if>页 每页显示<#if pageInfo1.pageSize??>${pageInfo1.pageSize}<#else>0</#if>条
        当前第<#if pageInfo1.pageNum??>${pageInfo1.pageNum}<#else>0</#if>页&nbsp;
    <#if pageInfo1.prePage??&&pageInfo1.prePage==0>
        &lt&lt首页&nbsp;&lt上一页&nbsp;
    <#else>
        <#if isparam??&&isparam="1">
            <a href="${pathurl}&&pageNum=${pageInfo1.firstPage}&pageSize=${pageInfo1.pageSize}">&lt&lt首页&nbsp;</a>&nbsp;
            <a href="${pathurl}&&pageNum=${pageInfo1.prePage}&pageSize=${pageInfo1.pageSize}" />&lt上一页</a>
        <#else>
            <a href="${pathurl}?&pageNum=${pageInfo1.firstPage}&pageSize=${pageInfo1.pageSize}">&lt&lt首页&nbsp;</a>&nbsp;
            <a href="${pathurl}?&pageNum=${pageInfo1.prePage}&pageSize=${pageInfo1.pageSize}" />&lt上一页</a>
        </#if>
    </#if>
        &nbsp;||&nbsp;

    <#if pageInfo1.nextPage??&&pageInfo1.nextPage==0>
        &nbsp;下一页&gt&nbsp;尾页&gt&gt
    <#else>
        <#if isparam??&&isparam="1">

            <a href="${pathurl}&&pageNum=${pageInfo1.nextPage}&pageSize=${pageInfo1.pageSize}">下一页&gt&nbsp;</a>&nbsp;
            <a href="${pathurl}&&pageNum=${pageInfo1.lastPage}&pageSize=${pageInfo1.pageSize}" />末页&gt&gt</a>
        <#else>
            <a href="${pathurl}?&pageNum=${pageInfo1.nextPage}&pageSize=${pageInfo1.pageSize}">下一页&gt&nbsp;</a>&nbsp;
            <a href="${pathurl}?&pageNum=${pageInfo1.lastPage}&pageSize=${pageInfo1.pageSize}" />末页&gt&gt</a>
        </#if>
    </#if>
        &nbsp;
    <#if pageInfo1.navigatepageNums??>
        <SELECT name="indexChange" id="indexChange"
                onchange="getCurrentPage(this.value);">
            <#list pageInfo1.navigatepageNums as p>
                <option value="${p_index+1}" <#if pageInfo1.pageNum==p_index+1>selected = "selected"</#if>>第${p_index+1}页</option>
            </#list>
        </SELECT>
    </#if>
        &nbsp;
        每页显示:<select name="everyPage" id="everyPage" onchange="setEveryPage(this.value);">
        <option value="5" <#if pageInfo1.pageSize==5>selected = "selected"</#if>>5</option>
        <option value="10" <#if pageInfo1.pageSize==10>selected = "selected"</#if>>10</option>
        <option value="20" <#if pageInfo1.pageSize==20>selected = "selected"</#if>>20</option>
        <option value="50" <#if pageInfo1.pageSize==50>selected = "selected"</#if>>50</option>
        <option value="100" <#if pageInfo1.pageSize==100>selected = "selected"</#if>>100</option>
        <option value="500" <#if pageInfo1.pageSize==500>selected = "selected"</#if>>500</option>
        <option value="1000" <#if pageInfo1.pageSize==1000>selected = "selected"</#if>>1000</option>
    </select>
    </td>
</tr>
<div style='display: none'>
    <a class=listlink id="indexPageHref" href='#'></a>
</div>
<script>
    function getCurrentPage(index){
        var a = document.getElementById("indexPageHref");
    <#if pageInfo1.pageSize??&&isparam??&&isparam=="1">
        a.href = '${pathurl}&pageSize=${pageInfo1.pageSize}&pageNum='+index;
    <#else>
        a.href = '${pathurl}?pageSize=${pageInfo1.pageSize}&pageNum='+index;
    </#if>
        a.setAttribute("onclick",'');
        a.click("return false");
    }
    function setEveryPage(everyPage){
        var a = document.getElementById("indexPageHref");
        var currentPage = document.getElementById('indexChange').value;
    <#if pageInfo1??&&isparam??&&isparam=="1">
        a.href = '${pathurl}&pageSize='+everyPage+'&pageNum='+${pageInfo1.pageNum};
    <#else>
        a.href = '${pathurl}?pageSize='+everyPage+'&pageNum='+${pageInfo1.pageNum};
    </#if>
        a.setAttribute("onclick",'');
        a.click("return false");
    }

</script>