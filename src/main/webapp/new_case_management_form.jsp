<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>新立案件管理</title>
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
    <script type="text/javascript" src="js/service/newformService.js"></script>
    <script type="text/javascript" src="js/controller/baseController.js"></script>
    <script type="text/javascript" src="js/controller/newformController.js"></script>
    <c:set value="${pageContext.request.contextPath}" var="path"/>
    <script type="text/javascript">
        function selectById(id) {
            $.ajax({
                url: "${path}/ultimate/selectById",
                type: "post",
                data: "id=" + id,
                dataType: "json",
                success: function (data) {
                    $("#id").val(data.id);
                    $("#unitName").val(data.unitName);
                    $("#organizational_code").val(data.organizationalCode);
                    $("#name_of_the_complainant").val(data.nameOfTheComplainant);
                    $("#id_card").val(data.idCard);
                    $("#phone").val(data.phone);
                    $("#name_of_registrant").val(data.nameOfRegistrant);
                    $("#account_character").val(data.accountCharacter);
                    $("#maxTime").val(data.maxtime);
                    $("#sex").val(data.sex);
                    $("#name_of_the_filer").val(data.nameOfTheFiler);
                    $("#filing_month").val(data.filingMonth);
                    $("#complaint_contents").val(data.complaintContents);
                    $("#number_of_auditors").val(data.numberOfAuditors);
                    $("#audit_households").val(data.auditHouseholds);
                    $("#amount_paid").val(data.amountPaid);
                    $("#filing_time").val(data.filingTime);
                }
            })
        }
        function query() {
            $.ajax({
                url: "${pageContext.request.contextPath}/ultimate/selectByPage",
                data: "page=${map.page}&status=1&typeStatus=5&approvalStatus=1&status=6",
                type: "get",
                success: function () {
                    location.reload();
                }
            })
        }
        function updateBySave() {
            var id = $("#id").val();
            var name = $("#unitName").val();
            var organizational_code = $("#organizational_code").val();
            var name_of_the_complainant = $("#name_of_the_complainant").val();
            var id_card = $("#id_card").val();
            var phone = $("#phone").val();
            //修改操作者
            var name_of_registrant = $("#name_of_registrant").val();
            var account_character = $("#account_character").val();
            var age = $("#age").val();
            var maxTime = $("#maxTime").val();
            var name_of_the_filer = $("#name_of_the_filer").val();
            var filing_month = $("#filing_month").val();
            var complaint_contents = $("#complaint_contents").val();
            var numberOfAuditors = $("#number_of_auditors").val();
            var auditHouseholds = $("#audit_households").val();
            var amountPaid = $("#amount_paid").val();
            var filingTime = $("#filing_time").val();

            var updateData = {
                "id": id,
                "unitName": name,
                "organizationalCode": organizational_code,
                "nameOfTheComplainant": name_of_the_complainant,
                "idCard": id_card,
                "phone": phone,
                "nameOfRegistrant": name_of_registrant,
                "accountCharacter": account_character,
                "age": age,
                "maxtime": maxTime,
                "nameOfTheFiler": name_of_the_filer,
                "filingMonth": filing_month,
                "complaintContents": complaint_contents,
                "numberOfAuditors": numberOfAuditors,
                "auditHouseholds": auditHouseholds,
                "amountPaid": amountPaid,
                "filingTime": filingTime
            };
            console.log(updateData);
            $.ajax({
                url: "${path}/ultimate/update",
                data: updateData,
                type: "post",
                dataType:"text",
                success: function () {
                    query();
                }
            });
        }
        function select() {
            var name = $("#unitName1").val();
            var organizational_code = $("#organizationalCode1").val();
            var name_of_registrant = $("#nameOfRegistrant1").val();
            var registrationOfCases = {
                "unitName": name,
                "organizationalCode": organizational_code,
                "nameOfRegistrant": name_of_registrant,
                "status": 6,
                "typeStatus": 5,
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
    </script>
</head>
<body class="hold-transition skin-red sidebar-mini" ng-app="shebao" ng-controller="newformController">
<!-- .box-body -->
<toaster-container toaster-options="{'time-out': 1000,'position-class':'toast-center'}"></toaster-container>
<div class="box-header with-border">
    <h3 class="box-title">新立案件管理</h3>
</div>
<div class="box-body">
    <div class="has-feedback">
        <div style="text-align: center;background: #ffff">
            <table align="center" ng-init="searchEntity.state=0">
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
                <th class="sorting">登记人</th>
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
                <tr>
                    <td>${d.unitName}</td>
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
                    <td>${d.nameOfTheFiler}</td>
                    <td>${d.complaintContents}</td>
                    <td><span style="color:red;">已经超过5个工作日，通知书仍未送达</span>
                        <!-- ng-if="pojo.registrationOfCases.warningTime>5" -->
                    </td>
                    <td class="text-center"><%--ng-click="findOne(pojo.id)"--%>
                        <button type="button" onblur="selectById(${d.id})" class="btn bg-olive btn-xs"
                                data-toggle="modal"
                                data-target="#editModal">编辑
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
                <a href="${path}/ultimate/selectByPage?page=${map.page-1}&typeStatus=5&approvalStatus=1&status=6">上一页</a>
            </c:if>
            第 ${map.page} 页&nbsp;&nbsp;&nbsp;共 ${map.num} 页
            <c:if test="${map.page<map.num}">
                <a href="${path}/ultimate/selectByPage?page=${map.page+1}&typeStatus=5&approvalStatus=1&status=6">下一页</a>
            </c:if>
        </c:if>
        <c:if test="${map.num==null && map.page==null}">
            <c:if test="${map.pages>1}">
                <a href="${path}/ultimate/selectByLike?page=${map.pages-1}<c:if test="${unitName!=null}">&unitName=${unitName}</c:if><c:if test="${organizationalCode!=null}">&organizationalCode=${organizationalCode}</c:if><c:if test="${nameOfRegistrant!=null}">&nameOfRegistrant=${nameOfRegistrant}</c:if>&typeStatus=5&approvalStatus=1&status=6">上一页</a>
            </c:if>
            第 ${map.pages} 页&nbsp;&nbsp;&nbsp;共 ${map.nums} 页
            <c:if test="${map.pages<map.nums}">
                <a href="${path}/ultimate/selectByLike?page=${map.pages+1}<c:if test="${unitName!=null}">&unitName=${unitName}</c:if><c:if test="${organizationalCode!=null}">&organizationalCode=${organizationalCode}</c:if><c:if test="${nameOfRegistrant!=null}">&nameOfRegistrant=${nameOfRegistrant}</c:if>&typeStatus=5&approvalStatus=1&status=6">下一页</a>
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
                            单位名称:
                        </td>
                        <input type="hidden" id="id"/>
                        <td colspan="2"><input ng-model="entity.unitName" id="unitName"
                                               class="form-control"
                                               placeholder="单位名称"></td>
                        <td align="right">
                            投诉内容：
                        </td>
                        <td colspan="2"><input ng-model="entity.complaintContents" id="complaint_contents"
                                               class="form-control"
                                               placeholder="投诉内容"></td>
                    </tr>
                    <tr>
                        <td>组织机构代码:</td>
                        <td><input ng-model="entity.organizationalCode" id="organizational_code"
                                   class="form-control"
                                   placeholder="组织机构代码"></td>
                        <td>投诉人姓名:</td>
                        <td><input ng-model="entity.nameOfTheComplainant" id="name_of_the_complainant"
                                   class="form-control"
                                   placeholder="投诉人姓名"></td>
                        <td>投诉人身份证号:</td>
                        <td><input ng-model="entity.idCard" class="form-control" id="id_card"
                                   placeholder="投诉人身份证号"></td>
                    </tr>
                    <tr>
                        <td>联系电话:</td>
                        <td><input ng-model="entity.phone" class="form-control" id="phone"
                                   placeholder="联系电话"></td>
                        <td>接收人:</td>
                        <td><input ng-model="entity.nameOfRegistrant" id="name_of_registrant"
                                   class="form-control"
                                   placeholder="接收人"></td>
                        <td>户口性质:</td>
                        <td>
                            <select class="form-control" id="account_character"
                                    ng-model="entity.accountCharacter">
                                <option value="">请选择</option>
                                <option value="0">农户</option>
                                <option value="1">城镇户</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>性别:</td>
                        <td>
                            <select class="form-control" id="sex"
                                    ng-model="entity.sex">
                                <option value="">请选择</option>
                                <option value="0">男</option>
                                <option value="1">女</option>
                            </select></td>
                        <td>送达时间:</td>
                        <td><input ng-model="entity.serviceTime" class="form-control" id="maxTime"
                                   placeholder="送达时间"></td>
                        <td>审计人数:</td>
                        <td><input ng-model="entity.numberOfAuditors" id="number_of_auditors"
                                   class="form-control"
                                   placeholder="审计人数"></td>
                    </tr>
                    <tr>
                        <td>审计户数:</td>
                        <td><input ng-model="entity.auditHouseholds" id="audit_households"
                                   class="form-control"
                                   placeholder="审计户数"></td>
                        <td>补缴数额</td>
                        <td><input ng-model="entity.amountPaid" class="form-control" id="amount_paid"
                                   placeholder="补缴数额"></td>
                        <td>立案时间</td>
                        <td><input ng-model="entity.filingTime" class="form-control" id="filing_time"
                                   placeholder="立案时间"></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer"><%--ng-click="save()"--%>
                <button class="btn btn-success" onclick="updateBySave()">保存</button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>