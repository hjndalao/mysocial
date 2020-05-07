<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>登录</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <link rel="stylesheet" href="${path}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${path}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${path}/css/style.css">
    <link rel="stylesheet" href="${path}/css/login.css" type="text/css"/>
    <link rel="stylesheet" href="${path}/plugins/angularjs/toaster.min.css">
    <script type="text/javascript" src="${path}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script type="text/javascript" src="${path}/plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${path}/plugins/angularjs/angular.min.js"></script>
    <script type="text/javascript" src="${path}/plugins/angularjs/angular-animate.min.js"></script>
    <script type="text/javascript" src="${path}/plugins/angularjs/toaster.min.js"></script>
    <script type="text/javascript" src="${path}/js/base.js"></script>
    <script type="text/javascript" src="${path}/js/service/loginService.js"></script>
    <script type="text/javascript" src="${path}/js/controller/loginController.js"></script>
<body ng-app="shebao" ng-controller="loginController">
<div class="a">
    <div class="b">
        稽查平台
    </div>
    <div>
        <table>
            <tr>
                <td>
                    <div style="display: inline-block;">
                        <img src="${path}/img/8bff190f237fe889394f89796fa0fa18.png"
                             style="width: 186px;height: 186px;margin-left: 480px;margin-top: 112px;border-radius: 95px;"/>
                    </div>
                </td>
                <td>
                    <div class="c">
                        <table style="border-collapse:separate; border-spacing:0px 10px;">
                            <tr>
                                <td>用户账号:</td>
                                <td><input id="uid" class="input" type="text" name="username"
                                           ng-model="entity.uid"/><br/></td>
                                <td><span id="sp1"></span></td>
                            </tr>
                            <tr>
                                <td>用户密码:</td>
                                <td><input id="pw" class="input" name="password" ng-model="entity.password"/></td>
                            </tr>
                        </table>
                        <br/>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div class="e">
        <div style="margin:auto;">
        </div>
    </div>
    <div class="g">
    </div>
</div>
</body>
</html>