<#if message??>
<div id="messageBox" class="alert alert-success">
    <button data-dismiss="alert" class="close">×</button>  ${message} </div>
<script type="text/javascript">if(!top.$.jBox.tip.mess){top.$.jBox.tip.mess=1;top.$.jBox.tip("${message}","success",{persistent:true,opacity:0});$("#messageBox").show();}</script>
</#if>