<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>社保稽查项目</title>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <!-- 页面meta /-->
    <link rel="stylesheet" href="${path}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${path}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${path}/plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="${path}/css/style.css">
    <link rel="stylesheet" href="${path}/plugins/angularjs/toaster.min.css">
    <script src="${path}/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="${path}/plugins/bootstrap/js/bootstrap.min.js"></script>
    <%--    <script type="text/javascript" src="${path}/plugins/angularjs/angular.min.js"></script>
        <script type="text/javascript" src="${path}/plugins/angularjs/angular-animate.min.js"></script>
        <script type="text/javascript" src="${path}/plugins/angularjs/toaster.min.js"></script>
        <script type="text/javascript" src="${path}/js/base.js"></script>
        <script type="text/javascript" src="${path}/js/service/loginService.js"></script>
        <script type="text/javascript" src="${path}/js/controller/loginController.js"></script>--%>
    <script src="${path}/plugins/adminLTE/js/app.min.js"></script>
    <script type="text/javascript">
        function SetIFrameHeight() {
            var iframeid = document.getElementById("iframe"); //iframe id
            if (document.getElementById) {
                iframeid.height = document.documentElement.clientHeight;
            }
        }
    </script>

</head>
<body class="hold-transition skin-blue sidebar-mini" ng-app="shebao" ng-controller="loginController"
      ng-init="getUserName();getRoleName()">
<div class="wrapper">
    <!-- 页面头部 -->
    <header class="main-header">
        <!-- Logo -->
        <a href="index.jsp" class="logo">
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><b>社保</b>稽查平台</span>
        </a>
        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="glyphicon glyphicon-align-justify"></span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <!-- User Account: style can be found in dropdown.less -->
                    <li class="dropdown user user-menu">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            欢迎你: <span class="hidden-xs">大佬</span>
                        </a>
                        <ul class="dropdown-menu">
                            <li class="user-footer">
                                <div class="pull-right">
                                    <a href="/logout" class="btn btn-default btn-flat">注销</a>
                                </div>
                            </li>
                        </ul>
                    </li>

                </ul>
            </div>
        </nav>
    </header>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
            <!-- Sidebar user panel -->
            <div class="user-panel">
                <div class="pull-left image">
                    <img src="img/user2-160x160.jpg" class="img-circle" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p></p>
                    <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
                </div>
            </div>
            <ul class="sidebar-menu">
                <li class="header">菜单</li>
                <li id="admin-index">
                    <a href=""><i class="fa fa-dashboard"></i> <span>首页</span></a></li>
                <li class="treeview" ng-if="true">
                    <!-- ng-if="isInArray(rolenames,'KEZHANG')||isInArray(rolenames,'KESHICAOZUO')" -->
                    <a href="111">
                        <i class="fa fa-folder"></i>
                        <span>来案登记</span>
                        <span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="admin-login">
                            <a href="${pageContext.request.contextPath}/registraionOfCases/caseRegistrationPage?page=1&pageNum=5&status=2&typeStatus=1&approvalStatus=4" target="iframe">
                                <i class="fa fa-circle-o"></i> 案件登记&nbsp;&nbsp;(功能完成)
                            </a>
                        </li>
                        <li id="admin-login1">
                            <a href="${pageContext.request.contextPath}/registraionOfCases/caseRegistrationPage?page=1&pageNum=5&typeStatus=2&approvalStatus=0&status=1" target="iframe">
                                <i class="fa fa-circle-o"></i> 日常审计&nbsp;&nbsp;(功能完成)
                            </a>
                        </li>
                        <li id="admin-login2">
                            <a href="${pageContext.request.contextPath}/registraionOfCases/caseRegistrationPage?page=1&pageNum=5&typeStatus=3&approvalStatus=0&status=3" target="iframe">
                                <i class="fa fa-circle-o"></i> 专项审计&nbsp;&nbsp;(功能完成)
                            </a>
                        </li>
                        <li id="admin-login3">
                            <a href="${pageContext.request.contextPath}/registraionOfCases/caseRegistrationPage?page=1&pageNum=5&typeStatus=4&approvalStatus=0&status=4" target="iframe">
                                <i class="fa fa-circle-o"></i> 立案审批&nbsp;&nbsp;(功能完成)
                            </a>
                        </li>
                        <li id="admin-login4" ng-if="true"><!-- ng-if="isInArray(rolenames,'KEZHANG')" -->
                            <a href="${pageContext.request.contextPath}/ultimate/selectByPage?page=1&pageNum=5&typeStatus=5&approvalStatus=0&status=5" target="iframe">
                                <i class="fa fa-circle-o"></i> 科长审核&nbsp;&nbsp;(功能完成)
                            </a>
                        </li>
                    </ul>
                </li>
                <!-- 菜单 -->
                <li class="treeview" ng-if="true">
                    <!-- ng-if="isInArray(rolenames,'KEZHANG')||isInArray(rolenames,'KESHICAOZUO')" -->
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>新立案件管理</span>
                        <span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="admin-login5">
                            <a href="${pageContext.request.contextPath}/ultimate/selectByPage?page=1&pageNum=5&typeStatus=5&approvalStatus=1&status=6" target="iframe">
                                <i class="fa fa-circle-o"></i> 新立案件管理&nbsp;&nbsp;(功能完成)
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="treeview" ng-if="true"><!-- ng-if="isInArray(rolenames,'KEZHANG')" -->
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>已发送稽核通知案件管理</span>
                        <span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="admin-login6">
                            <a href="${pageContext.request.contextPath}/ultimate/selectByPage?page=1&pageNum=5&typeStatus=6&approvalStatus=1&status=7" target="iframe">
                                <i class="fa fa-circle-o"></i> 已发送稽核通知案件管理&nbsp;&nbsp;(功能完成)
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="treeview" ng-if="true">
                    <!-- ng-if="isInArray(rolenames,'KEZHANG')||isInArray(rolenames,'KESHICAOZUO')" -->
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>已核定缴费基数案件管理</span>
                        <span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="admin-login12">
                            <a href="${pageContext.request.contextPath}/ultimate/selectByPage?page=1&pageNum=5&typeStatus=7&approvalStatus=1&status=8" target="iframe">
                                <i class="fa fa-circle-o"></i> 已核定缴费基数案件管理&nbsp;&nbsp;(功能完成)
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="treeview" ng-if="true">
                    <!-- ng-if="isInArray(rolenames,'KEZHANG')||isInArray(rolenames,'KESHICAOZUO')" -->
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>已发送补缴通知案件管理</span>
                        <span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="admin-login7">
                            <a href="${pageContext.request.contextPath}/ultimate/selectByPage?page=1&pageNum=5&typeStatus=8&approvalStatus=1&status=9"
                               target="iframe">
                                <i class="fa fa-circle-o"></i> 已发送补缴通知案件管理&nbsp;&nbsp;(功能完成)
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="treeview" ng-if="true">
                    <!-- ng-if="isInArray(rolenames,'KEZHANG')||isInArray(rolenames,'KESHICAOZUO')" -->
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>待查银行案件管理</span>
                        <span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="admin-login8">
                            <a href="${pageContext.request.contextPath}/ultimate/selectByPage?page=1&pageNum=5&typeStatus=9&approvalStatus=1&status=10" target="iframe">
                                <i class="fa fa-circle-o"></i> 待查银行案件管理&nbsp;&nbsp;(功能完成)
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="treeview" ng-if="true">
                    <!-- ng-if="isInArray(rolenames,'KEZHANG')||isInArray(rolenames,'KESHICAOZUO')" -->
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>强制执行案件管理</span>
                        <span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="admin-login9">
                            <a href="${pageContext.request.contextPath}/ultimate/selectByPage?page=1&pageNum=5&typeStatus=10&approvalStatus=1&status=11" target="iframe">
                                <i class="fa fa-circle-o"></i> 强制执行案件管理&nbsp;&nbsp;(功能完成)
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="treeview" ng-if="true">
                    <!-- ng-if="isInArray(rolenames,'KEZHANG')||isInArray(rolenames,'KESHICAOZUO')||isInArray(rolenames,'ZHUREN')||isInArray(rolenames,'BANGONGSHICAOZUO')" -->
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>历史档案管理</span>
                        <span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="admin-login10">
                            <a href="${pageContext.request.contextPath}/ultimate/selectByPage?page=1&pageNum=5&approvalStatus=3&status=12" target="iframe">
                                <i class="fa fa-circle-o"></i> 查询统计已结案归档案件
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="treeview" ng-if="true"><!-- ng-if="isInArray(rolenames,'ADMIN')" -->
                    <a href="#">
                        <i class="fa fa-folder"></i>
                        <span>系统管理</span>
                        <span class="pull-right-container">
				       			<i class="fa fa-angle-left pull-right"></i>
				   		 	</span>
                    </a>
                    <ul class="treeview-menu">
                        <li id="admin-login11">
                            <a href="user-Administration.jsp" target="iframe">
                                <i class="fa fa-circle-o"></i> 用户管理
                            </a>
                        </li>
                        <li>
                            <a href="organ-Administration.jsp" target="iframe">
                                <i class="fa fa-circle-o"></i> 机构管理
                            </a>
                        </li>
                        <li>
                            <a href="authorization-Administration.jsp" target="iframe">
                                <i class="fa fa-circle-o"></i> 用户权限管理
                            </a>
                        </li>
                        <li>
                            <a href="database-Administration.jsp" target="iframe">
                                <i class="fa fa-circle-o"></i> 数据库管理
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <div class="content-wrapper">
        <iframe width="100%" id="iframe" name="iframe" onload="SetIFrameHeight()"
                frameborder="0" src="registrationOfCases.jsp"></iframe>
    </div>
    <!-- 内容区域 /-->

    <!-- 底部导航 -->
    <footer class="main-footer">
        <div class="pull-right hidden-xs">
            <b>Version</b> 1.0.8
        </div>
        <strong>Copyright &copy; 2019-2020 <a href="http://www.itcast.cn"></a>.</strong> All rights reserved.
    </footer>
    <!-- 底部导航 /-->

</div>


</body>

</html>