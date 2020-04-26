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
    <title>立案登记</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="plugins/angularjs/toaster.min.css">
    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="plugins/angularjs/angular.min.js"></script>
    <script type="text/javascript" src="plugins/angularjs/angular-animate.min.js"></script>
    <script type="text/javascript" src="plugins/angularjs/toaster.min.js"></script>
    <!--引入分页插件资源-->
    <link rel="stylesheet" href="plugins/angularjs/pagination.css">
    <script type="text/javascript" src="plugins/angularjs/pagination.js"></script>
    <script type="text/javascript" src="js/base_pagination.js"></script>
    <script type="text/javascript" src="js/service/registrationOfCasesService.js"></script>
    <script type="text/javascript" src="js/controller/baseController.js"></script>
    <script type="text/javascript" src="js/controller/registrationOfCasesController.js"></script>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <script type="text/javascript">
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
                }
            })
        }

        function query() {
            $.ajax({
                url: "${pageContext.request.contextPath}/registraionOfCases/caseRegistrationPage",
                data: "page=${map.page}&status=2",
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
            var name_of_registrant = $("#name_of_registrant").val();
            var account_character = $("#account_character").val();
            var age = $("#age").val();
            var sex = $("#sex").val();
            var ame_of_the_filer = $("#name_of_the_filer").val();
            var filing_month = $("#filing_month").val();
            var complaint_contents = $("#complaint_contents").val();

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
                "nameOfTheFiler": ame_of_the_filer,
                "filingMonth": filing_month,
                "complaintContents": complaint_contents,
                "status": 2
            }

            $.ajax({
                url: "${path}/registraionOfCases/update",
                data: registrationOfCases,
                type: "post",
                success: function () {
                    query();
                }
            });
        }

        function del(id) {
            if (confirm("确定删除吗")) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/registraionOfCases/delete",
                    data: "id=" + id,
                    type: "post",
                    success: function () {
                        query();
                    }
                })
                return true;
            }
        }

        function save() {
            var name = $("#unitName2").val();
            var organizational_code = $("#organizationalCode").val();
            var name_of_the_complainant = $("#nameOfTheComplainant").val();
            var id_card = $("#idCard").val();
            var phone = $("#phone2").val();
            var name_of_registrant = $("#nameOfRegistrant").val();
            var account_character = $("#accountCharacter").val();
            var age = $("#age2").val();
            var sex = $("#sex2").val();
            var name_of_the_filer = $("#name_of_the_filer").val();
            var filing_month = $("#filing_month").val();
            var complaint_contents = $("#complaintContents").val();
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
                "status": 2
            }
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

        function select() {
            var name = $("#unitName1").val();
            var organizational_code = $("#organizationalCode1").val();
            var name_of_registrant = $("#nameOfRegistrant1").val();
            console.log(name);
            console.log(organizational_code);
            console.log(name_of_registrant)
            var registrationOfCases = {
                "unitName": name,
                "organizationalCode": organizational_code,
                "nameOfRegistrant": name_of_registrant,
                "status": 2
            }
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

        function updateStatus(id) {
            if (confirm("提交后不允许修改，您确定要执行此操作吗?")) {
                console.log(id, status);
                $.ajax({
                    url: "${path}/registraionOfCases/updateStatus",
                    data: "id=" + id + "&approvalStatus=0&typeStatus=2",
                    type: "post",
                    dataType: "text",
                    success: function () {
                        query();
                    }
                });
                return true;
            }
        }
    </script>
</head>
<body class="hold-transition skin-red sidebar-mini" ng-app="shebao" ng-controller="registrationOfCasesController">
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
                        <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                data-target="#editModal" ng-click="addClick()">登记
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
                <th class="sorting">修改</th>
                <th class="sorting">删除</th>
                <th class="sorting">提交</th>
            </tr>
            </thead>
            <c:forEach items="${data}" var="d">
                <tbody>
                <tr>
                    <td>${d.unitName}</td>
                    <td>${d.organizationalCode}</td>
                    <td>${d.nameOfRegistrant}</td>
                    <td>${d.registrationTime}</td>
                    <td>
                        <c:if test="${d.accountCharacter==0}">
                            农业户口
                        </c:if>
                        <c:if test="${d.accountCharacter==1}">
                            非农业户口
                        </c:if>
                    </td>
                    <td>${d.nameOfTheFiler}</td>
                    <td>${d.phone}</td>
                    <td>${d.complaintContents}</td>
                    <td>
                            <%--ng-click="findOne(pojo.id)"--%>
                        <button type="button" class="btn bg-olive btn-xs"
                                data-toggle="modal"
                                data-target="#editModal1" onclick="selectById(${d.id})">修改
                        </button>
                    </td>
                    <td>
                            <%--ng-click="deleteOne(pojo.id)"--%>
                        <button type="button" class="btn bg-olive btn-xs"
                                data-toggle="modal" onclick="del(${d.id})">
                            删除
                        </button>
                    </td>
                    <td>
                            <%--ng-click="updateStatus(pojo.id)"--%>
                        <button type="button" class="btn bg-olive btn-xs"
                                onclick="updateStatus(${d.id})">提交
                        </button>
                    </td>
                </tr>
                </tbody>
            </c:forEach>
        </table>
        <!--数据列表/-->
        <!--分页工具条展示-->
        <%-- <tm-pagination conf="paginationConf"></tm-pagination>--%>
        <c:if test="${map.nums==null}">
            <c:if test="${map.page>1}">
                <a href="${path}/registraionOfCases/caseRegistrationPage?page=${map.page-1}&status=2">上一页</a>
            </c:if>
            第 ${map.page} 页&nbsp;&nbsp;&nbsp;共 ${map.num} 页
            <c:if test="${map.page<map.num}">
                <a href="${path}/registraionOfCases/caseRegistrationPage?page=${map.page+1}&status=2">下一页</a>
            </c:if>
        </c:if>

        <c:if test="${map.num==null && map.page==null}">
            <c:if test="${map.pages>1}">
                <a href="${path}/registraionOfCases/caseRegistrationLike?page=${map.pages-1}<c:if test="${unitName!=null}">&unitName=${unitName}</c:if><c:if test="${organizationalCode!=null}">&organizationalCode=${organizationalCode}</c:if><c:if test="${nameOfRegistrant!=null}">&nameOfRegistrant=${nameOfRegistrant}&status=2</c:if>">上一页</a>
            </c:if>
            第 ${map.pages} 页&nbsp;&nbsp;&nbsp;共 ${map.nums} 页
            <c:if test="${map.pages<map.nums}">
                <a href="${path}/registraionOfCases/caseRegistrationLike?page=${map.pages+1}<c:if test="${unitName!=null}">&unitName=${unitName}</c:if><c:if test="${organizationalCode!=null}">&organizationalCode=${organizationalCode}</c:if><c:if test="${nameOfRegistrant!=null}">&nameOfRegistrant=${nameOfRegistrant}&status=2</c:if>">下一页</a>
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
                <h3 id="myModalLabel">登记页面</h3>
            </div>
            <div class="modal-body">
                <table class="table table-bordered table-striped">
                    <tr>
                        <td>单位名称:</td>
                        <td><input ng-model="entity.unitName" id="unitName2" class="form-control">
                        </td>
                    </tr>
                    <tr>
                        <td>组织机构代码:</td>
                        <td><input ng-model="entity.organizationalCode" id="organizationalCode" class="form-control"
                                   placeholder="以0开头的八位数字">
                        </td>
                        <td>投诉人姓名:</td>
                        <td><input ng-model="entity.nameOfTheComplainant" class="form-control"
                                   id="nameOfTheComplainant"></td>
                        <td>投诉人身份证号:</td>
                        <td><input ng-model="entity.idCard" class="form-control" id="idCard"
                                   placeholder="由十八位数字或者十七位数字末尾加x组成"></td>
                    </tr>
                    <tr>
                        <td>联系电话:</td>
                        <td><input ng-model="entity.phone" id="phone2" class="form-control" placeholder="只能以13、15、18开头">
                        </td>
                        <td>接收人:</td>
                        <td><input ng-model="entity.nameOfRegistrant" class="form-control" id="nameOfRegistrant"></td>
                        <td>户口性质:</td>
                        <td><select ng-model="entity.accountCharacter" class="form-control" id="accountCharacter">
                            <option value="0">农业户口</option>
                            <option value="1">非农业户口</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>年龄:</td>
                        <td><input ng-model="entity.age" class="form-control" id="age2"></td>
                        <td>性别:</td>
                        <td><select ng-model="entity.sex" class="form-control" id="sex2">
                            <option value="0">男</option>
                            <option value="1">女</option>
                        </select></td>
                        <td>投诉内容:</td>
                        <td><textarea ng-model="entity.complaintContents" id="complaintContents"></textarea></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <%--ng-click="baoCun()"--%>
                <button class="btn btn-success" onclick="save()">保存</button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="editModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:80%;">
        <div class="modal-content">
            <div class="modal-header">
                <button id="bt" type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                <h3 id="myModalLabe">修改页面</h3>
            </div>
            <div class="modal-body">
                <table class="table table-bordered table-striped">
                    <tr>
                        <td>单位名称:</td>
                        <input type="hidden" id="id">
                        <td><input ng-model="entity2.unitName" id="unitName" class="form-control">
                        </td>
                    </tr>
                    <tr>
                        <td>组织机构代码:</td>
                        <td><input ng-model="entity2.organizationalCode" id="organizational_code" class="form-control">
                        </td>
                        <td>投诉人姓名:</td>
                        <td><input ng-model="entity2.nameOfTheComplainant" id="name_of_the_complainant"
                                   class="form-control"></td>
                        <td>投诉人身份证号:</td>
                        <td><input ng-model="entity2.idCard" id="id_card" class="form-control">
                        </td>
                    </tr>
                    <tr>
                        <td>联系电话:</td>
                        <td><input ng-model="entity2.phone" id="phone" class="form-control"></td>
                        <td>接收人:</td>
                        <td><input ng-model="entity2.nameOfRegistrant" id="name_of_registrant" class="form-control">
                        </td>
                        <td>户口性质:</td>
                        <td><select ng-model="entity2.accountCharacter" id="account_character" class="form-control">
                            <option value="0">农业户口</option>
                            <option value="1">非农业户口</option>
                        </select></td>
                    </tr>
                    <tr>
                        <td>年龄:</td>
                        <td><input ng-model="entity2.age" id="age" class="form-control">
                        </td>
                        <td>性别:</td>
                        <td><select ng-model="entity2.sex" id="sex" class="form-control">
                            <option value="0">男</option>
                            <option value="1">女</option>
                        </select></td>
                        <td>立案人:</td>
                        <td><input ng-model="entity2.nameOfTheFiler" id="name_of_the_filer" class="form-control">
                        <td>立案月</td>
                        <td><input ng-model="entity2.filingMonth" id="filing_month" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>投诉内容:</td>
                        <td><textarea ng-model="entity2.complaintContents" id="complaint_contents"></textarea></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success" data-dismiss="modal" aria-hidden="true" onclick="updateBySave()">修改
                </button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>

</body>
</html>


