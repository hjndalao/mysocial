<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--案件登记-->
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="IE=edge">
    <title>立案登记</title>
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
        <script type="text/javascript" src="js/service/registrationOfCasesService.js"></script>
        <script type="text/javascript" src="js/controller/baseController.js"></script>
        <script type="text/javascript" src="js/controller/registrationOfCasesController01.js"></script>>
</head>
<body class="hold-transition skin-red sidebar-mini" ng-app="shebao" ng-controller="registrationOfCasesController01">
<!-- .box-body -->
<toaster-container toaster-options="{'time-out': 1000,'position-class':'toast-top-center'}"></toaster-container>

<div class="box-header with-border">
    <h3 class="box-title">案件登记</h3>
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
                <th class="sorting">立案月</th>
                <th class="sorting">登记时间</th>
                <th class="sorting">户口性质</th>
                <th class="sorting">姓名</th>
                <th class="sorting">联系电话</th>
                <th class="sorting">投诉内容</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td><a ng-click="findOne(pojo.id)" data-toggle="modal"
                       data-target="#editModal">中科软</a></td>
                <td>bj_a19837491723</td>
                <td>潘昭</td>
                <td>2019-09</td>
                <td>2019-09-09</td>
                <td>农村户口</td>
                <td>杜月笙</td>
                <td>13789899876</td>
                <td>上海滩不允许种西瓜</td>
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
                <h3 id="myModalLabel">历史案件信息编辑</h3>
            </div>
            <div class="modal-body">
                <table class="table table-bordered table-striped">
                    <tr>
                        <td>
                            单位名称：
                        </td>
                        <td colspan="2"><input readonly="true" ng-model="entity.unitName"
                                               class="form-control"
                                               placeholder="单位名称"></td>
                        <td align="right">
                            投诉内容：
                        </td>
                        <td colspan="2"><input readonly="true" ng-model="entity.complaintContents"
                                               class="form-control"
                                               placeholder="投诉内容"></td>
                    </tr>
                    <tr>
                        <td>组织机构代码:</td>
                        <td><input readonly="true" ng-model="entity.organizationalCode"
                                   class="form-control"
                                   placeholder="组织机构代码"></td>
                        <td>投诉人姓名:</td>
                        <td><input readonly="true" ng-model="entity.nameOfTheComplainant"
                                   class="form-control"
                                   placeholder="投诉人姓名"></td>
                        <td>投诉人身份证号:</td>
                        <td><input readonly="true" ng-model="entity.idCard" class="form-control"
                                   placeholder="投诉人身份证号"></td>
                    </tr>
                    <tr>
                        <td>联系电话:</td>
                        <td><input readonly="true" ng-model="entity.phone" class="form-control"
                                   placeholder="联系电话"></td>
                        <td>接收人:</td>
                        <td><input readonly="true" ng-model="entity.nameOfRegistrant"
                                   class="form-control"
                                   placeholder="接收人"></td>
                        <td>户口性质:</td>
                        <td>
                            <select disabled="disabled" class="form-control"
                                    ng-model="entity.accountCharacter">
                                <option value="0">农户</option>
                                <option value="1">城镇户</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>性别:</td>
                        <td>
                            <select disabled="disabled" class="form-control"
                                    ng-model="entity.sex">
                                <option value="0">男</option>
                                <option value="1">女</option>
                            </select></td>
                        <td>立案时间</td>
                        <td><input readonly="true" ng-model="entity.filingTime" class="form-control"
                        	placeholder="立案时间"></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>


