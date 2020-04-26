<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--立案审批-->
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="IE=edge">
    <title>立案审批</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="css/style.css">
   
    <!--引入分页插件资源-->
    <link rel="stylesheet" href="plugins/angularjs/pagination.css">
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="plugins/angularjs/toaster.min.css">
    <script type="text/javascript" src="plugins/angularjs/angular.min.js"></script>
    <script type="text/javascript" src="plugins/angularjs/angular-animate.min.js"></script>
    <script type="text/javascript" src="plugins/angularjs/toaster.min.js"></script>
    
    <script type="text/javascript" src="plugins/angularjs/pagination.js"></script>
    <script type="text/javascript" src="js/base_pagination.js"></script>
    <script type="text/javascript" src="js/service/approvalService.js"></script>
    <script type="text/javascript" src="js/controller/baseController.js"></script>
    <script type="text/javascript" src="js/controller/approvalController.js"></script>
</head>
<body class="hold-transition skin-red sidebar-mini" ng-app="shebao" ng-controller="approvalController">
<!-- .box-body -->
<toaster-container toaster-options="{'time-out': 1000,'position-class':'toast-top-center'}"></toaster-container>

<div class="box-header with-border">
    <h3 class="box-title">立案审批</h3>
</div>
<div class="box-body">
    <div class="has-feedback">
        <div style="text-align: center;background: #ffff">
            <table align="center">
                <tr>
                    <td style="text-align: right"><span style="white-space: nowrap;display: inline-block">单位名称：</span>
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
                <th class="sorting">立案月</th>
                <th class="sorting">登记时间</th>
                <th class="sorting">户口性质</th>
                <th class="sorting">姓名</th>
                <th class="sorting">联系电话</th>
                <th class="sorting">投诉内容</th>
                <th class="sorting">警示</th>
                <th class="sorting">审批通过</th>
                <th class="sorting">审批不通过</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>中科软有限公司</td>
                <td>Abj123456789</td>
                <td>韩立峰</td>
                <td>2019-07</td>
                <td>2019-01-01</td>
                <td>农村户口</td>
                <td>王宝强</td>
                <td>13856996369</td>
                <td>空调漏电</td>
                <td><span ng-if="pojo.warningTime>7" style="color:red;">已经超过7个工作日，仍未进行立案审批</span>
                <td>
                    <button type="button" ng-click="updateStatusYes(pojo.id)" class="btn bg-olive btn-xs"
                            data-toggle="modal">审批通过
                    </button>
                </td>
                <td>
                    <button type="button" ng-click="updateStatusNo(pojo.id)" class="btn bg-olive btn-xs" data-toggle="modal"
                            data-target="#editModal">审批不通过
                    </button>
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
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:80%;">
        <div class="modal-content">
            <div class="modal-header">
                <button id="bt1" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">终止立案</h3>
            </div>
            <div class="modal-body">
                <table class="table table-bordered table-striped">
                    <tr>
                        <td>案由:</td>
                        <td><input ng-model="entity.causeOfAction" class="form-control">
                        </td>
                    </tr>
                    <tr>
                        <td>终止执行原因:</td>
                        <td><textarea ng-model="entity.reasonsForTermination"></textarea></td>
                    </tr>
                    <tr>
                        <td>调查人意见:</td>
                        <td><textarea ng-model="entity.investigatorViews"></textarea></td>
                    </tr>
                    <tr>
                        <td>负责人意见:</td>
                        <td><textarea ng-model="entity.responsibleOpinions"></textarea></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success">保存</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>


