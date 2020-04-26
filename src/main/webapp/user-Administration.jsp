<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>用户管理</title>
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
    <script type="text/javascript" src="js/service/userService.js"></script>
    <script type="text/javascript" src="js/service/organService.js"></script>
    <script type="text/javascript" src="js/controller/baseController.js"></script>
    <script type="text/javascript" src="js/controller/userController.js"></script>

</head>
<body class="hold-transition skin-red sidebar-mini" ng-app="shebao" ng-controller="userController" ng-init="selectOrganlist()">
<!-- .box-body -->
<toaster-container toaster-options="{'time-out': 1000,'position-class':'toast-center'}"></toaster-container>
<div class="box-header with-border">
    <h3 class="box-title">用户管理</h3>
</div>
<div class="box-body">
    <div class="has-feedback">
        <div style="text-align: center;background: #ffff">
            <table align="center" ng-init="searchEntity.state=0">
                <tr>
                    <td style="text-align: right"><span style="white-space: nowrap;display: inline-block">姓名：</span>
                    </td>
                    <td><input class="form-control" ng-model="searchEntity.realName"></td>
                    <td style="text-align: right"><span style="white-space: nowrap;display: inline-block">部门：</span>
                    </td>
                    <td>
                        <select class="form-control" ng-model="searchEntity.department">
                            <option value="">全部</option>
                            <option ng-repeat="d in organlist"
                                    value="{{d.id}}">{{d.departmentName}}
                            </option>
                        </select>
                    </td>
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

        <!--工具栏-->
        <div class="pull-left">
            <div class="form-group form-inline">
                <div class="btn-group">
                    <button type="button" class="btn btn-default" title="添加" data-toggle="modal"
                            data-target="#editModal" ng-click="addClick()"><i class="fa fa-file-o"></i> 添加
                    </button>
                </div>
            </div>
        </div>
        <!--工具栏/-->
        <!--数据列表-->
        <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
            <thead>
            <tr>
                <th class="sorting">用户名</th>
                <th class="sorting">姓名</th>
                <th class="sorting">部门</th>
                <th class="sorting">操作</th>
            </tr>
            </thead>
            <tbody>
            <tr ng-repeat="pojo in list">
                <td>淋雪落虹</td>
                <td>葫芦娃</td>
                <td>葫芦山</td>
                <td class="text-center">
                    <button type="button" ng-click="findOne(pojo.id)" class="btn bg-olive btn-xs" data-toggle="modal"
                            data-target="#editModal">编辑
                    </button>
                    <button type="button" ng-click="deleteOne(pojo.id)" class="btn bg-olive btn-xs">删除
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
<!-- 编辑窗口 -->
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:80%;">
        <div class="modal-content">
            <div class="modal-header">
                <button id="bt1" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">用户信息编辑</h3>
            </div>
            <div class="modal-body">
                <table class="table table-bordered table-striped">
                    <tr>
                        <input type="hidden" ng-model="entity.id" class="form-control" >
                        <td>
                            用户名：
                        </td>
                        <td colspan="2"><input  ng-model="entity.username"
                                               class="form-control"
                                               placeholder="用户名"></td>
                        <td align="right">
                            密码：
                        </td>
                        <td colspan="2"><input  ng-model="entity.password"
                                               class="form-control"
                                               placeholder="密码"></td>
                    </tr>
                    <tr>
                        <td>
                            姓名：
                        </td>
                        <td colspan="2"><input  ng-model="entity.realName"
                                               class="form-control"
                                               placeholder="姓名"></td>
                        <td align="right">
                            部门：
                        </td>
                        <td colspan="2">
                            <select class="form-control" ng-model="entity.department">
                                <option value="">全部</option>
                                <option ng-repeat="d in organlist"
                                        value="{{d.id}}">{{d.departmentName}}
                                </option>
                            </select>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success" ng-click="verify()">保存</button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>