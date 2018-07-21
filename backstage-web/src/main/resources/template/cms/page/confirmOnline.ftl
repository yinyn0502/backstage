<html>
<head>
    <title>banner</title>

    <meta name="decorator" content="default"/>

    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js" type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet"/>
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet"/>

    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>
    <style>
        body{
            width: 100%;
            height: auto;
            overflow-y: hidden;
        }
        .button {
            background-color: #4A90E2;
            border: none;
            color: white;
            /*padding: 10px 21px;*/
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            border-radius: 6px;
            line-height: 40px;
            width: 100px;
            height:40px;
            text-align: center;

        }

        /*html {*/
            /*position: relative;*/
        /*}*/

        /*table {*/
            /*position: absolute;*/
            /*top: 50%;*/
            /*transform: translateY(-50%);*/
        /*}*/

        .buttonWarp{
            width: 100%;
            height: 50px;
            line-height: 50px;
            padding-top: 14%;
        }
        .title{
            width: 100%;
            text-align: center;
            font-size: 26px;
            margin-top: 30px;
        }

    </style>
</head>

<body>
    <div class="title">确认上线</div>
    <div class="buttonWarp">
        <button id="online" class="button" style="margin-right: 10%; margin-left: 20%;">上线</button>
        <button id="noOnline" class="button">不上线</button>
    </div>
</body>
</html>

<script>
    $(function () {
        $("#online").click(function () {
            var str = "上线成功喽";
            $.get("/cms/online?templateId=<#if templateId??>${templateId?c}</#if>&storeId=<#if storeId??>${storeId?c}</#if>", function (data) {
                if (!data) {
                    str = "上线失败啦";
                }
                alert(str);
                if (str == "上线成功喽"){
                    top.location.reload();
                }else {
                    $.artDialog.close();
                }

            });
        });

        $("#noOnline").click(function () {
            $.artDialog.close();
        });
    });
</script>
