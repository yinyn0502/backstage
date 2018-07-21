<html>
<head>
    <title>出错啦~~~</title>
    <link href="css/login1.css" mce_href="css/login1.css" rel="stylesheet" type="text/css" />

<#--<script language="javascript" type="text/javascript">
    var i = 2;
    var intervalid;
    intervalid = setInterval("fun()", 1000);
    function fun() {
        if (i == 0) {
            window.location.href = "/login";
            clearInterval(intervalid);
        }
        document.getElementById("mes").innerHTML = i;
        i--;
    }
</script>-->

</head>
<body>
<div id="errorfrm">
    <h3>出错啦~~~</h3>
    <div id="error">
      <#--  <img src="images/error.gif" mce_src="images/error.gif" alt="" />
        <p>系统出错，请联系管理员！</p>
        <p>将在 <span id="mes">2</span> 秒钟后返回首页！</p>-->

        <#if url??>
      ${url}
      </#if>
        <#if exception??>
        ${exception}
      </#if>
    </div>

</div>
</body>
</html>