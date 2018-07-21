<html>
    <body>
        <h1>welcome to freemarker </h1>



        <#if users??>
            <#list users as user>
            username : ${user.username}<br/>

            </#list>

        </#if>



    </body>
</html>