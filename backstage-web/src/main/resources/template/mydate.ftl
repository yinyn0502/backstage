<#function number_to_ymdhms date>

    <#if date != null>

        <#setting datetime_format="yyyy-MM-dd hh:mm:ss"/>

        <#return date?number_to_datetime/>

    </#if>

    <#return ""/>

</#function>

<#function date_to_ymdhms date>

    <#if date != null>

        <#return date?string('yyyy-MM-dd hh:mm:ss')/>

    </#if>

    <#return ""/>

</#function>

<#--
${number_to_ymdhms(item.addtime)}-->
