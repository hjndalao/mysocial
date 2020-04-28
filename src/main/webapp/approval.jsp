<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="plugins/angularjs/toaster.min.css">
    <script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="plugins/angularjs/angular.min.js"></script>
    <script type="text/javascript" src="plugins/angularjs/angular-animate.min.js"></script>
    <script type="text/javascript" src="plugins/angularjs/toaster.min.js"></script>
    <script type="text/javascript" src="plugins/angularjs/pagination.js"></script>
    <script type="text/javascript" src="js/base_pagination.js"></script>
    <script type="text/javascript" src="js/service/approvalService.js"></script>
    <script type="text/javascript" src="js/controller/baseController.js"></script>
    <script type="text/javascript" src="js/controller/approvalController.js"></script>
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <script type="text/javascript">

        function select() {
            console.log("查询");
            var name = $("#unitName1").val();
            var organizational_code = $("#organizationalCode1").val();
            var name_of_registrant = $("#nameOfRegistrant1").val();

            var registrationOfCases = {
                "unitName": name,
                "organizationalCode": organizational_code,
                "nameOfRegistrant": name_of_registrant,
                "status": 4,
                "typeStatus": 3,
                "approvalStatus": 0
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

        function query() {
            $.ajax({
                url: "${pageContext.request.contextPath}/registraionOfCases/caseRegistrationPage",
                data: "page=${map.page}&status=4&typeStatus=3&approvalStatus=0",
                type: "get",
                success: function () {
                    location.reload();
                }
            })
        }

        function updateStatus(id, approvalStatus) {
            //审批通过执行
            if (approvalStatus === 1) {
                update1(id, approvalStatus);
            }
            //审批没通过执行
            if (approvalStatus === 2) {
                update2(id, 0);
            }
        }

        function update1(id, approvalStatus) {
            if (confirm("审批通过将不允许再次修改，您确定要执行此操作吗?")) {
                $.ajax({
                    url: "${path}/registraionOfCases/updateStatus",
                    data: "id=" + id + "&approvalStatus=" + approvalStatus + "&typeStatus=3",
                    type: "post",
                    dataType: "text",
                    success: function () {
                        query();
                    }
                });
                return true;
            }
        }

        function update2(id, approvalStatus) {
            //审批不通过执行
            console.log("等于2执行", id);
            var causeOfAction = $("#causeOfAction").val();
            var reasonsForTermination = $("#reasonsForTermination").val();
            var investigatorViews = $("#investigatorViews").val();
            var responsibleOpinions = $("#responsibleOpinions").val();
            $.ajax({
                url: "${path}/registraionOfCases/updateStatus",
                data: "id=" + id + "&approvalStatus=" + approvalStatus,
                type: "post",
                dataType: "text",
                success: function (id) {
                    console.log(id);
                    $(".parid").val(id);
                }
            });
        }

        function save(approvalStatus) {
            //收集参数
            var param_id = $(".parid").val();
            var causeOfAction = $("#causeOfAction").val();
            var reasonsForTermination = $("#reasonsForTermination").val();
            var investigatorViews = $("#investigatorViews").val();
            var responsibleOpinions = $("#responsibleOpinions").val();
            var data = {
                "registrationOfCasesId": param_id,
                "causeOfAction": causeOfAction,
                "reasonsForTermination": reasonsForTermination,
                "investigatorViews": investigatorViews,
                "responsibleOpinions": responsibleOpinions
            }
            console.log("数据:", data);
            $.ajax({
                url: "${path}/terminationOfFilingForm/insert",
                data: data,
                type: "post",
                dataType: "text",
                success: function () {
                    update2(param_id, approvalStatus);
                    query();
                }
            });
        }
    </script>
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
            <c:forEach items="${data}" var="ds">
                <tbody>
                <tr>
                    <td>${ds.unitName}</td>
                    <td>${ds.organizationalCode}</td>
                    <td>${ds.nameOfRegistrant}</td>
                    <td>${ds.filingMonth}</td>
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
                    <td>
                            <%--ng-if="pojo.warningTime>7"--%>
                        <c:if test="${ds.warningTime>7}">
                            <span style="color:red;">已经超过7个工作日，仍未进行立案审批</span>
                        </c:if>
                        <c:if test="${ds.warningTime<7||ds.warningTime==null}">
                            <span style="color:cadetblue;">正常</span>
                        </c:if>
                    </td>
                    <td><%--ng-click="updateStatusYes(pojo.id)"--%>
                        <button type="button" class="btn bg-olive btn-xs"
                                data-toggle="modal" onclick="updateStatus(${ds.id},1)">审批通过
                        </button>
                    </td>
                    <td><%--ng-click="updateStatusNo(pojo.id)"--%>
                        <button type="button" class="btn bg-olive btn-xs"
                                data-toggle="modal"
                                data-target="#editModal" onclick="updateStatus(${ds.id},2)">审批不通过
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
                <a href="${path}/registraionOfCases/caseRegistrationPage?page=${map.page-1}&status=4&typeStatus=3&approvalStatus=0">上一页</a>
            </c:if>
            第 ${map.page} 页&nbsp;&nbsp;&nbsp;共 ${map.num} 页
            <c:if test="${map.page<map.num}">
                <a href="${path}/registraionOfCases/caseRegistrationPage?page=${map.page+1}&status=4&typeStatus=3&approvalStatus=0">下一页</a>
            </c:if>
        </c:if>
        <c:if test="${map.num==null && map.page==null}">
            <c:if test="${map.pages>1}">
                <a href="${path}/registraionOfCases/caseRegistrationLike?page=${map.pages-1}<c:if test="${unitName!=null}">&unitName=${unitName}</c:if><c:if test="${organizationalCode!=null}">&organizationalCode=${organizationalCode}</c:if><c:if test="${nameOfRegistrant!=null}">&nameOfRegistrant=${nameOfRegistrant}</c:if>&status=4&typeStatus=3&approvalStatus=0">上一页</a>
            </c:if>
            第 ${map.pages} 页&nbsp;&nbsp;&nbsp;共 ${map.nums} 页
            <c:if test="${map.pages<map.nums}">
                <a href="${path}/registraionOfCases/caseRegistrationLike?page=${map.pages+1}<c:if test="${unitName!=null}">&unitName=${unitName}</c:if><c:if test="${organizationalCode!=null}">&organizationalCode=${organizationalCode}</c:if><c:if test="${nameOfRegistrant!=null}">&nameOfRegistrant=${nameOfRegistrant}</c:if>&status=4&typeStatus=3&approvalStatus=0">下一页</a>
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
                <h3 id="myModalLabel">终止立案</h3>
            </div>
            <div class="modal-body">
                <table class="table table-bordered table-striped">
                    <tr>
                        <td>案由:</td>
                        <td><input ng-model="entity.causeOfAction" class="form-control" id="causeOfAction">
                        </td>
                    </tr>
                    <tr>
                        <td>终止执行原因:</td>
                        <td><textarea ng-model="entity.reasonsForTermination" id="reasonsForTermination"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>调查人意见:</td>
                        <td><textarea ng-model="entity.investigatorViews" id="investigatorViews"></textarea></td>
                    </tr>
                    <tr>
                        <td>负责人意见:</td>
                        <td><textarea ng-model="entity.responsibleOpinions" id="responsibleOpinions"></textarea></td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button class="btn btn-success" onclick="save(2)">保存</button>
                <input type="hidden" value="" class="parid">;
            </div>
        </div>
    </div>
</div>

</body>
</html>


