
<html>
<head>

    <title>消息页面</title>
    <meta name="decorator" content="default"/>
<#include "ahead.ftl">

    <script type="text/javascript">
        $(document).ready(function() {
            WinMove();
        });
    </script>
</head>
<body>
<div class="wrapper wrapper-content">
    <div class="row  border-bottom white-bg dashboard-header">
        <div class="col-sm-12">
            <blockquote class="text-info" style="font-size:16px">

                <br/>
                <#if message??>
                    ${message}
                </#if>

            </blockquote>


        </div>
    </div>


</div>
</body>
</html>