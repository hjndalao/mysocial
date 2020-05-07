<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <c:set var="path" value="${pageContext.request.contextPath}"/>
    <script type="text/javascript">
        function status1() {
            $.ajax({
                url: "${pageContext.request.contextPath}/AuditNcmFormController/selectAll",
                type: "get"
            })
        }

        status1();

        function select() {
            var name = $("#unitName1").val();
            var organizational_code = $("#organizationalCode1").val();
            var name_of_registrant = $("#nameOfRegistrant1").val();
            var registrationOfCases = {
                "unitName": name,
                "organizationalCode": organizational_code,
                "nameOfRegistrant": name_of_registrant,
                "status": 9,
                "typeStatus": 8,
                "approvalStatus": 3
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

        function save(id) {
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

        function update(id, status) {
            if (status == 2) {
                update1(id, status);
            } else if (status == 3) {
                update1(id, status);
            }
        }

        function status1() {
            $.ajax({
                url: "${pageContext.request.contextPath}/AuditNcmFormController/selectAll",
                async: false,
                type: "post"
            })
        }

        function query() {
            $.ajax({
                url: "${path}/ultimate/selectByPage",
                data: "page=${map.page}&typeStatus=8&approvalStatus=1&status=9",
                type: "get",
                dataType: "text",
                success: function () {
                    location.reload();
                }
            })
        }

        function update1(id, status) {
            if (status == 2) {
                if (confirm("是否提交处罚?")) {
                    $.ajax({
                        url: "${path}/NotificationCaseManagement/update",
                        data: "registrationOfCasesId=" + id + "&state=" + status + "&s=" + 1,
                        type: "post",
                        dataType: "text",
                        success: function () {
                            status1();
                            window.setTimeout(function () {
                                query();
                                alert("已经提交处罚 增加缴费￥25");
                            }, 1000)
                        }
                    });
                }
            }
            if (status == 3) {
                if (confirm("是否银行待查?")) {
                    $.ajax({
                        url: "${path}/NotificationCaseManagement/update",
                        data: "registrationOfCasesId=" + id + "&state=" + status,
                        type: "post",
                        dataType: "text",
                        success: function () {
                            status1();
                            $.ajax({
                                url: "${path}/ultimate/update",
                                data: "id=" + id + "&typeStatus=" + 9,
                                type: "post",
                                dataType: "text",
                                success: function () {
                                    $.ajax({
                                        url: "${path}/PendingBankCases/insert",
                                        data: "registrationOfCasesId=" + id + "&haveMoney=" + 0,
                                        type: "post",
                                        dataType: "text",
                                        success: function (status) {
                                            console.log(status);
                                        }
                                    })
                                }
                            })
                            window.setTimeout(function () {
                                query();
                                alert("移入银行待查已经完成");
                            }, 1000)
                        }
                    });
                }
            }
        }
    </script>
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
                <th class="sorting">缴费基数</th>
                <th class="sorting">警示</th>
                <th class="sorting">操作</th>
            </tr>
            </thead>
            <c:forEach items="${data}" var="d">
                <tbody>
                <tr><!-- ng-repeat="pojo in list" -->
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
                    <td>${d.nameOfTheComplainant}</td>
                    <td>${d.complaintContents}</td>
                    <td>
                        <c:forEach var="ds" items="${datas}">
                            <c:if test="${ds.registrationOfCasesId==d.id}">
                                ${ds.baseOfPayment}
                            </c:if>
                        </c:forEach></td>
                    <td><%--ng-if="true"--%>
                        <c:if test="${d.warningTime>5}">
                            <span style="color: red">已超过5个工作日，仍未补缴！</span>
                        </c:if>
                        <c:if test="${d.warningTime<=5}">
                            <span style="color: #00a157">正常</span>
                        </c:if>
                    </td>
                    <td class="text-center">
                            <%--ng-if="pojo.registrationOfCases.warningTime<5"--%><%--ng-click="guiDang(pojo.id)"--%>
                        <c:if test="${d.warningTime<5}">
                            <button type="button" class="btn bg-olive btn-xs" onclick="save(${d.id})">
                                结案归档
                            </button>
                        </c:if>
                        <c:if test="${d.warningTime>5}">
                            <%--ng-click="update(pojo.id,2)"--%>
                            <button ng-if="true" type="button" class="btn bg-olive btn-xs" onclick="update(${d.id},2)">
                                提请处罚
                            </button>
                            <%--ng-click="update(pojo.id,3)"--%>
                            <button ng-if="true" type="button" class="btn bg-olive btn-xs" onclick="update(${d.id},3)">
                                银行待查
                            </button>
                        </c:if>
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
                <a href="${path}/ultimate/selectByPage?page=${map.page-1}&typeStatus=8&approvalStatus=1&status=9">上一页</a>
            </c:if>
            第 ${map.page} 页&nbsp;&nbsp;&nbsp;共 ${map.num} 页
            <c:if test="${map.page<map.num}">
                <a href="${path}/ultimate/selectByPage?page=${map.page+1}&typeStatus=8&approvalStatus=1&status=9">下一页</a>
            </c:if>
        </c:if>
        <c:if test="${map.num==null && map.page==null}">
            <c:if test="${map.pages>1}">
                <a href="${path}/ultimate/selectByLike?page=${map.pages-1}<c:if test="${unitName!=null}">&unitName=${unitName}</c:if><c:if test="${organizationalCode!=null}">&organizationalCode=${organizationalCode}</c:if><c:if test="${nameOfRegistrant!=null}">&nameOfRegistrant=${nameOfRegistrant}</c:if>&typeStatus=8&approvalStatus=1&status=9">上一页</a>
            </c:if>
            第 ${map.pages} 页&nbsp;&nbsp;&nbsp;共 ${map.nums} 页
            <c:if test="${map.pages<map.nums}">
                <a href="${path}/ultimate/selectByLike?page=${map.pages+1}<c:if test="${unitName!=null}">&unitName=${unitName}</c:if><c:if test="${organizationalCode!=null}">&organizationalCode=${organizationalCode}</c:if><c:if test="${nameOfRegistrant!=null}">&nameOfRegistrant=${nameOfRegistrant}</c:if>&typeStatus=8&approvalStatus=1&status=9">下一页</a>
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
</body>
</html>