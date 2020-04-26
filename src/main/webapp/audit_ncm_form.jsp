<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>已发送稽核通知案件管理</title>
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
    <script type="text/javascript" src="js/service/auditformService.js"></script>
    <script type="text/javascript" src="js/controller/baseController.js"></script>
    <script type="text/javascript" src="js/controller/auditformController.js"></script>
</head>
<body class="hold-transition skin-red sidebar-mini" ng-app="shebao" ng-controller="auditformController"
      ng-init="searchEntity.registrationOfCases.approvalStatus=3">
<!-- .box-body -->
<toaster-container toaster-options="{'time-out': 1000,'position-class':'toast-center'}"></toaster-container>
<div class="box-header with-border">
    <h3 class="box-title">已发送稽核通知案件管理</h3>
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
                <th class="sorting">是否上传报送资料</th>
                <th class="sorting">警示</th>
                <th class="sorting">操作</th>
            </tr>
            </thead>
            <tbody>
            <tr ><!-- ng-repeat="pojo in list" -->
                <td>哗啦啦</td>
                <td>111111111</td>
                <td>都是大神</td>
                <td>2</td>
                <td>2019-10-12</td>
                <td>农户C</td>
                <td>士大夫嘀咕嘀咕</td>
                <td>打法</td>
                <td><span ng-if="true" style="color:red;">已经超过5个工作日，仍未报送材料</span>
                </td>
                <td class="text-center">
                    <button ng-if="true" type="button"
                            ng-click="findOne(pojo.id)" class="btn bg-olive btn-xs" data-toggle="modal"
                            data-target="#editModal">录入缴费基数
                    </button>
                    <button ng-if="pojo.state!=1" type="button" ng-click="findOne(pojo.id)" class="btn bg-olive btn-xs"
                            data-toggle="modal"
                            data-target="#editModal1">上传报送材料
                    </button>
                    <button ng-if="pojo.state==1" type="button" ng-click="guiDang(pojo.registrationOfCasesId)"
                            class="btn bg-olive btn-xs">结案归档
                    </button>
                </td>
				<td class="text-center">
				    <button type="button" ng-click="findOne(pojo.id)" class="btn bg-olive btn-xs" data-toggle="modal"
				            data-target="#editModal">编辑
				    </button>
				</td>
            </tr>
			<tr>
			    <td>哗啦啦</td>
			    <td>2222222</td>
			    <td>都是大神</td>
			    <td>2</td>
			    <td>2019-10-12</td>
			    <td>农户C</td>
			    <td>士大夫嘀咕嘀咕</td>
			    <td>打法</td>
			    <td><span ng-if="pojo.state!=1&&pojo.registrationOfCases.warningTime>5" style="color:red;">已经超过5个工作日，仍未报送材料</span>
			    </td>
			    <td class="text-center">
			        <button ng-if="(pojo.state==1||pojo.registrationOfCases.warningTime>5)" type="button"
			                ng-click="findOne(pojo.id)" class="btn bg-olive btn-xs" data-toggle="modal"
			                data-target="#editModal">录入缴费基数
			        </button>
			        <button ng-if="true" type="button" ng-click="findOne(pojo.id)" class="btn bg-olive btn-xs"
			                data-toggle="modal"
			                data-target="#editModal1">上传报送材料
			        </button>
			        <button ng-if="pojo.state==1" type="button" ng-click="guiDang(pojo.registrationOfCasesId)"
			                class="btn bg-olive btn-xs">结案归档
			        </button>
			    </td>
				<td class="text-center">
				    <button type="button" ng-click="findOne(pojo.id)" class="btn bg-olive btn-xs" data-toggle="modal"
				            data-target="#editModal">编辑
				    </button>
				</td>
			</tr>
			<tr>
			    <td>哗啦啦</td>
			    <td>333333</td>
			    <td>都是大神</td>
			    <td>2</td>
			    <td>2019-10-12</td>
			    <td>农户C</td>
			    <td>士大夫嘀咕嘀咕</td>
			    <td>打法</td>
			    <td><span ng-if="pojo.state!=1&&pojo.registrationOfCases.warningTime>5" style="color:red;">已经超过5个工作日，仍未报送材料</span>
			    </td>
			    <td class="text-center">
			        <button ng-if="(pojo.state==1||pojo.registrationOfCases.warningTime>5)" type="button"
			                ng-click="findOne(pojo.id)" class="btn bg-olive btn-xs" data-toggle="modal"
			                data-target="#editModal">录入缴费基数
			        </button>
			        <button ng-if="pojo.state!=1" type="button" ng-click="findOne(pojo.id)" class="btn bg-olive btn-xs"
			                data-toggle="modal"
			                data-target="#editModal1">上传报送材料
			        </button>
			        <button ng-if="true" type="button" ng-click="guiDang(pojo.registrationOfCasesId)"
			                class="btn bg-olive btn-xs">结案归档
			        </button>
			    </td>
				<td class="text-center">
				    <button type="button" ng-click="findOne(pojo.id)" class="btn bg-olive btn-xs" data-toggle="modal"
				            data-target="#editModal">编辑
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
                <h3 id="myModalLabel">已发送稽核通知案件信息</h3>
            </div>
            <div class="modal-body">
                <table class="table table-bordered table-striped">
                    <tr>
                        <td>
                            单位名称：
                        </td>
                        <td colspan="2"><input readonly="true" ng-model="entity.registrationOfCases.unitName"
                                               class="form-control"
                                               placeholder="单位名称"></td>
                        <td align="right">
                            投诉内容：
                        </td>
                        <td colspan="2"><input readonly="true" ng-model="entity.registrationOfCases.complaintContents"
                                               class="form-control"
                                               placeholder="投诉内容"></td>
                    </tr>
                    <tr>
                        <td>组织机构代码:</td>
                        <td><input readonly="true" ng-model="entity.registrationOfCases.organizationalCode"
                                   class="form-control"
                                   placeholder="组织机构代码"></td>
                        <td>投诉人姓名:</td>
                        <td><input readonly="true" ng-model="entity.registrationOfCases.nameOfTheComplainant"
                                   class="form-control"
                                   placeholder="投诉人姓名"></td>
                        <td>投诉人身份证号:</td>
                        <td><input readonly="true" ng-model="entity.registrationOfCases.idCard" class="form-control"
                                   placeholder="投诉人身份证号"></td>
                    </tr>
                    <tr>
                        <td>联系电话:</td>
                        <td><input readonly="true" ng-model="entity.registrationOfCases.phone" class="form-control"
                                   placeholder="联系电话"></td>
                        <td>接收人:</td>
                        <td><input readonly="true" ng-model="entity.registrationOfCases.nameOfRegistrant"
                                   class="form-control"
                                   placeholder="接收人"></td>
                        <td>户口性质:</td>
                        <td>
                            <select disabled="disabled" class="form-control"
                                    ng-model="entity.registrationOfCases.accountCharacter">
                                <option value="0">农户</option>
                                <option value="1">城镇户</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>性别:</td>
                        <td>
                            <select disabled="disabled" class="form-control"
                                    ng-model="entity.registrationOfCases.sex">
                                <option value="0">男</option>
                                <option value="1">女</option>
                            </select></td>
                        <td>缴费基数:</td>
                        <td><input ng-model="entity.baseOfPayment" class="form-control"
                                   placeholder="缴费基数"></td>
                        <td>审计人数:</td>
                        <td><input readonly="true" ng-model="entity.registrationOfCases.numberOfAuditors"
                                   class="form-control"
                                   placeholder="审计人数"></td>
                    </tr>
                    <tr>
                        <td>审计户数:</td>
                        <td><input readonly="true" ng-model="entity.registrationOfCases.auditHouseholds"
                                   class="form-control"
                                   placeholder="审计户数"></td>
                        <td>补缴数额</td>
                        <td><input readonly="true" ng-model="entity.registrationOfCases.amountPaid" class="form-control"
                                   placeholder="补缴数额"></td>
                        <td>立案时间</td>
                        <td><input readonly="true" ng-model="entity.registrationOfCases.filingTime" class="form-control"
                                   placeholder="立案时间"></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success" ng-click="save()">保存</button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>
<!-- 编辑窗口 -->
<div class="modal fade" id="editModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button id="bt" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel1">上传报送材料</h3>
            </div>
            <div class="modal-body">
                上传材料：<input type="file" name="file" id="file">
            </div>
            <div class="modal-footer">
                <button class="btn btn-success" ng-click="upload(entity.id)">上传</button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>