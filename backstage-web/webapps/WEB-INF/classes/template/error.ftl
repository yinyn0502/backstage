<html>
<head>
    <title>出错啦~~~</title>
    <link href="css/login1.css" mce_href="css/login1.css" rel="stylesheet" type="text/css" />


</head>
<body>

    <h3>出错啦~~~</h3>
    <div id="error">

       访问的URL地址为 <#if url??>${url}</#if>
        <#if exception??>${exception}</#if>
            <p>点击链接，返回<a href="/login" >登录页</a></p>
    </div>


</body>
</html>