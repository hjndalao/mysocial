<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--案件登记-->
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="IE=edge">
    <title>科长审批</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="plugins/angularjs/toaster.min.css">
    <!--引入分页插件资源-->
    <link rel="stylesheet" href="plugins/angularjs/pagination.css">
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="plugins/angularjs/angular.min.js"></script>
	<script type="text/javascript" src="plugins/angularjs/angular-animate.min.js"></script>
	<script type="text/javascript" src="plugins/angularjs/toaster.min.js"></script>
	<script type="text/javascript" src="plugins/angularjs/pagination.js"></script>
	<script type="text/javascript" src="js/base_pagination.js"></script>
	<script type="text/javascript" src="js/service/registrationOfCasesService.js"></script>
	<script type="text/javascript" src="js/controller/baseController.js"></script>
	<script type="text/javascript" src="js/controller/registrationOfCasesController02.js"></script>
</head>
<body class="hold-transition skin-red sidebar-mini" ng-app="shebao" ng-controller="registrationOfCasesController02">
<!-- .box-body -->
<toaster-container toaster-options="{'time-out': 1000,'position-class':'toast-top-center'}"></toaster-container>

<div class="box-header with-border">
    <h3 class="box-title">科长审批</h3>
</div>
<div class="box-body">
    <div class="has-feedback">
        <div style="text-align: center;background: #ffff">
            <table align="center">
                <tr>
                    <td style="text-align: right"><span style="white-space: nowrap;display: inline-block">公司名称：</span>
                    </td>
                    <td><input class="form-control" ng-model="searchEntity.unitName"></td>
                    <td style="text-align: right"><span style="white-space: nowrap;display: inline-block">组织机构代码：</span>
                    </td>
                    <td><input class="form-control" ng-model="searchEntity.organizationalCode"></td>
                    <td style="text-align: right"><span style="white-space: nowrap;display: inline-block">接收人：</span>
                    </td>
                    <td><input class="form-control" ng-model="searchEntity.nameOfRegistrant"></td>
                </tr>
            </table>
        </div>
        <div style="text-align: center;padding-top: 10px">
            <button class="btn btn-default" ng-click="reloadList()">查询</button>
        </div>
    </div>
</div>
<div class="box-body">
    <!-- 数据表格 -->
    <div class="table-box">
        <!-- 数据表格 -->
        <div class="table-box">
            <!--工具栏-->
            <div class="pull-left">
                <div class="form-group form-inline">
                    <div class="btn-group">
                    </div>
                </div>
            </div>
        </div>
        <!--工具栏/-->
        <!--数据列表-->
        <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
            <thead>
            <tr>
                <th class="sorting_asc">单位名称</th>
                <th class="sorting_asc">组织机构代码</th>
                <th class="sorting">接收人</th>
                <th class="sorting">登记时间</th>
                <th class="sorting">户口性质</th>
                <th class="sorting">姓名</th>
                <th class="sorting">联系电话</th>
                <th class="sorting">投诉内容</th>
                <th class="sorting">审核通过</th>
                <th class="sorting">审核不通过</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>中科软有限公司</td>
                <td>Abj123456789</td>
                <td>韩立峰</td>
                <td>2019-01-01</td>
                <td>农村户口</td>
                <td>王宝强</td>
                <td>13856996369</td>
                <td>空调漏电</td>
                <td>
                    <button type="button" ng-click="insert(pojo.id)" class="btn bg-olive btn-xs" data-toggle="modal">审核通过</button>
                </td>
                <td>
                    <button type="button" ng-click="deleteOne(pojo.id)" class="btn bg-olive btn-xs" data-toggle="modal">审核不通过</button>
                </td>
            </tr>
            </tbody>
        </table>
        <!--数据列表/-->
        <!--分页工具条展示-->
        <tm-pagination conf="paginationConf"></tm-pagination>
    </div>
    <!-- 数据表格 /-->
</div>
</body>
</html>


