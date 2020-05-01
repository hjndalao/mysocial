<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--案件登记-->
<html>
<head>
    <!-- 页面meta -->
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="IE=edge">
    <title>日常审计</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="plugins/angularjs/angular.min.js"></script>
    <script type="text/javascript" src="plugins/angularjs/angular-animate.min.js"></script>
    <script type="text/javascript" src="plugins/angularjs/toaster.min.js"></script>
    <script type="text/javascript" src="plugins/angularjs/pagination.js"></script>
    <script type="text/javascript" src="js/base_pagination.js"></script>
    <script type="text/javascript" src="js/service/specialauditService.js"></script>
    <script type="text/javascript" src="js/controller/baseController.js"></script>
    <script type="text/javascript" src="js/controller/specialauditController.js"></script>
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
                "status": 1,
                "typeStatus": 2,
                "approvalStatus": 0
            };
            if (name === "" && organizational_code === "" && name_of_registrant === "") {
                alert("请输入查询信息");
            } else {
                $.ajax({
                    url: "${path}/registraionOfCases/caseRegistrationLike",
                    data: registrationOfCases,
                    type: "post",
                    success: function () {
                        console.log("运行完成");
                        location.reload();
                    }
                });
            }
        }

        function selectById(id) {
            $.ajax({
                url: "${path}/registraionOfCases/selectById",
                data: "id=" + id,
                type: "post",
                success: function (data) {
                    var data = JSON.parse(data);
                    $("#id").val(data.id);
                    $("#unitName").val(data.unitName);
                    $("#organizational_code").val(data.organizationalCode);
                    $("#name_of_the_complainant").val(data.nameOfTheComplainant);
                    $("#id_card").val(data.idCard);
                    $("#phone").val(data.phone);
                    $("#name_of_registrant").val(data.nameOfRegistrant);
                    $("#account_character").val(data.accountCharacter);
                    $("#age").val(data.age);
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
                url: "${pageContext.request.contextPath}/registraionOfCases/caseRegistrationPage",
                data: "page=${map.page}&status=1&typeStatus=2&approvalStatus=0",
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
            var sex = $("#sex").val();
            var name_of_the_filer = $("#name_of_the_filer").val();
            var filing_month = $("#filing_month").val();
            var complaint_contents = $("#complaint_contents").val();
            var numberOfAuditors = $("#number_of_auditors").val();
            var auditHouseholds = $("#audit_households").val();
            var amountPaid = $("#amount_paid").val();
            var filingTime = $("#filing_time").val();

            var registrationOfCases = {
                "id": id,
                "unitName": name,
                "organizationalCode": organizational_code,
                "nameOfTheComplainant": name_of_the_complainant,
                "idCard": id_card,
                "phone": phone,
                "nameOfRegistrant": name_of_registrant,
                "accountCharacter": account_character,
                "age": age,
                "sex": sex,
                "nameOfTheFiler": name_of_the_filer,
                "filingMonth": filing_month,
                "complaintContents": complaint_contents,
                "numberOfAuditors": numberOfAuditors,
                "auditHouseholds": auditHouseholds,
                "amountPaid": amountPaid,
                "filingTime": filingTime
            };

            $.ajax({
                url: "${path}/registraionOfCases/update",
                data: registrationOfCases,
                type: "post",
                success: function () {
                    query();
                }
            });
        }

        function del(id, nameOfRegistrant, unitName, phone) {
            delData = {
                "id": id,
                "nameOfRegistrant": nameOfRegistrant,
                "unitName": unitName,
                "phone": phone
            };
            if (confirm("确定删除吗")) {
                $.ajax({
                    url: " ${pageContext.request.contextPath}/registraionOfCases/delete ",
                    data: delData,
                    type: "post",
                    success: function () {
                        query();
                    }
                });
                return true;
            }
        }

        function save() {
            var name = $("#unitName2").val();
            var organizational_code = $("#organizational_code2").val();
            var name_of_the_complainant = $("#name_of_the_complainant2").val();
            var id_card = $("#id_card2").val();
            var phone = $("#phone2").val();
            var name_of_registrant = $("#name_of_registrant2").val();
            var account_character = $("#account_character2").val();
            var age = $("#age2").val();
            var sex = $("#sex2").val();
            var name_of_the_filer = $("#name_of_the_filer2").val();
            var filing_month = $("#filing_month2").val();
            var complaint_contents = $("#complaint_contents2").val();
            var numberOfAuditors = $("#number_of_auditors2").val();
            var auditHouseholds = $("#audit_households2").val();
            var amountPaid = $("#amount_paid2").val();
            var filingTime = $("#filing_time2").val();

            if (name == null || name === "") {
                alert("单位名称不能为空");
                return;
            }
            if (organizational_code == null || organizational_code === "") {
                alert("组织机构代码不能为空");
                return;
            }
            if (!/^0\d{7}$/.test(organizational_code)) {
                alert("组织机构代码格式有误，请重填");
                return false;
            }
            if (name_of_the_complainant == null || name_of_the_complainant === "") {
                alert("投诉人姓名不能为空");
                return;
            }
            if (id_card == null || id_card === "") {
                alert("投诉人身份证号不能为空");
                return;
            }
            if (!(/^(\d{18}|\d{17}x)$/.test(id_card))) {
                alert("投诉人身份证号格式不正确,请重新填写");
                return;
            }
            if (phone == null || phone === "") {
                alert("联系电话不能为空");
                return;
            }
            if (!(/^1(3|5|6|8)\d{9}$/.test(phone))) {
                alert("手机号码格式有误，请重填");
                return;
            }
            if (name_of_registrant == null || name_of_registrant === "") {
                alert("登记人不能为空");
                return;
            }
            if (account_character == null || account_character === "") {
                alert("户口性质不能为空");
                return;
            }
            if (age == null || age === "") {
                alert("年龄不能为空");
                return;
            }
            if (sex == null || sex === "") {
                alert("性别不能为空");
                return;
            }
            if (numberOfAuditors == null || numberOfAuditors === "") {
                alert("审计人数不能为空");
                return;
            }
            if (auditHouseholds == null || auditHouseholds === "") {
                alert("审计户数不能为空");
                return;
            }
            if (amountPaid == null || amountPaid === "") {
                alert("补缴数额不能为空");
                return;
            }
            if (filingTime == null || filingTime === "") {
                alert("立案时间不能为空");
                return;
            }
            if (complaint_contents == null || complaint_contents === "") {
                alert("投诉内容不能为空");
                return;
            }
            $("#sp1").text("");
            var registrationOfCases = {
                "unitName": name,
                "organizationalCode": organizational_code,
                "nameOfTheComplainant": name_of_the_complainant,
                "idCard": id_card,
                "phone": phone,
                "nameOfRegistrant": name_of_registrant,
                "accountCharacter": account_character,
                "age": age,
                "sex": sex,
                "nameOfTheFiler": name_of_the_filer,
                "filingMonth": filing_month,
                "complaintContents": complaint_contents,
                "numberOfAuditors": numberOfAuditors,
                "auditHouseholds": auditHouseholds,
                "amountPaid": amountPaid,
                "filingTime": filingTime,
                "typeStatus": 2,
                "approvalStatus": 0
            };
            $.ajax({
                url: "${path}/registraionOfCases/insert",
                data: registrationOfCases,
                type: "post",
                success: function (status) {
                    console.log(status);
                    query();
                }
            });
        }

        function selectUpload(id) {
            if (id !== undefined) {
                $.ajax({
                    url: "${path}/specialAuditMaterials/upload",
                    data: "id=" + id,
                    type: "post",
                    dataType: "text",
                    success: function (status) {

                    }
                });
            }
        }

        function upload() {
            //获取上传文件
            var file = $('#file')[0].files[0];
            //创建FormData对象
            var formData = new FormData();
            formData.append("file", file);
            if (file !== undefined) {
                $.ajax({
                    url: "${path}/specialAuditMaterials/upload",
                    data: formData,
                    type: "post",
                    dataType: "text",
                    async: false,
                    processData: false, // 使数据不做处理
                    contentType: false, // 不要设置Content-Type请求头
                    success: function (status) {
                        if (status == 0) status = "失败";
                        if (status == 1) status = "成功";
                        window.setTimeout(function () {
                            alert('上传' + status);
                            query();
                        }, 500);
                    },
                    error: function () {
                        window.setTimeout(function () {
                            alert('上传失败 请选择小于5MB的文件');
                        }, 500);
                    }
                });
            }else {
                window.setTimeout(function () {
                    alert("请选择上传文件");
                }, 500);
            }
        }
    </script>
</head>
<body class="hold-transition skin-red sidebar-mini" ng-app="shebao" ng-controller="specialauditController">
<!-- .box-body -->
<toaster-container toaster-options="{'time-out': 1000,'position-class':'toast-center'}"></toaster-container>
<div class="box-header with-border">
    <h3 class="box-title">日常审计</h3>
</div>
<div class="box-body">
    <div class="has-feedback">
        <div style="text-align: center;background: #ffff">
            <table align="center" ng-init="searchEntity.typeStatus=1">
                <tr>
                    <td style="text-align: right"><span style="white-space: nowrap;display: inline-block">公司名称：</span>
                    </td>
                    <td><input class="form-control" ng-model="searchEntity.unitName" id="unitName1"></td>
                    <td style="text-align: right"><span style="white-space: nowrap;display: inline-block">组织机构代码：</span>
                    </td>
                    <td><input class="form-control" ng-model="searchEntity.organizationalCode" id="organizationalCode1">
                    </td>
                    <td style="text-align: right"><span style="white-space: nowrap;display: inline-block">接收人：</span>
                    </td>
                    <td><input class="form-control" ng-model="searchEntity.nameOfRegistrant" id="nameOfRegistrant1">
                    </td>
                </tr>
            </table>
        </div>
        <div style="text-align: center;padding-top: 10px">
            <%--ng-click="reloadList()"--%>
            <button class="btn btn-default" onclick="select()">查询</button>
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
                        <button type="button" ng-click="entity={'typeStatus':1}" class="btn btn-default" title="登记"
                                data-toggle="modal" data-target="#editModal2"><i class="fa fa-file-o"></i> 登记
                        </button>
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
                <th class="sorting">操作</th>
            </tr>
            </thead>
            <c:forEach items="${data}" var="ds">
                <tbody>
                <tr>
                    <td>${ds.unitName}</td>
                    <td>${ds.organizationalCode}</td>
                    <td>${ds.nameOfRegistrant}</td>
                    <td>${ds.registrationTime}</td>
                    <td>
                        <c:if test="${ds.accountCharacter==0}">
                            农业户口
                        </c:if>
                        <c:if test="${ds.accountCharacter==1}">
                            非农业户口
                        </c:if>
                    </td>
                    <td>${ds.nameOfTheFiler}</td>
                    <td>${ds.phone}</td>
                    <td>${ds.complaintContents}</td>
                    <td><%--ng-click="findOne(pojo.id)"--%>
                        <button type="button" class="btn bg-olive btn-xs"
                                onclick="selectById(${ds.id})"
                                data-toggle="modal"
                                data-target="#editModal">修改
                        </button>
                            <%--ng-click="deleteOne(pojo.id)"--%>
                        <button type="button" class="btn bg-olive btn-xs"
                                onclick="del(${ds.id},'${ds.nameOfRegistrant}','${ds.unitName}','${ds.phone}')">删除
                        </button>
                            <%--ng-click="findOne(pojo.id)"--%>
                        <button type="button" onclick="selectUpload(${ds.id})" class="btn bg-olive btn-xs"
                                data-toggle="modal"
                                data-target="#editModal1">上传材料
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
                <a href="${path}/registraionOfCases/caseRegistrationPage?page=${map.page-1}&status=1&typeStatus=2&approvalStatus=0">上一页</a>
            </c:if>
            第 ${map.page} 页&nbsp;&nbsp;&nbsp;共 ${map.num} 页
            <c:if test="${map.page<map.num}">
                <a href="${path}/registraionOfCases/caseRegistrationPage?page=${map.page+1}&status=1&typeStatus=2&approvalStatus=0">下一页</a>
            </c:if>
        </c:if>

        <c:if test="${map.num==null && map.page==null}">
            <c:if test="${map.pages>1}">
                <a href="${path}/registraionOfCases/caseRegistrationLike?page=${map.pages-1}<c:if test="${unitName!=null}">&unitName=${unitName}</c:if><c:if test="${organizationalCode!=null}">&organizationalCode=${organizationalCode}</c:if><c:if test="${nameOfRegistrant!=null}">&nameOfRegistrant=${nameOfRegistrant}</c:if>&status=1&typeStatus=2&approvalStatus=0">上一页</a>
            </c:if>
            第 ${map.pages} 页&nbsp;&nbsp;&nbsp;共 ${map.nums} 页
            <c:if test="${map.pages<map.nums}">
                <a href="${path}/registraionOfCases/caseRegistrationLike?page=${map.pages+1}<c:if test="${unitName!=null}">&unitName=${unitName}</c:if><c:if test="${organizationalCode!=null}">&organizationalCode=${organizationalCode}</c:if><c:if test="${nameOfRegistrant!=null}">&nameOfRegistrant=${nameOfRegistrant}</c:if>&status=1&typeStatus=2&approvalStatus=0">下一页</a>
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
<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:80%;">
        <div class="modal-content">
            <div class="modal-header">
                <button id="bt1" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel">修改页面</h3>
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
                        <td>年龄:</td>
                        <td><input ng-model="entity.age" class="form-control" id="age"
                                   placeholder="年龄"></td>
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
            <div class="modal-footer"><%--ng-click="yanzheng()"--%>
                <button class="btn btn-success" onclick="updateBySave()" data-dismiss="modal" aria-hidden="true">修改
                </button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="editModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:80%;">
        <div class="modal-content">
            <div class="modal-header">
                <button id="bt2" type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h3 id="myModalLabel2">添加页面</h3>
            </div>
            <div class="modal-body">
                <table class="table table-bordered table-striped">
                    <tr>
                        <td>
                            单位名称:
                        </td>
                        <td colspan="2"><input ng-model="entity.unitName" id="unitName2"
                                               class="form-control"
                                               placeholder="单位名称"></td>
                        <td align="right">
                            投诉内容：
                        </td>
                        <td colspan="2"><input ng-model="entity.complaintContents" id="complaint_contents2"
                                               class="form-control"
                                               placeholder="投诉内容"></td>
                    </tr>
                    <tr>
                        <td>组织机构代码:</td>
                        <td><input ng-model="entity.organizationalCode" id="organizational_code2"
                                   class="form-control"
                                   placeholder="组织机构代码"></td>
                        <td>投诉人姓名:</td>
                        <td><input ng-model="entity.nameOfTheComplainant" id="name_of_the_complainant2"
                                   class="form-control"
                                   placeholder="投诉人姓名"></td>
                        <td>投诉人身份证号:</td>
                        <td><input ng-model="entity.idCard" class="form-control" id="id_card2"
                                   placeholder="投诉人身份证号"></td>
                    </tr>
                    <tr>
                        <td>联系电话:</td>
                        <td><input ng-model="entity.phone" class="form-control" id="phone2"
                                   placeholder="联系电话"></td>
                        <td>登记人:</td>
                        <td><input ng-model="entity.nameOfRegistrant" id="name_of_registrant2"
                                   class="form-control"
                                   placeholder="接收人"></td>
                        <td>户口性质:</td>
                        <td>
                            <select class="form-control" id="account_character2"
                                    ng-model="entity.accountCharacter">
                                <option value="">请选择</option>
                                <option value="0">农户</option>
                                <option value="1">城镇户</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>性别:</td>
                        <td>
                            <select class="form-control" id="sex2"
                                    ng-model="entity.sex">
                                <option value="">请选择</option>
                                <option value="0">男</option>
                                <option value="1">女</option>
                            </select></td>
                        <td>年龄:</td>
                        <td><input ng-model="entity.age" class="form-control" id="age2"
                                   placeholder="年龄"></td>
                        <td>审计人数:</td>
                        <td><input ng-model="entity.numberOfAuditors" id="number_of_auditors2"
                                   class="form-control"
                                   placeholder="审计人数"></td>
                    </tr>
                    <tr>
                        <td>审计户数:</td>
                        <td><input ng-model="entity.auditHouseholds" id="audit_households2"
                                   class="form-control"
                                   placeholder="审计户数"></td>
                        <td>补缴数额</td>
                        <td><input ng-model="entity.amountPaid" class="form-control" id="amount_paid2"
                                   placeholder="补缴数额"></td>
                        <td>立案时间</td>
                        <td><input ng-model="entity.filingTime" class="form-control" id="filing_time2"
                                   placeholder="立案时间"></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer"><%--ng-click="yanzheng()"--%>
                <button class="btn btn-success" onclick="save()">保存</button>
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
                <h3 id="myModalLabel1">上传材料</h3>
            </div>
            <div class="modal-body">
                上传材料：
                <input type="file" name="files" id="file">
            </div>
            <div class="modal-footer">
                <%--ng-click="upload(entity.id)"--%>
                <button class="btn btn-success" onclick="upload()" data-dismiss="modal" aria-hidden="true">上传</button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>


