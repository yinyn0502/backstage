<!DOCTYPE html>
<html>

<head>
    <meta name="description" content="User login page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="shortcut icon" href="images/favicon.png" type="image/png">
    <link rel="stylesheet" href="/static/common/login/ace-fonts.css" />

    <link rel="stylesheet" href="/static/common/login/ace.css" />

    <link rel="stylesheet" href="../assets/css/ace-part2.css" />
    <link rel="stylesheet" href="/static/common/login/ace-rtl.css" />
    <#include "./ahead.ftl">
    <#include "./treeview.ftl" >
    <#include "./treetable.ftl" >
    <script type="text/javascript" src="/login/login.js"></script>
    <style type="text/css">

        .bound{
            background-color: white;
            background-color: rgba(255, 255, 255, 0.95);
            border-radius: 40px;
        }
    </style>
    <title>宠物网集成系统</title>
    <script>
        if (window.top !== window.self) {
            window.top.location = window.location;
        }
    </script>
</head>

<body class="login-layout light-login">
<div class="main-container">
    <div class="main-content">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container">

                    <div class="center">
                        <h1>
                            <br/>
                            <br>
                        </h1>

            <#if message??>
                 ${message}
            </#if>
                    </div>

                    <div class="space-6"></div>

                    <div class="position-relative">
                        <div id="login-box" class="login-box visible widget-box no-border bound">
                            <div class="widget-body bound">
                                <div class="widget-main bound">
                                    <h4 class="header blue lighter bigger">
                                        <i class="ace-icon fa fa-coffee green"></i>
                                        用户登录
                                    </h4>

                                    <div class="space-6"></div>

                                    <form id="loginForm" class="form-signin" action="/login" method="post">
                                        <fieldset>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text"  id="username" name="loginName" class="form-control required"  value="" placeholder="用户名" />
															<i class="ace-icon fa fa-user"></i>
														</span>
                                            </label>

                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" id="password" name="password" value="" class="form-control required" placeholder="密码" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
                                            </label>




                                            <div class="space"></div>

                                            <div class="clearfix">
                                                <label class="inline">
                                                    <input  type="checkbox" id="rememberMe" name="rememberMe" <#if rememberMe??>'checked'<#else></#if> class="ace" />
                                                    <span class="lbl"> 记住我</span>
                                                </label>

                                                <button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
                                                    <i class="ace-icon fa fa-key"></i>
                                                    <span class="bigger-110">登录</span>
                                                </button>
                                            </div>

                                            <div class="space-4"></div>


                                        </fieldset>
                                    </form>

                                    <br/>
                                    <br/>
                                    <div class="form-options clearfix">
                                        <div>
                                            <a href="#" data-target="#forgot-box" class="pull-left">
                                                <font color=" #007aff;"><i class="ace-icon fa fa-arrow-left"></i>
                                                    忘记密码</font>
                                            </a>
                                        </div>

                                        <div>
                                            <a href="#" data-target="#signup-box" class="pull-right user-signup-link">
                                                <font color=" #A73438">没有账号？注册
                                                    <i class="ace-icon fa fa-arrow-right"></i></font>
                                            </a>
                                        </div>
                                    </div>
                                </div><!-- /.widget-main -->


                            </div><!-- /.widget-body -->
                        </div><!-- /.login-box -->

                        <div id="forgot-box" class="forgot-box widget-box no-border bound">
                            <div class="widget-body bound">
                                <div class="widget-main bound">
                                    <h4 class="header red lighter bigger">
                                        <i class="ace-icon fa fa-key"></i>
                                        找回密码
                                    </h4>

                                    <div class="space-6"></div>
                                    <p>
                                        请输入您的注册手机号，您将会收到新的密码。
                                    </p>

                                    <form id="resetForm">
                                        <fieldset>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="tel_resetpass" name="mobile" type="tel" class="form-control  text-muted required isMobile" placeholder="请输入手机号" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
                                            </label>

                                            <div class="clearfix">
                                                <button id="sendPassBtn" type="button" class="width-35 pull-right btn btn-sm btn-danger">
                                                    <i class="ace-icon fa fa-lightbulb-o"></i>
                                                    <span class="bigger-110">发送!</span>
                                                </button>
                                            </div>
                                        </fieldset>
                                    </form>
                                    <div class="form-options center">
                                        <br/>
                                        <br/>
                                        <a href="#" data-target="#login-box" class="">
                                            <font color=" #A73438"><i class="ace-icon fa fa-arrow-left"></i>
                                                返回登录
                                            </font>
                                        </a>
                                    </div>
                                </div><!-- /.widget-main -->

                            </div><!-- /.widget-body -->
                        </div><!-- /.forgot-box -->

                        <div id="signup-box" class="signup-box widget-box no-border bound">
                            <div class="widget-body bound">
                                <div class="widget-main bound">
                                    <h4 class="header green lighter bigger">
                                        <i class="ace-icon fa fa-users blue"></i>
                                        用户注册
                                    </h4>

                                    <div class="space-6"></div>
                                    <form:form id="inputForm" modelAttribute="user" action="/sys/register/registerUser" method="post" class="form-group form-horizontal">
                                        <input  type="hidden" value="system" name="roleName"><!-- 默认注册用户都是超级管理员 -->
                                        <fieldset>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="tel" name="mobile" type="text" value="" maxlength="11" minlength="11" class="form-control text-muted required isMobile"  placeholder="手机号"/>
															<i class="ace-icon fa fa-phone"></i>
														</span>
                                            </label>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="code" name="randomCode" type="text" value="" maxlength="4" minlength="4" class="required"  placeholder="验证码"/>
															<button class="width-40 pull-right btn btn-sm btn-primary" type="button" id="sendCodeBtn"  >
																<i class="ace-icon fa fa-lightbulb-o"></i>
																<span class="bigger-110">获取验证码!</span>
															</button>
															<label id="code-error" class="error" for="code" style="display:none"></label>
														</span>
                                            </label>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="userId" name="username" type="text" value="" maxlength="20" minlength="3" class="form-control required" placeholder="用户名" />
															<i class="ace-icon fa fa-user"></i>
														</span>
                                            </label>

                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="newPassword" name="password" type="password" value="" maxlength="20" minlength="3"  class="form-control required" placeholder="密码" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
                                            </label>

                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input id="confirmNewPassword" name="confirmNewPassword" type="password" value="" maxlength="20" minlength="3" class="form-control required" equalTo="#newPassword" placeholder="重复密码" />
															<i class="ace-icon fa fa-retweet"></i>
														</span>
                                            </label>

                                            <label class="block">
                                                <input name="ck1" type="checkbox" class="required ace" />
                                                <span class="lbl">
															我接受
															<a href="#">《JeePlus用户注册协议》</a>
														</span>
                                                <label id="ck1-error" class="error" for="ck1" style="display: none;">必须接受用户协议</label>
                                            </label>

                                            <div class="space-24"></div>

                                            <div class="clearfix">
                                                <button type="reset" class="width-30 pull-left btn btn-sm">
                                                    <i class="ace-icon fa fa-refresh"></i>
                                                    <span class="bigger-110">重置</span>
                                                </button>

                                                <button type="submit" class="width-65 pull-right btn btn-sm btn-success">
                                                    <span class="bigger-110">注册</span>

                                                    <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                                </button>
                                            </div>
                                        </fieldset>
                                    </form:form>
                                    <div class="form-options center">
                                        <br/>
                                        <br/>
                                        <a href="#" data-target="#login-box" class="">
                                            <font color=" #A73438"><i class="ace-icon fa fa-arrow-left"></i>
                                                返回登录
                                            </font>
                                        </a>
                                    </div>
                                </div>


                            </div><!-- /.widget-body -->
                        </div><!-- /.signup-box -->
                    </div><!-- /.position-relative -->
                    <div class="center"><h4 id="id-company-text"><font color="#A90E0E">&copy; www.chongwuweb.com</font></h4></div>

                </div>
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.main-content -->
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write("<script src='../assets/js/jquery.js'>"+"<"+"/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='../assets/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]-->

<script type="text/javascript">
    if('ontouchstart' in document.documentElement) document.write("<script src='../assets/js/jquery.mobile.custom.js'>"+"<"+"/script>");
</script>
<style>
    /* Validation */

    label.error {
        color: #cc5965;
        display: inline-block;
        margin-left: 5px;
    }

</style>

</body>
</html>