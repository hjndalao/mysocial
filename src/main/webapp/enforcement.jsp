<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>强制执行案件管理</title>
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
    <script type="text/javascript" src="js/service/enforcementService.js"></script>
    <script type="text/javascript" src="js/controller/baseController.js"></script>
    <script type="text/javascript" src="js/controller/enforcementController.js"></script>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <script type="text/javascript">

        function select() {
            var name = $("#unitName1").val();
            var organizational_code = $("#organizationalCode1").val();
            var name_of_registrant = $("#nameOfRegistrant1").val();
            var registrationOfCases = {
                "unitName": name,
                "organizationalCode": organizational_code,
                "nameOfRegistrant": name_of_registrant,
                "status": 11,
                "typeStatus": 10,
                "approvalStatus": 1
            };
            if (name === "" && organizational_code === "" && name_of_registrant === "") {
                alert("请输入查询信息");
            } else {
                $.ajax({
                    url: "${path}/ultimate/selectByLike",
                    data: registrationOfCases,
                    type: "post",
                    success: function () {
                        location.reload();
                    }
                });
            }
        }
        function selectById(id) {
            $.ajax({
                url: "${path}/ultimate/selectById",
                type: "post",
                data: "id=" + id,
                dataType: "json",
                success: function (data) {
                    $("#id").val(data.id);
                    $("#unitName").val(data.unitName);
                    $("#organizationalCode").val(data.organizationalCode);
                    $("#nameOfTheComplainant").val(data.nameOfTheComplainant);
                    $("#idCard").val(data.idCard);
                    $("#phone").val(data.phone);
                    $("#nameOfRegistrant").val(data.nameOfRegistrant);
                    $("#accountCharacter").val(data.accountCharacter);
                    $("#sex").val(data.sex);
                    $("#nameOfTheFiler").val(data.nameOfTheFiler);
                    $("#filingMonth").val(data.filingMonth);
                    $("#complaintContents").val(data.complaintContents);
                    $("#numberOfAuditors").val(data.numberOfAuditors);
                    $("#auditHouseholds").val(data.auditHouseholds);
                    $("#amountPaid").val(data.amountPaid);
                    $("#filingTime").val(data.filingTime);
                }
            })
        }

        function query() {
            $.ajax({
                url: "${pageContext.request.contextPath}/ultimate/selectByPage",
                data: "page=${map.page}&typeStatus=10&approvalStatus=1&status=11",
                type: "get",
                success: function () {
                    location.reload();
                }
            })
        }

        function guiDang(id) {
            if (confirm("确定操作吗?")) {
                $.ajax({
                    url: "${path}/ultimate/update",
                    data: "id=" + id + "&approvalStatus=" + 3,
                    type: "post",
                    dataType: "text",
                    success: function () {
                        query();
                    }
                })
            }
        }
    </script>
</head>
<body class="hold-transition skin-red sidebar-mini" ng-app="shebao" ng-controller="enforcementController">
<!-- .box-body -->
<toaster-container toaster-options="{'time-out': 1000,'position-class':'toast-center'}"></toaster-container>
<div class="box-header with-border">
    <h3 class="box-title">强制执行案件管理</h3>
</div>
<div class="box-body">
    <div class="has-feedback">
        <div style="text-align: center;background: #ffff">
            <table align="center" ng-init="searchEntity.registrationOfCases.approvalStatus=3;searchEntity.haveMoney=0">
                <tr>
                    <td style="text-align: right"><span style="white-space: nowrap;display: inline-block">公司名称：</span>
                    </td>
                    <td><input class="form-control" ng-model="searchEntity.unitName" name="unitName" id="unitName1">
                    </td>
                    <td style="text-align: right"><span style="white-space: nowrap;display: inline-block">组织机构代码：</span>
                    </td>
                    <td><input class="form-control" ng-model="searchEntity.organizationalCode"
                               name="organizationalCode" id="organizationalCode1"></td>
                    <td style="text-align: right"><span style="white-space: nowrap;display: inline-block">接收人：</span>
                    </td>
                    <td><input class="form-control" ng-model="searchEntity.nameOfRegistrant" id="nameOfRegistrant1"
                               name="nameOfRegistrant">
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center;padding-top: 10px"><%--ng-click="reloadList()"--%>
            <button class="btn btn-default" onclick="select()">查询</button>
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
                <th class="sorting">警示</th>
                <th class="sorting">操作</th>
            </tr>
            </thead>
            <c:forEach items="${data}" var="d">
                <tbody>
                <tr><%--ng-click="findOne(pojo.id)"--%>
                    <td><a href="" onclick="selectById(${d.id})" data-toggle="modal"
                           data-target="#editModal">${d.unitName}</a></td>
                    <td>${d.organizationalCode}</td>
                    <td>${d.nameOfRegistrant}</td>
                    <td>${d.filingMonth}</td>
                    <td>${d.filingTime}</td>
                    <td>
                        <c:if test="${d.accountCharacter==0}">
                            农业户口
                        </c:if>
                        <c:if test="${d.accountCharacter==1}">
                            非农业户口
                        </c:if>
                    </td>
                    <td>${d.nameOfTheComplainant}</td>
                    <td>${d.complaintContents}</td>
                    <td><%--ng-if="pojo.registrationOfCases.warningTime>=170&&pojo.registrationOfCases.warningTime<=260"--%>
                        <c:if test="${d.warningTime<260}">
                            <span style="color: #00a157">正常</span>
                        </c:if>
                        <c:if test="${d.warningTime>=170&&d.warningTime<=260}">
                            <span style="color: red">请做强制执行！！！</span>
                        </c:if>
                        <c:if test="${d.warningTime>260}"><%--ng-if="pojo.registrationOfCases.warningTime>260"--%>
                            <span style="color:red;">报警提示！！！请处理！！！</span>
                        </c:if>
                    </td>
                        <%--ng-click="guiDang(pojo.registrationOfCasesId)"--%>
                    <td class="text-center">
                        <button type="button"
                                class="btn bg-olive btn-xs" onclick="guiDang(${d.id})">结案归档
                        </button>
                    </td>
                </tr>
                </tbody>
            </c:forEach>
        </table>
        <!--数据列表/-->
        <!--分页工具条展示-->
        <%--<tm-pagination conf="paginationConf"></tm-pagination>--%>
        <c:if test="${map.nums==null}">
            <c:if test="${map.page>1}">
                <a href="${path}/ultimate/selectByPage?page=${map.page-1}&typeStatus=10&approvalStatus=1&status=11">上一页</a>
            </c:if>
            第 ${map.page} 页&nbsp;&nbsp;&nbsp;共 ${map.num} 页
            <c:if test="${map.page<map.num}">
                <a href="${path}/ultimate/selectByPage?page=${map.page+1}&typeStatus=10&approvalStatus=1&status=11">下一页</a>
            </c:if>
        </c:if>
        <c:if test="${map.num==null && map.page==null}">
            <c:if test="${map.pages>1}">
                <a href="${path}/ultimate/selectByLike?page=${map.pages-1}<c:if test="${unitName!=null}">&unitName=${unitName}</c:if><c:if test="${organizationalCode!=null}">&organizationalCode=${organizationalCode}</c:if><c:if test="${nameOfRegistrant!=null}">&nameOfRegistrant=${nameOfRegistrant}</c:if>&typeStatus=10&approvalStatus=1&status=11">上一页</a>
            </c:if>
            第 ${map.pages} 页&nbsp;&nbsp;&nbsp;共 ${map.nums} 页
            <c:if test="${map.pages<map.nums}">
                <a href="${path}/ultimate/selectByLike?page=${map.pages+1}<c:if test="${unitName!=null}">&unitName=${unitName}</c:if><c:if test="${organizationalCode!=null}">&organizationalCode=${organizationalCode}</c:if><c:if test="${nameOfRegistrant!=null}">&nameOfRegistrant=${nameOfRegistrant}</c:if>&typeStatus=10&approvalStatus=1&status=11">下一页</a>
            </c:if>
        </c:if>
        <c:if test="${map.counts==null}">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共 ${map.count} 条数据
        </c:if>
        <c:if test="${map.count==null}">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;共 ${map.counts} 条数据
        </c:if>
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
                <h3 id="myModalLabel">新立案件信息编辑</h3>
            </div>
            <div class="modal-body">
                <table class="table table-bordered table-striped">
                    <tr>
                        <td>
                            单位名称：
                        </td>
                        <input type="hidden" id="id"/>
                        <td colspan="2"><input readonly="true" ng-model="entity.registrationOfCases.unitName"
                                               id="unitName"
                                               class="form-control"
                                               placeholder="单位名称"></td>
                        <td align="right">
                            投诉内容：
                        </td>
                        <td colspan="2"><input readonly="true" ng-model="entity.registrationOfCases.complaintContents"
                                               class="form-control" id="complaintContents"
                                               placeholder="投诉内容"></td>
                    </tr>
                    <tr>
                        <td>组织机构代码:</td>
                        <td><input readonly="true" ng-model="entity.registrationOfCases.organizationalCode"
                                   class="form-control" id="organizationalCode"
                                   placeholder="组织机构代码"></td>
                        <td>投诉人姓名:</td>
                        <td><input readonly="true" ng-model="entity.registrationOfCases.nameOfTheComplainant"
                                   class="form-control" id="nameOfTheComplainant"
                                   placeholder="投诉人姓名"></td>
                        <td>投诉人身份证号:</td>
                        <td><input readonly="true" ng-model="entity.registrationOfCases.idCard" class="form-control"
                                   id="idCard"
                                   placeholder="投诉人身份证号"></td>
                    </tr>
                    <tr>
                        <td>联系电话:</td>
                        <td><input readonly="true" ng-model="entity.registrationOfCases.phone" class="form-control"
                                   id="phone"
                                   placeholder="联系电话"></td>
                        <td>接收人:</td>
                        <td><input readonly="true" ng-model="entity.registrationOfCases.nameOfRegistrant"
                                   id="nameOfRegistrant"
                                   class="form-control"
                                   placeholder="接收人"></td>
                        <td>户口性质:</td>
                        <td>
                            <select disabled="disabled" class="form-control" id="accountCharacter"
                                    ng-model="entity.registrationOfCases.accountCharacter">
                                <option value="0">农户</option>
                                <option value="1">城镇户</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>性别:</td>
                        <td>
                            <select disabled="disabled" class="form-control" id="sex"
                                    ng-model="entity.registrationOfCases.sex">
                                <option value="0">男</option>
                                <option value="1">女</option>
                            </select></td>
                        <td>审计人数:</td>
                        <td><input readonly="true" ng-model="entity.registrationOfCases.numberOfAuditors"
                                   class="form-control" id="numberOfAuditors"
                                   placeholder="审计人数"></td>
                    </tr>
                    <tr>
                        <td>审计户数:</td>
                        <td><input readonly="true" ng-model="entity.registrationOfCases.auditHouseholds"
                                   id="auditHouseholds"
                                   class="form-control"
                                   placeholder="审计户数"></td>
                        <td>补缴数额</td>
                        <td><input readonly="true" ng-model="entity.registrationOfCases.amountPaid" class="form-control"
                                   id="amountPaid"
                                   placeholder="补缴数额"></td>
                        <td>立案时间</td>
                        <td><input readonly="true" ng-model="entity.registrationOfCases.filingTime" class="form-control"
                                   id="filingTime"
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