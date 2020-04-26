<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>已发送补缴通知案件管理</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="plugins/angularjs/toaster.min.css">
    <script type="text/javascript" src="plugins/angularjs/angular.min.js"></script>
    <script type="text/javascript" src="plugins/angularjs/angular-animate.min.js"></script>
    <script type="text/javascript" src="plugins/angularjs/toaster.min.js"></script>

    <!--引入分页插件资源-->
    <link rel="stylesheet" href="plugins/angularjs/pagination.css">
    <script type="text/javascript" src="plugins/angularjs/pagination.js"></script>

    <script type="text/javascript" src="js/base_pagination.js"></script>
    <script type="text/javascript" src="js/service/notificationService.js"></script>
    <script type="text/javascript" src="js/controller/baseController.js"></script>
    <script type="text/javascript" src="js/controller/notificationController.js"></script>
</head>
<body class="hold-transition skin-red sidebar-mini" ng-app="shebao" ng-controller="notificationController"
>
<!-- .box-body -->
<toaster-container toaster-options="{'time-out': 1000,'position-class':'toast-center'}"></toaster-container>
<div class="box-header with-border">
    <h3 class="box-title">已发送补缴通知案件管理</h3>
</div>
<div class="box-body">
    <div class="has-feedback">
        <div style="text-align: center;background: #ffff">
            <table align="center" ng-init="searchEntity.registrationOfCases.approvalStatus=3;searchEntity.state=0">
                <tr>
                    <td style="text-align: right"><span style="white-space: nowrap;display: inline-block">公司名称：</span>
                    </td>
                    <td><input class="form-control" ng-model="searchEntity.registrationOfCases.unitName"></td>
                    <td style="text-align: right"><span style="white-space: nowrap;display: inline-block">组织机构代码：</span>
                    </td>
                    <td><input class="form-control" ng-model="searchEntity.registrationOfCases.organizationalCode"></td>
                    <td style="text-align: right"><span style="white-space: nowrap;display: inline-block">接收人：</span>
                    </td>
                    <td><input class="form-control" ng-model="searchEntity.registrationOfCases.nameOfRegistrant"></td>
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
        <!--数据列表-->
        <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
            <thead>
            <tr>
                <th class="sorting">单位名称</th>
                <th class="sorting">组织机构代码</th>
                <th class="sorting">接收人</th>
                <th class="sorting">立案月</th>
                <th class="sorting">立案时间</th>
                <th class="sorting">户口性质</th>
                <th class="sorting">姓名</th>
                <th class="sorting">投诉内容</th>
                <th class="sorting">缴费基数</th>
                <th class="sorting">警示</th>
                <th class="sorting">操作</th>
            </tr>
            </thead>
            <tbody>
            <tr ><!-- ng-repeat="pojo in list" -->
                <td>dsda</td>
                <td>34324234</td>
                <td>fdsaf</td>
                <td>1</td>
                <td>e</td>
                <td>sad</td>
                <td>vds</td>
                <td>sdad</td>
                <td>ea</td>
                <td><span style="color: red" ng-if="true">已超过5个工作日，仍未补缴！</span>
                </td>
                <td class="text-center">
                    <button ng-if="pojo.registrationOfCases.warningTime<5" type="button"
                            ng-click="guiDang(pojo.id)" class="btn bg-olive btn-xs">
                        结案归档
                    </button>
                    <button ng-if="true" type="button"
                            ng-click="update(pojo.id,2)" class="btn bg-olive btn-xs">提请处罚
                    </button>
                    <button ng-if="true" type="button"
                            ng-click="update(pojo.id,3)" class="btn bg-olive btn-xs">银行待查
                    </button>
                </td>
            </tr>
			<tr ><!-- ng-repeat="pojo in list" -->
			    <td>dsda</td>
			    <td>34324234</td>
			    <td>fdsaf</td>
			    <td>1</td>
			    <td>e</td>
			    <td>sad</td>
			    <td>vds</td>
			    <td>sdad</td>
			    <td>ea</td>
			    <td><span style="color: red" ng-if="pojo.registrationOfCases.warningTime>5">已超过5个工作日，仍未补缴！</span>
			    </td>
			    <td class="text-center">
			        <button ng-if="true" type="button"
			                ng-click="guiDang(pojo.id)" class="btn bg-olive btn-xs">
			            结案归档
			        </button>
			        <button ng-if="pojo.registrationOfCases.warningTime>5" type="button"
			                ng-click="update(pojo.id,2)" class="btn bg-olive btn-xs">提请处罚
			        </button>
			        <button ng-if="pojo.registrationOfCases.warningTime>5" type="button"
			                ng-click="update(pojo.id,3)" class="btn bg-olive btn-xs">银行待查
			        </button>
			    </td>
			</tr>
			<tr ><!-- ng-repeat="pojo in list" -->
			    <td>dsda</td>
			    <td>34324234</td>
			    <td>fdsaf</td>
			    <td>1</td>
			    <td>e</td>
			    <td>sad</td>
			    <td>vds</td>
			    <td>sdad</td>
			    <td>ea</td>
			    <td><span style="color: red" ng-if="pojo.registrationOfCases.warningTime>5">已超过5个工作日，仍未补缴！</span>
			    </td>
			    <td class="text-center">
			        <button ng-if="pojo.registrationOfCases.warningTime<5" type="button"
			                ng-click="guiDang(pojo.id)" class="btn bg-olive btn-xs">
			            结案归档
			        </button>
			        <button ng-if="pojo.registrationOfCases.warningTime>5" type="button"
			                ng-click="update(pojo.id,2)" class="btn bg-olive btn-xs">提请处罚
			        </button>
			        <button ng-if="pojo.registrationOfCases.warningTime>5" type="button"
			                ng-click="update(pojo.id,3)" class="btn bg-olive btn-xs">银行待查
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
<!-- /.box-body -->
</body>
</html>