<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <c:set value="${pageContext.request.contextPath}" var="path"/>
    <script type="text/javascript">
        function status1() {
            $.ajax({
                url: "${pageContext.request.contextPath}/AuditNcmFormController/selectAll",
                async: false,
                type: "post"
            })
        }

        function query() {
            $.ajax({
                url: "${pageContext.request.contextPath}/ultimate/selectByPage",
                data: "page=${map.page}&status=7&typeStatus=6&approvalStatus=1",
                type: "get",
                success: function () {
                    location.reload();
                }
            })
        }

        function selectUpload(id) {
            console.log(id);
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

        function updateBySave() {
            var id = $("#id").val();
            var baseOfPayment = $("#baseOfPayment").val();
            if (baseOfPayment == null || baseOfPayment == '') {
                alert("请输入缴费基数");
                return;
            }
            $.ajax({
                url: "${path}/AuditNcmFormController/update",
                type: "post",
                data: "id=" + id + "&baseOfPayment=" + baseOfPayment,
                dataType: "text",
                success: function (status) {
                    if (status == 1) {
                        query();
                        alert("成功");
                    } else if (status == 2) {
                        alert("失败");
                    }
                }
            })

        }

        function upload() {
            //获取上传文件
            var file = $('#file')[0].files[0];
            //创建FormData对象
            var formData = new FormData();
            formData.append("statuss", 0);
            formData.append("file", file);
            formData.append("typeStatus", 6);
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
                            status1();
                            query();
                        }, 500);
                    },
                    error: function () {
                        window.setTimeout(function () {
                            alert('上传失败 请选择小于5MB的文件');
                        }, 500);
                    }
                });
            } else {
                window.setTimeout(function () {
                    alert("请选择上传文件");
                }, 500);
            }
        }

        function selectByRegistrationOfCasesId(id) {
            $.ajax({
                url: "${pageContext.request.contextPath}/AuditNcmFormController/selectByRegistrationOfCasesId",
                type: "get",
                data: "registrationOfCasesId=" + id,
                dataType: "json",
                success: function (data) {
                    if (data.baseOfPayment !== undefined && data.baseOfPayment !== null) {
                        $("#baseOfPayment").val(data.baseOfPayment);
                    }
                }
            })
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
                    selectByRegistrationOfCasesId(id);
                }
            })
        }

        function guidamng(id) {
            $.ajax({
                url: "${pageContext.request.contextPath}/AuditNcmFormController/selectByRegistrationOfCasesId",
                type: "get",
                data: "registrationOfCasesId=" + id,
                dataType: "json",
                success: function (data) {
                    if (data.baseOfPayment == null) {
                        alert("请录入缴费基数");
                        return;
                    }
                    if (confirm("确定归档吗")) {
                        $.ajax({
                            url: "${path}/ultimate/update",
                            data: "id=" + id + "&approvalStatus=" + 3 + " &typeStatus=" + 7,
                            dataType: "text",
                            success: function () {
                                $.ajax({
                                    url: "${path}/caseManagement/insert",
                                    data: "registrationOfCasesId=" + id,
                                    dataType: "text",
                                    success: function () {
                                        query();
                                    }
                                })
                            }
                        })
                    }
                }
            })

        }
    </script>
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
            <c:forEach var="d" items="${data}">
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
                    <td>${d.nameOfTheFiler}</td>
                    <td>${d.complaintContents}</td>
                    <c:forEach var="ds" items="${datas}">
                        <c:if test="${ds.registrationOfCasesId==d.id}">
                            <td>
                                <c:if test="${ds.state==1}">
                                    <span style="color:cadetblue;">已申报</span>
                                </c:if>
                                <c:if test="${ds.state==0}">
                                    <span style="color:red;">未申报</span>
                                </c:if>
                            </td>
                        </c:if>
                    </c:forEach>
                    <td>
                        <c:if test="${d.warningTime>=6}">
                            <span style="color:red;">已经超过5个工作日，通知书仍未送达</span>
                        </c:if>
                        <c:if test="${d.warningTime<=5||d.warningTime==null}">
                            <span style="color:cadetblue;">正常</span>
                        </c:if>
                    </td>
                    <td class="text-center"><%--ng-click="findOne(pojo.id)"--%>
                        <button ng-if="true" type="button"
                                class="btn bg-olive btn-xs" data-toggle="modal" onclick="selectById(${d.id})"
                                data-target="#editModal">录入缴费基数
                        </button>
                            <%--ng-click="findOne(pojo.id)"--%>
                        <button ng-if="pojo.state!=1" type="button"
                                class="btn bg-olive btn-xs"
                                data-toggle="modal" onclick="selectUpload(${d.id})"
                                data-target="#editModal1">上传报送材料
                        </button>
                            <%--ng-click="guiDang(pojo.registrationOfCasesId)" ng-if="pojo.state==1"--%>
                        <c:forEach var="ds" items="${datas}">
                            <c:if test="${ds.registrationOfCasesId==d.id}">
                                <c:if test="${ds.state==1}">
                                    <button type="button" class="btn bg-olive btn-xs" onclick="guidamng(${d.id})">结案归档
                                    </button>
                                </c:if>
                            </c:if>
                        </c:forEach>

                            <%--ng-click="findOne(pojo.id)"--%>
                            <%--     <button type="button" class="btn bg-olive btn-xs"
                                         data-toggle="modal"
                                         data-target="#editModal">编辑
                                 </button>--%>
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
                <a href="${path}/ultimate/selectByPage?page=${map.page-1}&typeStatus=6&approvalStatus=1&status=7">上一页</a>
            </c:if>
            第 ${map.page} 页&nbsp;&nbsp;&nbsp;共 ${map.num} 页
            <c:if test="${map.page<map.num}">
                <a href="${path}/ultimate/selectByPage?page=${map.page+1}&typeStatus=6&approvalStatus=1&status=7">下一页</a>
            </c:if>
        </c:if>
        <c:if test="${map.num==null && map.page==null}">
            <c:if test="${map.pages>1}">
                <a href="${path}/ultimate/selectByLike?page=${map.pages-1}<c:if test="${unitName!=null}">&unitName=${unitName}</c:if><c:if test="${organizationalCode!=null}">&organizationalCode=${organizationalCode}</c:if><c:if test="${nameOfRegistrant!=null}">&nameOfRegistrant=${nameOfRegistrant}</c:if>&typeStatus=6&approvalStatus=1&status=7">上一页</a>
            </c:if>
            第 ${map.pages} 页&nbsp;&nbsp;&nbsp;共 ${map.nums} 页
            <c:if test="${map.pages<map.nums}">
                <a href="${path}/ultimate/selectByLike?page=${map.pages+1}<c:if test="${unitName!=null}">&unitName=${unitName}</c:if><c:if test="${organizationalCode!=null}">&organizationalCode=${organizationalCode}</c:if><c:if test="${nameOfRegistrant!=null}">&nameOfRegistrant=${nameOfRegistrant}</c:if>&typeStatus=6&approvalStatus=1&status=7">下一页</a>
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
                <h3 id="myModalLabel">已发送稽核通知案件信息</h3>
            </div>
            <div class="modal-body">
                <table class="table table-bordered table-striped">
                    <tr>
                        <td>
                            单位名称：
                        </td>
                        <%--ng-model="entity.registrationOfCases.unitName"--%>
                        <input type="hidden" id="id"/>
                        <td colspan="2"><input readonly="true"
                                               class="form-control"
                                               id="unitName" placeholder="单位名称"></td>
                        <td align="right">
                            投诉内容：
                        </td>
                        <%--ng-model="entity.registrationOfCases.complaintContents"--%>
                        <td colspan="2"><input readonly="true"
                                               class="form-control"
                                               id="complaintContents" placeholder="投诉内容"></td>
                    </tr>
                    <tr>
                        <td>组织机构代码:</td>
                        <%--ng-model="entity.registrationOfCases.organizationalCode"--%>
                        <td><input readonly="true"
                                   class="form-control"
                                   id="organizationalCode" placeholder="组织机构代码"></td>
                        <td>投诉人姓名:</td>
                        <%--ng-model="entity.registrationOfCases.nameOfTheComplainant"--%>
                        <td><input readonly="true"
                                   class="form-control"
                                   id="nameOfTheComplainant" placeholder="投诉人姓名"></td>
                        <td>投诉人身份证号:</td>
                        <%--ng-model="entity.registrationOfCases.idCard"--%>
                        <td><input readonly="true" class="form-control"
                                   id="idCard" placeholder="投诉人身份证号"></td>
                    </tr>
                    <tr>
                        <td>联系电话:</td>
                        <%--ng-model="entity.registrationOfCases.phone"--%>
                        <td><input readonly="true" class="form-control"
                                   id="phone" placeholder="联系电话"></td>
                        <td>接收人:</td>
                        <%--ng-model="entity.registrationOfCases.nameOfRegistrant"--%>
                        <td><input readonly="true"
                                   class="form-control"
                                   id="nameOfRegistrant" placeholder="接收人"></td>
                        <td>户口性质:</td>
                        <td><%--ng-model="entity.registrationOfCases.accountCharacter"--%>
                            <select disabled="disabled" class="form-control"
                                    id="accountCharacter">
                                <option value="0">农户</option>
                                <option value="1">城镇户</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td>性别:</td>
                        <td><%--ng-model="entity.registrationOfCases.sex"--%>
                            <select disabled="disabled" class="form-control"
                                    id="sex">
                                <option value="0">男</option>
                                <option value="1">女</option>
                            </select></td>
                        <td>缴费基数:</td>
                        <%--ng-model="entity.baseOfPayment"--%>
                        <td><input class="form-control"
                                   id="baseOfPayment" placeholder="缴费基数"></td>
                        <td>审计人数:</td>
                        <%--ng-model="entity.registrationOfCases.numberOfAuditors"--%>
                        <td><input readonly="true"
                                   class="form-control"
                                   id="numberOfAuditors" placeholder="审计人数"></td>
                    </tr>
                    <tr>
                        <td>审计户数:</td>
                        <%--ng-model="entity.registrationOfCases.auditHouseholds"--%>
                        <td><input readonly="true"
                                   class="form-control"
                                   id="auditHouseholds" placeholder="审计户数"></td>
                        <td>补缴数额</td>
                        <%--ng-model="entity.registrationOfCases.amountPaid"--%>
                        <td><input readonly="true" class="form-control"
                                   id="amountPaid" placeholder="补缴数额"></td>
                        <td>立案时间</td>
                        <%--ng-model="entity.registrationOfCases.filingTime"--%>
                        <td><input readonly="true" class="form-control"
                                   id="filingTime" placeholder="立案时间"></td>
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
            <div class="modal-footer"><%--ng-click="upload(entity.id)"--%>
                <button class="btn btn-success" onclick="upload()">上传</button>
                <button class="btn btn-default" data-dismiss="modal" aria-hidden="true">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>