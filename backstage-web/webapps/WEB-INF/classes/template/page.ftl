

<tr>
    <td colspan="5">
        共<#if pageInfo.total??>${pageInfo.total}<#else>0</#if>条记录 | 共<#if pageInfo.pages??>${pageInfo.pages}<#else>0</#if>页 | 当前页显示<#if pageInfo.endRow??>${pageInfo.endRow}<#else>0</#if>条 |
        当前第<#if pageInfo.pageNum??>${pageInfo.pageNum}<#else>0</#if>页&nbsp;
    <div style="display: inline-block; width: 150px"></div>
    <#if pageInfo.prePage??&&pageInfo.prePage==pageInfo.pageNum>
        &lt&lt首页&nbsp;&lt上一页&nbsp;
    <#else>
            <#if isparam??&&isparam="1">
            <a href="${pathurl}&&pageNum=${pageInfo.firstPage}&pageSize=${pageInfo.pageSize}&storeId=${storeId!}">&lt&lt首页&nbsp;</a>&nbsp;
            <a href="${pathurl}&&pageNum=${pageInfo.prePage}&pageSize=${pageInfo.pageSize}&storeId=${storeId!}" />&lt上一页</a>
            <#else>
                <a href="${pathurl}?&pageNum=${pageInfo.firstPage}&pageSize=${pageInfo.pageSize}&storeId=${storeId!}">&lt&lt首页&nbsp;</a>&nbsp;
                <a href="${pathurl}?&pageNum=${pageInfo.prePage}&pageSize=${pageInfo.pageSize}&storeId=${storeId!}" />&lt上一页</a>
            </#if>
        </#if>
            &nbsp;||&nbsp;

    <#if pageInfo.nextPage??&&!pageInfo.hasNextPage>
        &nbsp;下一页&gt&nbsp;尾页&gt&gt
    <#else>
            <#if isparam??&&isparam="1">

                <a href="${pathurl}&&pageNum=${pageInfo.nextPage}&pageSize=${pageInfo.pageSize}&storeId=${storeId!}">下一页&gt&nbsp;</a>&nbsp;
                <a href="${pathurl}&&pageNum=${pageInfo.lastPage}&pageSize=${pageInfo.pageSize}&storeId=${storeId!}" />末页&gt&gt</a>
            <#else>
            <a href="${pathurl}?&pageNum=${pageInfo.nextPage}&pageSize=${pageInfo.pageSize}&storeId=${storeId!}">下一页&gt&nbsp;</a>&nbsp;
            <a href="${pathurl}?&pageNum=${pageInfo.lastPage}&pageSize=${pageInfo.pageSize}&storeId=${storeId!}" />末页&gt&gt</a>
            </#if>
        </#if>
        &nbsp;
        <#if pageInfo.navigatepageNums??>
            <SELECT name="indexChange" id="indexChange"
                    onchange="getCurrentPage(this.value);">
                <#list pageInfo.navigatepageNums as p>
                    <option value="${p_index+1}" <#if pageInfo.pageNum==p_index+1>selected = "selected"</#if>>第${p_index+1}页</option>
                </#list>
            </SELECT>
        </#if>
        &nbsp;
        每页显示:<select name="everyPage" id="everyPage" onchange="setEveryPage(this.value);">
            <option value="5" <#if pageInfo.pageSize==5>selected = "selected"</#if>>5</option>
            <option value="10" <#if pageInfo.pageSize==10>selected = "selected"</#if>>10</option>
            <option value="20" <#if pageInfo.pageSize==20>selected = "selected"</#if>>20</option>
            <option value="50" <#if pageInfo.pageSize==50>selected = "selected"</#if>>50</option>
            <option value="100" <#if pageInfo.pageSize==100>selected = "selected"</#if>>100</option>
            <option value="500" <#if pageInfo.pageSize==500>selected = "selected"</#if>>500</option>
            <option value="1000" <#if pageInfo.pageSize==1000>selected = "selected"</#if>>1000</option>
        </select>
    </td>
</tr>
<div style='display: none'>
    <a class=listlink id="indexPageHref" href='#'></a>
</div>
<script>
    function getCurrentPage(index){
        var a = document.getElementById("indexPageHref");
        <#if pageInfo.pageSize??&&isparam??&&isparam=="1">
            a.href = '${pathurl}&pageSize=${pageInfo.pageSize}&pageNum='+index;
        <#else>
            a.href = '${pathurl}?pageSize=${pageInfo.pageSize}&pageNum='+index;
        </#if>
        a.setAttribute("onclick",'');
        a.click("return false");
    }
    function setEveryPage(everyPage){
        var a = document.getElementById("indexPageHref");
        var currentPage = document.getElementById('indexChange').value;
        <#if pageInfo??&&isparam??&&isparam=="1">
            a.href = '${pathurl}&pageSize='+everyPage+'&pageNum='+<#if pageInfo.pageNum??>${pageInfo.pageNum}<#else>1</#if>;
        <#else>
                a.href = '${pathurl}?pageSize='+everyPage+'&pageNum='+<#if pageInfo.pageNum??>${pageInfo.pageNum}<#else>1</#if>;
        </#if>
        a.setAttribute("onclick",'');
        a.click("return false");
    }

</script>