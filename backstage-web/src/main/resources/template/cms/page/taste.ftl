
<html>
<head>
    <title>纯粹味道</title>

    <meta name="decorator" content="default"/>

    <script src="/static/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
    <link href="/static/bootstrap/3.3.4/css_default/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="/static/bootstrap/3.3.4/js/bootstrap.min.js"  type="text/javascript"></script>
    <link href="/static/awesome/4.4/css/font-awesome.min.css" rel="stylesheet" />
    <link href="/static/common/css/style.css?v=3.2.0" type="text/css" rel="stylesheet" />

    <script type="text/javascript" src="/static/artDialog/jquery.artDialog.js?skin=green"></script>
    <script type="text/javascript" src="/static/artDialog/plugins/iframeTools.source.js"></script>
    <style>
        .add {
            background-color: #4A90E2; /* Green */
            border: none;
            color: white;
            padding: 10px 21px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
        }
    </style>

</head>

<h1 align="center">纯粹味道</h1>

<#if moduleTypeId??>
<input hidden value="${moduleTypeId?c}" name="moduleTypeId" id="moduleTypeId"/>
</#if>
<#if moduleIds??>
<input hidden value="${moduleIds}" name="moduleIds" id="moduleIds"/>
</#if>
<#if templateId??>
<input hidden value="${templateId?c}" name="templateId" id="templateId"/>
</#if>
<#if storeId??>
<input hidden value="${storeId?c}" name="storeId" id="storeId"/>
</#if>
<table align="center" style="padding-left: 30px ">
    <thead>
    <tr>
        <td>
            <label>一共6个位置,每个位置6个品</label>
            <div style="display: inline-block; width: 100px"></div>
            <#--<button id="add" class="add">添加</button>-->
        </td>
    </tr>
    </thead>

    <#if cmsTasteVOList??>
    <#list cmsTasteVOList as item>
    <tr style="border-bottom: solid 1px; border-top: #66dc33 1px">
        <td>
            <table>
                <tr>
                    <td>
                        <hr style=" height:2px;border:none;border-top:2px dotted #185598;" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <label style="color: forestgreen">位置:</label>
                    </td>
                    <td>
                        <label id="sort_${item_index}" style="color: red"><#if item.sort??>${item.sort?c}</#if></label>
                    </td>
                    <td>
                        <input hidden id="moduleId_${item_index}" value="<#if item.moduleId??>${item.moduleId?c}</#if>"/>
                        <button id="update_${item_index}" data-index="${item_index}" class="update">修改</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <label>模块名称:</label>
                    </td>
                    <td>
                        <label><#if item.moduleName??>${item.moduleName}</#if></label>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <#if item.cmsProductInfoList??>
        <#list item.cmsProductInfoList as product>
        <td>
            <table align="center" style="border-top: solid 1px; border-right: 1px" width="550px">
                <tr>
                    <td>
                        <table>

                            <#if product.sort==1>
                                <tr>
                                    <td>
                                        <label>商品图:</label>
                                    </td>
                                    <td>
                                        <img id="uploadhead" src="<#if product.productImage??>${product.productImage}</#if>" href="test" height="250px" width="400px">
                                    </td>
                                </tr>
                                <#if product.productId??>
                                    <tr>
                                        <td>
                                            <label>商品ID:</label>
                                        </td>
                                        <td>
                                            <label><#if product.productId??>${product.productId?c}</#if></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>商品名称:</label>
                                        </td>
                                        <td>
                                            <label><#if product.productTitle??>${product.productTitle}</#if></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>副标题:</label>
                                        </td>
                                        <td>
                                            <label><#if product.productSubtitle??>${product.productSubtitle}</#if></label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td>
                                            <label>商品价格:</label>
                                        </td>
                                        <td>
                                            <label><#if product.price??>${product.price?c}</#if></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>可售库存:</label>
                                        </td>
                                        <td>
                                            <label><#if product.stock??>${product.stock?c}</#if></label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <label>可售状态:</label>
                                        </td>
                                        <td>
                                            <label><#if product.status??>${product.status}</#if></label>
                                        </td>
                                    </tr>
                                <#else >
                                    <tr>
                                        <td>
                                            <label>活动页地址:</label>
                                        </td>
                                        <td>
                                            <label>${product.targetValue}</label>
                                        </td>
                                    </tr>
                                        <tr>
                                            <td>
                                                <label>页面标题:</label>
                                            </td>
                                            <td>
                                                <label>${product.targetTitle}</label>
                                            </td>
                                        </tr>

                              </#if>
                        </#if>


                        <#if (product.sort>=2&&product.sort<7)>
                            <tr>
                                <td>
                                    <label>商品ID:</label>
                                </td>
                                <td>
                                    <label><#if product.productId??>${product.productId?c}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>商品图:</label>
                                </td>
                                <td>
                                    <img id="uploadhead" src="<#if product.productImage??>${product.productImage}</#if>" href="test" height="250px">
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>商品名称:</label>
                                </td>
                                <td>
                                    <label><#if product.productTitle??>${product.productTitle}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>副标题:</label>
                                </td>
                                <td>
                                    <label><#if product.productSubtitle??>${product.productSubtitle}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>商品价格:</label>
                                </td>
                                <td>
                                    <label><#if product.price??>${product.price?c}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>可售库存:</label>
                                </td>
                                <td>
                                    <label><#if product.stock??>${product.stock?c}</#if></label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>可售状态:</label>
                                </td>
                                <td>
                                    <label><#if product.status??>${product.status}</#if></label>
                                </td>
                            </tr>
                        </#if>


                        <#if product.sort==7>
                            <tr>
                                <td>
                                    <label>查看更多:</label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>背景图:</label>
                                </td>
                                <td>
                                    <img id="uploadImage" src="<#if product.productImage??>${product.productImage}</#if>" href="test" height="250px">

                                </td>

                            </tr>
                        <tr>
                            <#if product.targetTitle=="">
                                <td>
                                    <label>分类页:</label>
                                </td>
                                <td>
                                    <label id="classLocation"><#if product.targetValue??>${product.targetValue}</#if></label>
                                </td>
                            <#else >
                                <tr>
                                    <td>
                                        <label>活动页:</label>
                                    </td>
                                    <td>
                                        <label id="filePath"><#if product.targetValue??>${product.targetValue}</#if></label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label >页面标题:</label>
                                    </td>
                                    <td>
                                        <label>${product.targetTitle}</label>
                                    </td>
                                </tr>

                            </#if>
                        </tr>
                    </#if>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
        </#list>
        </#if>
    </tr>
    </#list>
    </#if>
</table>

<script>
//    $(".add").click(function () {
//        var templateId = $("#templateId").val();
//        var storeId = $("#storeId").val();
//
//        $.artDialog.open("/cms/page/taste/edit/view?cmd=save"
//                + "&storeId=" + storeId
//                + "&templateId=" + templateId,{
//            width:520,
//            height:600,
//            title:"添加-纯粹味道",
//            close: function () {
//                art.dialog.open.origin.location.href="/cms/page/taste?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
//            }
//        });
//    });
    $(".update").click(function () {
        var index = $(this).data("index");
        var sort = $("#sort_" + index).text();
        var moduleId = $("#moduleId_" + index).val();
        var templateId = $("#templateId").val();
        $.artDialog.open("/cms/page/taste/edit/view?cmd=update&storeId=<#if storeId??>${storeId?c}</#if>"
                + "&sort=" + sort
                + "&moduleId=" + moduleId
                + "&templateId=" + templateId,{
            width:700,
            height:700,
            title:"编辑-纯粹味道",
            close: function () {
                art.dialog.open.origin.location.href="/cms/page/taste?moduleIds="+$("#moduleIds").val()+"&templateId="+$("#templateId").val()+"&storeId="+$("#storeId").val();
            }
        });
    });
</script>

</html>